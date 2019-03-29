library(reticulate)
# import("numpy")

# create a new environment
# conda_create("r-reticulate")


source_python("inst/test.py", envir = parent.frame(), convert = T)

dx = 0.05
x0 = seq(0, 2.0*pi, dx)

testf = sin(x0)

testf = testf + rnorm(length(testf), mean = 0, sd = 0.04)

# np <- import("numpy")
# np$diff(testf)
# u0 <- c(0,diff(testf),0)
deriv_sm <- TVRegDiff(data = testf, itern = 1L, alph = 5e-2, scale='small', ep=1e-6, dx=dx,
          plotflag=0, diagflag=1)
class(deriv_sm)

dplyr::tibble(x0 = x0,
              s = deriv_sm)

plot(x0, deriv_lrg[1:126])
lines(x0, cos(x0))


    deriv_lrg = TVRegDiff(testf, 100L, 1e-1, dx=dx,
                          ep=1e-2, scale='large', plotflag=0)

source_python("inst/add.py", convert = F)
result <- add(1,2)

np <- import("numpy")
sp <- import("scipy")

np.array()
