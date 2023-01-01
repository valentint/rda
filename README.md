
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `rda`: Shrunken Centroids Regularized Discriminant Analysis

<!-- badges: start -->

[![CRAN
version](https://www.r-pkg.org/badges/version/rda)](https://cran.r-project.org/package=rda)
[![R-CMD-check](https://github.com/valentint/rda/workflows/R-CMD-check/badge.svg)](https://github.com/valentint/rda/actions)
[![downloads](https://cranlogs.r-pkg.org/badges/rda)](https://cran.r-project.org/package=rda)
[![downloads](https://cranlogs.r-pkg.org/badges/grand-total/rda)](https://cran.r-project.org/package=rda)
[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
<!-- badges: end -->

## Installation

The `rda` package was removed from CRAN (The Comprehensive R Archive
Network) and is currently archived. As soon as it is back on CRAN, we
will inform you that it is possible to install it from CRAN:

    ##    install.packages("rda")

## Building from source

To install the latest stable development version from GitHub, you can
pull this repository and install it using

    ## install.packages("remotes")
    remotes::install_github("valentint/rda")

Of course, if you have already installed `remotes`, you can skip the
first line (I have commented it out).

## Example

This is a basic example which shows you if the package is properly
installed:

``` r
library(rda)
data(colon)
colon.x <- t(colon.x)
(fit <- rda(colon.x, colon.y))
#> Call:
#> rda(x = colon.x, y = colon.y)
#> $nonzero
#>       delta
#> alpha     0 0.333 0.667    1 1.333 1.667    2 2.333 2.667    3
#>   0    2000   132    12    0     0     0    0     0     0    0
#>   0.11 2000    23     0    0     0     0    0     0     0    0
#>   0.22 2000    21     0    0     0     0    0     0     0    0
#>   0.33 2000    33     0    0     0     0    0     0     0    0
#>   0.44 2000    56     2    0     0     0    0     0     0    0
#>   0.55 2000   119     7    0     0     0    0     0     0    0
#>   0.66 2000   252    27    2     0     0    0     0     0    0
#>   0.77 2000   531   107   24     5     0    0     0     0    0
#>   0.88 2000  1069   486  217   100    44   16     9     3    1
#>   0.99 2000  1930  1858 1780  1695  1612 1524  1431  1354 1276
#> 
#> $errors
#>       delta
#> alpha  0 0.333 0.667  1 1.333 1.667  2 2.333 2.667  3
#>   0    7     7     8 22    22    22 22    22    22 22
#>   0.11 4     8    22 22    22    22 22    22    22 22
#>   0.22 0     8    22 22    22    22 22    22    22 22
#>   0.33 0     2    22 22    22    22 22    22    22 22
#>   0.44 0     1    22 22    22    22 22    22    22 22
#>   0.55 0     1    21 22    22    22 22    22    22 22
#>   0.66 0     1     2 22    22    22 22    22    22 22
#>   0.77 0     0     1  3    20    22 22    22    22 22
#>   0.88 0     0     1  1     1     2  5     8    19 22
#>   0.99 0     0     0  0     0     0  0     0     0  0
```
