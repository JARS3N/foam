gain_tbl<-function(doc){
  tibble(
    O2_LEDgain = foam::calibration_gain(doc,"O2"),
    pH_LEDgain = foam::calibration_gain(doc,'pH'),
    Well = plates::num_to_well(seq_along(O2_LEDgain),length(O2_LEDgain))
  )
}
