

View(dataset)

dataset$V18 <- as.numeric(dataset$V18)

dataset$V3 <- as.numeric(dataset$V3)

dataset$V35 <- as.numeric(dataset$V35)

hist(dataset$V18, breaks = 5, xlab = "Age at Enrollment", ylab = "Number of Students",
     main = "Age of Students at Enrollment")

boxplot(dataset$V3~dataset$V18,
        xlab = "Age of Student", ylab = "Application Order",
        main = "Student's Age vs. Application Order")

x <- dataset$V18
y <- dataset$V11
# Plot with main and axis titles
# Change point shape (pch = 19) and remove frame.
plot(x, y, main = "Student's Age vs. Father's Occupation",
     xlab = "Age of Student", ylab = "Father's Occupation",
     pch = 19, frame = FALSE)

