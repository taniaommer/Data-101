
# read both csv files
citibike1 <- read.csv("~/Downloads/Data101/citibike.May20.50K.csv")
citibike2 <- read.csv("~/Downloads/Data101/citibike.May21.50K.csv")

# create a trip duration column for citibike2
# convert start and end times to an overall trip duration
# convert the new trip duration from seconds to minutes
# citibike1's trip duration was already converted to minutes in the last assignment
start_time <- as.POSIXct(citibike2$started_at)
end_time <- as.POSIXct(citibike2$ended_at)
citibike2$trip_duration <- end_time - start_time
citibike2$tripduration <- citibike2$trip_duration/60
# calculated this before creating my hypotheses
# i don't end up using citibike2 data for my hypotheses


#hypothesis 1

# create subsets for each gender for hypothesis
male <- subset(citibike1, citibike1$gender=="1")
female <- subset(citibike1, citibike1$gender=="2")

# find mean of how long males and females rode
mean.male <- mean(male$tripduration)
mean.female <- mean(female$tripduration)

# find standard deviation of how long males and females rode
sd.male <- sd(male$tripduration)
sd.female <- sd(female$tripduration)

# find the number of males and females
num.male <- length(male$tripduration)
num.female <- length(female$tripduration)

# calculating the SD denominator for the z-score seprately
sd.male.female <- sqrt(sd.male^2/num.male + sd.female^2/num.female)

# calculating z-score
zscore <- (mean.male-mean.female)/sd.male.female
zscore

# calculating p-value
p <- 1 - pnorm(zscore)
p





#hypothesis 2

# create subsets for each subscribers and customers for hypothesis
subscriber <- subset(citibike1, citibike1$usertype=="Subscriber")
customer <- subset(citibike1, citibike1$usertype=="Customer")

# find mean of how long subscribers and customers rode
mean.subscriber <- mean(subscriber$tripduration)
mean.customer <- mean(customer$tripduration)

# find standard deviation of how long subcribers and customers rode
sd.subscriber <- sd(subscriber$tripduration)
sd.customer <- sd(customer$tripduration)

# find the number of subscribers and customers
num.subscriber <- length(subscriber$tripduration)
num.customer <- length(customer$tripduration)

# calculating the SD denominator for the z-score seprately
sd.subscriber.customer <- sqrt(sd.subscriber^2/num.subscriber + sd.customer^2/num.customer)

# calculating z-score
zscore2 <- (mean.subscriber-mean.customer)/sd.subscriber.customer
zscore2

# calculating p-value
p2 <- 1 - pnorm(zscore2)
p2
