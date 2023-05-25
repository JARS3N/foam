barcodes<-function(doc){
require(dplyr)
  nms<-c("Plate","Cartridge")
  xpathApply(doc,
              paste0("//",nms,"/Barcode") ,
              xmlValue) %>% 
    setNames(.,nms) %>% 
    as.data.frame()
}
