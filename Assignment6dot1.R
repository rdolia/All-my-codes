
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
  titanicdf$family[i]<- strsplit(titanicdf$name, ",")[[i]][1]
  }
View(titanicdf$family)

#Count the frequency of common names in family column.
 library(plyr)
family_frequency<- count(titanicdf,"family")
barplot(family_frequency$freq)

#b. Represent the proportion of people survived by family size
#using a graph.
library(sqldf)

survived<- sqldf("SELECT * 
      FROM titanicdf 
      WHERE survived = '1'") 
survived_family_freq <- count(survived$family)
barplot(survived_family_freq$freq)

#c. Impute the missing values in Age variable using Mice library,
#create two different graphs showing Age distribution before
#and after imputation

#Check the data for missing values for column Age
sapply(titanicdf, function(x) sum(is.na(x)))
str(titanicdf)

library(mice)
init = mice(titanicdf, maxit=0) 
meth = init$method
predM = init$predictorMatrix
meth[c(titanicdf$age)]="norm" 
