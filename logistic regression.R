#logistic regression
adddata<-read.csv("AdFarm.csv",1)
#removing column 1 and 2
adddata<-adddata[-c(1,2)]
#another way of removing addata<-adddata[3:5]
str(adddata)
#converting purchased into factor
adddata$Purchased<-factor(adddata$Purchased,levels = c(0,1))
str(adddata)
table(adddata$Purchased)
library(caTools)
#split data into training and test
set.seed(123)
split<-sample.split(adddata$Purchased,SplitRatio = 0.75)
train<-subset(adddata,split==T)
test<-subset(adddata,split==F)

#DATA Normalisation/feature scaling salary not lined to age necessarily
train[-3]<- scale(train[-3])
test[-3] <- scale(test[-3])

#model building glm used for logistic regression
classifier<-glm(formula = Purchased~.,family = binomial(),data = train)
summary(classifier)

#probablity of purchase
prob_pred <- predict(classifier,type = 'response',newdata = test[-3])

#if prob is higher than 0. 5 consider that as purchased = yes
y_pred<-ifelse(prob_pred>0.5,1,0)


#evaluation of model

#confusion matrix
cm<-table(test[,3],y_pred>0.5)

#actual 0 and predicted 0 is 57. actual 1 and predicted 1 is 26 hence accuracy % is 83 %

#principal component analysis
#used for dimensionality reduction we do feature extraction
