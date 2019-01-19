#PCA
Winedata <- read.csv(file.choose())
library(caTools)
set.seed(123)
split<- sample.split(Winedata$Customer_Segment,SplitRatio = 0.8)
train <- subset(Winedata,split==T)
test  <-subset(Winedata,split==F)
View(train)
#feature scaling for all independant variables. not on dependant variable.
train[-14] <- scale(train[-14])
test[-14 <- scale(test[-14])]
install.packages("caret")
install.packages("e1071")
library(caret)
library(e1071)
#choosing pca. each pca column is derived from all independant columns.
pca <- preProcess(x=train[-14],method = 'pca',pcaComp = 2)
train <- predict(pca,train)
#move dependant variable to last col
train <- train[c(2,3,1)]

test  <- predict(pca,test)
test  <- test[c(2,3,1)]

#build model
classifier <- svm(formula= Customer_Segment ~ .,data = train, type = 'C-classification', kernel = 'linear')
#Predictions on customer segment 
ypred <- predict(classifier,newdata = test[-3])
#confusion matrix to evaluate model
cm<- table(test[,3],ypred)
cm
