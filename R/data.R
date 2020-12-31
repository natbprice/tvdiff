#' Toy problem
#'
#' A test dataset based on the piecewise function \eqn{f(x) = (x+2)^2+\epsilon} when \eqn{x<0} and
#' \eqn{f(x) = (x-2)^2+\epsilon} when \eqn{x>0} with Gaussian noise with a standard deviation of 0.5.
#'
#' @format A data frame with 100 rows and 4 variables:
#' \describe{
#'   \item{x}{\code{seq(-4, 4, length.out = 100)}}
#'   \item{y_true}{true value}
#'   \item{y_obs}{observation with noise}
#'   \item{dydx_true}{true derivative}
#' }
#'
"toyproblem"

#' Small demo dataset
#'
#' A test dataset based on the function \eqn{f(x) = |x-0.5|} with Gaussian noise
#' with a standard deviation of 0.05 (i.e., \code{abs(x-0.5)+rnorm(length(x), mean=0, sd = 0.05)}).
#'
#' @format A data frame with 100 rows and 3 variables:
#' \describe{
#'   \item{x}{\code{seq(0, 1, length.out = 100)}}
#'   \item{true}{\code{abs(x - 0.5)}}
#'   \item{obs}{\code{abs(x - 0.5) + rnorm(length(x), mean = 0 , sd = 0.05)}}
#' }
#'
#' @references Rick Chartrand, "Numerical differentiation of noisy, nonsmooth
#' data," ISRN Applied Mathematics, Vol. 2011, Article ID 164564, 2011
#' @source \url{https://sites.google.com/site/dnartrahckcir/home/tvdiff-code}
"smalldemodata"

#' Large demo dataset
#'
#' \dquote{Data obtained from a whole-room calorimeter, courtesy of Edward L. Melanson
#' of the University of Colorado Denver. The metabolic rate of a subject within the
#' calorimeter can be determined via respirometry, the measurement of oxygen consumption,
#' and carbon dioxide production within the room." "The data consists of samples
#' taken every second for most of a day, for a total of 82,799 samples.}. Statement quoted from @chartrand2011numerical.
#'
#' @format A data frame with 82,799 rows and 2 variables:
#' \describe{
#'   \item{x}{seconds}
#'   \item{obs}{observed measurement}
#' }
#'
#' @references Rick Chartrand, "Numerical differentiation of noisy, nonsmooth
#' data," ISRN Applied Mathematics, Vol. 2011, Article ID 164564, 2011
#' @source \url{https://sites.google.com/site/dnartrahckcir/home/tvdiff-code}
"largedemodata"
