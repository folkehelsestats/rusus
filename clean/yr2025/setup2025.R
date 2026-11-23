# ---------------------------
## Analyser for 2024 dataene
# --------------------------
if (!requireNamespace("here", quietly = TRUE)) install.packages("here")
library("here")

library(data.table)
library(khtools)
library(rio)
library(cuci)

source(here::here("folder-path.R"))

DT24 <- readRDS(file.path(Rususdata, "Rusus_2024","rus2024.rds"))
dt24 <- as.data.table(DT24)

setnames(dt24, tolower(names(dt24)))


alkocl <- c("type1b_a", "type1b_b", "type1b_1", "type1b_2")
dt24[, lapply(.SD, str), .SDcols = alkocl]
