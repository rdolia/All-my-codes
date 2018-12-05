
path2data<-file.path(file.choose())
path2data
library(xlsx)
ZCOP <- read.xlsx("D:/Rachit/Tracker.xlsx",3)
View(ZCOP)
library(sqldf)
#modify this to do searches.
sqldf("SELECT * 
      FROM ZCOP 
      WHERE `EMP_CODE` = '182310'")

sqldf("SELECT `EMP_NAME` 
      FROM ZCOP 
      WHERE `EMP_CODE` = '306656'")

View(ZCOP)
