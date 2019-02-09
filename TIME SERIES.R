AP <- AirPassengers
plot.ts(AP)

#Stationarity Check:
 # In order to check if a series is stationary or not we use Ljung-Box 
#test or Augmented Dickey-Fuller Test.
Box.test(AP,lag = 20,type = 'Ljung-Box')
#Here, we observe that the p-value < 0.05. Hence, we can say that the series is stationary.
#ACF is the coefficient of correlation between the value of a point 
#at a current time and its value at lag p. i.e. correlation between Y(t) and Y(t-p)
#We should calculate ACF in order to know up to what extent current
#values are related to the past values. Thus, we can know which past
#values will be most helpful in predicting future values.
acf(AP,lag.max = 20)
