get_cell_counts <- function(doc) {
  SessionData <- xpathSApply(doc, "//SessionData", xmlValue)
  tibble(
    Norm_count = foam::cell_count_vecs(SessionData,"NormaliztionValues"),
    Raw_count = foam::cell_count_vecs(SessionData,"RawCellCounts"),
    Well = plates::num_to_well(seq_along(Raw_count),length(Raw_count))
  )
}
