get_extra_pars <- function(xml) {
  A <-
    as.list(as.numeric(xmlValue(
      getNodeSet(xml, "//ExtraParameters//ExtraParameterInfo//Value")
    )))
  B <-
    xmlValue(getNodeSet(xml, "//ExtraParameters//ExtraParameterInfo//Name"))
  setNames(A,B)
}
