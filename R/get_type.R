get_type <- function(doc,file) {
  out <- xpathSApply(doc, "//Cartridge//Type", xmlValue)
  if (out != "") {
    return(toupper(out))
  } else{
   out<- substr(regmatches(
      self$file,
      gregexpr("[C|W|T|Q|B][0-9|E][0-9]{4}", self$file)
    )[[1]], 2, 6)
  }
  toupper(out)
}
