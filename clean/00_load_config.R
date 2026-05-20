library(yaml)
library(data.table)
library(janitor)
library(readxl)

`%||%` <- function(a, b) if (!is.null(a)) a else b

load_config <- function(config_path = "config/variable_map.yaml") {
  
  var_map <- yaml::read_yaml(config_path)
  
  # --- Exact name lookup: colnames -> canonical_name ------------------
  name_lookup <- lapply(names(var_map), function(canonical) {
    aliases <- var_map[[canonical]]$colnames
    setNames(rep(canonical, length(aliases)), aliases)
  })
  name_lookup <- unlist(name_lookup)

  # --- Label lookup: canonical_name -> human-readable label -------------
  # This is used for reporting and can be the same as canonical_name or more descriptive.
  # e.g. "edu_attainment" -> "Education Attainment"
  label_lookup <- lapply(names(var_map), function(canonical) {
    label <- var_map[[canonical]]$label 
  })
  names(label_lookup) <- names(var_map)
  
  # --- Keyword pattern lookup: canonical_name -> regex pattern ----------
  # Each variable's keywords are collapsed into a single regex that
  # matches if ANY keyword appears anywhere in the column name.
  # e.g. education keywords -> "edu|school|educ|learn|degree|grade|qualif|literacy"
  keyword_patterns <- lapply(names(var_map), function(canonical) {
    kws <- var_map[[canonical]]$keywords
    if (is.null(kws) || length(kws) == 0) return(NULL)
    paste(kws, collapse = "|")   # build OR regex from keyword list
  })
  names(keyword_patterns) <- names(var_map)
  keyword_patterns <- Filter(Negate(is.null), keyword_patterns)  # drop NULLs
  
  # --- Recode map: canonical_name -> data.table of old->new values ------
  recode_map <- lapply(names(var_map), function(canonical) {
    recode_list <- var_map[[canonical]]$recode
    if (is.null(recode_list)) return(NULL)
    data.table(
      raw_value = names(recode_list),
      new_value = as.integer(unlist(recode_list))
    )
  })
  names(recode_map) <- names(var_map)
  
  # --- Type map: canonical_name -> R type -------------------------------
  type_map <- sapply(names(var_map), function(canonical) {
    var_map[[canonical]]$type %||% "character"
  })
  
  list(
    name_lookup      = name_lookup,
    keyword_patterns = keyword_patterns,
    recode_map       = recode_map,
    type_map         = type_map,
    var_map          = var_map
  )
}
