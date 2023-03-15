get_commands<-function(doc){
## still need to deal with ugly datetimes
com <-"CommandHistory"
vars <-c("InstructionName",
          "CommandName",
          "CommandIndex",
          "StartTime",
          "EndTime",
          "CompletionStatus"
          )
inputs<-setNames(paste("",com, com, vars, sep = "//"), vars)
 vals<- lapply(inputs,function(u){xpathSApply(doc, u, xmlValue)})
 vals$InstructionName[which(vals$InstructionName=="")]<-"missing"
 len<-c(length(vals$InstructionName),length(vals$CommandIndex))
 len_diff <-diff(len)
 if(len_diff>0){
   vals$InstructionName<-append(vals$InstructionName,rep("missing",len_diff))
   }
  as.data.frame(vals)
}
