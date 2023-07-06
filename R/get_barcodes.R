barcodes <- function(doc) {
  require(XML)
  nms <- c("Plate", "Cartridge")
  xpath <- setNames(paste0("//", nms , "/Barcode"), nms)
  data.frame(lapply(xpath,
                    xpathSApply,
                    doc = xml,
                    fun = xmlValue))
}
