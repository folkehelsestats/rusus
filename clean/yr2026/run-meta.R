
library(data.table)
library(khtools)
library(rio)
library(cuci)
library(labelled)

source(here::here("folder-path.R"))

file <- file.path(Rususdata, "Rusus_2026/ORG/rus2026_hdir_fhi_v2.parquet")
filem <- file.path(Rususdata, "Rusus_2026/ORG/rus2026_meta_hdir_fhi_v2.parquet")
fcsv <- file.path(Rususdata, "Rusus_2026/ORG/rus2026_hdir_fhi_v2.csv")


dt <- khtools::read_pq(file)
dr <- setDT(rio::import(file))
dm <- setDT(rio::import(filem))

## Rename variables from metadata
## ------------------------------

dx1 <- copy(dr)
dx2 <- copy(dr)

longVars <- unique(dm[["Varnavn"]])
shortVars <- unique(dm[["Varnavnkort"]])
shortVsml <- tolower(shortVars)

data.table::setnames(dx1, longVars, shortVars) #stor bokstaver
data.table::setnames(dx2, longVars, shortVsml) #små bokstaver

## Add metadata
source(file.path(here::here(), "clean/yr2026/input-meta.R"))

dx <- add_metadata_labels(
  data = dx2,
  metadata = dm
)

labelled::look_for(dx)

torr::create_codebook(dx, save = T)
