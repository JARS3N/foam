calc_gain<- function(lvls, pH_target, cal) {
  filter(lvls, Tick %in% (max(Tick) - c(2, 1, 0))) %>%
    group_by(Well) %>%
    summarize(sorpH = mean(pH_CorrectedEmission)) %>%
    left_join(., cal, by = 'Well') %>%
    mutate(
      pH_target = pH_target,
      Gain = (pH_target / pH.CalEmission) * (1 / 800) * (pH.CalEmission - sorpH)
    ) %>%
    mutate(KSV = NA, Ambient = NA, F0 = NA)
}
