calc_ksv<-function(lvls,ppo2,cal){
select(lvls,Tick,Well,Measure,O2_CorrectedEmission) %>%
  group_by(Well,Measure) %>%
  filter(Tick>(max(Tick)-3)) %>%
  summarise(ox =mean(O2_CorrectedEmission),.groups = 'drop') %>%
  mutate(Measure = c("Ambient","F0")[Measure]) %>%
  tidyr::spread(.,Measure,ox) %>%
  mutate(KSV = ((F0/Ambient)-1)/ppo2) %>%
  left_join(.,cal,by = c("Well", "F0"))%>%
  mutate(Gain=NA,sorpH=NA)
}


