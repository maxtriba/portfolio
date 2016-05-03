# Author: Max Triba
# Deconstruct, summarize, and predict unemployment in the United States

install.packages("forecast")
library(forecast)

unemp <- Quandl("FRED/UNRATE", authcode="API_KEY") #Gather unemployment data

##### Build a function to return summary statistics and plot unemployment data within a specific date range

unemp_summary <- function(dataset, startdate, enddate, frequency) { #datetime / POSIX transformations can be made to coerce startdate and enddate information to follow the necessary "YYYY-MM-DD" format
    
    range <- dataset[dataset$Date >= startdate & dataset$Date <= enddate, ] 
    
        if (nrow(range) == 0) { 
           stop("Invalid Range")
        }
        
    start <- as.numeric(format(range[nrow(range),1], "%Y")) #Start argument    
    month <- as.numeric(format(range[nrow(range),1], "%m")) #Find starting month of the initial year in range, assuming descending data
    
    Unemployment_Rate <- ts(range[,2], frequency = frequency, start = c(start, month)) #Build time series of range
    
    print(summary(range))  #Show summary statistics
    plot.ts(Unemployment_Rate)  #Plot time series subset
    
    
}

#Test function
unemp_summary(unemp, "2013-01-01", "2015-01-01", 12)


##### Forecast unemployment rate

unemp_series <- ts(unemp[,2], frequency = 12, start = c(1948, 1)) #Create time series of unemployment

#Use exponential smoothing to forecast unemployment rate

unemp_fitting <- HoltWinters(unemp_series)
plot(unemp_fitting)

unemp_forecast <- forecast.HoltWinters(unemp_fitting, h = 24) #Forecast out 24 periods
plot(unemp_forecast)

#Check for time lagged autocorrelation of model errors

acf(unemp_forecast$residuals, lag.max=20) 
plot.ts(unemp_forecast$residuals) #Check residual variance







