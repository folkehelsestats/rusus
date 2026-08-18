#' Fix mis-encoded Norwegian characters
#'
#' Repairs strings where Norwegian letters (\eqn{\text{æ, Æ, å, Å, ø, Ø}}) have
#' been mangled by encoding mismatches — typically UTF-8 bytes misread as
#' Latin-1/Windows-1252 (double-encoding), or raw Latin-1 bytes read directly.
#' This is a common issue when reading survey data exported from systems with
#' inconsistent encoding handling.
#'
#' @param x A character vector to fix.
#'
#' @details
#' The function corrects two classes of problems, applied in sequence via
#' [Reduce()]:
#' \itemize{
#'   \item \strong{Double-encoded UTF-8}: e.g. the UTF-8 bytes for "æ"
#'     (\code{C3 A6}) get misread as Latin-1 and re-encoded as two separate
#'     characters, \code{"\\u00c3\\u00a6"}. These are mapped back to the
#'     correct single character.
#'   \item \strong{Raw Latin-1 / Windows-1252 bytes}: e.g. \code{"\\xe6"} is
#'     mapped directly to \code{"\\u00e6"}.
#' }
#'
#' \strong{Uppercase Æ is a special case.} Its UTF-8 bytes are \code{C3 86}.
#' When double-encoded, \code{C3} becomes \code{"\\u00c3"} as usual, but byte
#' \code{86} is interpreted differently depending on the assumed source
#' encoding: it is unassigned in strict ISO-8859-1, but decodes to
#' \code{"\\u2020"} (dagger, "†") under Windows-1252 — the encoding Windows
#' tools such as Excel typically use. Since this pipeline runs on Windows,
#' the function matches the Windows-1252 form (\code{"\\u00c3\\u2020"}). If
#' you see stray literal "†" characters appear in cleaned output, that is a
#' sign this assumption doesn't hold for your data source and the pattern
#' should be revisited.
#'
#' Matching is done with \code{useBytes = TRUE} throughout, so replacement
#' operates on the raw byte sequences rather than relying on the (possibly
#' incorrect) declared encoding of \code{x}.
#'
#' @return A character vector of the same length as \code{x}, with corrected
#'   encoding.
#'
#' @references
#' Adapted from
#' \url{https://github.com/StoXProject/RstoxData/issues/10#issuecomment-510542301}
#'
#' @examples
#' \dontrun{
#' fix_encode("Sm\xc3\xa5 tr\xc3\xb8ndersk kr\xc3\xa6mmerhus")
#' fix_encode("\xc3\u2020rsrapport") # double-encoded "Årsrapport"-style Æ
#' }
#'
#' @keywords internal
#' @export
fix_encode <- function(x) {

  # Ordered as: pattern = replacement.
  # Each pattern covers both the double-encoded UTF-8 form and the raw
  # Latin-1/Windows-1252 byte for the same character.
  replacements <- c(
    "\\u00c3\\u00a6|\xe6"  = "\u00e6", # ae
    "\\u00c3\\u2020|\xc6"  = "\u00c6", # AE (Windows-1252 double-encoding)
    "\\u00c3\\u00a5|\xe5"  = "\u00e5", # aa
    "\\u00c3\\u00b8|\xf8"  = "\u00f8", # oe
    "\xed"                 = "i",      # stray mis-decoded byte
    "\xc5"                 = "\u00c5", # AA
    "\xd8"                 = "\u00d8"  # OE
  )

  Reduce(
    function(acc, i) gsub(names(replacements)[i], replacements[i], acc, useBytes = TRUE),
    seq_along(replacements),
    init = x
  )
}


# Encoding solution with some modification from
# https://github.com/StoXProject/RstoxData/issues/10#issuecomment-510542301
# This code is the based for the function fix_encode above, but the function is not exported and is not used in the package.
repair_encode <- function(x) gsub("\\u00c3\\u00a6|\xe6", "\u00e6", useBytes = TRUE,
                              gsub("\\u00c3\\u00a5|\xe5", "\u00e5", useBytes = TRUE,
                                   gsub("\\u00c3\\u00b8|\xf8", "\u00f8", useBytes = TRUE,
                                        gsub("\xed", "i", useBytes = TRUE,
                                             gsub("\xc5", "\u00c5", useBytes = TRUE,
                                                  gsub("\xd8", "\u00d8", x, useBytes = TRUE))))))
