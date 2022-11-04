#' Import the Biomarker data set
#'
#' This function retrieves the Biomarker data set, a data set containing raw
#' fluorescence amplification data: 24,576 amplification curves, of 50 cycles
#' each.
#'
#' @details
#' Data was gathered from Ruijter et al.
#' (2013), \doi{10.1016/j.ymeth.2012.08.011} but original source is by Vermeulen
#' et al. (2009), \doi{10.1016/S1470-2045(09)70154-8}.
#' The tidy version of the data is kept at the repository of the source of
#' `{vermeulen}` package. This function fetches such data and thus requires
#' internet connection. It takes a few seconds to run.
#'
#' The Biomarker data set comprises a set of 59 targets previously identified as
#' a 59-mRNA gene expression signature, that has been developed and validated for
#' improved outcome prediction of children with neuroblastoma. In short, 59
#' biomarkers and 5 reference genes were measured in 8 µl reactions in a
#' 384-well plate using the LightCycler480 SYBR Green Master (Roche) in a sample
#' maximization experiment design. The 59 genes were carefully selected as being
#' previously reported as prognostic genes in neuroblastoma in at least two
#' independent studies. Each plate contained 366 cDNA samples (n = 1) from
#' primary tumor biopsies, a 5-point 10-fold serial dilution series based on an
#' external oligonucleotide standard (n = 3, from 150,000 to 15 copies), and a
#' no template control (NTC, n = 3). Raw (baseline uncorrected) fluorescent data
#' were exported from the LightCycler480 instrument software.
#'
#' @return A data frame with 24,576 amplification curves, of 50 cycles each:
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
#' \donttest{
#' # Takes ~ 10-30 sec
#' head(get_biomarker_dataset())
#' }
#'
#' @export
get_biomarker_dataset <- function() {

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
