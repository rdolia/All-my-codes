
#'
#'# Tidy Data - using the `tidyr` package
#'
#+ message = F
# Clear the global environment  
rm(list = ls())
# Import `tidyr` package
library(tidyr)

# Load the `sales_pivot_missing.txt` data
path2data <- file.path(file.choose())

#separation is by space \t.

sales <- read.table(file.path(path2data)
                    , sep = "\t"
                    , header = T
                    , stringsAsFactors = F)

head(sales)
# Look at the first few rows of the data
head(sales)

# Look at the summary of the data
summary(sales)

#SPECIFY WHICH COLUMNS TO BE GATHERED. USING c()

long1 <- gather(data = sales
                , key = PERIOD
                , value = SVAL
                , c(JAN_12, FEB_12, MAR_12, APR_12, MAY_12, 
                    JUN_12, JUL_12, AUG_12, SEP_12, OCT_12, 
                    NOV_12, DEC_12))
head(long1)
str(long1)

#+
# Method 2: specify which columns to be gathered using `:`
long2 <- gather(data = sales
                , key = PERIOD
                , value = SVAL
                , JAN_12:DEC_12)
head(long2)
str(long2)

#+
# Method 3: specify which columns to be left out using `-`
long3 <- gather(data = sales
                , key = PERIOD
                , value = SVAL
                , -MBD, -CAT)
head(long3)
str(long3)

# Are long1, long2 and long3 identical?
identical(long1, long2)
identical(long1, long3)

#---
#'
#'# `tidyr` - Chaining with magrittr `%>%` operator
#+
sales %>% 
  gather(key = PERIOD
         , value = SVAL
         , -MBD, -CAT) %>% 
  head()


#---
#'
#'# `tidyr` - Long to Wide (`spread`)
#'
#+
wide1 <- spread(data = long1
                , key = PERIOD
                , value = SVAL)
head(wide1)

# arrange the columns in a desired order
#+ message = F
library(dplyr)
wide2 <- long1 %>% 
  mutate(PERIOD = factor(PERIOD, levels = c("JAN_12", "FEB_12", "MAR_12", "APR_12"
                                            , "MAY_12", "JUN_12", "JUL_12", "AUG_12"
                                            , "SEP_12", "OCT_12", "NOV_12", "DEC_12"))) %>% 
  spread(key = PERIOD
         , value = SVAL)

head(wide2)

##
wide3 <- long1 %>%
  spread(key = PERIOD
         , value = SVAL) 
# Are sales and wide2 identical?
#+
identical(sales, wide2)


#'---
#'
#'## Exercise 
#'Load `CELL_LEVEL_RAWSALES_WIDE.txt` data and saved it as dataframe `rawsales_wide` 
#'Use `tidyr`` package to complete the following two exercise.  
#'
#'
#'### Exercise 1
#'Gather the two rawsales variables from `rawsales_wide` into a value column named `RAW_SALES` 
#'corresponding to key column named `PERIODCODE`.  Store the output as `rawsales`.  
#'Challenge - Remove the `"RAW_SALES_"` prefix from the values from the `PERIODCODE` variable.  
#'<br>
#'
#+

#---
#'
#'### Exercise 2
#'Spread the `RAW_SALES` values for each `PERIODCODE` of the `rawsales` dataframe into separate columns.
#'Store the output as `rawsales_wide1`.
#'<br>
#'


#---
#'
#'# `tidyr` - `unite` and `separate`
#'
#'The `unite` function concatenates columns in a data.frame
#+
# Concatenate the MBD and CAT columns and removes the original columns
unite1 <- unite(data = sales
                , col = MBD_CAT
                , MBD, CAT
                , sep = "/"
                , remove = T)
head(unite1)

#+
# Alternative Method
unite2 <- unite(data = sales
                , col = MBD_CAT
                , MBD:CAT
                , sep = "/"
                , remove = T)
head(unite2)

#'
#'<br>
#'The `separate` function splits up a column into multiple columns based on the separator
#+
# Split the MBD_CAT column
separate(data = unite1
         , col = MBD_CAT
         , into = c("MBD", "CAT")
         , sep = "/"
         , convert = T) %>%   
  head()



#---
#'
#'# Handling Missing Values
#'
#'* Represented as `NA`
#'* Operations on data with `NA` will likely result in `NA`
#'* `is.na`: returns a logical vector as to whether each element is `NA`
#'* `na.omit`: returns rows of the data.frame with no `NA` entries
#'* `complete.cases`: returns indices of rows of the data.frame with no `NA` entries
#'* `na.rm` = ...: a common option in vectorized functions (e.g., `sum`, `mean`, `max`, `min`) to ignore `NA` when computing the values
#'

#---
#'
#'# Handling Missing Values - Examples
#+
# Import the sales dataset
path2data <- file.path(file.choose())
sales <- read.table(file.path(path2data)
                    , sep = "\t"
                    , header = T
                    , stringsAsFactors = F)

# Take a quick look at the dataset
summary(sales)

# returns logical vector of whether each element in the JAN_12 variable is `NA`
is.na(sales$JAN_12)
# returns rows of the sales dataframe with no `NA` entries
na.omit(sales)
# returns indices of rows of the sales dataframe with no `NA` entries
complete.cases(sales)
sum(complete.cases(sales))

# Which observations have missing data in the JAN_12 variable?
sales[is.na(sales$JAN_12), ]



#'---
#'
#'## Exercise 3
#'Use the `rawsales` data from Exercise 1, which observations have missing data 
#'in the `RAW_SALES` variable in `rawsales`?  
#'<br>
#'
#' Use `complete.cases` to see which observations in `rawsales` are complete (i.e., no `NA`)
#'<br>
#'
#' Use `na.omit` to obtain complete observations (i.e., no `NA`)
#' 


#'---
#'
#'# Summary
#'
#'* Tidy data, together with a complete code book, eases data analysis and manipulation
#'* `tidyr` can be used to convert data from wide to long formats (and vice-versa) easily
#'* `is.na`, `na.omit`, `complete.cases` and `na.rm` are useful functions/options to use in dealing with missing values
#'
