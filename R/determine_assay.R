determine_assay <- function(template,file,force=F,override=NULL){
  if(force==T){return(override)}
  sub_reg<-function(str,match){
    regmatches(str,gregexpr(match,str))
  }
  a<-unlist(sub_reg(tolower(template),"gain|ksv|barcode|wet qc xfp|wet qc|wetqc|mr|pka|outlier"))
  b<-unlist(sub_reg(tolower(file),"gain|ksv|barcode|wet qc xfp|wet qc|wetqc|mr|pka|outlier"))
  if(length(a)>0){return(a[1])}
  if(length(b>0)){return(b[1])}else{
    return(NA)
  }
}
