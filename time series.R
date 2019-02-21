#predict sales 
data("AirPassengers")
class(AirPassengers)
#class is time series
start(AirPassengers)
end(AirPassengers)
summary(AirPassengers)
plot(AirPassengers)
#mean and variance both are increasing. seasonal effect also there
#have to make the data stationary. 
abline(reg = lm(AirPassengers~time(AirPassengers)))
#checking cyclicity
cycle(AirPassengers)
#seasonality
boxplot(AirPassengers~cycle(AirPassengers))
#Trend
#plotting the mean to see if its constant.
plot(aggregate(AirPassengers, FUN= mean))
#mean is increasing.

plot(log(AirPassengers))
#variance has become equal in above plot using the log function.
#now make mean equal.
 difflog <- (diff(log(AirPassengers)))
plot(difflog)
#check again if mean is constant
plot(aggregate(difflog,FUN=mean))
#hence mean , variance is constant and no seasonality and trend
#hence its stationary
#we can now implement ARMA model
#ARIMA.. Auto regressive moving average.
#pdq - p is auto regression
#d is differentiation
#q is for moving average
#lag is how the past value is correlated to current value
acf(diff(log(AirPassengers))) #determing q value
#q = 1
#p value is 1 as first line is 0 2nd is 1 and after one its negative. '
pacf(diff(log(AirPassengers)))
#p is 0 because 2nd line is negative
#d value is number of times differentiated = 1
#pdq 0,1,1
fit <- arima(log(AirPassengers),c(0,1,1),seasonal = list(order = c(0,1,1),period = 12))

#predict using the above fit for the next 10 years monthwise
pred <- predict(fit,n.ahead = 10*12)
pred1 <-2.718^pred$pred
#plotting the prediction below
ts.plot(AirPassengers,pred1,log = 'y',lty= c(1,3))

#compare accuracy of model 
datawide <- ts(AirPassengers,frequency = 12, start = c(1949,1),end = c(1959,12))
fit <- arima(log(datawide),c(0,1,1),seasonal = list(order= c(0,1,1),period=12))
pred <- predict(fit, n.ahead = 10*12)

pred1 <- 2.718^pred$pred
data1 <- head(pred1,12)
data1
predict_1960 <- round(data1,digits = 0)
original_1960 <- tail(AirPassengers,12)
