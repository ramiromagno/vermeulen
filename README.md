
<!-- README.md is generated from README.Rmd. Please edit that file -->

# vermeulen

<!-- badges: start -->
<!-- badges: end -->

`{vermeulen}` provides the biomarker data set by [Vermeulen et
al. (2009)](https://doi.org/10.1016/S1470-2045(09)70154-8) in tidy
format.

This data set is for a real-time quantitative PCR experiment that
comprises:

-   The raw fluorescence data of 24,576 amplification curves.
-   64 targets: 59 genes of interest and 5 reference genes.
-   366 neuroblastoma cDNA samples and 18 dilution series samples.

## Installation

Currently you can install `{vermeulen}` from GitHub only:

``` r
# install.packages("remotes")
remotes::install_github("ramiromagno/vermeulen")
```

## Usage

Because of CRAN size limits the data is not provided at installation
time. The data can be retrieved after installation with a set of helper
functions from this GitHub repository:

-   `amplification_curves()`
-   `reactions()`
-   `targets()`
-   `samples()`

## Code of Conduct

Please note that the `{vermeulen}` project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## References

1.  Vermeulen et al.. *Predicting outcomes for children with
    neuroblastoma using a multigene-expression signature: a
    retrospective SIOPEN/COG/GPOH study*. The Lancet Oncology 10,
    663–671 (2009). doi:
    [10.1016/S1470-2045(09)70154-8](https://doi.org/10.1016/S1470-2045(09)70154-8).

2.  Ruijter et al.. *Evaluation of qPCR curve analysis methods for
    reliable biomarker discovery: Bias, resolution, precision, and
    implications*. Methods 59 32–46 (2013). doi:
    [10.1016/j.ymeth.2012.08.011](https://doi.org/10.1016/j.ymeth.2012.08.011).
