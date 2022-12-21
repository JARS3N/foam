get_plate <- function(doc){
  x <-list()
  x$barcode<-xpathSApply(doc, "//PlateBarcode", xmlValue)
  x$lot <- substr(x$barcode,7,11)
  x$sn <-  substr(x$barcode,2,6)
  x$orientation <- substr(x$barcode,12,12)
  x
}
