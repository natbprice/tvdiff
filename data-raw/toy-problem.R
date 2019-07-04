library(readr)

x <- seq(-4, 4, length.out = 100)
dx <- x[2] - x[1]

y_true <- vector("numeric", 100)
y_true[x < 0] <- (x[x > 0] - 2)^2
y_true[x > 0] <- (x[x < 0] + 2)^2

dydx_true <- vector("numeric", 100)
dydx_true[x < 0] <- 2*x[x > 0] - 4
dydx_true[x > 0] <- 2*x[x < 0] + 4

y_obs <- y_true + rnorm(length(y_true), mean = 0, sd = 0.5)

toyproblem <- data.frame(x = x,
                         y_true = y_true,
                         y_obs = y_obs,
                         dydx_true = dydx_true)

# Save data
write_csv(toyproblem, "data-raw/toyproblem.csv")
usethis::use_data(toyproblem, overwrite = TRUE)
