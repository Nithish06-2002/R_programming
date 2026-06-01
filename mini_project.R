#PROJECT GENE EXPRESSION
setwd('/Users/nithish/SAS Project Folder')

BIO_NEW<-read.csv('/Users/nithish/SAS Project Folder/Project Gene expression raw data csv file.csv')
View(BIO_NEW)

library(tidyverse)

New<-BIO_NEW %>% 
  select(2,10,11,18) %>% head()
View(New)

Gene_new<-read.csv('/Users/nithish/SAS Project Folder/Project Gene expression raw data second csv file.csv')
View(Gene_new)

New1<-BIO_NEW %>% 
  select(2,10,11,18) %>% 
  rename(tissue=characteristics_ch1) %>% 
  rename(metastasis=characteristics_ch1.1) %>% 
  mutate(tissue=gsub("tissue:","",tissue)) %>% 
  mutate(metastasis=gsub("metastasis:","" ,metastasis))
View(New1)

#Import gene data file and reshaping
data.long<-Gene_new %>% 
  rename(gene=X) %>% 
  gather(key="sample",value = "FPKM",-gene)

View(data.long)

#combain both the data set 
data.long<-data.long %>% 
  left_join(.,New1,by=c("sample"="description"))

data.long

#Description
data.long %>% group_by(gene,title) %>% 
  summarise(mean_FPKM=mean(FPKM),
            median_FPKM=median(FPKM),
            ) %>% 
  arrange(mean_FPKM)
