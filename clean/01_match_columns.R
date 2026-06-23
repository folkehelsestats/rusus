# ------------------------------------------------------------------
# match_columns()
#
# Attempts to map raw column names to canonical names using a
# three-layer strategy, in order of confidence:
#
#   Layer 1 — EXACT MATCH    : raw name is in the alias dictionary
#   Layer 2 — FUZZY MATCH    : raw name is close to an alias
#                              (edit distance via agrep)
#   Layer 3 — KEYWORD MATCH  : raw name contains a known keyword
#                              (regex pattern match)
#
# Returns a data.table log of all matches with their method and
# confidence level, plus a rename vector ready for setnames().
# ------------------------------------------------------------------

match_columns <- function(raw_colnames, config, fuzzy_max_distance = 0.15) {
  
  # All canonical variable names we are trying to find
  canonical_vars <- names(config$var_map)
  
  # ---- Sanity check: warn early if name_lookup is empty ---------------
  # This almost always means load_config() is reading 'raw_aliases' from
  # the YAML but the file uses 'colnames'. Fix: in load_config(), change
  #   var_map[[canonical]]$raw_aliases
  # to
  #   var_map[[canonical]]$colnames
  if (length(config$name_lookup) == 0) {
    warning(
      "config$name_lookup is empty — exact and fuzzy matching will be skipped.\n",
      "  Check that load_config() reads the correct field from your YAML.\n",
      "  Your YAML uses 'colnames:' but load_config() may be reading 'raw_aliases:'.\n",
      "  Fix: replace '$raw_aliases' with '$colnames' in load_config().",
      call. = FALSE
    )
  }
  
  # Columns not yet assigned to a canonical variable (starts as all cols)
  unmatched <- raw_colnames
  
  # Accumulate match records: one row per matched column
  match_log <- list()
  
  # Track which canonical variables have already been claimed
  # to avoid assigning two raw columns to the same canonical name
  claimed_canonical <- character(0)
  
  
  # ================================================================
  # LAYER 1: EXACT MATCH
  # Check if the raw column name appears directly in the alias lookup.
  # This is the highest-confidence match — no ambiguity.
  # ================================================================
  for (col in unmatched) {
    if (col %in% names(config$name_lookup)) {
      canonical <- config$name_lookup[[col]]
      
      # Skip if this canonical variable was already matched
      if (canonical %in% claimed_canonical) next
      
      match_log[[length(match_log) + 1]] <- data.table(
        raw_name      = col,
        canonical     = canonical,
        method        = "exact",
        confidence    = "high",
        needs_review  = FALSE
      )
      claimed_canonical <- c(claimed_canonical, canonical)
    }
  }
  
  # Remove exactly-matched columns from the unmatched pool
  exact_matched <- sapply(match_log, `[[`, "raw_name")
  unmatched     <- setdiff(unmatched, exact_matched)
  
  
  # ================================================================
  # LAYER 2: FUZZY MATCH (edit distance)
  # Uses agrep() which implements the Levenshtein distance algorithm.
  # Catches typos and minor spelling variations.
  # e.g. "counrty" -> "country", "educaiton" -> "education"
  # max.distance controls tolerance: 0.15 = up to ~15% of chars wrong
  # ================================================================

  # Consider to exclude the exactly matched aliases from the fuzzy search to reduce false positives??
  # should use unmatched aliases only?? but that might miss some matches if the exact match was claimed by another column
  #
  # NOTE: name_lookup keys are the values from the YAML 'colnames' field.
  # If name_lookup is empty here it means load_config() is reading 'raw_aliases'
  # but your YAML uses 'colnames' — ensure load_config() reads var$colnames.
  all_aliases <- names(config$name_lookup)  # full pool of known aliases
  
  for (col in unmatched) {
    # Find aliases within edit-distance threshold of this raw column name
    fuzzy_hits <- agrep(
      pattern      = col,
      x            = all_aliases, #should use unmatched aliases only??
      max.distance = fuzzy_max_distance,
      value        = TRUE,    # return matched strings, not indices
      ignore.case  = TRUE
    )
    
    if (length(fuzzy_hits) == 0) next  # no fuzzy match found, move on
    
    # If multiple hits, pick the closest alias (shortest edit distance)
    # by taking the first result (agrep returns in order of closeness)
    best_alias <- fuzzy_hits[1]
    canonical  <- config$name_lookup[[best_alias]]
    
    if (canonical %in% claimed_canonical) next  # already assigned
    
    match_log[[length(match_log) + 1]] <- data.table(
      raw_name      = col,
      canonical     = canonical,
      method        = "fuzzy",
      confidence    = "medium",
      needs_review  = TRUE    # fuzzy matches always flagged for review
    )
    claimed_canonical <- c(claimed_canonical, canonical)
  }
  
  # Remove fuzzy-matched columns from unmatched pool
  fuzzy_matched <- sapply(
    Filter(function(x) x$method == "fuzzy", match_log), `[[`, "raw_name"
  )
  unmatched <- setdiff(unmatched, fuzzy_matched)
  
  
  # ================================================================
  # LAYER 3: KEYWORD / PATTERN MATCH
  # Check if the raw column name *contains* a keyword associated with
  # a canonical variable. This catches completely different names
  # that still carry semantic meaning.
  # e.g. "school_level" -> education (keyword: "school")
  #      "annual_wage"  -> income    (keyword: "wage")
  # ================================================================
  for (col in unmatched) {
    matched_canonical <- NULL
    matched_keyword   <- NULL
    
    for (canonical in names(config$keyword_patterns)) {
      if (canonical %in% claimed_canonical) next  # already claimed
      
      pattern <- config$keyword_patterns[[canonical]]

      # Clean pattern
      if (is.null(pattern) || pattern %in% c("NA", "", NA)) next
      
      # grepl checks if the combined keyword pattern appears in the column name.
      # 'pattern' here is already a single regex string built by build_keyword_patterns(),
      # e.g. "\\b(kjonn|sex|gender)\\b" — safe to pass directly to grepl().
      if (grepl(pattern, col, ignore.case = TRUE, perl = TRUE)) {
        matched_canonical <- canonical
        
        # --- Find which specific keyword triggered the match --------
        # Split the combined pattern back into individual keyword tokens
        # and test each one separately against the column name.
        # This must use sapply/vapply (scalar per element), NOT grepl()
        # on the whole vector — that would only test the first element
        # and return NA for the rest, causing the "NA" display bug.
        keywords <- unlist(strsplit(pattern, "\\|"))
        
        # Strip regex word-boundary wrappers added by build_keyword_patterns()
        keywords <- gsub("^\\\\b\\(|\\)\\\\b$", "", keywords)
        keywords <- trimws(keywords)
        keywords <- keywords[nchar(keywords) >= 3]
        
        # Use vapply for element-wise grepl: one TRUE/FALSE per keyword
        hit_flags <- vapply(
          keywords,
          function(kw) grepl(kw, col, ignore.case = TRUE),
          logical(1)
        )
        
        # Pick the longest matching keyword for the clearest report label
        matching_kws <- keywords[hit_flags]
        if (length(matching_kws) == 0) {
          matched_keyword <- pattern   # fallback: show the raw pattern
        } else {
          matched_keyword <- matching_kws[which.max(nchar(matching_kws))]
        }
        
        break  # stop at first canonical variable that matches
      }
    }
    
    if (!is.null(matched_canonical)) {
      match_log[[length(match_log) + 1]] <- data.table(
        raw_name      = col,
        canonical     = matched_canonical,
        method        = sprintf('keyword ["%s"]', matched_keyword),
        confidence    = "low",
        needs_review  = TRUE    # keyword matches always flagged for review
      )
      claimed_canonical <- c(claimed_canonical, matched_canonical)
    }
  }
  
  
  # ================================================================
  # Compile final match log and rename vector
  # ================================================================
  if (length(match_log) == 0) {
    # No matches at all — return empty structures
    return(list(
      match_log   = data.table(),
      rename_vec  = setNames(character(0), character(0)),
      unmatched   = raw_colnames
    ))
  }
  
  match_log_dt <- rbindlist(match_log)
  
  # Build rename vector: old_name -> new_canonical_name
  # Only include renames where the name actually changes
  rename_vec <- with(
    match_log_dt[raw_name != canonical],
    setNames(canonical, raw_name)
  )
  
  # Columns that were never matched by any layer
  all_matched <- match_log_dt$raw_name
  truly_unmatched <- setdiff(raw_colnames, all_matched)
  
  list(
    match_log   = match_log_dt,
    rename_vec  = rename_vec,
    unmatched   = truly_unmatched   # columns we couldn't map at all
  )
}


# ------------------------------------------------------------------
# print_match_report()
# Prints a human-readable summary of the column matching results,
# with clear warnings for predicted (fuzzy/keyword) matches.
# ------------------------------------------------------------------
print_match_report <- function(match_result, dataset_label = "") {
  
  log <- match_result$match_log
  if (nrow(log) == 0 && length(match_result$unmatched) == 0) return(invisible())
  
  cat(sprintf("\n╔══════════════════════════════════════════════════════╗\n"))
  cat(sprintf("  Column Matching Report: %s\n", dataset_label))
  cat(sprintf("╚══════════════════════════════════════════════════════╝\n"))
  
  # --- Exact matches (high confidence, no action needed) ---------------
  exact <- log[method == "exact"]
  if (nrow(exact) > 0) {
    cat(sprintf("\n  ✔ EXACT MATCHES (%d):\n", nrow(exact)))
    exact[, cat(sprintf("    %-25s -> %s\n", raw_name, canonical)), by = seq_len(nrow(exact))]
  }
  
  # --- Fuzzy matches (medium confidence, review advised) ---------------
  fuzzy <- log[method == "fuzzy"]
  if (nrow(fuzzy) > 0) {
    cat(sprintf("\n  ⚠ FUZZY MATCHES — please double-check (%d):\n", nrow(fuzzy)))
    fuzzy[, cat(sprintf("    %-25s -> %-15s  [possible typo/variant]\n",
                        raw_name, canonical)), by = seq_len(nrow(fuzzy))]
  }
  
  # --- Keyword matches (low confidence, must review) -------------------
  keyword <- log[grepl("^keyword", method)]
  if (nrow(keyword) > 0) {
    cat(sprintf("\n  ⚠⚠ KEYWORD/PREDICTED MATCHES — must verify (%d):\n", nrow(keyword)))
    keyword[, cat(sprintf("    %-25s -> %-15s  matched by %s\n",
                          raw_name, canonical, method)), by = seq_len(nrow(keyword))]
  }
  
  # --- Unmatched columns (completely unknown) -------------------------
  if (length(match_result$unmatched) > 0) {
    cat(sprintf("\n  ✖ UNMATCHED COLUMNS — not included in output (%d):\n",
                length(match_result$unmatched)))
    cat(sprintf("    %s\n", paste(match_result$unmatched, collapse = ", ")))
    cat("    → Consider adding these to your variable_map.yaml\n")
  }
  
  cat("\n")
  invisible()
}


# ---------------------------------------------------------------
# build_keyword_patterns()
#
# Cleans and constructs strict regex patterns from YAML keywords
# ---------------------------------------------------------------
build_keyword_patterns <- function(config, min_char = 3) {
  
  keyword_patterns <- lapply(config$var_map, function(var_def) {
    
    keywords <- var_def$keywords
    
    # ---- Step 1: Handle NULL / ~ / NA safely -------------------
    if (is.null(keywords) || all(is.na(keywords))) {
      return(NULL)
    }
    
    # Convert to character
    keywords <- as.character(keywords)
    
    # ---- Step 2: Clean keywords --------------------------------
    keywords <- tolower(keywords)
    keywords <- trimws(keywords)
    
    # Remove invalid values
    keywords <- keywords[
      !keywords %in% c("", "na", "null", "none") &
      !is.na(keywords)
    ]
    
    # Remove weak tokens (very important)
    keywords <- keywords[nchar(keywords) >= min_char]
    
    # If nothing left → no pattern
    if (length(keywords) == 0) {
      return(NULL)
    }
    
    # ---- Step 3: Escape regex special characters ----------------
    keywords <- gsub("([\\.\\^\\$\\*\\+\\?\\(\\)\\[\\{\\\\\\|])", "\\\\\\1", keywords)
    
    # ---- Step 4: Build STRICT pattern with word boundaries ------
    pattern <- paste0("\\b(", paste(unique(keywords), collapse = "|"), ")\\b")
    
    return(pattern)
  })
  
  # Remove NULL entries (important!)
  keyword_patterns <- keyword_patterns[!sapply(keyword_patterns, is.null)]
  
  return(keyword_patterns)
}
