
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tvdiff

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.org/natbprice/tvdiff.svg?branch=master)](https://travis-ci.org/natbprice/tvdiff)

The **tvdiff** package is an R translation of the Matlab implementation
of the Total Variation Regularized Numerical Differentiation algorithm
by Rick Chartrand. The package implements the methods found in Rick
Chartrand,“Numerical differentiation of noisy, nonsmooth data,” ISRN
Applied Mathematics, Vol. 2011, Article ID 164564, 2011.

## Installation

The **tvdiff** package is currently only available from Github.

``` r
devtools::install_github("natbprice/tvdiff")
```

## Example

A simple example based on the function ![f(x) = \\mid x - 0.5
\\mid](https://latex.codecogs.com/png.latex?f%28x%29%20%3D%20%5Cmid%20x%20-%200.5%20%5Cmid
"f(x) = \\mid x - 0.5 \\mid") with Gaussian noise of standard deviation
0.05. The derivative is estimated from the noisy observations using
Total Variation Regularized Differentiation. A prediction of the
original function is obtained from the estimated derivative through
numerical
integration.

<img src= "./man/figures/README-unnamed-chunk-2-1.svg"><img src= "./man/figures/README-unnamed-chunk-2-2.svg">

## References

Rick Chartrand, “Numerical differentiation of noisy, nonsmooth data,”
ISRN Applied Mathematics, Vol. 2011, Article ID 164564, 2011.

<https://sites.google.com/site/dnartrahckcir/home/tvdiff-code>

Python translation by Simone Sturniolo:
<https://github.com/stur86/tvregdiff>
