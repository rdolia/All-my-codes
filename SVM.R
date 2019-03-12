#svm

data(iris)
str(iris)
library(ggplot2)
qplot(Petal.Length,Petal.Width,data = iris,color=Species)
install.packages('e1071')
library(e1071)
Classifier <- svm(Species~.,data = iris)
summary(Classifier)

plot(Classifier,data = iris, Petal.Length~Petal.Width,slice = list(Sepal.Length= 3,Sepal.Width = 3))
     