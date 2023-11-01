combo_assay<-function(X){
  foam::calc_gain(filter(X$levels,Measure==1),X$pH_coefs$target,X$calibration) %>%
plyr::left_join(
   foam::calc_ksv(X$levels,X$O2_coefs$co,X$calibration)
  ) %>%
 dplyr::left_join(.,X$calibration)
}
