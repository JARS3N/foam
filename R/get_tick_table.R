get_tick_table <- function(doc) {
  start = as.numeric(xpathSApply(doc, "//AssayDataSet//RateSpans//StartTickIndex", xmlValue))
  end =  as.numeric(xpathSApply(doc, "//AssayDataSet//RateSpans//EndTickIndex", xmlValue))
  do.call('rbind',
          Map(
            function(x, y, z) {
              data.frame(Tick = seq(from = x,
                                    to = y,
                                    by = 1), Measure = z)
            },
            x = start,
            y = end,
            z = seq_along(start)
          ))
}
