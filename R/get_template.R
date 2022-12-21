get_template = function(doc) {
  usrtemplate <- xpathSApply(doc, path = "//IsUserTemplate", xmlValue)
  if (usrtemplate == 'false') {
    NA
  } else{
    basename(xpathSApply(doc, path = "//AssayTemplate", xmlValue))
  }
}
