clean_dataset <- function(dt, config, year_tag = NULL, dataset_label = "") {
  
  dt <- copy(dt)
  
  # ---- Step 1: Normalize column names ----------------------------------
  dt <- as.data.table(janitor::clean_names(as.data.frame(dt)))
  
  # ---- Step 2: Intelligent column matching (3-layer) -------------------
  match_result <- match_columns(names(dt), config)
  
  # Print the full match report with warnings for predicted columns
  print_match_report(match_result, dataset_label)
  
  # ---- Step 3: Apply renames from matching engine ----------------------
  if (length(match_result$rename_vec) > 0) {
    existing_renames <- match_result$rename_vec[
      names(match_result$rename_vec) %in% names(dt)
    ]
    if (length(existing_renames) > 0) {
      setnames(dt, old = names(existing_renames), new = unname(existing_renames))
    }
  }
  
  # ---- Step 4: Keep only canonical variables ---------------------------
  keep_cols <- intersect(names(dt), names(config$var_map))
  dt        <- dt[, ..keep_cols]
  
  # ---- Step 5: Recode values -------------------------------------------
  for (var in keep_cols) {
    recode_tbl <- config$recode_map[[var]]
    if (!is.null(recode_tbl)) {
      raw_as_char <- as.character(dt[[var]])
      recode_vec  <- setNames(recode_tbl$new_value, recode_tbl$raw_value)
      recoded     <- recode_vec[raw_as_char]
      matched     <- !is.na(recoded)
      if (any(matched)) dt[matched, (var) := recoded[matched]]
    }
  }
  
  # ---- Step 6: Type coercion -------------------------------------------
  for (var in keep_cols) {
    target_type <- config$type_map[[var]]
    dt[, (var) := switch(
      target_type,
      "integer"   = as.integer(get(var)),
      "numeric"   = as.numeric(get(var)),
      "character" = as.character(get(var)),
      get(var)
    )]
  }
  
  # ---- Step 7: Inject year if provided ---------------------------------
  if (!is.null(year_tag)) {
    dt[, year := as.integer(year_tag)]
  }
  
  # ---- Step 8: Remove duplicates and fully empty rows ------------------
  dt <- unique(dt)
  dt <- dt[!rowSums(is.na(dt)) == ncol(dt)]
  
  return(dt)
}
