% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{toyproblem}
\alias{toyproblem}
\title{Toy problem}
\format{
A data frame with 100 rows and 4 variables:
\describe{
  \item{x}{\code{seq(-4, 4, length.out = 100)}}
  \item{y_true}{true value}
  \item{y_obs}{observation with noise}
  \item{dydx_true}{true derivative}
}
}
\usage{
toyproblem
}
\description{
A test dataset based on the piecewise function \eqn{f(x) = (x+2)^2} when \eqn{x<0} and
\eqn{f(x) = (x-2)^2} when \eqn{x>0} with Gaussian noise with a standard deviation of 0.5.
}
\keyword{datasets}
