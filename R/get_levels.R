get_lvls <- function(doc,TICKS) {
paths<-list()
  xpull <-function(doc,xpath){xpathApply(doc, xpath, function(u)
  {xmlSApply(u, xmlValue)})}

  paths$timestamp <- "//Item[Key='pH']//Value//AnalyteDataSet//TimeStamp"
  TICKS$timestamp <-unlist(xpull(doc,paths$timestamp),use.names = F)
  gen_path<-"//Item[Key='@']//Value//AnalyteDataSet//CorrectedEmissionValues"
  paths$analyte <- lapply(list(pH="pH",O2="O2"),gsub,pattern="@",x=gen_path)

  bind_df <- function(x, y, z) {
    data.frame(
      pH_CorrectedEmission = x,
      O2_CorrectedEmission = y,
      Tick = z,
      Well = seq_along(x)
    )}

  Map(
    bind_df,
    x = lapply(xpull(doc, paths$analyte$pH), as.numeric),
    y = lapply(xpull(doc, paths$analyte$O2), as.numeric),
    z = TICKS$Tick
  ) %>%
    dplyr::bind_rows() %>%
    suppressMessages(dplyr::left_join(., TICKS))
}
