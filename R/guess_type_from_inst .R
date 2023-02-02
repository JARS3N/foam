guess_type_from_inst <- function(inst){
  #remove leading zeros or letters
 cleaned<- gsub("^00|[A-Z]","",inst)
 #select second character after 4
 n<-substr(cleaned,2,2)
 str<-c("1"= "W","2"="B","3"="C","4"="C","5" = "W")
 unname(str[n])
}
