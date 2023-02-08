cell_count_vecs<-function(string,pattern){
require(dplyr)
  pat<-gsub("X",pattern,"<X>(.*)</X>")
  unlist(regmatches(
    string,gregexpr(pat,string))) %>%
    gsub(paste0("<[/]{0,1}",pattern,">|\n"), "", .) %>%
    trimws(.) %>%
    {regmatches(.,gregexpr("<(double|int)>[0-9]+</(double|int)>", .))} %>%
    unlist() %>%
    gsub("<[/]{0,1}(double|int)>", "", .) %>%
    as.numeric()
}
