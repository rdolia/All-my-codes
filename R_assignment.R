#------------------------Module 2-------------------------------------------
#Q1- what would be the output of the following script?
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v%/%t)

#Ans - 0 1 1

#Q2- You have 25 excel files with names such as xx_1.xlsx...xx_25.xlsx in a dir
# write a program to extract the contents of each excel sheet and make it one df

#Ans-
library(readxl)
file.list <- list.files(pattern='*.xlsx')
df.list <- lapply(file.list, read_excel)

#Q3- If the above 25 files were csv files what would be your script to read

#Ans- 
temp = list.files(pattern="*.csv")
myfiles = lapply(temp, read.delim)

##
library(rjson)
filenames <- list.files("Users/Desktop/json", 
                        pattern="*.json", 
                        full.names=TRUE) 
# this should give you a character vector, with each file name represented 
#by an entry
myJSON <- lapply(filenames, function(x) fromJSON(file=x)) 
# a list in which each element is one of your original JSON files

#Q5- Parse the following JSON into a data frame
js<-'{
"name": null, "release_date_local": null, "title": "3 (2011)", 
"opening_weekend_take": 1234, "year": 2011,
"release_date_wide": "2011-09-16", "gross": 59954
}'

#Ans- 
temp <- list.files(path, pattern="*.json", full.names=TRUE)
movies <- purrr::map_df(temp, function(x) { 
  purrr::map(jsonlite::fromJSON(x), function(y) ifelse(is.null(y), NA, y)) 
})


#Q6- Write a script for variable binning using R
# Ans-
df = data.frame(v=sample(1:60,1000,TRUE))
df$cat = cut(df$v,c(-Inf,6,12,Inf))
table(df$cat)

#Q7- How To Import SAS XPORT Files into R With The foreign package
#Ans-
library(foreign)
data <- read.xport("")

#Q8- How To Import SAS Files into R With The haven Package?
#Ans-
library(haven)
data <- read_sas("")

#Q9- How to read Weka Attribute-Relation File Format (ARFF) files in R ?
#Ans-
library(foreign)
data <- read.arff("")

#Q10- How to read a heavy csv/tsv file using readr package?
#Ans- 
df <- read_table("",
                 col_names=TRUE)
