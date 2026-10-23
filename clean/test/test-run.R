
source("clean/00_load_config.R")
source("clean/01_match_columns.R")
source("clean/02_clean_dataset.R")
source("clean/03_validate.R")
source("clean/04_export_log.R")
source("clean/05_render_report.R")   # <- report renderer

library(data.table)
library(readxl)
library(janitor)

# Path to dataset config file (CSV or Excel)
# ------------------------------------------------------------------------------
source("https://raw.githubusercontent.com/folkehelsestats/rusus/refs/heads/main/folder-path.R")

# file <- file.path(Rususdata, "Rusus_2026\\midlertidig\\dataset_v2\\rus2026_midl.csv")
file <- file.path(Rususdata, "Rusus_2025/rus2025_v4/rus2025_fhi_hdir.csv")

DT <- fread(file)

read_raw_file <- function(path) {
  ext <- tolower(tools::file_ext(path))
  switch(ext,
    "csv"  = fread(path),
    "tsv"  = fread(path, sep = "\t"),
    "xlsx" = as.data.table(read_excel(path)),
    stop(sprintf("Unsupported file type: .%s", ext))
  )
}

file_manifest <- data.table(
  path     = c(file),
  year_tag = c(2026)
)

config     <- load_config("clean/variable_map.yaml")
clean_list <- vector("list", nrow(file_manifest))

i <- 1
path     <- file_manifest$path[i]
year_tag <- file_manifest$year_tag[i]
label    <- basename(path)

cat(sprintf("\n── Processing: %s ─────────────────────────\n", label))

# 1. Read raw file
raw_dt <- read_raw_file(path)

# 2. Normalise column names (same step as inside clean_dataset)
#    so match_columns sees the same names that cleaning will use
# normed_dt <- as.data.table(janitor::clean_names(as.data.frame(raw_dt)))

# 3. Run three-layer column matching
# match_result <- match_columns(names(normed_dt), config)
match_result <- match_columns(names(raw_dt), config)

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
