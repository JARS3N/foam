xml<- function(file) {
require(XML)
  if (test_if_zippped(file)) {
    name <- grep("ASSAYDATA", unzip(file, list = T)$Name, value = T)
    out <- XML::xmlTreeParse(unzip(file, name), useInternalNodes = T)
    unlink(name)
  } else{
    out <- XML::xmlTreeParse(file, useInternalNodes = T)
  }
  return(out)
}
