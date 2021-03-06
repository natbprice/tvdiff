# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

chop <- function(x) {
    .Call(`_tvdiff_chop`, x)
}

A <- function(x, dx) {
    .Call(`_tvdiff_A`, x, dx)
}

AT <- function(x, dx) {
    .Call(`_tvdiff_AT`, x, dx)
}

Ax <- function(x, alph, L, dx) {
    .Call(`_tvdiff_Ax`, x, alph, L, dx)
}

#' Preconditioned conjugate gradient method
#'
#' Preconditioned conjugate gradient method for solving system of linear equations Ax = b,
#' where A is symmetric and positive definite.
#'
#' Code is a slightly modified version of \code{\link[cPCG]{pcgsolve}}
#'
#' @param b vector, with same dimension as number of rows of A.
#' @param M matrix, preconditioner matrix defined interal to \code{\link{TVRegDiffR}}.
#' @param alph numeric, regularization parameter used in \code{\link{TVRegDiffR}}.
#' @param L matrix, linearized diffusion matrix internal to \code{\link{TVRegDiffR}}.
#' @param dx numeric, grid spacing used in \code{\link{TVRegDiffR}}.
#' @param tol numeric, threshold for convergence, default is \code{1e-6}.
#' @param maxIter numeric, maximum iteration, default is \code{1000}.
#' @return A vector representing solution x.
pcgsolve <- function(b, M, alph, L, dx, tol = 1e-6, maxIter = 1000L) {
    .Call(`_tvdiff_pcgsolve`, b, M, alph, L, dx, tol, maxIter)
}

