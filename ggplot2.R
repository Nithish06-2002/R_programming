#GGPLOT: GRAMMER OF GRAPHICS
PACKAGE OF advanced data visualization
It is the most powerful visualization#Seven layers of GGPLOT2
1]Data: Datasetname
2]Aesthetics: It is used to map into the aesthetic attributes
3]Geometric: How the data begins displayed USJudgeRatingspoints, line, histogram,bar, boxplot
4]Facets: Display the subset of data using columns & rows
4]Statistics: Binning, smoothing, descriptive, intermediate
6]Coordinate: Space b/w data and display using Cartesian
fixed polar limit
7]Them: It provides the color of the background


#General syntax of ggplot2

library(ggplot2)

ggplot(data = dataset,
       aes(x = variable1,
           y = variable2)) +
  
  geom_XXXX()


data("iris")

ggplot(data = iris,mapping = aes(x=Sepal.Length,y=Sepal.Width),xlab="seplength",
       ylab="sepalwidth",label="nithi")

#1]Data: Datasetname
View(mtcars)
ggplot(data = mtcars,aes(x=hp,y=mpg,col="red"))+
  labs(title = "MTCars Data PLot")

#2]Aesthetics
ggplot(data=mtcars,aes(x=hp,y=mpg,col="red"))+
  geom_point()+
  labs(title="Miles per Gallons Horse power",
       x="Horsepower",
       y="Miles per gallon")

#size

ggplot(data=mtcars,aes(x=hp,y=mpg,size = disp))+
  geom_point()+
  labs(title="Miles per Gallons Horse power",
       x="Horsepower",
       y="Miles per gallon")

#Adding shapes and colours
ggplot(data=mtcars,aes(x=hp,y=mpg,col=factor(cyl),
                       shape = factor(am)))+geom_point()+
  labs(title="Miles per Gallons Horse power",
       x="Horsepower",
       y="Miles per gallon")

View(mtcars)


#Example
ggplot(data=class,aes(x=Height,y=Weight,col=factor(Sex),
                      shape=factor(Age)))+geom_point()+
  labs(title = "Class graph",
       x="Height",
       y="Weight")
