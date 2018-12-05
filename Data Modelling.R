#dplyr and sqldf packages to be installed sqldf has sql queries language.
#can install via install.packages('dplyr') and for others
library(sqldf)
#file.choose is used for choosing file
#file.path is the path to the data and not the file. 
path2data<-file.path(file.choose())
path2data

library(sqldf)
iris_setosa <- read.csv.sql(file.path(path2data)
                            , "SELECT * 
                            FROM file
                            WHERE Species = 'setosa'")
iris_setosa                            
                            

#below syntax is for sqldf package in R only. sepal.length is in quotes because there is a dot. in between . 

iris_setosa_sepallength <- read.csv.sql(file.path(path2data)
                                        , "SELECT 'Sepal.Length', Species 
                                        FROM file
                                        WHERE Species = 'setosa'")
View(iris_setosa_sepallength)


#'Load only Sepal.Length and Species from the `iris.csv` dataset where `Species = "setosa"`                        )



