library(tidyverse)

class<-tribble(
  ~Name,~Sex,~Age,~Height,~Weight,
  "Alfred","M",14,69,112.5,
  "Alice","F",13,56.5,84,
  "Barbara","F",13,65.3,98,
)
class

class1<-data.frame(
  Name = c("Alfred","Alice","Barbara"),
  Sex = c("M","F","F"),
  Age = c(14,13,13),
  Height = c(69,56.5,65.3),
  Weight = c(112.5,84,98)
)
str(class1)

new_class<-
  filter(class,Sex =="M" | Age == 13)

new_class1<-filter(
  filter(class1,Sex == "M" & Age %in% c(14,13) )
)

new_class1

subset<-select(class,Name,Sex)
subset

subset1<-select(class,-Name,Sex)
subset1

subset2<-select(class,-starts_with(c("H","W")))
subset2


males<-class %>% 
  filter(Sex == "M") %>% 
  select(-Sex)
males


# renamed

renamed<-rename(class,Age_years=Age,Height_in=Height)
renamed

re<-rename(renamed,Age_nith=Age_years,Height_nithi=Height_in)
re

dm<-tribble(
  ~USUBJID,~DOMAIN,~SITEID,~Age,
  "ABC-001","DM",010,21,
  "DSA-002","DM",403,24,
  "SDA-003","DM",213,32,
  "SDA-004","DM",211,62,
)
dm

dm1<-dm %>% 
  mutate(
    AGEMON = Age*12,
    GROUP = 1
  )
dm1

dm3 <- dm %>% 
  mutate(
    agegr1 = case_when(
      Age < 20 ~ "<20 Years",
      between(Age, 20, 25) ~ "20-25 Years",
      Age > 25 ~ ">25 Years"
    )
  )

dm3

male<-tribble(
  ~Name,~Sex,~Age,
  "nithi","m",21,
  "veda","m",32,
)

female<-tribble(
  ~Name,~Sex,~Age,
  "gagana","f",22,
  "gayana","f",32,
)

final<-bind_rows(male,female)
final

final1<-bind_cols(male,female)
final1

