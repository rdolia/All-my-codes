
#Perform the below operations:
#  a. Pre-process the passenger names to come up with a list of
#titles that represent families and represent using appropriate
#visualization graph.

#Importing the titanic dataset into R
library(xlsx)
titanicdf<-read.xlsx("titanic3.xls",1)
#Converting the name column to char
titanicdf$name<-as.character(titanicdf$name)

#Extracting the family name (first name) and adding it to a new column family
for (i in seq (1:1309)) {
  titanicdf$family[i]<- strsplit(titanicdf$name, " ")[[i]][1]
  }
View(titanicdf$family)

#Count the frequency of common names in family column.