library(data.table)
library(khtools)
library(rio)
library(cuci)

source(here::here("folder-path.R"))

file <- file.path(Rususdata, "Rusus_2026/ORG/rus2026_hdir_fhi.parquet")
filem <- file.path(Rususdata, "Rusus_2026/ORG/rus2026_meta_hdir_fhi.parquet")
fcsv <- file.path(Rususdata, "Rusus_2026/ORG/rus2026_hdir_fhi.csv")


dt <- khtools::read_pq(file)
dr <- setDT(rio::import(file))
dm <- setDT(rio::import(filem))

dc <- fread(fcsv)

# rio::export(dc, file.path(Rususdata, "Rusus_2026/dataFraCSV_2026.dta") )
# rio::export(as.data.frame(names(dr)), file.path(Rususdata, "Rusus_2026/varnames2026.csv"))
rio::export(dm, file.path(Rususdata, "Rusus_2026/meta2026.csv"), sep = ";")
rio::export(dm, file.path(Rususdata, "Rusus_2026/meta2026.xlsx"))

## Standardisere
## -----------------------------------------------------------------------------
# rtu <- "https://raw.githubusercontent.com/folkehelsestats/rusus/refs/heads/main/config/variable_map.yaml"
# rtu <- "O:\\Prosjekt\\Rusdata\\Rusundersokelsen\\Datasets\\variable_map.yaml"
rtu <- "C:\\Users\\ykama\\Git-hdir\\rusus\\config\\variable_map02.yaml"

config <- load_config(rtu)

out <- clean_dataset(
  dt            = dr,
  config        = config,
  year_tag      = 2026L,
  dataset_label = "rtu2026.csv",
  apply_missing = FALSE              # keep 8/9 as integers for now
)

out$data
out$issues



# Returns a named list - one cleaned data.table per file
results <- run_pipeline(
  file_manifest = data.frame(path = fcsv, year_tag = 2026),
  config_file   = rtu,
  log_dir       = "logs/matching",
  output_path   = "data/clean",      # directory: one CSV per file
  merge         = FALSE
)

results["survey_2026_hdir_fhi.csv"]

# Report
render_report(
  log_dir = "logs/matching",
  output_dir = "reports",
  output_file = "rtu2026_report.html",
  create_dir = TRUE,
  open_browser = FALSE
)
