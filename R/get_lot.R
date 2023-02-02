get_lot <- function(doc,file) {
  expected <- unlist(xpathSApply(doc, "//Cartridge//Lot", xmlValue))
  from_file <- unlist(foam::lot_from_string(file))
  if (! is.null(expected)){return(expected)}
  if (! identical(from_file,character(0))){return(from_file)}
  "UNKNWN" #otherwise known
}
