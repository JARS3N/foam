lot_from_string <- function(strg){
 pattern <- paste0("[",paste0(foam::types(),collapse="|"),"]","[0-9|E][0-9]{4}")
 unlist(regmatches(strg, gregexpr(pattern,strg)))
}
