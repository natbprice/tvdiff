#' Preconditioned conjugate gradient method solver
#'
#' Solve system of linear equations $Ax = b$
#'
#' @param Ax function that takes argument x and returns matrix product A*x
#' @param b right hand side of the linear system
#' @param M preconditioner for A
#' @param x0 starting guess for solution
#' @param maxiter maximum number of iterations
#' @param tol tolerance for convergence on norm(residual, "2")
#'
#' @examples
#' A <- matrix(c(4, 1, 1, 3), nrow = 2)
#' b <- c(1, 2)
#' x0 <- c(2, 1)
#'
#' Ax <- function(x) {
#'   A %*% x
#' }
#'
#' M <- matrix(c(4, 0, 0, 3), nrow = nrow(A))
#'
#' opt <- pcg(Ax, b, M, x0)
#'
#' @export
pcg <-
  function(Ax,
           b,
           M,
           x0,
           maxiter = 1e3,
           tol = 1e-6) {
    r <- vector(mode = "list", length = maxiter)
    x <- vector(mode = "list", length = maxiter)
    z <- vector(mode = "list", length = maxiter)
    p <- vector(mode = "list", length = maxiter)
    alpha <- vector(mode = "list", length = maxiter)
    beta <- vector(mode = "list", length = maxiter)

    x[[1]] <- x0
    r[[1]] <- b - Ax(x[[1]])
    # Minv <- solve(M + diag(rnorm(nrow(M), 0, 1e-3)))
    Minv <- solve(M, tol = 1e-20)
    z[[1]] <- Minv %*% r[[1]]
    p[[1]] <- z[[1]]

    resid <- Inf
    k <- 1
    while (resid > tol & k < maxiter) {
      alpha[[k]] <-
        as.numeric((t(as.array(r[[k]])) %*% z[[k]]) / (t(as.array(p[[k]])) %*% Ax(p[[k]])))
      x[[k + 1]] <- x[[k]] + alpha[[k]] * p[[k]]
      r[[k + 1]] <- r[[k]] - alpha[[k]] * Ax(p[[k]])
      resid <- norm(r[[k + 1]], "2")
      z[[k + 1]] <- Minv %*% r[[k + 1]]
      beta[[k]] <-
        as.numeric((t(as.array(z[[k + 1]])) %*% r[[k + 1]]) / (t(as.array(z[[k]])) %*% r[[k]]))
      p[[k + 1]] <- z[[k + 1]] + beta[[k]] * p[[k]]
      k <- k + 1
    }

    return(list(x = x[[k]], resid = resid, iter = k))

  }
