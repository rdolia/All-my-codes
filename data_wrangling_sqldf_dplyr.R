#'---
#'  title: "Data Wrangling with sqldf & dplyr"
#'  date: '`r Sys.Date()`'
#'  output: 
#'    slidy_presentation:
#'      theme: cerulean
#'      toc: yes
#'---

rm(list=ls())

#'##Overview of Data Wrangling packages in R  
#'
#'* base R  
#'* `sqldf`: Compatible with majority of SQLite query commands  
#'* `dplyr`: Similar to SQL/Python pandas (use of keywords), and at the same time, slightly more concise.  Part of the Hardley Wickham "ecosystem" of data wrangling and visualization libraries in R.  
#'* `data.table`: Extends the `data.frame` object class.  Written in C++, and it is extremely fast.  Its concision can both be a pro and con.  


#'##Data manipulation with SQL (`sqldf` package)  
#'
#'* an R package for running SQL statements on R data.frames  
#'* allows importing a subset of a csv file into R (as opposed to importing the whole file before subsetting) through SQL statements  
#'* easy to form dynamic/parametrized queries using the `paste` function  
#'* not for updating the original DB  
#'* Useful link : https://github.com/ggrothendieck/sqldf  
#'

#'##Learning objectives:  
#'
#'* Importing a csv file into a data.frame using `read.csv.sql`  
#'* Data wrangling using SQL statements via `sqldf` 
#'      * SELECT  
#'      * DISTINCT  
#'      * WHERE  
#'      * AND, OR, LIKE, IN  
#'      * JOINS (INNER, LEFT)  
#'      * AGGREGATION (AVG, COUNT, MAX, MIN, SUM, GROUP BY)  
#'

#'##Importing a csv file into a data.frame using `read.csv.sql`
#'
#'Load libraries
#+
library(sqldf)
#'Set up the path to data
#+ message = F, warning = F
path2data <- file.path(file.choose())
path2data

#'Load all variables from the `iris.csv` dataset where `Species = "setosa"`
#+ message = F, warning = F
iris_setosa <- read.csv.sql(file.path(path2data)
                            , "SELECT * 
                            FROM file
                            WHERE Species = 'setosa'")
head(iris_setosa)

#'Load only Sepal.Length and Species from the `iris.csv` dataset where `Species = "setosa"`
#+ message = F, warning = F
iris_setosa_sepallength <- read.csv.sql(file.path(path2data)
                                        , "SELECT `Sepal.Length`, Species 
                                           FROM file
                                           WHERE Species = 'setosa'")
head(iris_setosa_sepallength)

#'Remove all unnecessary variables in the Global Environment
#+
rm(list = c("iris_setosa", "iris_setosa_sepallength"))



#'##Data wrangling using SQL statements via `sqldf`
#'
#'Load the trimmed iris dataset into R
#+ message = F, warning = F
iris_all <- read.csv.sql(file.path(path2data)
                         , sql = "SELECT * 
                                  FROM file")
head(iris_all)


#'##`sqldf`: SELECT    
#'
#'* used to select either some or all the variables from a table  
#'* `*` is a wildcard that is used to denote all variables  
#'* a good programming practice to list the variable names that you need and avoid the use of `SELECT *`  
#'
#'Let's obtain only the `Species` and `Sepal.Length` variables from the `iris_all` data.frame, looking at the first 10 observations.  
#'
#+ message = FALSE, warning = FALSE
sqldf("SELECT Species, 'Sepal.Length'
       FROM iris_all
       LIMIT 10")

#'Create a new variable `Sepal.Area` given by `Sepal.Area = Sepal.Length * Sepal.Width`
#'
#+ message = FALSE, warning = FALSE
sqldf("SELECT `Sepal.Length`, `Sepal.Width`, `Sepal.Length` * `Sepal.Width` AS `Sepal.Area`
      FROM iris_all
      LIMIT 10")


#'##`sqldf`: DISTINCT
#'
#'* Similar to the `unique` function in base R
#'* Retrieves distinct records from the variables specified
#'* Used together with the `SELECT` keyword
#'
#'What are the distinct `Species` in the `iris_all` data.frame?  
#'
#+ message = FALSE, warning = FALSE
sqldf("SELECT DISTINCT Species
       FROM iris_all")

#'##`sqldf`: WHERE
#'
#'* used to filter the observations based on certain conditions 
#'
#'Which observations have `Sepal.Length` strictly less than 4.5 units?  
#'
#+ message = FALSE, warning = FALSE
sqldf("SELECT * 
       FROM iris_all
       WHERE `Sepal.Length` < 4.5")

#'##`sqldf`: AND, OR, LIKE, IN
#'
#'* `AND` & `OR`: used when there are multiple filter conditions (similar to `&` and `|` in base R)
#'* `LIKE`: used to filter for similarity of strings
#'    * `_`: exactly one unknown character  
#'    * `%`: an unknown number of unknown characters  
#'
#'* `IN`: used to filter values belonging to a set of values (similar to `%in%` in base R)
#'
#'Which `setosa` observations have `Sepal.Length` strictly less than 5 units?  
#'
#+ message = FALSE, warning = FALSE
# AND
sqldf("SELECT * 
       FROM iris_all
       WHERE Species = 'setosa' AND `Sepal.Length` < 5")

#'Which observations have either `Sepal.Length` strictly less than 4.5 units or `Sepal.Width` strictly less than 2.5 units?  
#+
# OR
sqldf("SELECT * 
       FROM iris_all
       WHERE `Sepal.Length` < 4.5 OR `Sepal.Width` < 2.5")

#'Which observations have `Species` starting with `"se"`?  
#+
# LIKE
sqldf("SELECT * 
       FROM iris_all
       WHERE Species LIKE 'se%'")

#'Which observations have `Species` either equal to `"versicolor"` or `"setosa"`?  
#+
# IN
sqldf("SELECT * 
       FROM iris_all
       WHERE Species IN ('versicolor', 'setosa')")


#'##`sqldf`: ORDER BY
#'
#'* order/sort data by variables
#'
#'Sort the data by descending order of `Species`, followed by ascending order of `Sepal.Length`.  
#'
#+ message = FALSE, warning = FALSE
sqldf("SELECT * 
       FROM iris_all
       ORDER BY Species DESC, `Sepal.Length` ASC
       LIMIT 10")


#'##`sqldf`: Aggregation and GROUP BY
#'
#'* Aggregation: used to create summarized values
#'* `GROUP BY`: usually used during aggregation based on group
#'
#'Obtain the mean, min and max values of `Sepal.Length` for the entire iris_all dataset.  
#'Obtain the mean, min and max values of `Sepal.Length` for each `Species`.  
#'
#+ message = FALSE, warning = FALSE
# No grouping; aggregate by whole dataset
sqldf("SELECT AVG(`Sepal.Length`) as avg, MIN(`Sepal.Length`) as min, MAX(`Sepal.Length`) as max
       FROM iris_all")

# Aggregation by Species
iris_group <- sqldf("SELECT Species, AVG(`Sepal.Length`) as avg, MIN(`Sepal.Length`) as min, MAX(`Sepal.Length`) as max
                     FROM iris_all
                     GROUP BY Species")
iris_group


#'##`sqldf`: JOINS (INNER, LEFT)
#'
#'* Similar to VLOOKUP in Excel  
#'* `INNER JOIN`: returns only records with common keys  
#'* `LEFT JOIN`: returns all records from the "left" table (first table specified)  
#'
#'Inner join `iris_all` and `iris_group` by `Species`.  
#'
#+ message = FALSE, warning = FALSE
sqldf("SELECT iris_all.Species, iris_all.`Sepal.Length`, iris_group.avg, iris_group.max, iris_group.min
       FROM iris_all
       INNER JOIN iris_group
       ON iris_all.Species = iris_group.Species
       LIMIT 10")

#'Remove all unnecessary variables in the Global Environment
#+
rm(list = "iris_group")
iris_group


#'##Data wrangling with `dplyr`  
#'
#'* Uses a `keyword` style, similar to SQL  
#'* Generally easy to read and learn  
#'* "Talks" with other packages written by Hadley Wickham (`ggvis`, `tidyr`)  
#'
#'Fundamental commands:  
#'
#'* select variables: select()
#'* select distinct observations: distinct()
#'* select observations: filter()
#'* create new variables: mutate()
#'* arrange observations: arrange()
#'* aggregate data: summarize()
#'* operate data in groups: group_by()
#'* merge tables: left_join(), etc.
#'

#'##`dplyr`: select    
#'
#'* used to select either some or all the variables from a table  
#'
#'Let's obtain only the `Species` and `Sepal.Length` variables from the `iris_all` data.frame, looking at the first 10 observations.  
#'
#+ message = FALSE, warning = FALSE
library(dplyr)
select(iris_all, Species, Sepal.Length)

# equivalently, using pipe %>%
iris_all %>% 
  select(Species, Sepal.Length) %>% 
  head(10)


#'##`dplyr`: distinct
#'
#'* Combines `select` and `unique` functions
#'* Retrieves distinct records from the variables specified
#'* NO NEED to use the `select` function
#'
#'What are the distinct `Species` in the `iris_all` data.frame?  
#'
#+ message = FALSE, warning = FALSE
iris_all %>% distinct(Species)

distinct(iris_all,Species)
#'##`dplyr`: filter
#'
#'* used to filter the observations based on certain conditions 
#'
#'Which observations have `Sepal.Length` strictly less than 4.5 units?  
#'
#+ message = FALSE, warning = FALSE
iris_all %>% 
  filter(Sepal.Length < 4.5)

filter(iris_all,Sepal.Length < 4.5)

#'Which `setosa` observations have Sepal.Length strictly less than 5 units?  
#+
iris_all %>% 
  filter(Species == "setosa" & Sepal.Length < 5)

#'Which observations have either `Sepal.Length` strictly less than 4.5 units or `Sepal.Width` strictly less than 2.5 units?  
#+
iris_all %>% 
  filter(Sepal.Length < 4.5 | Sepal.Width < 2.5)

#'Which observations have `Species` starting with `"se"`?  
#+
iris_all %>% 
  filter(substr(Species, start = 1, stop = 2) == "se")

#'Which observations have `Species` either equal to `"versicolor"` or `"setosa"`?  
#+
iris_all %>% 
  filter(Species %in% c("versicolor", "setosa"))


#'##`dplyr`: mutate
#'
#'* adds a new variable to the table
#'
#'Add a variable `Sepal.Area` given by `Sepal.Area = Sepal.Length * Sepal.Width`.  
#'
#+ message = FALSE, warning = FALSE
iris_all %>% 
  mutate(Sepal.Area = Sepal.Length * Sepal.Width) %>% 
  head(10)


#'##`dplyr`: arrange
#'
#'* order/sort data by variables
#'
#'Sort the data by descending order of `Species`, followed by ascending order of `Sepal.Length`.  
#'
#+ message = FALSE, warning = FALSE
iris_all %>% 
  arrange(desc(Species), Sepal.Length) %>% 
  head(10)


#'##`dplyr`: summarize and group_by
#'
#'* `summarize`: used to create summarized values
#'* `group_by`: usually used during aggregation based on group.  Each `summarize` command "peels off" the last called layer of `group_by`.  
#'
#'Obtain the mean, min and max values of `Sepal.Length` for the entire iris_all dataset.  
#'Obtain the mean, min and max values of `Sepal.Length` for each `Species`.  
#'
#+ message = FALSE, warning = FALSE
# No grouping; aggregate by whole dataset
iris_all %>% 
  summarize(avg = mean(Sepal.Length)
            , min = min(Sepal.Length)
            , max = max(Sepal.Length))

# Aggregation by Species
iris_group <- iris_all %>% 
  group_by(Species) %>% 
  summarize(avg = mean(Sepal.Length)
            , min = min(Sepal.Length)
            , max = max(Sepal.Length))
iris_group


#'##`dplyr`: inner_join, left_join, right_join, full_join
#'
#'* `inner_join`: returns only records with common keys  
#'* `left_join`: returns all records from the "left" table (first table specified)  
#'* `right_join`: returns all records from the "right" table (second table specified)  
#'* `full_join`: returns all records from both table  
#'
#'Inner join `iris_all` and `iris_group` by `Species`.  
#'
#+ message = FALSE, warning = FALSE
iris_all %>%     # "left" table
  inner_join(iris_group
             , by = "Species") %>% 
  head(10)

# Different keys
iris_all %>% 
  inner_join(iris_group
             , by.x = "Species"  ## SQL: iris_all.Species
             , by.y = "Species"  ## SQL: iris_group.Species
  )


# Alternative to producing the same table
iris_all %>%
  group_by(Species) %>% 
  mutate(avg = mean(Sepal.Length)
         , min = min(Sepal.Length)
         , max = max(Sepal.Length)) %>% 
  ungroup() %>% 
  head(10)

#'##`dplyr`: Ungrouping matters for `group_by %>% mutate`!  
#'
#+
#Without ungrouping
iris_all %>%
  group_by(Species) %>% 
  mutate(avg = mean(Sepal.Length)
         , min = min(Sepal.Length)
         , max = max(Sepal.Length)) %>% 
  mutate(all_median = median(Sepal.Length)) %>% 
  select(Species, Sepal.Length, all_median) %>% 
  head(10)

#With ungrouping
iris_all %>%
  group_by(Species) %>% 
  mutate(avg = mean(Sepal.Length)
         , min = min(Sepal.Length)
         , max = max(Sepal.Length)) %>% 
  ungroup() %>% 
  mutate(all_median = median(Sepal.Length)) %>% 
  select(Species, Sepal.Length, all_median) %>% 
  head(10)

#'Remove all unnecessary variables in the Global Environment
#+
rm(list = c("iris_all", "iris_group"))


#'##Data wrangling with `dplyr`  
#'
#'###Other useful keywords/functions in `dplyr`
#'
#'* `count`: count number of observations  
#'* `rename`: renames variables/columns  
#'* `one_of`, `contains`, `starts_with`, `ends_with`, etc:  select variables based on column names patterns  
#'* `glimpse`:  an enhanced `str` function  
#'
#'###Using Standard Evaluation (SE) / Performing Dynamic/Parametrized queries in `dplyr`
#'
#'* use the `_` versions of the keywords, e.g.: `select_`, `mutate_`, ... 
#'* resources: 
#'      * http://rmhogervorst.nl/cleancode/blog/2016/06/13/NSE_standard_evaluation_dplyr.html
#'      * https://www.r-bloggers.com/the-complete-catalog-of-argument-variations-of-select-in-dplyr/
#'
#'


#'##Other useful data wrangling packages in R
#'
#'* `reshape2` / `tidyr`:  convert dataset from wide to long (and vice-versa)  
#'
#'