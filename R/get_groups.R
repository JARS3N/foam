get_groups<-function(x){
 Group <- xpathSApply(x,"//Well//GroupName",xmlValue)
 data.frame(Group=Group,Well=seq_along(Group))
}
