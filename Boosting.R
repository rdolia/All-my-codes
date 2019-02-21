#Boosting Algorithm
library(xgboost)
library(magrittr)
library(Matrix)
library(dplyr)

#Data

Appdata <- read.csv(file.choose(),header=T)
str(Appdata)
Appdata$rank <- as.factor(Appdata$rank)

#Partitioning
set.seed(1234)
index <- sample(2,nrow(Appdata),replace = T,prob = c(0.8,0.2))
train <- Appdata[index == 1,]
test <- Appdata[index == 2,]
library(Matrix)
#Creating Matrixes
trainm <- sparse.model.matrix(admit ~ .-1,data = train)
head(trainm)
train_label <- train[,"admit"]
train_matrix <- xgb.DMatrix(data = as.matrix(trainm),label = train_label)

testm <- sparse.model.matrix(admit~.-1,data = test)
test_label <- test[,"admit"]
test_matrix <- xgb.DMatrix(data = as.matrix(testm),label = test_label)

#Additionl parameters
nc <- length(unique(train_label))
xgb_params <- list("objective"="multi:softprob",
                   "eval_metric" = "mlogloss",
                   "num_class"= nc)
watchlist <- list(train = train_matrix,test = test_matrix)

#eXtreme Gradient Boosting Model

Bst_model <- xgb.train(params = xgb_params,
                         data = train_matrix,
                         nrounds = 1000,
                         watchlist = watchlist,
                       eta = 0.001,max.depth = 3,
                       gamma = 0,
                       subsample = 1,
                       colsample_bytree = 1,
                       missing = NA,
                       seed = 333)
#by defaukt eta =.3

#test and Training error plot
e<- data.frame(Bst_model$evaluation_log)
plot(e$iter,e$train_mlogloss,col = 'blue')
lines(e$iter,e$test_mlogloss,col = 'red')

min(e$test_mlogloss)
e[e$test_mlogloss ==   0.62571,]

#Feature importance
imp <- xgb.importance(colnames(train_matrix),model = Bst_model)
xgb.plot.importance(imp)

#Prediction and accuracy
p <- predict(Bst_model,newdata = test_matrix)
pred <- matrix(p,nrow = nc,ncol = length(p)/nc)%>%t()%>%data.frame()%>%
  mutate(label = test_label,max_prob = max.col(.,"last")-1)
table(Prediction = pred$max_prob,Actual = pred$label)
