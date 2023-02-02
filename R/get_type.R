#get_type <- function(doc,file) {
# out <- xpathSApply(doc, "//Cartridge//Type", xmlValue)
#  if (out != "") {
#    return(toupper(out))
#  } else{
#   out<- substr(regmatches(
#      self$file,
#      gregexpr("[C|W|T|Q|B][0-9|E][0-9]{4}", self$file)
#    )[[1]], 2, 6)
#  }
#  toupper(out)
#}
get_type <- function(doc, inst, file,cal) {
  # first looks in XML
  # second infers from file string
  # third guesses from instrument number
  # failing all that,just go by wells in calibration
  first <-
    try(unlist(xpathSApply(doc, "//Cartridge//Type", xmlValue)))
  second <- try(unlist(substr(foam::lot_from_string(file), 1, 1)))
  third<-foam::guess_type_from_inst(inst)
 if (!is.null(first) & !is.na(third)) {return(first)}
 if (!identical(second,character(0)) & !is.na(third)) {return(second)}
 if(!identical(third,character(0)) & !is.na(third)){return(third)}
  n<- as.character(nrow(cal)) 
  unname(c("8"="C","24"="B","96"="W")[n])
}
