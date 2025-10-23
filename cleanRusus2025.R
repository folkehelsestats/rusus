## Clean data from SSB
if (!requireNamespace("here", quietly = TRUE)) install.packages("here")
library("here")

source("folder-path.R")
source("setup.R")
ssb2025 <- file.path(Rususdata, "Rusus_2025", "rus2025_v2", "rus2025_fhi_hdir.csv")
ssb2025des <- file.path(Rususdata, "Rusus_2025", "rus2025_v2", "rus2025_fhi_hdir_desimaltall.csv")

ssb <- fread(ssb2025)
ssbDes <- fread(ssb2025des)
