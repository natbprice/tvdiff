---
title: 'tvdiff: R package for total-variation regularized numerical differentiation for noisy, nonsmooth data'
tags:
  - machine learning
  - differentiation
  - clustering
authors:
 - name: Nathaniel B Price
   orcid: 0000-0002-6450-617X
   affiliation: 1
 - name: Jessica L. Burnett
   orcid: 0000-0002-0896-5099
   affiliation: "1, 2"
 - name: Christopher Chizinski
   orcid: 0000-0001-9294-2588
   affiliation: 1
affiliations:
 - name: School of Natural Resources, University of Nebraska-Lincoln
   index: 1
 - name: Nebraska Cooperative Fish and Wildlife Research Unit, University of Nebraska-Lincoln
   index: 2
date: 04 July 2019
bibliography: inst/paper/paper.bib
---

# Summary   
The **tvdiff** package is an R translation of the Matlab implementation of the Total Variation Regularized Numerical Differentiation algorithm [@chartrand2011numerical]. This algorithm is also available as Python code [@tvregdiff]. Our package, `tvdiff`, comprises a single function, [__TVRegDiffR__](https://github.com/natbprice/tvdiff/blob/master/R/TVRegDiffR.R). 

The original publication [@chartrand2011numerical] presents two methods, a 'small-scale' and a 'large-scale'. The 'large-scale' implementation is extremely computationally expensive, and is not yet under development. Although this package contains both the small and large-scale datasets used in @chartrand2011numerical, the large-scale algorithm is not yet implemented in our package. We present package functionality using the small-scale data originally published in @chartrand2011numerical.

# Example using 'smalldemodata'  
This example uses a [small-scale dataset](/data-raw/smalldemodata.csv) which is based on the function ![f(x) = \\mid x - 0.5\\mid](https://latex.codecogs.com/png.latex?f%28x%29%20%3D%20%5Cmid%20x%20-%200.5%20%5Cmid "f(x) = \\mid x - 0.5 \\mid") with Gaussian noise of standard deviation 0.05. The derivative is estimated from the noisy observations using Total Variation Regularized Differentiation. A prediction of the original function is obtained from the estimated derivative through numerical integration. The code for obtaining these figures is provided as a [vignette](/vignettes/example.Rmd).

<img src= "/man/figures/README-plot-1.svg"><img src= "/man/figures/README-plot-2.svg">


# References
