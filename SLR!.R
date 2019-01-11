#Simole Linear Regresssion
dataset <- read.csv(file.choose())
install.packages("caTools")
library(caTools)
set.seed(123)
split <- sample.split(dataset$Sales,SplitRatio =2/3)
trainingdata <- subset(dataset,split == T)
testdata <- subset(dataset,split == F)
#Fit the Simple Linear regression model into the training data

regressor <- lm(formula = Sales ~ TV,data = trainingdata)
summary(regressor)
pred_value <- predict(regressor, newdata = testdata)
library(ggplot2)
ggplot()+ geom_point(aes(x=testdata$TV,y = testdata$Sales),colour = 'red')+
  geom_line(aes(x = trainingdata$TV,y =predict(regressor, newdata = trainingdata)),
            colour = 'blue') + 
  ggtitle('TV vs Sales')+
  xlab("TV Spend")+
  ylab('Sales')