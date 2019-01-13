library(factoextra)
data("decathlon2")
View(decathlon2)
decathlon2.active<-decathlon2[1:23,1:10]
res.pca<-prcomp(decathlon2.active,scale. = T)
View(res.pca)
summary(res.pca)
#first 6 columns are giving us 91 % of variance. so we dont need to take more.
fviz_eig(res.pca)
#Eigen values

eig.val <-get_eigenvalue(res.pca)
eig.val
