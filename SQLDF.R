#'Load only Sepal.Length and Species from the `iris.csv` dataset where `Species = "setosa"`
library(sqldf)

path2data<-file.path(file.choose())
path2data
#'Load only Sepal.Length and Species from the `iris.csv` dataset where `Species = "setosa"`
#use single quotes for setosa.. doenst work with anything else.full select query to be in double quotes.

iris_setosa<-read.csv.sql(file.path(path2data)
                          ,"SELECT * 
                          FROM file
                          WHERE Species ='setosa'")
View(iris_setosa)
head(iris_setosa,n=10)

#'Load only Sepal.Length and Species from the `iris.csv` dataset for species = setosa
iris_setosa_sepal_length<-read.csv.sql(file.path(path2data)
                          ,"SELECT 'Sepal.Length',Species 
                          FROM file
                          WHERE Species ='setosa'")
View(iris_setosa_sepal_length)
#'Load the trimmed iris dataset into R then use sqldf
iris_all <- read.csv.sql(file.path(path2data))

#let's pull only species and sepal length from this data set using the sql function.
# IMPORTANT!!! use the key below esc key ` instead of single quote for the sqldf command.
sqldf("SELECT `Sepal.Length`,Species FROM iris_all LIMIT 10")

#'Create a new variable `Sepal.Area` given by `Sepal.Area = Sepal.Length * Sepal.Width
sqldf("SELECT `Sepal.Length`,`Sepal.Width`,`Sepal.Length` * `Sepal.Width` AS `Sepal.Area`  FROM iris_all LIMIT 10")

#'Which `setosa` observations have `Sepal.Length` strictly less than 5 units? USE OF AND COMMAND
#'IMPORTANT!! for a field name use the below escape key quote. for values in a field use single quote.

library(sqldf)
iris_all
sqldf("SELECT * 
      FROM iris_all 
      WHERE Species = 'setosa' AND `Sepal.Length` < 5")

#'Which observations have either `Sepal.Length` strictly less than 4.5 units or `Sepal.Width` strictly
#' less than 2.5 units?  
#' OR command.
sqldf("SELECT *
      FROM iris_all
      WHERE `Sepal.Length` < 4.5 OR `Sepal.Width` < 2.5")

#'Which observations have `Species` starting with `"se"`?  
#LIKE command. use single quotes for se..as its a field and not a field name.
sqldf("SELECT *
      FROM iris_all
      WHERE `Species` LIKE 'se%'")

#'Which observations have `Species` either equal to `"versicolor"` or `"setosa"`?  
#'IN command
sqldf("SELECT *
      FROM iris_all
      WHERE `Species` IN ('versicolor', 'setosa')")

#'Sort the data by descending order of `Species`, followed by ascending order of `Sepal.Length`.
#'ORDER BY command
sqldf( "SELECT *
       FROM iris_all
       ORDER BY Species DESC, `Sepal.Length` ASC")

#'Obtain the mean, min and max values of `Sepal.Length` for the entire iris_all dataset.  
sqldf("SELECT AVG(`Sepal.Length`) as avg, MIN(`Sepal.Length`) as min, MAX(`Sepal.Length`) as max
        FROM iris_all")

#'Obtain the mean, min and max values of `Sepal.Length` for each `Species`.  
iris_group <- sqldf("SELECT Species, AVG(`Sepal.Length`) as avg, MIN(`Sepal.Length`) as min, MAX(`Sepal.Length`) as max
                     FROM iris_all
                    GROUP BY Species")
View(iris_group)

#'Inner join `iris_all` and `iris_group` by `Species`.  

sqldf("SELECT iris_all.Species, iris_all.`Sepal.Length`, iris_group.avg, iris_group.max, iris_group.min
       FROM iris_all INNER JOIN iris_group
       ON iris_all.Species = iris_group.Species
       LIMIT 10")                                                                                       
                          
# dplyr

library(dplyr)

select(iris_all, Species, Sepal.Length)

# equivalently, using pipe %>% pipe takes the left value and puts it in right. like g(f(x))

iris_all %>% 
  select(Species, Sepal.Length) %>% 
  head(10)
