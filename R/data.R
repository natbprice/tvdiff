#' Small demo dataset
#'
#' A test dataset based on the function \eqn{f(x) = |x-0.5|} with Gaussian noise
#' with a standard deviation of 0.05.
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
#' "Data obtained from a whole-room calorimeter, courtesy of Edward L. Melanson
#' of the University of Colorado Denver. The metabolic rate of a subject within the
#' calorimeter can be determined via respirometry, the measurement of oxygen consumption,
#' and carbon dioxide production within the room." "The data consists of samples
#' taken every second for most of a day, for a total of 82,799 samples."
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

#' Paleo diatom abundances
#'
#' "To test for regime shifts in the paleoecological record, we used a long-term
#' high-resolution sedimentological record from Foy Lake (Montana, USA) that
#' showed abrupt changes in diatom community structure at 1.3 ka (thousands
#' of years before present, with present defined as AD 1950). Foy Lake
#' (48.1648N, 1143589W, 1005 m elevation) is a deep freshwater lake situated
#' in the drought-sensitive Flathead River Basin in the Northern Rocky Mountains
#' [4], [5]. Diatom assemblages in this system are sensitive to changes in
#' lake depth driven by changes in effective moisture [6] and represent
#' one metric of ecological resilience. The percent abundances of 109 diatom
#' species were collected from a lake sediment core that was sampled
#' continuously at an interval of every 5-20 years, yielding a 7 kyr
#' record of 800 time-steps."
#'
#' @format A data frame with 83,167 rows and 5 variables:
#' \describe{
#'   \item{site}{seconds}
#'   \item{sortVar}{time}
#'   \item{variable}{species}
#'   \item{value}{relative abundance}
#'   \item{cellID}{id variable}
#' }
#'
#' @references Spanbauer, T. L., Allen, C. R., Angeler, D. G., Eason, T., Fritz,
#' S. C., Garmestani, A. S., … Stone, J. R. (2014). Prolonged Instability Prior
#' to a Regime Shift. PLOS ONE, 9(10), e108936.
#' https://doi.org/10.1371/journal.pone.0108936

#' @source \url{https://doi.org/10.1371/journal.pone.0108936.s001}
"paleo"
