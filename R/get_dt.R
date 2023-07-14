get_dt<-function(xml){
require(hms)
require(lubridate)
dt<-foam::get_last_run(xml)
  tibble(
    date_time=lubridate::ymd_hms(dt,tz="EST5EDT"),
       hms = hms::as_hms(date_time),
       date = lubridate::date(date_time)
    )
  }
