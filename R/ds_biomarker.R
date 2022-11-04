#' Biomarker data set
#'
#' This function retrieves the biomarker data set, a data set containing raw
#' fluorescence amplification data. Data was gathered from from Ruijter et al.
#' (2013), \doi{10.1016/j.ymeth.2012.08.011} but original source is by Vermeulen
#' et al. (2009), \doi{10.1016/S1470-2045(09)70154-8}.
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
#' \item{`target`}{Target identifier, in almost all cases the name of a gene.}
#' \item{`target_type`}{Target type: either target of interest (`"toi"`) or
#' reference target (`"ref"`).}
#' \item{`sample`}{Sample identifier.}
#' \item{`sample_type`}{Sample type.}
#' \item{`copies`}{Standard copy number.}
#' \item{`dilution`}{Dilution factor. Higher number means greater dilution.}
#' \item{`cycle`}{PCR cycle.}
#' \item{`fluor`}{Raw fluorescence values.}
#' }
#'
#' @source
#' - \url{https://medischebiologie.nl/wp-content/uploads/2019/02/qpcrdatamethods.zip}
#' - \url{https://github.com/ramiromagno/vermeulen/tree/main/data-raw}
#'
#' @examples
#' \dontrun{
#' # Takes ~ 8 sec
#' ds_biomarker()
#' }
#'
#' @export
ds_biomarker <- function() {

  amplification_curves <- amplification_curves()
  samples <- samples()
  reactions <- reactions()
  targets <- targets()

  df01 <- merge(x = amplification_curves, y = reactions, by = c("plate", "well", "dye"), all.x = TRUE)
  df02 <- merge(x = df01, y = samples, by = "sample", all.x = TRUE)
  df03 <- merge(x = df02, y = targets, by = "target", all.x = TRUE)

  # Arrange rows and columns order.
  cols_order <- c("plate", "well", "dye", "target", "target_type", "sample", "sample_type", "copies", "dilution", "cycle", "fluor")
  ordering <- order(df03$plate, df03$well, df03$cycle)
  ds_biomarker <- df03[ordering, cols_order]

  # Remove row names.
  rownames(ds_biomarker) <- NULL

  ds_biomarker
}
