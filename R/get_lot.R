get_lot <- function(doc,file) {
  out <- xpathSApply(doc, "//Cartridge//Lot", xmlValue)
  if (out != "") {
    return(out)
  } else{
    substr(regmatches(
      file,
      gregexpr("[C|W|T|Q|B][0-9|E][0-9]{4}", file)
    )[[1]], 1, 1)
  }
}
