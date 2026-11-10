# if(!require(pak)) install.packages("pak")
# pak::pkg_install("folkehelsestats/torr")

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

## Frequency
## -----------------------------------------------------------------------------
source(file.path(here::here(), "clean/yr2026/fun-freq-tbl.R"))

kj <- freq_table(dx, "kjonn")

# clean labelled attributes coz it makes troubles
kj[, (names(kj)) := lapply(.SD, \(x) { attributes(x) <- NULL; x })]



library(highdir)
spec <- hd_spec(kj, "value", "pct", n = "N")
opts <- hd_opts(title = "kjonn")
hd_make(spec, "column", opts)


## Describe the dataset
## ----------------

library(data.table)
library(skimr)

skimr::skim(dx)

skim(dx) |>
  as.data.table()

describe_dt <- function(dt, n_max_unique = 10, n_show = 5) {
  stopifnot(data.table::is.data.table(dt) || is.data.frame(dt))

  data.table(
    variable = names(dt),
    class = vapply(dt, function(x) class(x)[1], character(1)),
    n_unique = vapply(dt, function(x) length(unique(x)), integer(1)),
    values = vapply(dt, function(x) {

      ux <- unique(x)

      if (is.factor(x)) {
        paste(levels(x), collapse = ", ")
      } else if (length(ux) <= n_max_unique) {
        paste(ux, collapse = ", ")
      } else {
        paste(head(ux, n_show), collapse = ", ")
      }

    }, character(1))
  )
}

des <- describe_dt(dx)
fwrite(des, here::here("clean", "yr2026", "dx_variable_descriptions.csv"))

## -----------------------------------------------------------------------------
## Create report
## -----------------------------------------------------------------------------
pak::pak("ekstroem/dataReporter")

dataReporter::makeDataReport(data = dx,
                             output = "html",
                             render = TRUE,
                             mode = c("summarize", "visualize", "check"),
                             smartNum = TRUE,
                             file = "rtu_report2026.html",
                             listChecks = TRUE,
                             maxProbVals = Inf,
                             codebook = TRUE,
                             reportTitle = "Rus- og tobakksundersøkelsen 2026",
                             includeVariableList = TRUE)
