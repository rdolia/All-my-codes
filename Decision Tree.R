#Decision Trees

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

install.packages("rpart")
library(rpart)
DtClassifier <- rpart(formula = Purchased~.,data = traindata)

#Predicting using the model
Ypredicted <- predict(DtClassifier,newdata = testdata[-3],type = 'class')

cm <- table(testdata[,3],Ypredicted)
cm
 plot(DtClassifier)
 text(DtClassifier)
 