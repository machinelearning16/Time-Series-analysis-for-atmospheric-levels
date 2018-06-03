data <- read.table(choose.files(), sep=",",header= TRUE)
View(data)

myts1  <- ts(data$co2, start=1958,end=2013,frequency=12)

plot(myts1)

install.packages("forecast")
require(forecast)

#Gaussian Processes

# ARIMA Method(AR(Autoregression),I(Integerated),MA(Moving Average))(Manually)

#Find value of P by ACF(Autocorrelation)=40
acf(myts1)

#Find value of Q by PCF(Partial Autocorrelation)=4
pacf(myts1)

#Find the value of D to check data is stationary or non stationary
#If data is stationary then value will be 0 but if is non stationary then
#then it will have some value to make data stationary
adf.test(myts1)
ndiffs(myts1)

#Fitting ARIMA Model and getting the Perfect P,D,Q value automatically by the model 
fit <-auto.arima(myts1,seasonal = TRUE)
summary(fit)
plot(forecast(fit,550))

