
Custdata <- read.csv(file.choose())
Custdata <- Custdata[4:5]
set.seed(123)
#calculating optimal number of clusters
wcss =  vector()
for (i in 1:10) 
  wcss[i]= sum(kmeans(Custdata,i)$withinss)
plot(1:10, wcss, type = 'b',main = paste('Elbow Curve '))
# Value of k - number of clusters is 5 as per the curve.

set.seed(112)
kmeans = kmeans(x = Custdata, centers = 5)
yKmeans <- kmeans$cluster
#ykmeans shows which data is assigned to which cluster.
install.packages('cluster')
library(cluster)
clusplot(Custdata, yKmeans, lines = 0, shade = T,color = T,labels = 2,plotchar = F,span = T,main = paste('Cluster of Customers'),xlab = 'Annual Income',ylab = 'Spending Score')