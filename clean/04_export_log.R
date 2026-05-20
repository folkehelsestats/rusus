# ------------------------------------------------------------------
# export_match_log()
#
# Exports the column matching log for a single dataset to a CSV file.
# The log captures every column mapping decision made by the three-
# layer matching engine, including the method used and whether the
# match needs manual review.
#
# A master log is also appended to track decisions across all years
# in one place for a full audit trail.
#
# Arguments:
#   match_result   : output from match_columns()
#   dataset_label  : human-readable label (e.g. filename)
#   year_tag       : numeric year for the dataset
#   log_dir        : folder where CSV logs are written
#   append_master  : if TRUE, appends to a master log across all files
# ------------------------------------------------------------------

export_match_log <- function(match_result,
                             dataset_label  = "",
                             year_tag       = NA,
                             log_dir        = "logs/matching",
                             append_master  = TRUE) {
  
  # Create log directory if it doesn't exist
  if (!dir.exists(log_dir)) {
    dir.create(log_dir, recursive = TRUE)
    message(sprintf("Created log directory: %s", log_dir))
  }
  
  log_dt <- match_result$match_log
  
  # ---- Build a complete log including unmatched columns ---------------
  # Unmatched columns are recorded as their own rows so the audit log
  # is a full picture of every column in the raw dataset.
  
  if (length(match_result$unmatched) > 0) {
    unmatched_dt <- data.table(
      raw_name     = match_result$unmatched,
      canonical    = NA_character_,
      method       = "unmatched",
      confidence   = "none",
      needs_review = TRUE
    )
    # Combine matched and unmatched rows into a single log
    log_dt <- rbindlist(list(log_dt, unmatched_dt), fill = TRUE, use.names = TRUE)
  }
  
  # ---- Add metadata columns to every row ------------------------------
  log_dt[, `:=`(
    dataset    = dataset_label,          # which file this row came from
    year       = year_tag,               # survey year for traceability
    logged_at  = format(Sys.time(), "%Y-%m-%d %H:%M:%S"),  # timestamp
    # Human-readable action summary for quick scanning
    action     = fcase(
      method == "exact",              "Renamed to canonical",
      method == "fuzzy",              "Renamed — verify spelling",
      grepl("^keyword", method),      "Predicted — must verify",
      method == "unmatched",          "DROPPED — not in canonical set",
      default = "Unknown"
    )
  )]
  
  # ---- Sort: review-needed rows first, then by confidence level -------
  # This puts the most important rows at the top when the CSV is opened
  confidence_order <- c("none", "low", "medium", "high")
  log_dt[, confidence_rank := match(confidence, confidence_order)]
  setorder(log_dt, -needs_review, confidence_rank)  # descending review priority
  log_dt[, confidence_rank := NULL]                 # drop the helper column
  
  # ---- Reorder columns for readability --------------------------------
  setcolorder(log_dt, c(
    "dataset", "year", "raw_name", "canonical",
    "method", "confidence", "needs_review", "action", "logged_at"
  ))
  
  # ---- Write per-dataset CSV ------------------------------------------
  # Filename uses the dataset label with spaces replaced and .csv appended
  safe_label  <- gsub("[^A-Za-z0-9_-]", "_", dataset_label)
  per_file_path <- file.path(log_dir, sprintf("match_log_%s.csv", safe_label))
  
  fwrite(log_dt, per_file_path)
  
  cat(sprintf("  📄 Match log saved: %s\n", per_file_path))
  
  # ---- Optionally append to master log across all datasets ------------
  if (append_master) {
    master_path <- file.path(log_dir, "match_log_MASTER.csv")
    
    if (file.exists(master_path)) {
      # Read existing master, append new rows, write back
      # This preserves history from previous pipeline runs
      master_dt   <- fread(master_path)
      
      # Remove any existing rows for this dataset (re-run safety)
      # so re-processing a file doesn't create duplicate entries
      master_dt   <- master_dt[dataset != dataset_label]
      
      combined_dt <- rbindlist(list(master_dt, log_dt), fill = TRUE, use.names = TRUE)
    } else {
      combined_dt <- log_dt  # first run — master log doesn't exist yet
    }
    
    fwrite(combined_dt, master_path)
    cat(sprintf("  📋 Master log updated: %s (%d total decisions)\n",
                master_path, nrow(combined_dt)))
  }
  
  invisible(log_dt)  # return log invisibly for optional downstream use
}


# ------------------------------------------------------------------
# summarise_master_log()
#
# Reads the master log and prints a high-level summary across all
# datasets — useful for a quick end-of-pipeline audit overview.
# ------------------------------------------------------------------
summarise_master_log <- function(log_dir = "logs/matching") {
  
  master_path <- file.path(log_dir, "match_log_MASTER.csv")
  
  if (!file.exists(master_path)) {
    message("No master log found at: ", master_path)
    return(invisible(NULL))
  }
  
  master_dt <- fread(master_path)
  
  cat("\n╔══════════════════════════════════════════════════════╗\n")
  cat("  MASTER AUDIT SUMMARY — All Datasets\n")
  cat("╚══════════════════════════════════════════════════════╝\n")
  
  # Overall counts by match method
  cat("\n  Decisions by match method (all datasets):\n")
  method_summary <- master_dt[, .N, by = method][order(-N)]
  method_summary[, cat(sprintf("    %-30s %d\n", method, N)), by = seq_len(nrow(method_summary))]
  
  # Count of columns needing review per dataset
  cat("\n  Columns flagged for review per dataset:\n")
  review_summary <- master_dt[needs_review == TRUE, .N, by = .(dataset, year)][order(year)]
  
  if (nrow(review_summary) == 0) {
    cat("    ✔ No columns flagged for review.\n")
  } else {
    review_summary[, cat(sprintf("    %-35s (year %s): %d column(s)\n",
                                  dataset, year, N)), by = seq_len(nrow(review_summary))]
    cat(sprintf("\n  ⚠ Total columns needing review: %d\n",
                master_dt[needs_review == TRUE, .N]))
  }
  
  # List all predicted/keyword matches across all files for quick action
  predicted <- master_dt[grepl("^keyword", method)]
  if (nrow(predicted) > 0) {
    cat("\n  ⚠⚠ ALL PREDICTED (keyword) MATCHES — verify these:\n")
    predicted[, cat(sprintf("    [%s | %s]  %-25s -> %s  (%s)\n",
                             dataset, year, raw_name, canonical, method)),
              by = seq_len(nrow(predicted))]
  }
  
  cat("\n")
  invisible(master_dt)
}
