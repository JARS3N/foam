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
get_type <- function(doc, inst, file) {
  first <-
    try(unlist(xpathSApply(doc, "//Cartridge//Type", xmlValue)))
  second <- try(unlist(substr(lot_from_string(file), 1, 1)))
  if (!is.null(first)) {
    return(first)
  } else{
    if (!is.null(second)) {
      return(second)
    } else{
      return(guess_type_from_inst(inst))
    }
  }
}
