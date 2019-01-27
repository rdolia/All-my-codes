#hierarchical clustering
Hcluster<- read.csv(file.choose())
#dataset is target dummy in datasets folder.
Hcluster <- Hcluster[4:5]
#build dendogram
dendograms <- hclust(d = dist(Hcluster,method = 'euclidean'), method = 'ward.D')
plot(dendograms,main = paste('Dendogram'),xlab = 'Customer',ylab = 'Euclidean Distance')
#fitting clusters
clust <- hclust(dist(Hcluster,method = 'euclidean'),method = 'ward.D')
clust

y_clust <- cutree(clust,5)
library(cluster)
clusplot(Hcluster,
         y_clust,
         lines = 0,
         shade = T,
         color = T,
         labels = 3,
         plotchar = F,
         span = T,
         main  = paste("Heirarchical Clustering"))
         
    