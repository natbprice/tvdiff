// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// chop
arma::vec chop(arma::vec x);
RcppExport SEXP _tvdiff_chop(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::vec >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(chop(x));
    return rcpp_result_gen;
END_RCPP
}
// A
arma::vec A(arma::vec x, float dx);
RcppExport SEXP _tvdiff_A(SEXP xSEXP, SEXP dxSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::vec >::type x(xSEXP);
    Rcpp::traits::input_parameter< float >::type dx(dxSEXP);
    rcpp_result_gen = Rcpp::wrap(A(x, dx));
    return rcpp_result_gen;
END_RCPP
}
// AT
arma::vec AT(arma::vec x, float dx);
RcppExport SEXP _tvdiff_AT(SEXP xSEXP, SEXP dxSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::vec >::type x(xSEXP);
    Rcpp::traits::input_parameter< float >::type dx(dxSEXP);
    rcpp_result_gen = Rcpp::wrap(AT(x, dx));
    return rcpp_result_gen;
END_RCPP
}
// Ax
arma::vec Ax(arma::vec x, double alph, arma::mat L, double dx);
RcppExport SEXP _tvdiff_Ax(SEXP xSEXP, SEXP alphSEXP, SEXP LSEXP, SEXP dxSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::vec >::type x(xSEXP);
    Rcpp::traits::input_parameter< double >::type alph(alphSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type L(LSEXP);
    Rcpp::traits::input_parameter< double >::type dx(dxSEXP);
    rcpp_result_gen = Rcpp::wrap(Ax(x, alph, L, dx));
    return rcpp_result_gen;
END_RCPP
}
// pcgsolve
arma::vec pcgsolve(arma::vec b, arma::mat M, double alph, arma::mat L, double dx, float tol, int maxIter);
RcppExport SEXP _tvdiff_pcgsolve(SEXP bSEXP, SEXP MSEXP, SEXP alphSEXP, SEXP LSEXP, SEXP dxSEXP, SEXP tolSEXP, SEXP maxIterSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::vec >::type b(bSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type M(MSEXP);
    Rcpp::traits::input_parameter< double >::type alph(alphSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type L(LSEXP);
    Rcpp::traits::input_parameter< double >::type dx(dxSEXP);
    Rcpp::traits::input_parameter< float >::type tol(tolSEXP);
    Rcpp::traits::input_parameter< int >::type maxIter(maxIterSEXP);
    rcpp_result_gen = Rcpp::wrap(pcgsolve(b, M, alph, L, dx, tol, maxIter));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_tvdiff_chop", (DL_FUNC) &_tvdiff_chop, 1},
    {"_tvdiff_A", (DL_FUNC) &_tvdiff_A, 2},
    {"_tvdiff_AT", (DL_FUNC) &_tvdiff_AT, 2},
    {"_tvdiff_Ax", (DL_FUNC) &_tvdiff_Ax, 4},
    {"_tvdiff_pcgsolve", (DL_FUNC) &_tvdiff_pcgsolve, 7},
    {NULL, NULL, 0}
};

RcppExport void R_init_tvdiff(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
