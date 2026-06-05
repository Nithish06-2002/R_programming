#Project DM report

library(tidyverse)

setwd('/Users/nithish/CR + SAS COURSE METERIALS')

df<-read.csv("Project Clinical report csv raw data file.csv",stringsAsFactors = TRUE)
View(df)

install.packages("r2rtf")
library(r2rtf)

cnts<-df %>% 
  group_by(trtcd) %>% 
  summarise(n=n())
cnts

cnt_pbo<-cnts$n[1]
cnt_5mg<-cnts$n[2]
cnt_10mg<-cnts$n[3]
cnt_50<-cnts$n[4]

Sex_sum<-df %>% 
  group_by(trtcd,Sex) %>% 
  summarise(n=n(),.groups = "drop") %>% 
  pivot_wider(id_cols = Sex,names_from = trtcd,values_from = n) %>% 
  mutate(total= `1`+`2`+`3`+`4`,
         pct_1=(`1`/cnt_pbo)*100,
         pct_2=(`2`/cnt_5mg)*100,
         pct_3=(`3`/cnt_10mg)*100,
         pct_4=(`4`/cnt_50)*100,
         pct_tot=(`1`+`2`+`3`+`4`)/sum(cnts$n)*100) %>% 
  mutate(c_pct_1=formatC(pct_1,format="f",digits=1),
         c_pct_2=formatC(pct_2,format="f",digits=1),
         c_pct_3=formatC(pct_3,format="f",digits=1),
         c_pct_4=formatC(pct_4,format="f",digits=1),
         c_pct_tot=formatC(pct_tot,format="f",digits=1)) %>% 
  mutate(
    fmt_1 = paste0(`1`, "(", c_pct_1, "%)"),
    fmt_2 = paste0(`2`, "(", c_pct_2, "%)"),
    fmt_3 = paste0(`3`, "(", c_pct_3, "%)"),
    fmt_4 = paste0(`4`, "(", c_pct_4, "%)"),
    fmt_tot = paste0(total, "(", c_pct_tot, "%)"),
    stats= c("n(%)")) %>% 
  select(Sex,stats,fmt_1,fmt_2,fmt_3,fmt_4,fmt_tot)

View(Sex_sum)

firstrow<-data.frame(Sex="Sex",stats="",fmt_1="",fmt_2="",fmt_3="",
                     fmt_4="",fmt_tot="")
firstrow

Sex_sum$Sex<-paste("",Sex_sum$Sex)
Sex_sum

cnt_all<-rbind.data.frame(firstrow,Sex_sum)
View(cnt_all)

library(r2rtf)

#report part
cnt_all %>% 
  rtf_page(orientation = "landscape",
           border_first = "single",
           border_last = "single") %>% 
  rtf_title(title = "Table 13.1.2",
            subtitle = c("Demographic characteristics",
                         "full Analysis"),
            text_justification = "c",
            text_font_size = 8) %>%
  rtf_colheader(colheader = "Characteristics | statistics |place|
                XYZ 5mg |XYZ 10mg | XYZ 50mg | Total",
                col_rel_width = c(7,4,3,3,3,3,3),
                text_justification = c("1","1","c","c","c","c","c"),
                border_top = rep("",7),
                border_right = rep("",7),
                border_top=rep("",7))%>% 
  rtf_colheader(colheader = paste0("| | N=",cnt_pbo,"| N=",cnt_5mg,
                                   "| N=",cnt_10mg,"| N=",cnt_50,
                                   "| N=",cnt_pbo+cnt_5mg+cnt_10mg+cnt_50),
                col_rel_width = c(7,4,3,3,3,3,3),
                border_top = rep("",7),
                border_right=rep("",7),
                border_left=rep("",7)) %>% 
  rtf_body(as_colheader = F,
           col_rel_width = c(7,4,3,3,3,3,3),
           border_first = rep("single",7),
           border_last = rep("single",7),
           border_right = rep("single",7),
           border_left = rep("single",7),
           text_justification = c("l","l","c","c","c","c","c"),
           text_font_size = 8,
           last_row = F) %>% 
  rtf_footnote(footnote = c("Source:listings 16.2.4.1 and 16.2.4.3",
                            "Note:The percentages and based on the xxx Analysisset"),
               border_left = "",
               border_right = "",
               border_bottom = "",
               text_font_size = 7) %>% 
               write_rtf("table.rtf")
View(cnt_all)            
              
file.info("table.rtf")
args(write_rtf)

file.info("table.rtf")
class(tmp)
exists("cnt_50")
dim(cnt_all)

