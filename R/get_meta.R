# grab meta data from wave obj
meta<-function(u){
  software<-tryCatch( {as.data.frame(u$software)},error=function(e){NULL})
  dplyr::bind_cols( tibble(Instrument=u$Inst,
                           Lot = paste0(u$type,u$lot),
                           sn = u$sn,
                           file = u$file
  ) ,software,u$last_run,u$barcodes)
}
