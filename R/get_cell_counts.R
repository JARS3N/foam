get_cell_counts <- function(doc) {
  SessionData <- xpathSApply(doc, "//SessionData", xmlValue)
  vals <- regmatches(SessionData,
                     gregexpr("<double>[0-9]+</double>", SessionData))[[1]]
  num_vals <- as.numeric(gsub("<double>|</double>", "", vals))
  n <- length(num_vals) / 2 
  data.frame(
    Well = plates::plate(n)$Wells,
    Norm_count = num_vals[1:n],
    Raw_count = num_vals[(n + 1):(n * 2)]
  )
}
