# It is recommended that functions in a package are not memoised at build-time,
# but when the package is loaded. The simplest way to do this is within
# .onLoad().
# Here we perform memoisation for the set of helpers provided by this package.

.onLoad <- function(libname, pkgname) {
  amplification_curves <<- memoise::memoise(amplification_curves)
  samples <<- memoise::memoise(samples)
  reactions <<- memoise::memoise(reactions)
  targets <<- memoise::memoise(targets)
  ds_biomarker <<- memoise::memoise(get_biomarker_dataset)
}
