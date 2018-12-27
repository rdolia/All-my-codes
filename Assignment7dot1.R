#1. Histogram for all variables in a dataset mtcars.
#Write a program to create histograms for all columns
View(mtcars)
library(ggplot2)
library(tidyr)

mtcars %>% gather() %>% head()
#Using this as our data, we can map value as our x variable, 
#and use facet_wrap to separate by the  key column:
ggplot(gather(mtcars), aes(value)) + 
  geom_histogram(bins = 10) + 
  facet_wrap(~key, scales = 'free_x')
#2. Check the probability distribution of all variables in mtcars.


#3. Write a program to create boxplot for all variables.
ggplot(gather(mtcars), aes(x=value,y=key)) + 
  geom_boxplot(bins = 10) + facet_wrap(~key, scales = 'free_x')
