#' Reactions
#'
#' A data set containing the metadata associated with each qPCR well and
#' respective reaction mix. Data is obtained from Ruijter (2013),
#' \doi{10.1016/j.ymeth.2012.08.011} but original source is by Vermeulen (2009),
#' \doi{10.1016/S1470-2045(09)70154-8}.
#'
#' @format A data frame with `r format(nrow(reactions), big.mark = ",")`
#' reactions and `r ncol(reactions)` variables:
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
#' @seealso `amplification_curves` `targets` `samples`
#'
#' @source
#' - Vermeulen (2009), \doi{10.1016/S1470-2045(09)70154-8}.
#' - Ruijter (2013), \doi{10.1016/j.ymeth.2012.08.011}.
#'
"reactions"
