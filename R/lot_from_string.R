lot_from_string <- function(strg){
 pattern <- "[C|W|B][0-9|E][0-9]{4}"
 unlist(regmatches(strg, gregexpr(pattern,strg)))
}
