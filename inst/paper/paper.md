---
title: 'tvdiff: R package for total-variation regularized numerical differentiation for noisy, nonsmooth data'
tags:
  - machine learning
  - differentiation
  - clustering
  - noisy data
authors:
 - name: Nathaniel B Price
   orcid: 0000-0002-6450-617X
   affiliation: 1
 - name: Jessica L. Burnett
   orcid: 0000-0002-0896-5099
   affiliation: "1, 2, 3"
 - name: Christopher Chizinski
   orcid: 0000-0001-9294-2588
   affiliation: 1
affiliations:
 - name: School of Natural Resources, University of Nebraska-Lincoln, Lincoln, NE
   index: 1
 - name: Nebraska Cooperative Fish and Wildlife Research Unit, University of Nebraska-Lincoln, Lincoln, NE
   index: 2
 - name: Core Science Systems Science Analytics and Synthesis, U.S. Geological Survey, Lakewood, CO
   index: 3
date: 25 February 2020
bibliography: paper.bib
---

# Summary   
The **tvdiff** package is an R translation of the Matlab implementation of the Total Variation Regularized Numerical Differentiation algorithm [@chartrand2011numerical]. This algorithm is also available as Python code [@tvregdiff]. Our package, `tvdiff`, comprises a single function for implementing this algorithm, [__TVRegDiffR__](https://github.com/natbprice/tvdiff/blob/master/R/TVRegDiffR.R), and two datasets reproduced from @chartrand2011numerical. The original publication [@chartrand2011numerical] presents two approaches to using this algorithm: 'small-scale' and 'large-scale'. The 'large-scale' implementation is extremely computationally expensive, and is therefore not implemented in this package. Both datasets are, however, provided in this package. 
The Total Variation Regularized Differentiation algorithm has been applied to numerous systems in disciplines which ubiquitously use Python and MatLab for scientific computing. This algorithm has been shown to be valuable in environmental and ecological sciences [@burnett2019regime], whose practitioners are largely familiar with R programming. As such, this package allows R users who are unfamiliar with Python or MatLab programming to easily implement this complex differentiation method. 


# Example implementation of small-scale total variation regularized differentiation  
This example uses a [small-scale dataset](/data-raw/smalldemodata.csv) which is based on the function  
![f(x) = \\mid x - 0.5\\mid](https://latex.codecogs.com/png.latex?f%28x%29%20%3D%20%5Cmid%20x%20-%200.5%20%5Cmid "f(x) = \\mid x - 0.5 \\mid")    
with Gaussian noise of standard deviation 0.05 ( \autoref{fig:data}). The derivative is estimated from the noisy observations using Total Variation Regularized Differentiation [@chartrand2011numerical]. A prediction of the original function is obtained from the estimated derivative through numerical integration (\autoref{fig:dxdt}). The code for obtaining the figures in this example is provided in a [vignette](/vignettes/example.Rmd).


# Figures 

![Example small-scale dataset values.\label{fig:data}](/man/figures/README-plot-1.svg)
![Derivative of the small-scale dataset using Total Variation Regularized differentiation (where Gaussian noise SD=0.05).\label{fig:dxdt}](/man/figures/README-plot-2.svg)

# References
