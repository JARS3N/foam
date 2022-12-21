get_software <- function(doc) {
  terms <- c("SWVersion",
             "MainBoardFirmware",
             "EO1Firmware",
             "EO2Firmware",
             "Pic24Firmware")
  inputs <- setNames(paste0("//", terms), terms)
  lapply(inputs, function(u) {
    xpathSApply(doc, u, xmlValue)
  })
}
