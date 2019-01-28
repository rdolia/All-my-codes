library(xlsx)
#a. Read the file in Zip format and get it into R
zipF<- "C:\\Users\\ra306656\\Documents\\AirQualityUCI.zip"
outDir<-"D:\\Rachit\\Acadgild\\ASSIGNMENTS\\Assignment10.1"
unzip(zipF,exdir=outDir)
#file saved in above outDir location.
data <- read.xlsx("AirQualityUCI.xlsx",1)
View(data)
head(data)
#b. Create Univariate for all the columns.
library(tidyr)
library(lattice)
#1for column CO.GT.
histogram(~CO.GT.,data)
densityplot(~CO.GT.,data)
qqmath(~CO.GT.,data)
bwplot(~CO.GT.,data)
#2for column PT08.S1.CO

histogram(~PT08.S1.CO.,data)
densityplot(~PT08.S1.CO.,data)
qqmath(~PT08.S1.CO.,data)
bwplot(~PT08.S1.CO.,data)
# 3for column NMHC.GT.  
histogram(~NMHC.GT.,data)
densityplot(~NMHC.GT.,data)
qqmath(~NMHC.GT.,data)
bwplot(~NMHC.GT.,data)
# 4 for column NMHC.GT.  
histogram(~NMHC.GT.,data)
densityplot(~NMHC.GT.,data)
qqmath(~NMHC.GT.,data)
bwplot(~NMHC.GT.,data)
#5for column C6H6.GT.
histogram(~C6H6.GT.,data)
densityplot(~C6H6.GT.,data)
qqmath(~C6H6.GT.,data)
bwplot(~C6H6.GT.,data)
#6for column PT08.S2.NMHC. 
histogram(~PT08.S2.NMHC. ,data)
densityplot(~PT08.S2.NMHC. ,data)
qqmath(~PT08.S2.NMHC. ,data)
bwplot(~PT08.S2.NMHC. ,data)
#7for column NOx.GT.  
histogram(~NOx.GT.,data)
densityplot(~NOx.GT.,data)
qqmath(~NOx.GT. ,data)
bwplot(~NOx.GT. ,data)
#8for column PT08.S3.NOx.   
histogram(~PT08.S3.NOx. ,data)
densityplot(~PT08.S3.NOx. ,data)
qqmath(~PT08.S3.NOx. ,data)
bwplot(~PT08.S3.NOx. ,data)
#9for column NO2.GT.    
histogram(~NO2.GT. ,data)
densityplot(~NO2.GT. ,data)
qqmath(~NO2.GT. ,data)
bwplot(~NO2.GT. ,data)
#10for column PT08.S4.NO2.     
histogram(~PT08.S4.NO2.,data)
densityplot(~PT08.S4.NO2. ,data)
qqmath(~PT08.S4.NO2.,data)
bwplot(~PT08.S4.NO2. ,data)
#11for column PT08.S5.O3.           
histogram(~PT08.S5.O3.,data)
densityplot(~PT08.S5.O3.,data)
qqmath(~PT08.S5.O3.,data)
bwplot(~PT08.S5.O3.,data)
#12for column RH           
histogram(~RH,data)
densityplot(~RH,data)
qqmath(~RH,data)
bwplot(~RH,data)
#13for column AH           
histogram(~AH,data)
densityplot(~AH,data)
qqmath(~AH,data)
bwplot(~AH,data)
 
#c. Check for missing values in all columns.

table(is.na(data$Date))
table(is.na(data$Time))
table(is.na(data$CO.GT.))
table(is.na(data$PT08.S1.CO.))
table(is.na(data$NMHC.GT.))
table(is.na(data$C6H6.GT.))
table(is.na(data$PT08.S2.NMHC.))
table(is.na(data$NOx.GT.))
table(is.na(data$PT08.S3.NOx.))
table(is.na(data$NO2.GT.))
table(is.na(data$PT08.S4.NO2.))
table(is.na(data$PT08.S5.O3.))
table(is.na(data$T))
table(is.na(data$RH))
table(is.na(data$AH))
table(is.na(data$NA.))
table(is.na(data$NA..1))
#We can see that there is NA for all variables in rows 9358 till 9471.
#Hence we will remove them from data.
data<-data[-c(9358:9471), ]
#As last 2 column are full NAs we remove them as well.
data<- data[,-c(16:17)]
#Run below commands again to see number of NAs.
table(is.na(data$Date))
table(is.na(data$Time))
table(is.na(data$CO.GT.))
table(is.na(data$PT08.S1.CO.))
table(is.na(data$NMHC.GT.))
table(is.na(data$C6H6.GT.))
table(is.na(data$PT08.S2.NMHC.))
table(is.na(data$NOx.GT.))
table(is.na(data$PT08.S3.NOx.))
table(is.na(data$NO2.GT.))
table(is.na(data$PT08.S4.NO2.))
table(is.na(data$PT08.S5.O3.))
table(is.na(data$T))
table(is.na(data$RH))
table(is.na(data$AH))
#Impute the missing values using appropriate methods
#There are no missing values anymore hence no imputation is required.
# Create bi-variate analysis for all relationships
#removing first 2 columns for bi- variate analysis
data1 <- data[-c(1,2)]
library(corrplot)
data2 <- as.matrix(data1)
corrplot(cor(data2))
#We can see higher correlations between attributes with darker and bigger circles

#Test relevant hypothesis for valid relation
colnames(data2)

cor.test(data1$PT08.S1.CO.,data1$PT08.S2.NMHC.)
#The p-value of the test is  2.2e-16, which is less than the significance level alpha = 0.05.
#We can conclude that PT08.S1.CO. and PT08.S2.NMHC. are significantly 
#correlated with a correlation coefficient of0.9331013.
#doing the same with blue to dark blue circles in the corrplot will determine 
#significance of correlation for each attribute pair.
