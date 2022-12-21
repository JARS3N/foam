get_O2_coefs <- function(doc) {
  ksvs <- as.numeric(xpathSApply(doc, '//O2DataModifiers//Ksv', xmlValue))
  F0 <- as.numeric(XML::xpathApply(doc,"//AssayDataSet//O2DataModifiers//FO",XML::xmlValue)[[1]])
  coefs <- list(
    "target" = as.numeric(
      xpathSApply(
        doc,
        "//Item[Key='O2']//Value//AnalyteCalibration//TargetEmissionValue",
        xmlValue
      )
    ),
    "Ksv" = ksvs[1],
    "CorrectedKsv" = ksvs[2],
    "F0" = F0
  )
  coefs$co <-as.numeric(xpathSApply(doc,"//Plate/CO",xmlValue))
  coefs
}
