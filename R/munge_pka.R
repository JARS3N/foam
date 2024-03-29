munge_pka <- function(lvls, type) {
  pH <- c(3.8, 5, 5.8, 6.6, 7.0, 7.4, 8.15, 9.2)
  reps <- unname(c(
    "C" = 1,
    "Q" = 3,
    "B" = 3,
    "W" = 12,
    "X" = 12,
    "Y" = 3,
    "Z" = 1
  )[type])
  pH_df <- tibble(pH = unlist(lapply(pH, rep, times = reps)),
                  Well = seq_along(pH))
  
  LVL <- select(lvls, Well, Tick, Measure, pH_CorrectedEmission) %>%
    merge(pH_df) %>%
    group_by(Well, Measure, pH) %>%
    filter(Tick >= (max(Tick) - 2)) %>%
    summarise(counts = mean(pH_CorrectedEmission)) %>%
    ungroup()
  MM <- max(LVL$Measure)
  is96 <- type %in% c("W","X")
  if (MM == 2 & !is96) {
    LVL %>%
      left_join(., tibble(Measure = c(1, 2),
                          dye = c("CL", "PR"))) %>% select(-Measure)
  } else if (is96 & MM == 1) {
    mutate(
      LVL,
      W = plates::num_to_well(Well, 96),
      Col = plates::cols(W),
      test = factor(Col > 6, levels = c(F, T)),
      dye = c("CL", "PR")[test]
    ) %>%
      select(-W,-Col,-Measure, -test)
  } else{
    mutate(LVL, dye = "CL") %>%
      select(-Measure)
  }
  
}
