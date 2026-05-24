
# Merging data

library(tidyverse)

sex<-tribble(
  ~Name,~Sex,
  "Nithish","M",
  "Veadamurthy","M",
  "Manogna","F"
)

adw<-tribble(
  ~Name,~Age,~Height,~Weight,
  "Nithish",14,21,153,
  "Veadamurthy",12,21,123,
  "Gayana",23,34,134,
)

full<-full_join(sex,adw,by="Name")
full
inner<-inner_join(sex,adw,by="Name")
inner
left<-left_join(sex,adw,by="Name")
left
right<-right_join(sex,adw,by="Name")
right


