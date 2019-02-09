data <- airquality
data[4:10,3] <- rep(NA,7)
data[1:5,4] <- NA


#removing columns 5 and 6 from the dataset data.
data <- data[-c(5,6)]
#summary data displays number of NAs.
summary(data)

#We therefore check for features (columns) and samples (rows) where more
#than 5% of the data is missing using a simple function

#creating a function for % Calculation
pMiss <- function(x){sum(is.na(x))/length(x)*100}
apply(data,2,pMiss)
apply(data,1,pMiss)

library(mice)
#The mice package provides a nice function md.pattern() 
#to get a better understanding of the pattern of missing data
md.pattern(data)
#The output tells us that 104 samples are complete, 34 samples miss only 
#the Ozone measurement,
#4 samples miss only the Solar.R value and so on.

#running the mice function
tempData <- mice(data,m=5,maxit=50,meth='pmm',seed=500)
summary(tempData)

#check for imputed data in a field
tempData$imp$Ozone

#check imputation method
tempData$meth
#Now we can get back the completed dataset using the complete() function.

completedData <- complete(tempData,1)
md.pattern(completedData)
