munge_pka <- function(lvls,type) {
  pH <- c(3.8, 5, 5.8, 6.6, 7.0, 7.4, 8.15, 9.2)
  reps <- unname(c(
    "C" = 1,
    "T" = 3,
    "Q" = 3,
    "B" = 3,
    "W" = 12
  )[type])
  pH_df <- data.frame(pH = unlist(lapply(pH, rep, times = reps)))
  pH_df$Well <- seq_along(pH_df$pH)
  last_ticks_of_measures <-
    unlist(lapply(unique(lvls$Measure), function(u) {
      max(lvls$Tick[lvls$Measure == u])
    }))
  tick_filter <-
    unlist(rev(lapply(rev(last_ticks_of_measures)[1:2], function(n) {
      c(-2, -1, 0) + n
    })))
  LVL <-
    lvls[lvls$Tick %in% tick_filter, c("pH_CorrectedEmission", "Tick", "Well", "Measure")]
  LVL$Tick <- as.numeric(factor(LVL$Tick))
  X <- merge(LVL, pH_df, by = 'Well')
  X$Measure <- as.numeric(factor(X$Measure))
  if (max(X$Measure == 2) & type != "W") {
    X$dye <- c('CL', 'PR')[X$Measure]
  } else if (type == "W" & max(X$Measure) == 1) {
    X$dye <- c(rep("CL", 6), rep("PR", 6))
  } else{
    X$dye <- 'CL'
  }

  setNames(aggregate(
    pH_CorrectedEmission ~ Well + pH + dye,
    data = X,
    FUN = mean
  ),c("Well", "pH", "dye", "counts"))
}
