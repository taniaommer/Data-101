

--------------------------------------------------------------------------------

# EXAMPLE FROM LECTURE SLIDES

citybike_train <- read.csv("citybike.train.csv")
View(citybike_train)

plot(citybike.train$bikeid,citybike.train$tripduration)
summary(citybike.train$tripduration)
summary(citybike.train$bikeid)

bikeidModel = lm(tripduration~bikeid, data=citybike.train)
summary(bikeidModel)

citybike.test100 <- read.csv("citybike.test100.csv")
View(citybike.test100)

bikeidpredictions = predict(bikeid.lm.model,citybike.test100)
citybike.test100withduration <- read.csv("citybike.test100withduration.csv")

citybike.train$Day = as.numeric(substr(citybike.train$starttime,9,10))

day.lm.model = lm(tripduration~Day, data=citybike.train)
citybike.test100$Day = as.numeric(substr(citybike.test100$starttime,9,10))
day.lm.predictions = predict(day.lm.model,citybike.test100)

all.predictions = data.frame(Predicted=rep(600,10000))
View(all.predictions)
write.csv(all.predictions,file="all.predictions.csv")

--------------------------------------------------------------------------------

# MY CODE FOR MODEL AND PREDICTIONS
  
install.packages("Metrics")
library(Metrics) #Used to display the mse


citybiketest10000A <- read.csv("citybike.test10000A.csv")
citybiketest10000B <- read.csv("citybike.test10000B.csv")
citybiketest10000Awithduration <- read.csv("citybike.test10000Awithduration.csv")
View(citybiketest10000Awithduration)
View(citybiketest10000B)

--------------------------------------------------------------------------------

  
# PREDICTIONS AND ERROR FOR citybiketest1000A
  
train.data <- subset(citybiketest10000Awithduration, tripduration < 5000)
View(train.data)

train.data$age <- cut(train.data$birth.year, breaks=c(1850,1900,1950,2010), labels = c("Old", "Middle", "Young"))
train.data$day = as.numeric(substr(train.data$starttime,9,10))

age_gender.lm.model <- lm(tripduration~end.station.longitude + end.station.longitude, data=train.data)
predicted <- predict(age_gender.lm.model, train.data)
View(predicted)
train.data$predicted <- predicted
#summary(age_gender.lm.model)
rmse(predicted, train.data$tripduration) 

# RMSE = 661.9544


--------------------------------------------------------------------------------

  
# citybiketest1000B
  
citybiketest10000B$age <- cut(citybiketest10000B$birth.year, breaks=c(1850,1900,1950,2010), labels = c("Old", "Middle", "Young"))
citybiketest10000B$day = as.numeric(substr(citybiketest10000B$starttime,9,10))
predict.10000B <- predict(age_gender.lm.model, citybiketest10000B)
#View(predict.10000B)

rmse(predict.10000B, train.data$tripduration) #RMSE

write.csv(predict.10000B,file="to186-16-prediction.csv")
x <- read.csv("to186-16-prediction.csv")
View(x)


colnames(x) <- c("Id","Predicted")
write.csv(x,file="to186-16-prediction.csv",row.names=FALSE)
View(x)

