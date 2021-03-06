% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{smalldemodata}
\alias{smalldemodata}
\title{Small demo dataset}
\format{
A data frame with 100 rows and 3 variables:
\describe{
  \item{x}{\code{seq(0, 1, length.out = 100)}}
  \item{true}{\code{abs(x - 0.5)}}
  \item{obs}{\code{abs(x - 0.5) + rnorm(length(x), mean = 0 , sd = 0.05)}}
}
}
\source{
\url{https://sites.google.com/site/dnartrahckcir/home/tvdiff-code}
}
\usage{
smalldemodata
}
\description{
A test dataset based on the function \eqn{f(x) = |x-0.5|} with Gaussian noise
with a standard deviation of 0.05.
}
\references{
Rick Chartrand, "Numerical differentiation of noisy, nonsmooth
data," ISRN Applied Mathematics, Vol. 2011, Article ID 164564, 2011
}
\keyword{datasets}
