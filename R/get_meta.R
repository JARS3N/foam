# grab meta data from wave obj
meta<-function(u){
    dplyr::bind_cols( tibble(Instrument=u$Inst,
         Lot = u$lot,
         sn = u$sn,
         file = u$file
  ) ,as.data.frame(u$software))
}
