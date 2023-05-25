get_software <- function(doc) {
  terms <- c("SWVersion",
             "MainBoardFirmware",
             "EO1Firmware",
             "EO2Firmware",
             "Pic24Firmware")
  inputs <- setNames(paste0("//", terms), terms)
  out<-lapply(inputs, function(u) {
    xpathSApply(doc, u, xmlValue)
  })
  # pre-Pro may not have board info etc
  check_null<-unlist(lapply(out,is.null))
  out[!check_null]
}
