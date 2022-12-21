get_cal_data <- function(doc) {
  get_a_cal <- function(var, analyte) {
    xstr <-
      "//AssayDataSet//AnalyteCalibrationsByAnalyteName//Item[Key='"
    vars <-
      c(
        "LED" = "']//Value//AnalyteCalibration//LedValues//ArrayOfInt//int",
        "CalEmission" = "']//Value//AnalyteCalibration//CalibrationEmissionValues//ArrayOfDouble//double",
        "IntialReferenceDelta" = "']//Value//AnalyteCalibration//IntialReferenceDeltaValues//ArrayOfInt//int",
        "Status" = "']//Value//AnalyteCalibration//LedStatusValues//ArrayOfCalibrationQuality//CalibrationQuality"
      )
    type <- list(
      "LED" = as.numeric,
      "CalEmission" = as.numeric,
      "IntialReferenceDelta" = as.numeric,
      "Status" = as.character
    )
    type[[var]](xpathSApply(doc, paste0(xstr, analyte, vars[var]), xmlValue))
  }
  anCal <- function(xml, analyte) {
    var_names <-
      c("LED", "CalEmission", "IntialReferenceDelta", "Status")
    setNames(data.frame(lapply(var_names, get_a_cal, analyte = analyte)),
             paste(analyte, var_names, sep = "."))
  }
  pH <- anCal(doc, 'pH')
  O2 <- anCal(doc, 'O2')
  Well <- seq_along(pH[, 1])
  cbind(Well, pH, O2)
}
