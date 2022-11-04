#' Reactions
#'
#' A data set containing the metadata associated with each qPCR well and
#' respective reaction mix. Data is obtained from Ruijter (2013),
#' \doi{10.1016/j.ymeth.2012.08.011} but original source is by Vermeulen (2009),
#' \doi{10.1016/S1470-2045(09)70154-8}.
#'
#' The tidy version of the data is kept at the repository of the source of
#' `{vermeulen}` package. This function fetches such data and thus requires
#' internet connection.
#'
#' @return A data frame with 24,576 reactions and 5 variables:
#'
#' \describe{
#' \item{`plate`}{Plate identifier. Because one plate was used per gene, the
#' name of the plate is the same as the values in `target`.}
#' \item{`well`}{Well identifier.}
#' \item{`dye`}{In all reactions the SYBR Green I master mix (Roche) was used,
#' so the value is always `"SYBR"`.}
#' \item{`sample`}{Sample identifier.}
#' \item{`target`}{Target.}
#' }
#'
#' @seealso `amplification_curves()` `targets()` `samples()`
#'
#' @source
#' - \url{https://medischebiologie.nl/wp-content/uploads/2019/02/qpcrdatamethods.zip}
#' - \url{https://github.com/ramiromagno/vermeulen/blob/main/data-raw/reactions.csv.gz}
#'
#' @examples
#' try(reactions())
#'
reactions <- function() {
  url <- file.path(repo(), "main/data-raw/reactions.csv.gz")
  txt <- readLines(gzcon(url(url)))
  df <- utils::read.csv(file = textConnection(txt), colClasses = c("factor", "factor", "factor", "character", "factor"))
  # Fix the order of the levels in `well`
  df$well <- factor(df$well, levels = wells())
  df
}

