#' Add variable and value labels from metadata
#'
#' Adds variable labels and value labels using metadata stored in a
#' separate table. Variable labels are taken from `Vartext` and value
#' labels are created from `Kode` and `Tekst`.
#'
#' Variables whose metadata contain no codes (all `Kode` are missing)
#' receive only variable labels. This is appropriate for continuous
#' variables, counts and free-text fields.
#'
#' Several validation checks are performed to identify metadata problems
#' before value labels are attached.
#'
#' @param data A data.frame or data.table containing the survey data.
#' @param metadata A data.frame or data.table containing metadata.
#'
#' Required metadata columns:
#' \itemize{
#'   \item Varnavnkort: variable name in data
#'   \item Vartext: variable label
#'   \item Kode: coded value
#'   \item Tekst: value label
#' }
#'
#' @param warn_unused_codes Logical. If TRUE, warn when metadata contains
#' codes that are not observed in the data.
#'
#' @return
#' The input dataset with:
#' \itemize{
#'   \item variable labels attached using labelled::var_label()
#'   \item value labels attached using labelled::val_labels()
#' }
#'
#' @examples
#' dr <- add_metadata_labels(
#'   data = dr,
#'   metadata = dm
#' )
#'
#' labelled::look_for(dr)
#'
#' @export
add_metadata_labels <- function(
    data,
    metadata,
    warn_unused_codes = TRUE) {

  #------------------------------------------------------------
  # Validate required metadata columns
  #------------------------------------------------------------
  #
  # Without these columns we cannot reliably build labels.
  #
  required_cols <- c(
    "Varnavnkort",
    "Vartext",
    "Kode",
    "Tekst"
  )

  missing_cols <- setdiff(
    required_cols,
    names(metadata)
  )

  if (length(missing_cols) > 0) {

    stop(
      "Missing required metadata column(s): ",
      paste(missing_cols, collapse = ", "),
      call. = FALSE
    )
  }

  #------------------------------------------------------------
  # Process one variable at a time
  #------------------------------------------------------------
  for (var in unique(tolower(metadata$Varnavnkort))) {

    # Skip metadata rows for variables not present in data.
    if (!var %in% names(data)) {

      warning(
        sprintf(
          "Variable '%s' found in metadata but not in data.",
          var
        ),
        call. = FALSE
      )

      next
    }

    md_var <- metadata[tolower(metadata$Varnavnkort) == var, ]

    #----------------------------------------------------------
    # Variable label
    #----------------------------------------------------------
    #
    # Variable labels should normally be unique. If several
    # labels exist we use the first non-missing label and warn.
    #
    variable_labels <- unique(
      stats::na.omit(md_var$Vartext)
    )

    variable_labels <- variable_labels[
      nzchar(variable_labels)
    ]

    if (length(variable_labels) > 1) {

      warning(
        sprintf(
          "Variable '%s' has multiple variable labels in metadata.",
          var
        ),
        call. = FALSE
      )
    }

    if (length(variable_labels) > 0) {

      labelled::var_label(
        data[[var]]
      ) <- variable_labels[1]
    }

    #----------------------------------------------------------
    # Extract coded values
    #----------------------------------------------------------
    #
    # Variables with all Kode = NA are assumed to be:
    # - continuous variables
    # - counts
    # - free text
    #
    # These should receive only variable labels.
    #
    value_md <- md_var[
      !is.na(md_var$Kode),
    ]

    if (nrow(value_md) == 0) {
      next
    }

    #----------------------------------------------------------
    # Check for duplicated codes
    #----------------------------------------------------------
    #
    # Duplicate codes usually indicate broken metadata because
    # one code should correspond to exactly one category.
    #
    duplicate_codes <- unique(
      value_md$Kode[
        duplicated(value_md$Kode)
      ]
    )

    if (length(duplicate_codes) > 0) {

      stop(
        sprintf(
          paste(
            "Variable '%s' contains duplicate metadata code(s): %s"
          ),
          var,
          paste(
            duplicate_codes,
            collapse = ", "
          )
        ),
        call. = FALSE
      )
    }

    #----------------------------------------------------------
    # Check for missing category text
    #----------------------------------------------------------
    #
    # Categories without labels are rarely useful and often
    # indicate incomplete metadata.
    #
    missing_text <- value_md[
      is.na(value_md$Tekst) |
      !nzchar(value_md$Tekst),
    ]

    if (nrow(missing_text) > 0) {

      warning(
        sprintf(
          "Variable '%s' contains codes with missing category labels.",
          var
        ),
        call. = FALSE
      )
    }

    # Keep only fully defined value labels.
    value_md <- value_md[
      !is.na(value_md$Tekst) &
      nzchar(value_md$Tekst),
    ]

    if (nrow(value_md) == 0) {
      next
    }

    #----------------------------------------------------------
    # Convert metadata codes to the same type as the variable
    #----------------------------------------------------------
    #
    # labelled::val_labels() works best when code types match
    # the underlying data type exactly.
    #
    codes <- value_md$Kode

    if (is.numeric(data[[var]]) ||
        is.integer(data[[var]])) {

      converted_codes <- suppressWarnings(
        as.numeric(codes)
      )

      invalid_codes <- codes[
        is.na(converted_codes)
      ]

      if (length(invalid_codes) > 0) {

        warning(
          sprintf(
            paste(
              "Variable '%s' has metadata codes",
              "that cannot be converted to numeric."
            ),
            var
          ),
          call. = FALSE
        )
      }

      codes <- converted_codes
    }

    #----------------------------------------------------------
    # Warn about codes defined but not observed
    #----------------------------------------------------------
    #
    # This often occurs when:
    # - metadata comes from another survey wave
    # - categories were removed
    # - filtering was applied
    #
    if (warn_unused_codes) {

      observed_values <- unique(
        stats::na.omit(data[[var]])
      )

      unused_codes <- setdiff(
        codes,
        observed_values
      )

      if (length(unused_codes) > 0) {

        warning(
          sprintf(
            paste(
              "Variable '%s' contains metadata codes",
              "not observed in the data: %s"
            ),
            var,
            paste(
              unused_codes,
              collapse = ", "
            )
          ),
          call. = FALSE
        )
      }
    }

    #----------------------------------------------------------
    # Create named vector for labelled package
    #----------------------------------------------------------
    #
    # labelled stores value labels as:
    # c("Yes" = 1, "No" = 2)
    #
    labels <- stats::setNames(
      object = codes,
      nm = value_md$Tekst
    )

    labelled::val_labels(
      data[[var]]
    ) <- labels
  }

  data
}
