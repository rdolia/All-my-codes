#timeseries tutorial https://datascienceplus.com/time-series-analysis-in-r-part-1-the-time-series-object/
set.seed(123)
t <- seq(from = 1, to = 100, by= 1)+10 + rnorm(100,sd = 7)
plot(t)
args(ts)
#converted to ts format with start as 2000 and quarterly.
tseries <- ts(t,start = c(2000,1),frequency = 4)
print(tseries)
View(tseries)
print(tseries)
plot(tseries)
plot.ts(tseries)
#window command pulls required timeframe 
tseries_sub <- window(tseries,start=c(2000,1),end= c(2012,4))
print(tseries_sub)
#start, end , frequency commands

tseries_lag3 <- lag(tseries, 3)
head(cbind(tseries, tseries_lag3))
#-1 lag will be a lead by 1 offset.
tseries_diff1 <- diff(tseries,lag = 1)

tseries_diff2 <- diff(tseries, lag = 2)
tm <- cbind(tseries, tseries_diff2)
head(tm)
plot(tm)

#using log function
trend <- ts(seq(from = 10, to = 110))
cycle <- ts(sin(trend)) * 0.2 * trend
tseries_h <- trend + cycle
plot.ts(tseries_h)
#variance is called heteroskedasticity and can cause problems in linear regression
#taking log corrects variance
tseries_log <- log(tseries_h)
tm <-cbind(tseries_h, tseries_log)
plot.ts(tm)
#There are other more advanced ways of eliminating non-constant variance,
#one of which is the Box-Cox transformation, which allows us a bit more
#control over the transformation. 
# f or ec package
install.packages('forecast')
library(forecast)
plot.ts(BoxCox(tseries_h, lambda = 0.5))
#Notice that this value of lambda here does not entirely take care of
#the heteroskedasticity problem. We can experiment with different values of lambda, or we can use the BoxCox.lambda() function,
#which will provide us an optimal value for parameter lambda:
lambda <- BoxCox.lambda(tseries_h)
print(lambda)
#plot with optimal lambda
plot.ts(BoxCox(tseries_h, lambda = lambda))
#above we have eliminated variance . it's constant now.
#Two of the functions that we have discussed so far, 
#the difference and the log, are often combined in time series analysis.
#The log difference function is useful for making non-stationary 
#data stationary and has some other useful properties. We can calculate
#the log difference in R by simply combining the log() and diff() functions.
tseries_dlog <- ts(diff(log(tseries)), start = c(2000, 1), frequency = 4)
plot.ts(cbind(tseries, tseries_dlog))
#t series has become stationary