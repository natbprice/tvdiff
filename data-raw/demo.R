library(R.matlab)
library(dplyr)
library(readr)

# Load matlab data
path <- system.file("matlab-code", package = "tvdiff")
pathname <- file.path(path, "smalldemodata.mat")
rawSmall <- readMat(pathname)
pathname <- file.path(path, "largedemodata.mat")
rawLarge <- readMat(pathname)

# Convert to dataframe
smalldemodata <-
  tibble(
    x = seq(0, 1, length.out = 100),
    true = rawSmall$absdata[, ],
    obs = rawSmall$noisyabsdata[, ]
  )

largedemodata <-
  tibble(x = 1:82799,
         obs = rawLarge$largescaledata[,])

# Save data
write_csv(smalldemodata, "data-raw/smalldemodata.csv")
usethis::use_data(smalldemodata, overwrite = TRUE)
write_csv(largedemodata, "data-raw/largedemodata.csv")
usethis::use_data(largedemodata, overwrite = TRUE)
