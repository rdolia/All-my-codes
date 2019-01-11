#Multiple Linear Regression

dataset <- read.csv(file.choose())
View(dataset)

dataset$State <- factor(dataset$State,
                        levels = c('New York','California','Florida'),
                        labels = c(1,2,3))
#splitting
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit,SplitRatio = 0.75)
traindata = subset(dataset,split == T)
testdata = subset(dataset,split == F)
#Model Building
regressor = lm(formula = Profit ~ .,data = traindata)
summary(regressor)
Profit_predicted = predict(regressor,newdata =testdata)
Profit_predicted
