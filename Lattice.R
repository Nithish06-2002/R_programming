#Lattice Package
Syntax:graph_type(formula,data)
graph_type: represents types of graphics.off
formula: specifies the variable or conditional variable

#Load the library
install.packages("lattice")
library(lattice)

#Scatter plot
View(iris)

xyplot(Sepal.Length~Petal.Length,data=iris)

xyplot(Sepal.Length~Petal.Length,data=iris,
       groups = Species,
       auto.key = TRUE)

# |= represents the classification of a categorical variable or a group of variables
# distribute the point in column-wise
xyplot(Sepal.Length~Petal.Length|Species,
       groups = Species,
       data=iris,
       type=c("p","smooth"),
       scales = "free")

#3D Scatter plot

cloud(Sepal.Length~Sepal.Length*Petal.Width,data=iris,
      group=Species,auto.key = TRUE)

#Boxplots
View(ToothGrowth)
bwplot(len~dose,data=ToothGrowth,xlab="Dose",ylab="Lenght")

ToothGrowth$dose<-as.factor(ToothGrowth$dose)

#Example
bwplot(len~supp|dose,ToothGrowth,layout=c(3,1),
       xlab="Dose",ylab="Length")


#Dotplots
dotplot(len~dose,data=ToothGrowth,xlab="Dose",ylab="Length")

dotplot(len~supp|dose,
        data = ToothGrowth,
        layout=c(3,1),
        xlab="dose",ylab="Lenght")

#Strip plot
stripplot(len~dose,data=ToothGrowth,jitter.point=TRUE,
          pct=19,xlab="Dose",ylab="Lenght")

stripplot(len~supp|dose,data=ToothGrowth,jitter.point=TRUE,
          pct=19,xlab="Dose",ylab="Lenght",layout=c(3,1))
