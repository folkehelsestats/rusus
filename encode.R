
#' Repair Character Encoding
#'
#' Repairs common character encoding issues, particularly corrupted
#' Norwegian characters (\u00e6, \u00f8, \u00e5, \u00c6, \u00d8, \u00c5).
#'
#' The function first attempts to normalize text using
#' [base::iconv()] and then applies a set of known byte-level
#' replacements that commonly occur when UTF-8 and Latin-1 encodings
#' have been mixed.
#'
#' The function is vectorized and returns the input unchanged when
#' \code{x} is \code{NULL}, length 0, or contains only missing values.
#'
#' @param x A character vector.
#'
#' @return A character vector with repaired encoding.
#'
#' @details
#' Common examples of repaired strings include:
#'
#' \itemize{
#'   \item "Ã¦" -> "æ"
#'   \item "Ã¸" -> "ø"
#'   \item "Ã¥" -> "å"
#'   \item "Ã\206" -> "Æ"
#'   \item "Ã\230" -> "Ø"
#'   \item "í" -> "i"
#' }
#'
#' @examples
#' txt <- c(
#'   "Helse og omsorg",
#'   "MÃ¥ned",
#'   "TrÃ¸ndelag",
#'   NA_character_
#' )
#'
#' repair_encoding(txt)
#'
#' @export
fix_encoding <- function(x) {

  if (is.null(x) || length(x) == 0) {
    return(x)
  }

  if (!is.character(x)) {
    x <- as.character(x)
  }

  # First attempt: normalize encoding
  res <- suppressWarnings(
    iconv(
      x,
      from = "",
      to = "UTF-8",
      sub = "byte"
    )
  )

  # Keep original values if iconv fails
  idx_na <- is.na(res) & !is.na(x)

  if (any(idx_na)) {
    res[idx_na] <- x[idx_na]
  }

  # Known problematic byte sequences
  replacements <- c(
    "\u00c3\u00a6" = "\u00e6",  # Ã¦ -> æ
    "\u00c3\u00b8" = "\u00f8",  # Ã¸ -> ø
    "\u00c3\u00a5" = "\u00e5",  # Ã¥ -> å
    "\u00c5"       = "\u00c5",  # Å
    "\u00d8"       = "\u00d8",  # Ø
    "\xe6"         = "\u00e6",
    "\xf8"         = "\u00f8",
    "\xe5"         = "\u00e5",
    "\xed"         = "i"
  )

  for (i in seq_along(replacements)) {
    res <- gsub(
      pattern = names(replacements)[i],
      replacement = replacements[[i]],
      x = res,
      useBytes = TRUE
    )
  }

  res
}



# # Encoding solution with some modification from
# # https://github.com/StoXProject/RstoxData/issues/10#issuecomment-510542301
# is_encode <- function(x) gsub("\\u00c3\\u00a6|\xe6", "\u00e6", useBytes = TRUE,
#                               gsub("\\u00c3\\u00a5|\xe5", "\u00e5", useBytes = TRUE,
#                                    gsub("\\u00c3\\u00b8|\xf8", "\u00f8", useBytes = TRUE,
#                                         gsub("\xed", "i", useBytes = TRUE,
#                                              gsub("\xc5", "\u00c5", useBytes = TRUE,
#                                                   gsub("\xd8", "\u00d8", x, useBytes = TRUE))))))
