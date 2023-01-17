library("readxl")

flights <- read_excel("nycflights13.lon.lat.xlsx", sheet = "flights")

#  8255 of departures getting cancelled
sum(is.na(flights$dep_time)) 


    