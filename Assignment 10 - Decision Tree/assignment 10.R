
install.packages("rpart")
install.packages("rpart.plot")
library("rpart")
library("rpart.plot")

data <- S23DataSurveyWithSectionsAnonymized
View(data)
summary(data)


# Convert categorical variables to factors
data$RollTongue <- as.numeric(factor(data$"Can you roll your tongue?", 
                                     levels = c("Yes", "No", "What?"), labels = c(1, 0, 0)))


phone <- data$"What kind of cell-phone do you have"
rotary <- data$"Could you make a phone call using a rotary phone"
handed <- data$"Are you left- or right-handed?"
rolltongue <- data$"Can you roll your tongue?"
floaters <- data$"When you look at a blue sky, do you see those swirly floaters in your vision?"
food <- data$"What's a really popular food that you don't like?"
activities <- data$"Which of these activities can you do reasonably well? (check all that apply)"
icecream <- data$"Which ice cream flavor do you prefer?"
gross <- data$"Were you grossed out by any of the answer choices to the previous question?"
number <- data$"Pick a number from 1 to 100"
thermostat <- data$"When you adjust a thermostat that was set by someone else, it is usually because you want the room to be..."
animal <- data$"Name the first animal you can think of"
sports <- data$"What is your favorite sports team (put \"none\" if you don't have it )"
triedfoods <- data$"Have you ever tried the following food? (check all that apply)"


# Build decision tree for type of cell phone
tree1 <- rpart(phone ~ thermostat + rotary + gross, data=data, method="class")
tree1
rpart.plot(tree1)
printcp(tree1)

# Build decision tree for thermostat temperature
tree2 <- rpart(thermostat ~ animal + icecream + sports + gross, data=data, method="class")
tree2
rpart.plot(tree2)
printcp(tree2)

# Build decision tree for roll tongue
tree3 <- rpart(RollTongue ~ gross + floaters + number + handed, data=data, method="class")
tree3
rpart.plot(tree3)
printcp(tree3)

