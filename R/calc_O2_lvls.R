calc_O2_levels <- function(cal, lvls, coefs) {
  require(dplyr)
  ppO2 <- foam::partial_pressure_ox(37)
  lvls <- select(lvls, Tick, Measure, Well, O2_CorrectedEmission)
  cal <- select(cal, Well, O2.CalEmission) %>%
    mutate(F0 = O2.CalEmission * (ppO2 * coefs$Ksv + 1))

  xx <-  left_join(lvls, cal,by='Well') %>%
    mutate(O2 =  (1 / coefs$Ksv) * ((F0 / O2_CorrectedEmission) - 1))
  xx
}
