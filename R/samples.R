#' Samples
#'
#' A data set containing the metadata associated with each sample. Data is
#' obtained from Ruijter (2013), \doi{10.1016/j.ymeth.2012.08.011} but original
#' source is by Vermeulen (2009), \doi{10.1016/S1470-2045(09)70154-8}.
#'
#' @format A data frame with `r nrow(samples)`
#' samples and `r ncol(samples)` variables:
#'
#' \describe{
#' \item{`sample`}{Sample identifier.}
#' \item{`sample_type`}{Sample type.}
#' \item{`dilution`}{Dilution factor. Higher number means greater dilution.}
#' }
#'
#' @seealso `amplification_curves` `targets` `reactions`
#'
#' @source
#' - Vermeulen (2009), \doi{10.1016/S1470-2045(09)70154-8}.
#' - Ruijter (2013), \doi{10.1016/j.ymeth.2012.08.011}.
#'
"samples"
