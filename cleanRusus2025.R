Sys.setlocale("LC_ALL", "nb-NO.UTF-8")
## Clean data from SSB
if (!requireNamespace("here", quietly = TRUE)) install.packages("here")
library("here")

source("folder-path.R")
source("setup.R")

## ssb2024 <- file.path(Rususdata, "Rusus_2024", "rus2024.rds")
## dt2024 <- readRDS(ssb2024)

ssb2025 <- file.path(Rususdata, "Rusus_2025", "ORG/rus2025_fhi_hdir_v3/rus2025_fhi_hdir.csv")
##ssb2025des <- file.path(Rususdata, "Rusus_2025", "rus2025_v2", "rus2025_fhi_hdir_desimaltall.csv")

ssb <- fread(ssb2025)
## ssbDes <- fread(ssb2025des)

## Variabler fra spørreskjema
## --------------------------

quesCol <- c(
  ##Bakgrunnsvariabler -------------
  "KommNavn", "Yrkesstatus",
  "YrkStat2", #"Yrkesstatus_1" i spørreskjema
  "yrke", # "Arbeid_kod" til hovedyrke
  "Siv", "SivStat", "AntPers", "AntBarn1", "AntBarn2",
  ##Egenopplevd helse ------------
  "Helse", "Helsepsyk",
  ##Rusvaner ----------------
  "Tob1", "Tob2", "Tob3", "Tob4a", "Tob5", "Tob13", "Tob14", "Tob20",
  "Tob21", "Tob22a", "Tob22b", "Tob22d", "Tob22q", "Tob22s", "Tob22r",
  "Tob23", "Tob30", "Tob31a", "Tob31b", "Tob31c", "Tob33", "Tob34",
  "Tob38", "Tob39", "Tob40", "Tob42a", "Tob42b", "Tob42d", "Tob42o",
  "Tob42m", "Tob42n", "Tob43", "Tob44", "Tobvan1", "Tob61", "Tob61b",
  ##"Tob62" spørsmålene er delt til disse
  "Tob62a", "Tob62e", "Tob62f", "Tob62g", "Tob62h",
  "TobE", "TobE1", "tobald", "TobE3", "TobE4",
  ##Tobxx om hvilke situasjoner røyer du
  "tobsit_a", "tobsit_b", "tobsit_c", "tobsit_d", "tobsit_e",
  "Tob60", "Tob64a", "Tob64b", "Tob64c", "TobPrSn1", "TobPrSn2",
  "Tob66", "Tob68", "Tob69", "Tob69b", "Tob71",
  "tobsluttsn1", # "Tobxx2" Har du noen gang prøvd å slutte med snus
  "tobsluttsn2", # "Tobxx3" Hvilket år sluttet du med snus
  ## Alkoholburk -----------
  "Drukket1",
  "Drukk1b", # "Drukket1b",
  "Drukket2",
  "Drukk2a", #"Drukket2a",
  "Drukk2b", #"Drukket2b",
  "Drukk2c", #"Drukket2c",
  ## Alkoholbruk frekvens og mengde ---------
  "Drukket3", "TYPE1", "TYPE2", "TYPE3", "TYPE4", "TYPE1a",
  "Typ1a_uk", # "Type1a_uk",
  "Typ1a_mn", # "Type1a_mn",
  ## "TYPE1b" fordelt til disse
  "Type1b_a", "Type1b_b", "Type1b_1", "Type1b_2",
  "Type1c_a", "Type1c_b",
  # "TYPE1c" fordelt til disse
  "Type1c_1", "Type1c_2", # "Type1c_3",
  "TYPE2a",
  "Typ2a_uk", # "Type2a_uk",
  "Typ2a_mn", # "Type2a_mn",
  ## "TYPE2b" fordelt til disse
  "Type2b_a", "Type2b_b", "Type2b_1", "Type2b_2",
  ## "TYPE2c" fordelt til disse
  "Type2c_a", "Type2c_b", "Type2c_1", "Type2c_2",
  "TYPE3a",
  "Typ3a_uk", # "Type3a_uk",
  "Typ3a_mn", # "Type3a_mn",
  # "TYPE3b" fordelt til disse
  "Type3b_a", "Type3b_b",
  "Type3b_1", "Type3b_2", # "Type3b1", "Type3b2
  # "TYPE3c" fordelt til disse
  "Type3c_a", "Type3c_b",
  "Type3c_1", "Type3c_2", # "Type3c1", "Type3c2",
  "TYPE4a",
  "Typ4a_uk", "Typ4a_mn", # "Type4a_uk", "Type4a_mn",
  # "TYPE4b" fordelt til disse
  "Type4b_a", "Type4b_b", "Type4b_1", "Type4b_2",
  # "TYPE4c" fordelt til disse
  "Type4c_a", "Type4c_b",
  "Type4c_1", "Type4c_2", "Beruset4",
  "AL2", "AL3", "AL4", "AL5",
  ##"ALKxx", #Hvordan anskaffer du vanligvis alkohol
  "alkansk_a","alkansk_b","alkansk_c","alkansk_d","alkansk_e",
  "alkansk_f","alkansk_g","alkansk_h","alkansk_i","alkansk_j",
  ## Risikofull alkoholbruk (AUDIT) -----------
  "Audit2", "Audit3", "AUDIT3_1", "AUDIT3_2", "AUDIT3_3",
  "Audit4", "Audit5", "Audit6", "Audit7", "Audit8",
  # "Audit9" fordelt til disse
  "Audit9_a", "Audit9_b", "Audit9_c", "Audit9a", "Audit9b",
  "Audit10", "Audit10a",
  ## Arbeidsliv og alkohol -------------
  "Arb_alk1", "Arb_alk1b", "Arb_alk2", "Arb_alk3",
  "Arb_alk4", "Arb_alk5",
  ## Reseptbelagte legemidler -------------
  "Leg1", "Leg2", "Leg3", "Leg5", "Leg6", "Leg7",
  "Leg9", "Leg10", "Leg11", "Leg12",
  ## Skjemadel narkotiske stoffer -----
  "Can1", "Can2", "Can3", "Can4", "Can5", "Can6", "Can6b",
  ## "Can7" er splittet til følgende:
  "Can7_a", "Can7_b", "Can7_c", "Can7_d", "Can7_e",
  "Can7sps", "Can8", "Can8sps", "Can9", "Can10",
  "Can11", "Can13", "Can14",
  ## Andre narkotiske stoffer --------
  "Ans1",
  # "Ans2" fordelt til disse
  "Ans2_a", "Ans2_b", "Ans2_c", "Ans2_d",
  "Ans2_e", "Ans2_f", "Ans2_g", "Ans2_x", "Ans2_y", "Ans2_h",
  ## "Ans2_sp1", "Ans2_sp2", "Ans2_sp3",
  "Ans2sps", # Alle Ans2_sp2 samles her
  "Ans3_1", "Ans3_2", "Ans3_3", "Ans3_4", "Ans3_5",
  "Ans3_6", "Ans3_7", "Ans3_x", "Ans3_y", "Ans3_8",
  "Ans_5", # "Ans5" i spørreskjema
  "Ans9",
  ## Prestasjonsfremmende midler --------
  "Dop1", "Dop3_1", "NegKons1", "NegKons2", "NegKons3",
  "NegKons4", "NegKons4_1", "NegKons5", "NegKons6",
  ## Pårørende ---------
  "paaror1a",
  ## "paaror1b" hvilken typer rusmidler dreier det seg om
  "paaror1b_a", "paaror1b_b", "paaror1b_c",
  ## "paaror2" familierelasjon
  "paaror2_a", "paaror2_b","paaror2_c","paaror2_d","paaror2_e",
  "paaror3", "paaror4", "paaror5"
)


SSBcol <- names(ssb)

## Kolonne fra spørreskjema, men ikke i datasettet
diffQues <- quesCol[!tolower(quesCol) %chin% tolower(SSBcol)]

## Kolonne i datasettet som ikke finnes i spørreskjema
diffSSB <- SSBcol[!tolower(SSBcol) %chin% tolower(quesCol)]

## Define variables
source("define_variables.R")

## Illegale rusmidler
canInd <- which(quesCol == "Can1") #her fra er det TOIL vars
canVars <- quesCol[canInd:length(quesCol)]
ssbIrm <- ssb[, ..canVars]

dt <- copy(ssb)
setnames(dt, names(dt), tolower(names(dt)))
