#' Create a frequency table from a labelled variable in a data.table
#'
#' Creates a frequency table for a labelled variable where the value labels
#' are stored in the variable's `labels` attribute. The resulting table
#' contains the code, label, count, and percentage for each category.
#'
#' @param dt A data.table.
#' @param var Unquoted column name.
#' @param include_na Logical. If TRUE, missing values are included as a
#'   separate category.
#' @param na_label Label used for missing values.
#''
#' @return A data.table with the columns:
#' \describe{
#'   \item{code}{Underlying coded value.}
#'   \item{value}{Value label.}
#'   \item{N}{Frequency count.}
#'   \item{pct}{Percentage of observations.}
#' }
#'
#' @examples
#' dt <- data.table::data.table(
#'   kjonn = c(1, 1, 2, 2, 2, NA)
#' )
#'
#' attr(dt$kjonn, "labels") <- c(
#'   Mann = 1,
#'   Kvinne = 2
#' )
#'
#' freq_table(dt, kjonn)
#'
#' @export
freq_table <- function(
    dt,
    var,
    include_na = TRUE,
    na_label = "Missing") {
  
  # Capture column name
#   var_name <- deparse(substitute(var))
  var_name = var

  # Validate input
  if (!data.table::is.data.table(dt)) {
    stop("'dt' must be a data.table.")
  }

  if (!var_name %in% names(dt)) {
    stop(sprintf("Column '%s' not found.", var_name))
  }

  # Extract labels from variable attribute
  labels <- attr(dt[[var_name]], "labels")

  if (is.null(labels)) {
    stop(sprintf(
      "Column '%s' does not contain a 'labels' attribute.",
      var_name
    ))
  }

  # Create lookup table of codes and labels
  lookup <- data.table::data.table(
    code = unname(labels),
    value = names(labels)
  )

  # Count observations by code
  freq <- dt[
    ,
    .(N = .N),
    by = .(code = get(var_name))
  ]

  # Optionally include NA as a category
  if (include_na) {
    
    freq[is.na(code), code := "__NA__"]

    lookup <- rbind(
      lookup,
      data.table::data.table(
        code = "__NA__",
        value = na_label
      ),
      fill = TRUE
    )
  }

  # Join labels onto frequencies
  freq <- lookup[
    freq,
    on = "code"
  ]

  # Calculate percentages
  freq[
    ,
    pct := round(100 * N / sum(N), 1)
  ]

  # Order by code where possible
  data.table::setcolorder(
    freq,
    c("code", "value", "N", "pct")
  )

  freq[]
}
