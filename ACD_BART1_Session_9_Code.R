head(mtcars)

Mode <- function(x){
  ux <- unique(x)
  ux[which.max(tabulate(match(x,ux)))]
}

mean(mtcars$mpg);
median(mtcars$mpg);
Mode(mtcars$mpg);
range(mtcars$mpg);
sd(mtcars$mpg);
var(mtcars$mpg);
table(mtcars$cyl)

par(mfrow=c(1,3))
boxplot(mtcars$mpg);hist(mtcars$mpg);plot(density(mtcars$mpg))

#calculation
n = 12
p = 1/5
q = 1-(1/5)
mean = n*p
var = n*p*q
help(dbinom)
#Method 1
dbinom(0,12,0.2)+dbinom(1,12,0.2)+dbinom(2,12,0.2)+dbinom(3,12,0.2)+dbinom(4,12,0.2)
dbinom(0:4,12,0.2)
#Method 2
pbinom(4,12,0.2)

ppois(16,lambda = 12,lower.tail = FALSE)
pexp
#Method 1
1-pnorm(84,72,15)

#Method 2
pnorm(84,72,15,lower.tail = F)

#dbinom is probablity mass function and pbinom is cumulative distribution function.

