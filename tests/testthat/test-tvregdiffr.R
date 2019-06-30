context("test-tvregdiffr")

# Load small demo data
data("smalldemodata")

# Unpack data
x <- smalldemodata$x
obs <- smalldemodata$obs
true <- smalldemodata$true
dydx_true <- rep(-1, length(x))
dydx_true[x > 0.5] <- 1
dx <- x[2] - x[1]

test_that("inputs", {
  expect_error(
    TVRegDiffR(
      data = "string",
      iter = 100,
      alph = 0.2,
      scale = "small",
      ep = 1e-6,
      dx = dx
      ),
    "Input 'data' should be a numeric vector."
    )
  expect_error(
    TVRegDiffR(
      data = 1,
      iter = 100,
      alph = 0.2,
      scale = "small",
      ep = 1e-6,
      dx = 1
    ),
    "Input 'data' should be a numeric vector."
  )
  expect_error(
    TVRegDiffR(
      data = obs,
      iter = "string",
      alph = 0.2,
      scale = "small",
      ep = 1e-6,
      dx = 1
    ),
    "Input 'iter' should be a positive integer."
  )
  expect_error(
    TVRegDiffR(
      data = obs,
      iter = c(10,1),
      alph = 0.2,
      scale = "small",
      ep = 1e-6,
      dx = 1
    ),
    "Input 'iter' should be a positive integer."
  )
  expect_error(
    TVRegDiffR(
      data = obs,
      iter = 100,
      alph = "string",
      scale = "small",
      ep = 1e-6,
      dx = 1
    ),
    "Input 'alph' should be a positive number"
  )
  expect_error(
    TVRegDiffR(
      data = obs,
      iter = 100,
      alph = c(10,1),
      scale = "small",
      ep = 1e-6,
      dx = 1
    ),
    "Input 'alph' should be a positive number"
  )
})
