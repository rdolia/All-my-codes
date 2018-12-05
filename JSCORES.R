
# DATA JSCORE FILE

library(xlsx)
DATAJSCORES  <- read.xlsx("D:/Rachit/7. Workforce Transformation/DATA Jscores.xlsx",1)
View(DATAJSCORES)
library(sqldf)
#modify this to do searches.


# FOR PEOPLE WITH FOUNDATION SCORE
sqldf("SELECT `EMP.Name` 
      FROM DATAJSCORES 
      WHERE `Skill` = 'Foundation Complete'")

sqldf("SELECT `EMP.Name` 
      FROM DATAJSCORES 
     WHERE `Skill` = 'I'")

sqldf("SELECT `EMP.Name` 
      FROM DATAJSCORES 
     WHERE `Skill` = 'T'")

#FOR NA

sqldf("SELECT `EMP.Name` 
      FROM DATAJSCORES 
      WHERE `Skill` = 'FALSE'")



