devtools::install_github("https://github.com/TrashBirdEcology/regimeDetectionMeasures")
library(regimeDetectionMeasures)
library(readr)

paleo <- munge_orig_dat()
paleoDistance <- calculate_distanceTravelled(paleo)

# Save data
write_csv(paleo, "data-raw/paleo.csv")
usethis::use_data(paleo, overwrite = TRUE)
write_csv(paleoDistance, "data-raw/paleoDistance.csv")
usethis::use_data(paleoDistance, overwrite = TRUE)
