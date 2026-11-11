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

## Ensure correct datatype and encoding
## -----------------------------------------------------------------------------
library(cuci)

readr::guess_encoding(
  here::here("clean/yr2026/variable_map.yaml")
)

path <- here::here("clean/yr2026/variable_map.yaml")

txt <- readLines(path, encoding = "latin1", warn = FALSE)

# Convert to UTF-8 if not
writeLines(
  enc2utf8(txt),
  path,
  useBytes = TRUE
)

cfg <- cuci::load_config(here::here("clean/yr2026/variable_map.yaml"))


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

## -----------------------------------------------------------------------------
## Create report
## -----------------------------------------------------------------------------
pak::pak("ybkamaleri/dataReporter@flip")
library(dataReporter)

check(dx$alder)
check(dx)
allCheckFunctions()

identifyMissing(dx$alder)


summarize(dx[, c("alder", "aldersgruppe")])

visualize(dx$alder)
visualize(dx[, c("alder", "aldersgruppe")])

makeCodebook(dx,
             reportTitle = "Rus- og tobakksundersøkelsen 2026",
             file = "rtu_check2026.html")

dataReporter::makeDataReport(data = dx,
                             vol = 1,
                             output = "html",
                             render = TRUE,
                             mode = c("summarize", "visualize", "check"),
                             smartNum = TRUE,
                             file = file.path(here::here("clean/yr2026/rtu_report2026.html")),
                             listChecks = TRUE,
                             maxProbVals = Inf,
                             codebook = TRUE,
                             visuals = setVisuals(all = "standardVisual"), #basicVisual (base R) or standardVisual (ggplot2)
                             reportTitle = "Rus- og tobakksundersøkelsen 2026",
                             includeVariableList = TRUE,
                             rename = TRUE)

## Curiousity
## ---------

myvar <- 1:10
manyVars <- dx[, c("kjonn", "alder", "aldersgruppe")]

basicVisual(dx$kjonn, "Kjønn")
standardVisual(myvar, "MyTest")

visualize(manyVars)
visualize(manyVars, setVisuals(character = "basicVisual", factor = "standardVisual"))

basicVisual(myvar, "MyTest", doEval = F)
standardVisual(myvar, "MyTest", doEval = F)

allVisualFunctions()
