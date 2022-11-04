#' Samples
#'
#' A data set containing the metadata associated with each sample. Data is
#' obtained from Ruijter (2013), \doi{10.1016/j.ymeth.2012.08.011} but original
#' source is by Vermeulen (2009), \doi{10.1016/S1470-2045(09)70154-8}.
#'
#' The tidy version of the data is kept at the repository of the source of
#' `{vermeulen}` package. This function fetches such data and thus requires
#' internet connection.
#'
#' @return A data frame with 372 samples and 3 variables:
#'
#' \describe{
#' \item{`sample`}{Sample identifier.}
#' \item{`sample_type`}{Sample type.}
#' \item{`copies`}{Standard copy number.}
#' \item{`dilution`}{Dilution factor. Higher number means greater dilution.}
#' }
#'
#' @seealso `amplification_curves()` `targets()` `reactions()`
#'
#' @source
#' - \url{https://medischebiologie.nl/wp-content/uploads/2019/02/qpcrdatamethods.zip}
#' - \url{https://github.com/ramiromagno/vermeulen/blob/main/data-raw/samples.csv.gz}
#'
#' @examples
#' try(samples())
#'
#' @export
samples <- function() {
  url <- file.path(repo(), "main/data-raw/samples.csv.gz")
  txt <- readLines(gzcon(url(url)))
  utils::read.csv(file = textConnection(txt), colClasses = c("factor", "factor", "integer", "double"))
}
