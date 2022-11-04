#' Amplification curves
#'
#' A data set containing raw fluorescence amplification data. Data is
#' obtained from Ruijter (2013), \doi{10.1016/j.ymeth.2012.08.011} but original
#' source is by Vermeulen (2009), \doi{10.1016/S1470-2045(09)70154-8}.
#'
#' The tidy version of the data is kept at the repository of the source of
#' `{vermeulen}` package. This function fetches such data and thus requires
#' internet connection. It takes a few seconds to run.
#'
#' @return A data frame with 24,576 amplification curves, 50 cycles each:
#'
#' \describe{
#' \item{`plate`}{Plate identifier. Because one plate was used per gene, the
#' name of the plate is the same as the values in `target`.}
#' \item{`well`}{Well identifier.}
#' \item{`dye`}{In all reactions the SYBR Green I master mix (Roche) was used,
#' so the value is always `"SYBR"`.}
#' \item{`cycle`}{PCR cycle.}
#' \item{`fluor`}{Raw fluorescence values.}
#' }
#'
#' @source
#' - \url{https://medischebiologie.nl/wp-content/uploads/2019/02/qpcrdatamethods.zip}
#' - \url{https://github.com/ramiromagno/vermeulen/blob/main/data-raw/amplification_curves.csv.gz}
#'
#' @noRd
amplification_curves <- function() {
  url <- file.path(repo(), "main/data-raw/amplification_curves.csv.gz")
  txt <- readLines(gzcon(url(url)))
  df <- utils::read.csv(file = textConnection(txt), colClasses = c("factor", "factor", "factor", "integer", "double"))
  # Fix the order of the levels in `well`
  df$well <- factor(df$well, levels = wells())
  df
}
