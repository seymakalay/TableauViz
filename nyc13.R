library("readxl"); library(dplyr); library(tidyr); library(ggplot2)

airport_location("YVR","IATA")

flights_data <- read_excel("nycflights13.lon.lat.xlsx", sheet = "flights")
weather_data <- read_excel("nycflights13.lon.lat.xlsx", sheet = "weather")
names(weather_data)
names(flights_data)

View(flights_data)


###Descriptive stats for canceled data
library(nycflights13)
mydf <- nycflights13::flights

#mydf <- subset(mydf, is.na(dep_time))




mydf <- mydf %>%
               mutate(my.col = ifelse(is.na(dep_time), "Canceled",
                                   ifelse(mydf$dep_delay > 0, "Delayed", "OnTime")))
              
      
table(mydf$my.col)




write.csv(mydf, "my.df.col.csv", row.names = FALSE)



airport_location("YVR","IATA")





a <- flights_data  %>% 
  dplyr::mutate(my.col = ifelse(dep_delay == "" , "delay", "not"))


# 8255 of departures getting cancelled
sum(is.na(flights_data$dep_time)) 


flights_data <- flights_data[!flights_data$dep_time == "",]

my.df <- dplyr::inner_join(flights_data, weather_data, by = c("origin", "time_hour"))
names(my.df)


my.df <- my.df %>% 
     group_by(origin,dest) %>% 
     mutate(count.flights = n()); names(a) #summarise(n = n())

my.df$visib <- as.factor(my.df$visib)

model <- lm(dep_delay ~  pressure + visib + count.flights,  data = my.df)
summary(model)


model <- lm(dep_delay ~  pressure + visib + pressure*visib,  data = my.df)
summary(model)






library(gmodels)
CrossTable(my.df$dep_delay, my.df$origin,
           expected=F, prop.r=T, prop.c=T, prop.t=T, prop.chisq=F, chisq = T)











#REMOVING THE ROWS WHEN flights$dep_time == NA
library(nycflights13)
head(flights)

my.flights <- flights %>% 
               dplyr::filter(flights$dep_time != "")

write.csv(my.flights, "my.flights.csv", row.names = FALSE)




#How many unique air planes fly from NYC to Seattle?
  #Calculating unique number of air planes to Seattle by using tailnum
  length(unique(flights$tailnum))

##

flights %>%
  left_join(weather, by = c("origin", "time_hour")) %>%
  select(dep_delay, visib) %>%
  drop_na() -> d
d




##
byMon_EWR_total <- group_by(flights_data[flights_data$origin == "EWR",],month)
( sumMon_EWR_total <- summarize(byMon_EWR_total,count=n()) )
sum(sumMon_EWR_total$count)

colnames(sumMon_EWR_total) <- c("month", "TotalCount")
byMon_LGA_total <- group_by(flights_data[flights_data$origin == "LGA",],month)
( sumMon_LGA_total <- summarize(byMon_LGA_total,count=n()) )
sum(sumMon_LGA_total$count)

colnames(sumMon_LGA_total) <- c("month", "TotalCount")
byMon_JFK_total <- group_by(flights_data[flights_data$origin == "JFK",],month)
( sumMon_JFK_total <- summarize(byMon_JFK_total,count=n()) )
sum(sumMon_JFK_total$count)

colnames(sumMon_JFK_total) <- c("month", "TotalCount")

#Filtering data to capture only specific airport and delayed flight details
#Cancelled flights and on time departure flights have been omitted
EWR_data = filter(flights_data, flights_data$origin == "EWR" & flights_data$dep_delay>0)
LGA_data = filter(flights_data, flights_data$origin == "LGA" & flights_data$dep_delay>0)
JFK_data = filter(flights_data, flights_data$origin == "JFK" & flights_data$dep_delay>0)
#Grouping by delay of flights on monthly basis for EWR Airport
#Plotting count of delayed flights and percentage delayed flights per month for EWR airport
byMon_EWR <- group_by(EWR_data,month)
( sumMon_EWR <- summarize(byMon_EWR,count=n()) )

sum(sumMon_EWR$count)

par(mfrow=c(1,2))
plot(sumMon_EWR, type='b', ylab = 'Number of delays', xlab = 'Month')
abline(h=mean(sumMon_EWR$count))
sumMon_EWR_final = merge(x = sumMon_EWR, y = sumMon_EWR_total, by = "month", all = TRUE)
sumMon_EWR_final$percent_delay <- with(sumMon_EWR_final, (count/TotalCount)*100)
plot(x=sumMon_EWR_final$month,y=sumMon_EWR_final$percent_delay,
     ylab='Percent Delay', xlab ='Month', type = 'b')
mtext('Monthly trend of delays at EWR Airport', side = 1, line = -21, outer = TRUE)




#http://vaibhavwalvekar.github.io/Portfolio_NYCFlights.pdf


a <- filter(flights_data,  is.na(flights_data$dep_time) == FALSE)

KeepDepDelayBiggerthanZero <- filter(a, a$dep_delay > 0 )

KeepDepDelayBiggerthanZero <- as.data.frame(KeepDepDelayBiggerthanZero)

write.csv(KeepDepDelayBiggerthanZero, "KeepDepDelayBiggerthanZero.csv", row.names = FALSE)



4375 + 3094 + 2193
4375 / (4375 + 3094 + 2193)
3094 / (4375 + 3094 + 2193)
2193 / (4375 + 3094 + 2193)
