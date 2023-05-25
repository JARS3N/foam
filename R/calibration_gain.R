calibration_gain<-function(doc,analyte){
path<-"//Item[Key='%var%']//Value//AnalyteCalibration//GainValues//ArrayOfInt//int"
alt<-gsub("%var%",analyte,path)
as.integer((xpathSApply(doc,alt,xmlValue)))
}
