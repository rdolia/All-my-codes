
#below generates the probablity density of  standard normal distribution for value x.
x=seq(-4,4,length=200)
y=dnorm(x,mean=0,sd=1)
plot(x,y,type="l",lwd=2,col="red")

#If the total area under the curve equals 1, then by symmetry one would expect
#that the area under the curve to the left of x = 0 would equal 0.5.
#R has a command called pnorm (the "p" is for "probability") which is 
#designed to capture this probability (area under the curve).
pnorm(0, mean=0, sd=1)
#Sometimes the opposite question is asked. That is, suppose that the area under 
#the curve to the left of some unknown number is known. What is the unknown number?
qnorm(0.95,mean=0,sd=1)
#Hence, there is a 95% probability that a random number
#less than or equal to 1.644854 is chosen from the standard normal distribution.
