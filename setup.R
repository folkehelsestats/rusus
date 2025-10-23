# tcltk - to display the CRAN windows when not active. Relevant for Emacs
# DescTools - for Winsorize function
pkgs <- c("skimr", "codebook", "tcltk", "viridisLite",
          "DescTools", "gt", "ggplot2", "here", "haven",
          "rlang","emmeans", "highcharter", "data.table")

invisible(lapply(pkgs, function(pkg) {
    if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg)
    library(pkg, character.only = TRUE)
}))


