library("readxl"); library(dplyr); library(tidyr); library(ggplot2)

flights <- read_excel("nycflights13.lon.lat.xlsx", sheet = "flights")
weather <- read_excel("nycflights13.lon.lat.xlsx", sheet = "weather")

#  8255 of departures getting cancelled
sum(is.na(flights$dep_time)) 


byMon_EWR_total <- group_by(flights[flights$origin == "EWR",],month)
( sumMon_EWR_total <- summarize(byMon_EWR_total,count=n()) )    
sum (sumMon_EWR_total)


flights %>%
  left_join(weather, by = c("origin", "time_hour")) %>%
  select(dep_delay, visib) %>%
  drop_na() -> d
d

ggplot(d, aes(x = visib, y = dep_delay)) + geom_point() + geom_smooth(se = FALSE)
