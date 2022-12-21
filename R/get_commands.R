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
as.data.frame(lapply(inputs,function(u){xpathSApply(doc, u, xmlValue)}))
}
