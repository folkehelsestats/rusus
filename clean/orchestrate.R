# R/orchestrate.R
#
# Main pipeline entry point. Reads all raw datasets defined in the
# file manifest, cleans and validates each one, stacks them into a
# master data.table, and renders the Quarto audit report.
#
# Usage:
#   source("R/04_orchestrate.R")        # from RStudio / interactive R
#   Rscript R/04_orchestrate.R          # from terminal

source("R/00_load_config.R")
source("R/01_match_columns.R")
source("R/02_clean_dataset.R")
source("R/03_validate.R")
source("R/03_export_log.R")
source("R/05_render_report.R")   # <- report renderer

library(data.table)
library(readxl)
library(janitor)

# ------------------------------------------------------------------
# read_raw_file()
# Auto-detects file extension and reads into a data.table.
# ------------------------------------------------------------------
read_raw_file <- function(path) {
  ext <- tolower(tools::file_ext(path))
  switch(ext,
    "csv"  = fread(path),
    "tsv"  = fread(path, sep = "\t"),
    "xlsx" = as.data.table(read_excel(path)),
    stop(sprintf("Unsupported file type: .%s", ext))
  )
}

# ------------------------------------------------------------------
# File manifest — add one row per raw dataset.
# Set year_tag = NA if the year column exists inside the raw file.
# ------------------------------------------------------------------
file_manifest <- data.table(
  path     = c(
    "data/raw/survey_2019.csv",
    "data/raw/survey_2020.csv",
    "data/raw/survey_2022.xlsx"
  ),
  year_tag = c(2019, 2020, 2022)
)

# ------------------------------------------------------------------
# Load config once — shared across all datasets
# ------------------------------------------------------------------
config     <- load_config("config/variable_map.yaml")
clean_list <- vector("list", nrow(file_manifest))

# ------------------------------------------------------------------
# Main loop: read -> match -> export log -> clean -> validate
# ------------------------------------------------------------------
for (i in seq_len(nrow(file_manifest))) {
  
  path     <- file_manifest$path[i]
  year_tag <- file_manifest$year_tag[i]
  label    <- basename(path)
  
  cat(sprintf("\n── Processing: %s ─────────────────────────\n", label))
  
  # 1. Read raw file
  raw_dt <- read_raw_file(path)
  
  # 2. Normalise column names (same step as inside clean_dataset)
  #    so match_columns sees the same names that cleaning will use
  normed_dt <- as.data.table(janitor::clean_names(as.data.frame(raw_dt)))
  
  # 3. Run three-layer column matching
  match_result <- match_columns(names(normed_dt), config)
  
  # 4. Print match report to console
  print_match_report(match_result, label)
  
  # 5. Export match log CSV + update master log
  export_match_log(
    match_result  = match_result,
    dataset_label = label,
    year_tag      = year_tag,
    log_dir       = "logs/matching",
    append_master = TRUE
  )
  
  # 6. Clean the dataset (rename, recode, coerce types, remove empties)
  clean_dt <- clean_dataset(
    dt            = raw_dt,
    config        = config,
    year_tag      = if (is.na(year_tag)) NULL else year_tag,
    dataset_label = label
  )
  
  # 7. Validate the cleaned dataset
  clean_dt <- validate_dataset(clean_dt, label)
  
  clean_list[[i]] <- clean_dt
}

# ------------------------------------------------------------------
# Stack all cleaned datasets into one master data.table.
# fill = TRUE pads missing columns with NA across datasets.
# ------------------------------------------------------------------
master_dt <- rbindlist(clean_list, fill = TRUE, use.names = TRUE)

# Put year first, then all other columns alphabetically
other_cols <- sort(setdiff(names(master_dt), "year"))
setcolorder(master_dt, c("year", other_cols))

# ------------------------------------------------------------------
# Save cleaned master dataset
# ------------------------------------------------------------------
if (!dir.exists("data/clean")) dir.create("data/clean", recursive = TRUE)
fwrite(master_dt, "data/clean/master_clean.csv")

cat(sprintf(
  "\n✔ Master dataset saved: data/clean/master_clean.csv\n  %d rows | columns: %s\n",
  nrow(master_dt),
  paste(names(master_dt), collapse = ", ")
))

# ------------------------------------------------------------------
# Print master audit summary to console
# ------------------------------------------------------------------
summarise_master_log("logs/matching")

# ------------------------------------------------------------------
# Render Quarto audit report
# Set open_browser = TRUE to auto-open after rendering.
# ------------------------------------------------------------------
render_audit_report(
  log_dir      = "logs/matching",
  output_dir   = "reports",
  open_browser = interactive()   # opens automatically in RStudio
)
