// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-

#include <RcppArmadillo.h>
#include <math.h>

// [[Rcpp::depends(RcppArmadillo)]]

using namespace Rcpp;
using namespace std;
using namespace arma;


// helper function (delete first entry)
// [[Rcpp::export]]
arma::vec chop(arma::vec x){
  return x.subvec(1, x.n_elem - 1);
}

// antidifferentiation operator and its adjoint
// [[Rcpp::export]]
arma::vec A(arma::vec x, float dx){
  return chop(arma::cumsum(x) - 0.5 * (x + x[0])) * dx;
}

// [[Rcpp::export]]
arma::vec AT(arma::vec x, float dx){
  arma::vec y1 = arma::zeros<rowvec>(1);
  y1[0] = arma::sum(x) / 2.0;
  arma::vec y2 = arma::cumsum(x) - x / 2.0;
  return (arma::sum(x) - join_cols(y1, y2)) * dx;
}

// matrix vector product A*x
// [[Rcpp::export]]
arma::vec Ax(arma::vec x, double alph, arma::mat L, double dx){
  return alph * L * x + AT(A(x, dx), dx);
}

// incomplete cholesky factorization
// [[Rcpp::export]]
arma::mat icc(arma::mat A){
  int N = A.n_cols ;
  arma::mat temp = A;
  for(int k = 0; k < N; k++){
    temp(k,k) = sqrt(temp(k,k));
    for(int i = k + 1; i < N; i++){
      if(temp(i,k) != 0){
        temp(i,k) = temp(i,k)/temp(k,k);
      }
    }
    for(int j = k + 1; j < N; j++){
      for(int i= j; i < N; i++){
        if(temp(i,j) != 0){
          temp(i,j) = temp(i,j) - temp(i,k)*temp(j,k);
        }
      }
    }
  }

  for(int i = 0; i<N; i++){
    for(int j = i+1; j<N; j++){
      temp(i,j) = 0;
    }
  }

  return temp;
}


//' Preconditioned conjugate gradient method
//'
//' Preconditioned conjugate gradient method for solving system of linear equations Ax = b,
//' where A is symmetric and positive definite.
//'
//' @title Solve for x in Ax = b using preconditioned conjugate gradient method.
//' @param A matrix, symmetric and positive definite.
//' @param b vector, with same dimension as number of rows of A.
//' @param preconditioner string, method for preconditioning: \code{"Jacobi"} (default), \code{"SSOR"}, or \code{"ICC"}.
//' @param tol numeric, threshold for convergence, default is \code{1e-6}.
//' @param maxIter numeric, maximum iteration, default is \code{1000}.
//' @return A vector representing solution x.
//' @examples
//' \dontrun{
//' test_A <- matrix(c(4,1,1,3), ncol = 2)
//' test_b <- matrix(1:2, ncol = 1)
//' pcgsolve(test_A, test_b, "ICC")
//' }
// [[Rcpp::export]]
arma::vec pcgsolve(arma::vec b, arma::mat M, double alph, arma::mat L, double dx, float tol = 1e-6, int maxIter = 1000) {
  /* Function for solving linear equations Ax = b using preconditioned conjugate gradient
   Input:
   A: matrix.
   b: vector
   preconditioner: string, type of preconditioner
   Output
   x: vector
   */
  // get number of columns of A
  int C = M.n_cols ;
  int R = M.n_rows ;

  /* get preconditioner M
  arma::mat M;
  if (preconditioner == "Jacobi"){
    M = arma::diagmat(A);
  } else if(preconditioner == "SSOR"){
    arma::mat D = arma::diagmat(A);
    arma::mat L = arma::trimatl(A);
    M = (D+L) * D.i() * (D+L).t();
  } else if(preconditioner == "ICC"){
    M = icc(A);
  }
  */

  // initiate solution x as zeros
  arma::vec x(C) ;
  x.zeros() ;

  arma::vec oneVec(C);
  oneVec.ones() ;

  arma::vec r = b - Ax(x, alph, L, dx);
  arma::mat Minv = M.i();
  arma::vec z = Minv * r;
  arma::vec p = z;
  double rz_old = sum(r % z);
  double rz_new=1;
  // arma::vec rz_ratio(1);

  arma::vec Ap(R);
  double alpha, beta;
  // vector version of alpha
  // arma::vec alphaVec(1);

  for(int iter = 0; (iter < maxIter) && (rz_new > tol); iter++){
    // Ap = A * p;
    Ap = Ax(p, alph, L, dx);
    alpha = rz_old / sum(p % Ap);

    x += alpha * p;
    r -= alpha * Ap;
    z = Minv * r;
    rz_new = sum( z % r );
    beta = rz_new / rz_old;

    p = z + beta * p;
    rz_old = rz_new;
    if (iter >= maxIter){
      Rcout << "pcg did not converge." << endl;
    }
  }

  return x;

}
