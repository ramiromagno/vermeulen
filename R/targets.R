#' Targets
#'
#' A data set containing the metadata associated with each target. Data is
#' obtained from Ruijter (2013), \doi{10.1016/j.ymeth.2012.08.011} but original
#' source is by Vermeulen (2009), \doi{10.1016/S1470-2045(09)70154-8}.
#'
#' The tidy version of the data is kept at the repository of the source of
#' `{vermeulen}` package. This function fetches such data and thus requires
#' internet connection.
#'
#' @return A data frame with 64 targets and two variables:
#'
#' \describe{
#' \item{`target`}{Target identifier, in almost all cases the name of a gene.}
#' \item{`target_type`}{Target type: either target of interest (`"toi"`) or
#' reference target (`"ref"`).}
#' }
#'
#' @source
#' - \url{https://medischebiologie.nl/wp-content/uploads/2019/02/qpcrdatamethods.zip}
#' - \url{https://github.com/ramiromagno/vermeulen/blob/main/data-raw/targets.csv.gz}
#'
#' @noRd
targets <- function() {
  url <- file.path(repo(), "main/data-raw/targets.csv.gz")
  txt <- readLines(gzcon(url(url)))
  utils::read.csv(file = textConnection(txt), colClasses = c("factor", "factor"))
}
