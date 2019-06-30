library(R.matlab)
library(readr)

# Load matlab data
rawSmall <- readMat("data-raw/smalldemodata.mat")
rawLarge <- readMat("data-raw/largedemodata.mat")

# Convert to dataframe
smalldemodata <-
  data.frame(
    x = seq(0, 1, length.out = 100),
    true = rawSmall$absdata[, ],
    obs = rawSmall$noisyabsdata[, ]
  )

largedemodata <-
  data.frame(x = 1:82799,
         obs = rawLarge$largescaledata[,])

# Save data
write_csv(smalldemodata, "data-raw/smalldemodata.csv")
usethis::use_data(smalldemodata, overwrite = TRUE)
write_csv(largedemodata, "data-raw/largedemodata.csv")
usethis::use_data(largedemodata, overwrite = TRUE)
