# Import `tidyr` package
library(tidyr)

# Load the `sales_pivot_missing.txt` data
path2data<-file.path(file.choose())
sales<-read.table(path2data,sep = "\t",header = T,stringsAsFactors = F)
View(sales)

#gather for long
long2<-gather(data= sales,
              key= MONTH1,
              value = AMOUNT,
              c(JAN_12, FEB_12, MAR_12, APR_12, MAY_12, 
                JUN_12, JUL_12, AUG_12, SEP_12, OCT_12, 
                NOV_12,DEC_12))
View(long2)    

     
 #summary command will give the brief min, max, mean etc for each column of sales.
summary(long2)

#spread for wide from line 77 tidy.data.
wide1 <- spread(data = long2, key = MONTH1, value = AMOUNT)
head(wide1)

#mutate line 86 

separate(data = unite1
         , col = MBD_CAT
         , into = c("MBD", "CAT")
         , sep = "/"
         , convert = T) %>% 
# `tidyr` - `unite` and `separate` commands
long3 <- unite(data = long2,col = CATMONTH,CAT,MONTH1,sep = '/', remove = T)
long4 <- separate(data = long3, col = CATMONTH, into= c("CAT","MONTH"), sep = '/', convert = T)
