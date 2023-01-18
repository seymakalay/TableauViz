library("readxl"); library(dplyr)

flights <- read_excel("nycflights13.lon.lat.xlsx", sheet = "flights")

#  8255 of departures getting cancelled
sum(is.na(flights$dep_time)) 


byMon_EWR_total <- group_by(flights[flights$origin == "EWR",],month)
( sumMon_EWR_total <- summarize(byMon_EWR_total,count=n()) )    
sum (sumMon_EWR_total)
