
<!-- README.md is generated from README.Rmd. Please edit that file -->

# vermeulen

<!-- badges: start -->
<!-- badges: end -->

`{vermeulen}` provides the biomarker data set by [Vermeulen et al.
(2009)](https://doi.org/10.1016/S1470-2045(09)70154-8) in tidy format.

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

### Amplification curves

``` r
library(vermeulen)

amplification_curves
#> # A tibble: 1,226,880 × 5
#>    plate  well  dye   cycle fluor
#>    <fct>  <fct> <fct> <int> <dbl>
#>  1 CAMTA2 A1    SYBR      1  1.18
#>  2 CAMTA2 A1    SYBR      2  1.46
#>  3 CAMTA2 A1    SYBR      3  1.47
#>  4 CAMTA2 A1    SYBR      4  1.49
#>  5 CAMTA2 A1    SYBR      5  1.49
#>  6 CAMTA2 A1    SYBR      6  1.49
#>  7 CAMTA2 A1    SYBR      7  1.50
#>  8 CAMTA2 A1    SYBR      8  1.49
#>  9 CAMTA2 A1    SYBR      9  1.48
#> 10 CAMTA2 A1    SYBR     10  1.48
#> # … with 1,226,870 more rows
#> # ℹ Use `print(n = ...)` to see more rows
```

### Reactions

``` r
reactions
#> # A tibble: 24,576 × 5
#>    plate  well  dye   sample target
#>    <fct>  <fct> <fct> <chr>  <fct> 
#>  1 CAMTA2 A1    SYBR  1495   CAMTA2
#>  2 CAMTA2 A2    SYBR  1832   CAMTA2
#>  3 CAMTA2 A3    SYBR  1496   CAMTA2
#>  4 CAMTA2 A4    SYBR  1834   CAMTA2
#>  5 CAMTA2 A5    SYBR  1497   CAMTA2
#>  6 CAMTA2 A6    SYBR  1835   CAMTA2
#>  7 CAMTA2 A7    SYBR  1498   CAMTA2
#>  8 CAMTA2 A8    SYBR  1836   CAMTA2
#>  9 CAMTA2 A9    SYBR  1499   CAMTA2
#> 10 CAMTA2 A10   SYBR  1837   CAMTA2
#> # … with 24,566 more rows
#> # ℹ Use `print(n = ...)` to see more rows
```

### Targets

``` r
targets
#> # A tibble: 64 × 2
#>    target  target_type
#>    <fct>   <fct>      
#>  1 CAMTA2  toi        
#>  2 CAMTA1  toi        
#>  3 BIRC5   toi        
#>  4 ARHGEF7 toi        
#>  5 ALUsq   toi        
#>  6 AKR1C1  toi        
#>  7 AHCY    toi        
#>  8 ECEL1   toi        
#>  9 DPYSL3  toi        
#> 10 DDC     toi        
#> # … with 54 more rows
#> # ℹ Use `print(n = ...)` to see more rows
```

### Samples

``` r
targets
#> # A tibble: 64 × 2
#>    target  target_type
#>    <fct>   <fct>      
#>  1 CAMTA2  toi        
#>  2 CAMTA1  toi        
#>  3 BIRC5   toi        
#>  4 ARHGEF7 toi        
#>  5 ALUsq   toi        
#>  6 AKR1C1  toi        
#>  7 AHCY    toi        
#>  8 ECEL1   toi        
#>  9 DPYSL3  toi        
#> 10 DDC     toi        
#> # … with 54 more rows
#> # ℹ Use `print(n = ...)` to see more rows
```

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
