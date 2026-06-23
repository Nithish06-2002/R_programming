#Project Demographic summary table

setwd('/Users/nithish/CR + SAS COURSE METERIALS')

library(tidyverse)
library(readxl)

demo<-read_excel('/Users/nithish/CR + SAS COURSE METERIALS/Project DM summary table Raw data.xlsx')
View(demo)

print(str(DEMO))

demo1<-demo %>% mutate(age_num=as.numeric(AGECAL_YRS),
                       wgt_num=as.numeric(WGHT_KG),
                       hgt_num=as.numeric(HIGHT_CM))

View(demo1)

install.packages("table1")
library(table1)
label(demo1$age_num)<-"Age"
units(demo1$age_num)<-"Years"
label(demo1$wgt_num)<-"Weight"
label(demo1$hgt_num)<-"Height"

Categorical variable:Count and percentage
Numerical variable:Mean SD Median Min max()

DM<-table1(~SEX+RACE+age_num+wgt_num+hgt_num|TRT,data=demo1)
DM

#plot the graph
plot(x=demo1$age_num,y=demo1$wgt_num,
     type = "o",xlab="Age(years)",ylab = "weight(Kg)",main="Age vs weight")
