#Simple Linear Regression
dataset<- read.csv(file.choose())
View(dataset)
installed.packages("caTools")
library(caTools)
set.seed(123)
split<-sample.split(dataset$Sales,SplitRatio = 2/3)
trainingdata<-subset(dataset,split ==T)
testdata<-subset(dataset,split==F)
#Fit the simple linear regresssion model into training data
regressor<-lm(formula = Sales~TV,data = trainingdata)
summary(regressor)
pred_value<-predict(regressor,newdata = testdata)
library(ggplot2)
ggplot()+geom_point(aes(x=trainingdata$TV,y=trainingdata$Sales),colour='red')+
  geom_line(aes(x=trainingdata$TV,y=predict(regressor,newdata = trainingdata)),
            colour='blue') + xlab("TV Spend")+ ylab("Sales") +ggtitle("TV vs Sales")