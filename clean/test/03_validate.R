# ------------------------------------------------------------------
# validate_dataset()
# Runs a set of basic sanity checks on a cleaned dataset.
# Prints a summary report and returns the data invisibly
# so it can be used inline in a pipeline.
# ------------------------------------------------------------------
validate_dataset <- function(dt, dataset_label = "") {
  
  cat("\n========================================\n")
  cat(sprintf(" Validation Report: %s\n", dataset_label))
  cat("========================================\n")
  cat(sprintf("  Rows    : %d\n", nrow(dt)))
  cat(sprintf("  Columns : %s\n", paste(names(dt), collapse = ", ")))
  
  # --- Check for expected canonical columns --------------------------
  expected_core <- c("year")  # at minimum, year must always be present
  missing_core  <- setdiff(expected_core, names(dt))
  if (length(missing_core) > 0) {
    warning(sprintf("[%s] Missing core columns: %s", dataset_label, paste(missing_core, collapse = ", ")))
  }
  
  # --- Report missingness per column ---------------------------------
  cat("\n  Missingness per column:\n")
  miss_pct <- dt[, lapply(.SD, function(x) round(mean(is.na(x)) * 100, 1))]
  for (col in names(miss_pct)) {
    cat(sprintf("    %-20s %s%%\n", col, miss_pct[[col]]))
  }
  
  # --- Check value ranges for known numeric variables ----------------
  if ("age" %in% names(dt)) {
    out_of_range <- dt[!is.na(age) & (age < 0 | age > 120), .N]
    if (out_of_range > 0)
      warning(sprintf("[%s] %d rows with age out of range [0, 120]", dataset_label, out_of_range))
    else
      cat("\n  ✔ Age range OK\n")
  }
  
  if ("sex" %in% names(dt)) {
    # After recoding, sex should only be 1 (Male) or 2 (Female)
    invalid_sex <- dt[!is.na(sex) & !sex %in% c(1L, 2L), .N]
    if (invalid_sex > 0)
      warning(sprintf("[%s] %d rows with unexpected sex codes", dataset_label, invalid_sex))
    else
      cat("  ✔ Sex codes OK (1=Male, 2=Female)\n")
  }
  
  cat("========================================\n")
  
  invisible(dt)  # return dt so this can be used mid-pipeline
}
