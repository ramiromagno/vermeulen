#' Amplification curves
#'
#' A data set containing raw fluorescence amplification data. Data is
#' obtained from Ruijter (2013), \doi{10.1016/j.ymeth.2012.08.011} but original
#' source is by Vermeulen (2009), \doi{10.1016/S1470-2045(09)70154-8}.
#'
#' @format A data frame with `r format(nrow(reactions), big.mark = ",")`
#' amplification curves, 50 cycles each:
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
#' @seealso `reactions` `targets` `samples`
#'
#' @source
#' - Vermeulen (2009), \doi{10.1016/S1470-2045(09)70154-8}.
#' - Ruijter (2013), \doi{10.1016/j.ymeth.2012.08.011}.
#'
amplification_curves <- function() {
  url <- "https://raw.githubusercontent.com/ramiromagno/vermeulen/main/data-raw/amplification_curves.csv"
  readr::read_csv(file = url)
}
