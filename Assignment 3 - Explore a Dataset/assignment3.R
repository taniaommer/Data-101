
View(citibike.May20.50K)


#BOXPLOT

#sets the gender values of 0,1,2 from the data to unknown,male,and female
citibike.May20.50K$gender[citibike.May20.50K$gender == 0] <- "Unknown"
citibike.May20.50K$gender[citibike.May20.50K$gender == 1] <- "Male"
citibike.May20.50K$gender[citibike.May20.50K$gender == 2] <- "Female"

#converts the trip duration from seconds to minutes
citibike.May20.50K$mins <- citibike.May20.50K$tripduration

#boxplot showing the ride duration in minutes for each gender
#shows all data points, including the most extreme outliers
#hard to read and identify where most of the data is
boxplot(mins ~ gender, data = citibike.May20.50K, frame = FALSE, 
        col = c("lightblue", "lavender", "cornsilk"), 
        main = "Boxplot of Trip Duration in Minutes for Each Gender", 
        xlab = "Gender", ylab = "Trip Duration (minutes)")

#this boxplot takes all the data limits the ride duration to 120 minutes
#it shows how the majority of riders had a ride duration of an hour or less
#this is illustarted by the the mean ride duration, which is aroudn 20 mins for all three genders
boxplot(mins ~ gender, data = citibike.May20.50K, frame = FALSE, 
        ylim = c(0, 120), col = c("lightblue", "lavender", "cornsilk"), 
        main = "Boxplot of Trip Duration in Minutes for Each Gender", 
        xlab = "Gender", ylab = "Trip Duration (minutes)")

#this horizontal boxplot shows ride duration in minutes for each gender in a different orientation
boxplot(mins ~ gender, data = citibike.May20.50K, frame = FALSE,
        horizontal = TRUE, ylim = c(0, 120), col = c("lightblue", "lavender", "cornsilk"), 
        main = "Horizontal Boxplot of Trip Duration in Minutes for Each Gender", 
        ylab = "Gender", xlab = "Trip Duration (minutes)")


#HISTOGRAM

#histogram showing the birth years of the citibike users and the frequency 
#of users per year
#makes it easy to determine the main age range of most citi bike users
#largest bar around the birth year of 1968 to 1970
hist(citibike.May20.50K$birth.year, breaks = 50, col = "orange",
     xlab = "Birth Year", main = "Histogram of Citi Bike Users Birth Years")

