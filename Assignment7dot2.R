View(mtcars)
mtcars_cat <- mtcars[c(2,8,9,10,11)]
library(tidyr)
gather(mtcars_cat)
library(ggplot2)
ggplot(gather(mtcars_cat), aes(value)) + geom_bar()+facet_wrap(~key, scales = 'free_x')

#. Create a scatterplot matrix by gear types in mtcars dataset.
View(mtcars)
pairs(~gear+mpg+cyl+disp+hp,mtcars)
pairs(~gear+drat+wt+qsec+vs,mtcars)
pairs(~gear+am+carb,mtcars)

#. Write a program to create a plot density by class variable.
library(ggplot2)
library(tidyr)
ggplot(gather(mtcars), aes(value)) + geom_density(fill="cyan")+facet_wrap(~key, scales = 'free_x')
