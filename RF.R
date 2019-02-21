#Random Forest Classification

Dt <- read.csv(file.choose())
View(Dt)
Dt <- Dt[3:5]
str(Dt)
Dt$Purchased<-factor(Dt$Purchased,levels = c(0,1)) 

#building training and test data

set.seed(123)
library(caTools)
split = sample.split(Dt$Purchased,SplitRatio = .80)
traindata <-subset(Dt,split == T)
testdata <- subset(Dt,split == F)

#Data Normalisation
traindata[-3]<- scale(traindata[-3])
testdata[-3]<- scale(testdata[-3])
#Fitting Random Forest to the training data
library(randomForest)
set.seed(123)
RFClassifier <- randomForest(x = traindata[-3],y=traindata$Purchased,ntree = 500)

#Predicting the testdata results
RFPred <- predict(RFClassifier,newdata = testdata[-3] )
RFPred
#Model Evaluation
cm = table(testdata[,3],RFPred)
cm

plot(RFClassifier)
