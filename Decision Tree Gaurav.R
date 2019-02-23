mydata<-read.csv(file.choose())
mydata$NSPF <- as.factor(mydata$NSP)
#partition data
set.seed(123)
pd<-sample(2,nrow(mydata),replace = T,prob=c(0.8,0.2))
pd
train<- mydata[pd==1,]
test<-mydata[pd==2,]
#install.packages('party')
library(party)
mytree<- ctree(NSPF~LB+AC+FM,data = train)
plot(mytree)
#pruning
mytree<- ctree(NSPF~LB+AC+FM,data = train,controls = ctree_control(mincriterion = 0.9,minsplit= 200))
#minsplit  - is the splitting criteria to create new split. if less than 
#that then wont split.
plot(mytree,type='simple')
predict(mytree,test)
#CONFUSION MATRIX
table<- table(predict(mytree,test),test$NSPF)
