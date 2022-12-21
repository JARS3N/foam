# test <-foam$new('test.xflr')
#
# <Residues>
#   <Residue>
#
#  X<- xpathApply(test$xml, "//Residue")
#
#  gets <- function(k){
#  names <-XML::names.XMLNode(X[[1]])
#  lapply(names,FUN=xpathApply,doc=X[[1]],path=paste0("//",names))
#  }
#
#
#  as.data.frame(setNames(
#  lapply(names,function(k){
#  unlist(sapply(X,function(u){
#  strsplit(xpathSApply(u,path=k,xmlValue),split=" ")}))}),
#  names))
#
#
#
