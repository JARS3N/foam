foam <- R6::R6Class(
  "foam",
  list(
    xml = NULL,
    file =  NULL,
    software =  NULL,
    lot =  NULL,
    type =  NULL,
    sn =  NULL,
    plate = NULL,
    Inst =  NULL,
    calibration_temp = NULL,
    temp_tolerance = NULL,
    atmospheric_pressure = NULL,
    tick_table = NULL,
    groups = NULL,
    O2_coefs = NULL,
    pH_coefs = NULL,
    calibration = NULL,
    levels = NULL,
    template = NULL,
    assay = NULL,
    commands = NULL,
    summary = NULL,
    extra_parameters = NULL,

    initialize = function(x) {
      library(dplyr)
      library(XML)
      self$xml <- foam::xml(x)
      self$file <-
        basename(xpathSApply(self$xml, "//FileName", xmlValue))
       self$software <- foam::get_software(self$xml)
       self$Inst <- xpathSApply(self$xml, "//InstrumentSerialNumber", xmlValue)
       self$lot <- foam::get_lot(self$xml,self$file)
       self$sn <- xpathSApply(self$xml, "//Cartridge//Serial", xmlValue)
       self$plate <- foam::get_plate(self$xml)
       self$temp_tolerance <- xpathSApply(self$xml,"//EnvironmentDataModifiers/TemperatureTolerance/text()",xmlValue)
       self$calibration_temp <- as.numeric(xpathSApply(
        self$xml,
        "//AssayDataSet//CalibrationStartTemperature",
        xmlValue
      ))
      self$atmospheric_pressure <-
        as.numeric(
          XML::xpathApply(
            self$xml,
            "//EnvironmentDataModifiers//AtmosphericPressure",
            XML::xmlValue
          )
        )
      self$groups <- foam::get_groups(self$xml)
      self$template <- foam::get_template(self$xml)
      self$tick_table <- foam::get_tick_table(self$xml)
      self$O2_coefs <- foam::get_O2_coefs(self$xml)
      self$pH_coefs <- foam::get_pH_coefs(self$xml)
      self$calibration <- foam::get_cal_data(self$xml)
      self$levels <- foam::get_lvls(self$xml,self$tick_table)
      self$levels$pH <- foam::calc_pH_levels(self$calibration,self$levels,self$pH_coefs$gain)$pH
      self$levels$O2 <- foam::calc_O2_levels(self$calibration,self$levels,self$O2_coefs)$O2
      self$assay <- foam::determine_assay(self$template, self$file, F, NULL)
      self$commands <-foam::get_commands(self$xml)
      self$extra_parameters <- foam::get_extra_pars(self$xml)
      self$type <- foam::get_type(self$xml,self$Inst,self$file,self$calibration)
      self$summary <- if(grepl("wet( |)qc|gain|ksv|pka",self$assay)){
        foam::analysis(self)
        }
    }
  )
)
