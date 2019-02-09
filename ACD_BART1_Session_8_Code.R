head(mtcars)
View(mtcars)
# basic statistics
apply(mtcars,2,mean)
apply(mtcars,2,mean)
apply(mtcars,2,median)
apply(mtcars,2,sd)
apply(mtcars,2,var)

#frequency table
table(mtcars$cyl)

#relative frequency
table(mtcars$cyl)/sum(table(mtcars$cyl))

#quartile
quantile(mtcars$mpg,prob=c(0.05,0.10,0.90,0.95))

#default summary
summary(mtcars)

#compute mean excluding missing values 
sapply(mtcars, mean, na.rm=TRUE)

# mean,median,25th and 75th quartiles,min,max
summary(mtcars)


