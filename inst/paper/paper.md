---
title: 'tvdiff: R package for total-variation regularized numerical differentiation for noisy, nonsmooth data'
tags:
  - machine learning
  - clustering
authors:
 - name: Nathaniel B Price
   orcid: 0000-0002-
   affiliation: 1
 - name: Jessica L Burnett
   orcid: 0000-0002-
   affiliation: 2
 - name: Christopher Chizinski
   orcid: 0000-0002-
   affiliation: 1
 affiliations:
 - index: 1
   name:  School of Natural Resources, University of Nebraska-Lincoln
 - index: 2
   name: Nebraska Cooperative Fish and Wildlife Research Unit, School of Natural Resources, University of Nebraska-Lincoln
date: XX JULY 2019
bibliography: paper.bib
---

# Summary 

The **tvdiff** package is an R translation of the Matlab implementation of the Total Variation Regularized Numerical Differentiation algorithm [@chartrand2011numerical]. This algorithm is also available as Python code [@tvregdiff]. Our package, `tvdiff`, comprises a single function, [__TVRegDiffR__](https://github.com/natbprice/tvdiff/blob/master/R/TVRegDiffR.R). 

The original publication [@chartrand2011numerical] presents two methods, a 'small-scale' and a 'large-scale'. The 'large-scale' implementation is extremely computationally expensive, and is not yet under development. Although this package contains both the small and large-scale datasets used in @chartrand2011numerical, the large-scale algorithm is not yet implemented in our package. We present package functionality using the small-scale data originally published in @chartrand2011numerical.








# References
