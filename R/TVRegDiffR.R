#' Total Variation Regularized Numerical Differentiation (TVDiff)
#'
#' Estimate the derivative of noisy data using regularized differentiation.
#'
#' This function is an R wrapper for a Python translation of the original Matlab
#' code.
#'
#' @param data Vector of data to be differentiated.
#' @param iter Number of iterations to run the main loop. A stopping condition
#' based on the norm of the gradient vector g below would be an easy
#' modification.  No default value.
#' @param alph Regularization parameter.  This is the main parameter
#' to fiddle with.  Start by varying by orders of magnitude until reasonable
#' results are obtained.  A value to the nearest power of 10 is usally adequate.
#' No default value.  Higher values increase regularization strenght and improve
#' conditioning.
#' @param u0 Initialization of the iteration.  Default value is the naive
#' derivative (without scaling), of appropriate length (this being different
#' for the two methods). Although the solution is theoretically independent of
#' the intialization, a poor choice can exacerbate conditioning issues when the
#' linear system is solved.
#' @param scale 'large' or 'small' (case insensitive).  Default is 'small'.
#' 'small' has somewhat better boundary behavior, but becomes unwieldly for data
#' larger than 1000 entries or so.  'large' has simpler numerics but is more
#' efficient for large-scale problems.  'large' is more readily modified for
#' higher-order derivatives, since the implicit differentiation matrix is square.
#' @param ep Parameter for avoiding division by zero.  Default value is 1e-6.
#' Results should not be very sensitive to the value.  Larger values improve
#' conditioning and therefore speed, while smaller values give more accurate
#' results with sharper jumps.
#' @param dx Grid spacing, used in the definition of the derivative operators.
#' Default is the reciprocal of the data size.
#' @param plotflag Flag whether to display plot at each iteration. Default is 1
#'  (yes).  Useful, but adds significant running time.
#' @param diagflag Flag whether to display diagnostics at each iteration.
#' Default is 1 (yes).  Useful for diagnosing preconditioning problems.  When
#' tolerance is not met, an early iterate being best is more worrying than a
#' large relative residual.
#' @param tol R Version Only: Tolerance passed to scipy.sparse.linalg.cg
#' @param maxit R Version Only: Maximum iterations passed to
#' scipy.sparse.linalg.cg
#'
#' @return Estimate of the regularized derivative of data.  Due to different
#' grid assumptions, length( u ) = length( data ) + 1 if scale = 'small',
#' otherwise length( u ) = length( data ).
#'
#' @author
#' Rick Chartrand (\email{rickc@@lanl.gov})
#'
#' R translation: Nathaniel Price  (\email{natbprice@@gmail.com})
#'
#' @references
#' Rick Chartrand, "Numerical differentiation of noisy, nonsmooth
#' data," ISRN Applied Mathematics, Vol. 2011, Article ID 164564, 2011.
#'
#' @import Matrix
#' @importFrom graphics plot
#'
#' @export
TVRegDiffR <-
  function(data,
           iter,
           alph,
           u0 = NULL,
           scale = 'small',
           ep = 1e-6,
           dx,
           plotflag = 0,
           diagflag = 0,
           tol = 1e-4,
           maxit = 200) {


    ## Copyright notice:
    # Copyright 2010. Los Alamos National Security, LLC. This material
    # was produced under U.S. Government contract DE-AC52-06NA25396 for
    # Los Alamos National Laboratory, which is operated by Los Alamos
    # National Security, LLC, for the U.S. Department of Energy. The
    # Government is granted for, itself and others acting on its
    # behalf, a paid-up, nonexclusive, irrevocable worldwide license in
    # this material to reproduce, prepare derivative works, and perform
    # publicly and display publicly. Beginning five (5) years after
    # (March 31, 2011) permission to assert copyright was obtained,
    # subject to additional five-year worldwide renewals, the
    # Government is granted for itself and others acting on its behalf
    # a paid-up, nonexclusive, irrevocable worldwide license in this
    # material to reproduce, prepare derivative works, distribute
    # copies to the public, perform publicly and display publicly, and
    # to permit others to do so. NEITHER THE UNITED STATES NOR THE
    # UNITED STATES DEPARTMENT OF ENERGY, NOR LOS ALAMOS NATIONAL
    # SECURITY, LLC, NOR ANY OF THEIR EMPLOYEES, MAKES ANY WARRANTY,
    # EXPRESS OR IMPLIED, OR ASSUMES ANY LEGAL LIABILITY OR
    # RESPONSIBILITY FOR THE ACCURACY, COMPLETENESS, OR USEFULNESS OF
    # ANY INFORMATION, APPARATUS, PRODUCT, OR PROCESS DISCLOSED, OR
    # REPRESENTS THAT ITS USE WOULD NOT INFRINGE PRIVATELY OWNED
    # RIGHTS.

    ## BSD License notice:
    # Redistribution and use in source and binary forms, with or without
    # modification, are permitted provided that the following conditions
    # are met:
    #
    #      Redistributions of source code must retain the above
    #      copyright notice, this list of conditions and the following
    #      disclaimer.
    #      Redistributions in binary form must reproduce the above
    #      copyright notice, this list of conditions and the following
    #      disclaimer in the documentation and/or other materials
    #      provided with the distribution.
    #      Neither the name of Los Alamos National Security nor the names of its
    #      contributors may be used to endorse or promote products
    #      derived from this software without specific prior written
    #      permission.
    #
    # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
    # CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
    # INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
    # MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    # DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
    # CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    # SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    # LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
    # USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
    # AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    # LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    # ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    # POSSIBILITY OF SUCH DAMAGE.

    # Helper function
    chop <- function(v){
      v[-1]
    }

    # Get the data size.
    n = length(data)

    # Default checking. (u0 is done separately within each method.)
    if(is.null(dx))   dx = 1.0 / n

    # Different methods for small- and large-scale problems.
    if (scale == 'small') {

      # Construct differentiation matrix.
      c1 = rep(1, n+1) / dx
      D <-
        Matrix::bandSparse(n = n,
                   m = n + 1,
                   c(0, 1),
                   diagonals = matrix(c(-c1, c1), ncol = 2))
      DT <- t(D)

      # Construct antidifferentiation operator and its adjoint.
      A <- function(x) {
        chop(cumsum(x) - 0.5 * (x + x[1])) * dx
      }

      AT <- function(w) {
        (sum(w) - c(sum(w) / 2.0, cumsum(w) - w / 2.0)) * dx
      }

      # Default initialization is naive derivative
      if (is.null(u0)) {
        u0 <- c(0, diff(data), 0)
      }

      # Initialize u
      u <- u0

      # Since Au( 0 ) = 0, we need to adjust.
      ofst <- data[1]
      # Precompute.
      ATb = AT(ofst - data)

      # Main loop.
      for (ii in 1:(iter+1)){
        # Diagonal matrix of weights, for linearizing E-L equation.
        Q <- Matrix::bandSparse(n = n, m = n, k = 0,
                        diagonals = matrix( 1 / ( sqrt( ( D %*% u )^2 + ep )), ncol = 1))
        # Linearized diffusion matrix, also approximation of Hessian.
        L = dx * DT %*% Q %*% D

        # Gradient of functional.
        g = AT(A(u)) + ATb + alph * L %*% u

        # Simple preconditioner
        P <- alph * Matrix::bandSparse(n = n + 1, m = n + 1, k = 0,
                               diagonals = as.matrix(diag(L) + 1, ncol = 1))

        # Preconditiond conjugate gradient solver
        pcgResult = pcg(
          Ax = function(v) alph * L %*% v + AT(A(v)),
          b = g,
          x0 = rep(0, length(g)),
          tol = tol,
          maxiter = maxit,
          M = P
        )
        s <- pcgResult$x

        # Update solution.
        u = u - s

        # Display plot.
        if (plotflag) {
          plot(u)
        }
      }
    } else if (scale == "large") {

      stop("Only small scale algorithm is implemented.")
    }

    return(u)
  }
