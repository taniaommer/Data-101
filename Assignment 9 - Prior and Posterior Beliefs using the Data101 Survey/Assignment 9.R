
data <- S23DataSurveyWithSectionsAnonymized
View(data)

# PRIOR
table(data$"What kind of cell-phone do you have")
nrow(data[data$"What kind of cell-phone do you have"=="Iphone",])/nrow(data)
nrow(data[data$"What kind of cell-phone do you have"=="Android",])/nrow(data)

# POSTERIOR 1
table(data$"Could you make a phone call using a rotary phone")
table(data$"What kind of cell-phone do you have", data$"Could you make a phone call using a rotary phone")

# POSTERIOR 2
table(data[data$"Could you make a phone call using a rotary phone"=="Yes, and I have" & 
             data$"Are you left- or right-handed?"=="Right",]$"What kind of cell-phone do you have")

# POSTERIOR 3
table(data$"When you look at a blue sky, do you see those swirly floaters in your vision?")
table(data$"What kind of cell-phone do you have", data$"When you look at a blue sky, do you see those swirly floaters in your vision?")

