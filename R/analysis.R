analysis<-function(X){
  if(X$type=="C" & grepl("wet[ |]qc",X$assay)==T){
    return(X$summary <-foam::combo_assay(X))
  }else{
    if(X$assay=="ksv"){
      return(X$summary <-foam::calc_ksv(X$levels,
                            X$O2_coefs$co,
                            X$calibration
                            ))
    }
    if(X$assay=="gain"){
      return(X$summary <-foam::calc_gain(X$levels,
                             X$pH_coefs$target,
                             X$calibration))
    }
    if(X$assay=="pka"){
      return(X$summary <- foam::munge_pka(X$levels,X$type))
    }
    # the
    message("you get ...nothing!")
  }
}
