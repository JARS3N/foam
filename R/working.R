# x<-list.files(pattern='asyr$')
# library(foam)
# t1 <- foam$new("W19922_150_GAIN_30K_072022_201431C.asyr")
# t2 <- foam$new("W19922_75_KSV_12.5K_072022_201431C.asyr")
# t3 <- foam$new("C18022_300_WETQC_070122_430029.asyr")
# f5 <- "C:/Users/arsenaul/Desktop/Products_tests_etc/XFPro_MR/082422_04_450135_MR.xflr"
# t5 <- foam$new(f5)
#
# #lvls, pH_target, cal
# identical(
# calc_gain_b(t1$levels,t1$pH_coefs$target,t1$calibration)[1],
# calc_gain_a(t1$levels,t1$pH_coefs$target,t1$calibration)[1])
#
# b<-calc_gain_b(t1$levels,t1$pH_coefs$target,t1$calibration)
# a<-calc_gain_a(t1$levels,t1$pH_coefs$target,t1$calibration)
# #############
#
# calc_ksv(t2$levels, t2$O2_coefs$co, t2$calibration)
# calc_ksv_b(t2$levels,t2$O2_coefs$co,t2$calibration)
#
# ##########
#
# library(ggplot2)
# ggplot(t2$levels,aes(Tick,O2))+
#   geom_line(aes(group=Well))
