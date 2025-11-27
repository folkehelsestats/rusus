source("cleanRusus2025.R")
source("fun-codebook.R")

library(dataReporter)


meta <- extract_attr(ssb)

## Integer var
intVars <- meta[value_labels == "", name]

## Categorical variable
catVars <- setdiff(names(ssb), intVars)
ssb[, (catVars) := lapply(.SD, as.factor), .SDcols = catVars]

## Labels names after defining var types and values
## Else some var labels being excluded when defining factors var.
source("define_labels.R")

## saveRDS(ssb, file = file.path(Rususdata, "Rusus_2025", "rusus2025_20251126.rds"))

## Exclude problem variables with lots of text
dkb <- ssb[, -c("Can7sps", "Can8sps", "Ans2sps")] #Exclude free text coz create prob

dataReporter::makeDataReport(data = dkb,
                             output = "html",
                             mode = c("summarize",  "visualize", "check"),
                             smartNum = TRUE, #Treat few numerical as category
                             render = TRUE,
                             file = "rusus_check2025.html",
                             ## checks = setChecks(c("missing", "unique", "numRange", "valueRange")),
                             listChecks = TRUE,
                             maxProbVals = Inf,
                             codebook = TRUE,
                             reportTitle = "Rusundersøkelse 2025",
                             ## addSummaryTable = FALSE, #
                             includeVariableList = TRUE #add variable labels
                             )

## Just those that might have prob
makeDataReport(ssb, output = "html",
               onlyProblematic = TRUE,
               file = "ssb_report",
               includeVariableList = TRUE)

## Bare illegale rusmidler variabler
ilr <- ssbIrm[, -c("Can7sps", "Can8sps", "Ans2sps")]#Exclude free text coz create prob
dataReporter::makeDataReport(data = ilr,
                             mode = c("summarize",  "visualize", "check"),
                             smartNum = FALSE,
                             file = "illegal2025.html",
                             checks = setChecks(c("missing", "unique", "numRange", "valueRange")),
                             listChecks = FALSE,
                             maxProbVals = Inf,
                             codebook = TRUE, reportTitle = "Rusundersøkelse 2025 - Illegale rusmidler")


## Create Codebook
create_codebook(ssb, page = 50, save = TRUE)


## Hente variable labels og values
## ------------------------

library(data.table)
library(codebook)

# Anta at dt er ditt data.table-objekt
dt <- copy(ssb)

# Hent variabelbeskrivelser
var_labels <- sapply(dt, function(x) attr(x, "label"))

# Hent verdi-labels
value_labels <- sapply(dt, function(x) attr(x, "labels"))

# Lag metadata-tabell
metadata_dt <- data.table(
  variable = names(dt),
  var_label = var_labels,
  value_labels = sapply(value_labels, function(lbls) {
    if (!is.null(lbls)) paste(names(lbls), lbls, sep = "=", collapse = "; ") else NA
  }),
  var_type = sapply(dt, function(x) class(x)[1]),
  missing_values = sapply(dt, function(x) sum(is.na(x)))
)

## -----------------------

summarize(ssb$Alder)

makeDataReport(ssbIrm, open = FALSE, quiet = "silent",
 vol = paste("_", format(Sys.time(), "%m-%d%-%y_%H.%M"), sep = ""))

makeDataReport(ssbIrm, onlyProblematic = TRUE, mode = "check", replace = TRUE)

## # Example: Generate HTML codebook
## dataReporter::makeCodebook(ssb,checks = setChecks(c("missing", "unique", "numRange", "valueRange")),
##                            file = "rusus2025.html")
## library(dataReporter)
## makeDataReport(ssb, replace = TRUE)

## ## Check for missing value for vekting
## ## ssb[, vekt2 := as.numeric(sub(",", ".", vekt))]
## ## ssb[is.na(vekt2), .N]

## explore::explore(ssb)

## ## Do-file
## library(haven)
## library(data.table)

## dofile <- file.path(Rususdata, "Rusus_2025", "rus2025_v1", "statads.dat" )
## dt2025 <- read_stata(dofile)
## setDT(dt2025)


