analysis<-function(X){
  assay<-tolower(X$assay)
  if(length(X$assay)>1){
    message("confused,assay length >1")
    return(NULL)
  }
  if(X$type=="C" & grepl("wet( |)qc",assay)==T){
    return(X$summary <-foam::combo_assay(X))
  }else{
    if(assay=="ksv"){
      return(X$summary <-foam::calc_ksv(X$levels,
                            X$O2_coefs$co,
                            X$calibration
                            ))
    }
    if(assay=="gain"){
      return(X$summary <-foam::calc_gain(X$levels,
                             X$pH_coefs$target,
                             X$calibration))
    }
    if(assay=="pka"){
      return(X$summary <- foam::munge_pka(X$levels,X$type))
    }
    # the
    message("you get ...nothing!")
  }
}
