
combo_assay <- function(X) {
  A <- foam::calc_gain(filter(X$levels, Measure == 1),
                       X$pH_coefs$target,
                       X$calibration) %>%
    select(-KSV, -F0, -Ambient)
  B <- foam::calc_ksv(X$levels, X$O2_coefs$co, X$calibration) %>%
    select(-Gain, -sorpH)
  
  
    left_join(
      A,
      B,
      by = join_by(
        Well,
        pH.LED,
        pH.CalEmission,
        pH.IntialReferenceDelta,
        pH.Status,
        O2.LED,
        O2.CalEmission,
        O2.IntialReferenceDelta,
        O2.Status
      ))
}
