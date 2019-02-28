install.packages('MASS')
library(MASS)
head(Pima.tr)
head(Pima.te)
train <- Pima.tr
test <- Pima.te

#converting yes no into 0 and 1 factor.
library(plyr)
train$type <- revalue(train$type, c("Yes"=1))
train$type <- revalue(train$type, c("No"=0))
str(train)
test$type <- revalue(test$type, c("Yes"=1))
test$type <- revalue(test$type, c("No"=0))
str(test)

pairs(train, colors = train$type)
plot(train$age,train$type)

library(ggplot2)
ggplot(train, aes(x=train$age, y=train$bp, color=train$type)) + geom_point()


library(caTools)

#model building glm used for logistic regression
classifier<-glm(formula = train$type~ train$age+train$bmi,family = binomial(),data = train)
summary(classifier)


#probablity of diabetes
test<-test[1:200,]
prob_pred <- predict(classifier,type = 'response',newdata = test[-8])
#if prob is higher than 0. 5 consider that as diabetic = yes
y_pred<-ifelse(prob_pred>0.5,1,0)

#What does the model fitted in exercise 3 predict in terms
#of probability for someone age 35 with bmi of 32, what about bmi of 22?

check<- predict(classifier, type = "response",newdata = data.frame(bmi = c(32, 22), age = 35))
#confusion matrix
cm<-table(test[,8],y_pred>0.5)
cm

# Prediction accuracy
sum(diag(cm)) / sum(cm) 

