View(airquality)
#find the missing value
is.na(airquality)

#count the missing value
sum(is.na(airquality))
#eleminate the missing value
na.omit(airquality)

mean(airquality$Ozone,na.rm = TRUE)

#IMPUTATE THE MISSING VALUE BY MISE PACKAGE
mice package
amelia package
MisForest
#visualize the ate by package VIM
install.packages("VIM")
library(VIM)

aggr(airquality)

NROW(na.omit(airquality))

#INSTALL MICE PACKAGE
install.packages("mice")
library(mice)

airquality_imp<-mice(airquality)
airquality_imp

#view of imputated table
airquality_comp<-complete(airquality_imp)
airquality_comp

aggr(airquality_comp)

#visulize the data

par(mfrow=c(2,2))

boxplot(airquality$Ozone,main="Data with NA")

boxplot(airquality_comp$Ozone,main="Data without NA")

t.test(airquality$Ozone,airquality_comp$Ozone)

#Visualize the data
plot(density(airquality$Ozone,na.rm = TRUE
             ,main="Data with NA"))
lines(density(airquality_comp$Ozone,na.rm = TRUE),
      col="red",lty=3)

plot(density(airquality$,na.rm = TRUE
             ,main="Data with NA"))
lines(density(airquality_comp$Ozone,na.rm = TRUE),
      col="red",lty=3)

