#KNN
#DATA IS ADFARM
data <- read.csv(file.choose())
data <- data[3:5]
str(data)
data$Purchased <- as.factor(data$Purchased)
str(data)
library(caTools)
set.seed(123)
split <- sample.split(data$Purchased,SplitRatio = 0.7)
train_data <- subset(data,split == T)
test_data <- subset(data,split==F)
#Normalisation or feature scaling. dependant variable not to be scaled.
train_data[-3] <- scale(train_data[-3])
test_data[-3]  <- scale(test_data[-3])
install.packages('class')
library(class)

y_pred <- knn(train = train_data[,-3],
              test = test_data[,-3],
              cl = train_data[,-3],
              k = 5,
              prob = T)

#then build confusion matrix
cm <- table(test_data[,-3],y_pred)