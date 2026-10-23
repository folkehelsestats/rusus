library(yaml)
library(data.table)
library(janitor)
library(readxl)

config_path = "clean/variable_map.yaml"

var_map <- yaml::read_yaml(config_path)

name_lookup <- lapply(names(var_map), function(canonical) {
  aliases <- var_map[[canonical]]$colnames
  setNames(rep(canonical, length(aliases)), aliases)
})
name_lookup <- unlist(name_lookup)


label_lookup <- lapply(names(var_map), function(canonical) {
  label <- var_map[[canonical]]$label 
})
names(label_lookup) <- names(var_map)


keyword_patterns <- lapply(names(var_map), function(canonical) {
  kws <- var_map[[canonical]]$keywords
  if (is.null(kws) || length(kws) == 0) return(NULL)
  paste(kws, collapse = "|")   # build OR regex from keyword list
})
names(keyword_patterns) <- names(var_map)
keyword_patterns <- Filter(Negate(is.null), keyword_patterns)  # drop NULLs

value_map <- lapply(names(var_map), function(canonical) {
  value_list <- var_map[[canonical]]$value
  if (is.null(value_list)) return(NULL)
  data.table(
    raw_value = names(value_list),
    new_value = as.character(unlist(value_list))
  )
})
names(value_map) <- names(var_map)


recode_map <- lapply(names(var_map), function(canonical) {
  recode_list <- var_map[[canonical]]$recode
  if (is.null(recode_list)) return(NULL)
  data.table(
    raw_value = names(recode_list),
    new_value = as.integer(unlist(recode_list))
  )
})
names(recode_map) <- names(var_map)

type_map <- sapply(names(var_map), function(canonical) {
  var_map[[canonical]]$type %||% "character"
})
