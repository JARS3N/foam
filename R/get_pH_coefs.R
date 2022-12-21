get_pH_coefs <- function(doc) {
  coefs <- list(
    "slope" = as.numeric(
      xpathSApply(
        doc,
        "//Item[Key='pH']//Value//AnalyteCalibration//GainEquation//C3",
        xmlValue
      )
    ),
    "intercept" = as.numeric(
      xpathSApply(
        doc,
        "//Item[Key='pH']//Value//AnalyteCalibration//GainEquation//C4",
        xmlValue
      )
    ),
    "target" = as.numeric(
      xpathSApply(
        doc,
        "//Item[Key='pH']//Value//AnalyteCalibration//TargetEmissionValue",
        xmlValue
      )
    )
  )
  coefs$gain <- c((coefs$slope * coefs$target) + coefs$intercept)
 coefs
}
