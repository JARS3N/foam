calc_pH_levels <- function(cal, lvls, gain) {
  library(dplyr)
  select(
  mutate(suppressMessages(left_join(lvls, cal, by = "Well")),
         pH = (7400 - ((pH.CalEmission - pH_CorrectedEmission) / gain
         )) / 1000), Tick, Well,pH)
}


