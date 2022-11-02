#' Targets
#'
#' A data set containing the metadata associated with each target. Data is
#' obtained from Ruijter (2013), \doi{10.1016/j.ymeth.2012.08.011} but original
#' source is by Vermeulen (2009), \doi{10.1016/S1470-2045(09)70154-8}.
#'
#' @format A data frame with `r nrow(targets)` targets and `r ncol(targets)`
#' variables:
#'
#' \describe{
#' \item{`target`}{Target identifier, in almost all cases the name of a gene.}
#' \item{`target_type`}{Target type: either target of interest (`"toi"`) or
#' reference target (`"ref"`).}
#' }
#'
#' @seealso `amplification_curves` `reactions` `samples`
#'
#' @source
#' - Vermeulen (2009), \doi{10.1016/S1470-2045(09)70154-8}.
#' - Ruijter (2013), \doi{10.1016/j.ymeth.2012.08.011}.
#'
#' @export
targets <- function() {
  url <- "https://raw.githubusercontent.com/ramiromagno/vermeulen/main/data-raw/targets.csv"
  readr::read_csv(file = url)
}
