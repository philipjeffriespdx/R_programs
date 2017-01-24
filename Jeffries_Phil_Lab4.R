#Author: Phil Jeffries
#2-9-2016
#CSC311
#Lab 4, chapter 4 
#Working with data and why this isn't trivial

#1 Sec. 4.1
manager <- c(1,2,3,4,5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK","UK","UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32,45,25,39,99)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)
leadership <- data.frame(manager,date,country,gender,age,
                         q1, q2, q3, q4, q5, stringsAsFactors = FALSE)
#2 Sec. 4.2
mydata <- data.frame(x1 = c(2,2,6,4),
                     x2 = c(3,4,2,8))

mydata$sumx = mydata$x1 + mydata$x2
mydata$meanx = (mydata$x1 + mydata$x2) /2

#extra work for questions
x1 = c(2,2,6,4)
x2 = c(3,4,2,8,9)
x1+x2
#2.a. x1+x2 returns one array with the two values from the same location added together
#     x1/x2 returns one array with the two values from the same location the first divided by the second
# It treats arithmatic options between arrays betwen each location and creates one array
#2.b. You get a warning message and the shorter array is looped back through again
#2.c. x1+5 adds 5 to every value in x1

#3 Sec. 4.3
leadership <- within(leadership,{
  agecat <- NA
  agecat[age > 75] <- "Elder"
  agecat[age >= 55 & age <=75] <- "Middle Aged"
  agecat[age <55] <- "Young"
})
#3.a. it would set the variable for any data piece greater than 25 to NA or not having a value
#3.b. it would return <NA>

#4 Sec. 4.5  <> see more in ch. 18
y <- c(1, 2, 3, NA)
is.na(y)
#c(FALSE, FALSE, FALSE, TRUE)
is.na(leadership[,6:10])
#will not work:
x <- c(1, 2, NA, 4)
y <- x[1] + x[2] + x[3] + x[4]
z <- sum(x)
#but this will
y <- sum(x, na.rm=TRUE)
#na.omit will delete any rows with missing data
#4.a. it will remove any rows with missing data from the dataframe file
#4.b. an example where NA is a response you want to analyze could be if a device was down for a few days you would want to find out when and save the data of when the results were NA
#     an example where NA is a response we would want to discard could be if it is someones salary and we could no longer find the average salary

#5 Sec. 4.7
#is.numeric()
#is.character()
#as.numeric()
#as.character()

#6 Sec. 4.9
#horizontal
#total <- merge(dataframeA, dataframeB, by="ID")
#total <- merge(dataframeA, dataframeB, by=c("ID","Country")
#horizontal, and no common key
#total <- cbind(A, B)
#vertical
#total <- rbind(dataframeA, dataframeB)

#6.a. merge() is horizontal with a common key
#     cbind() is horizontal
#     rbind() is vertical
#6.b. They are helpful for merging two data frames together

#7 Sec. 4.10.1-4.10.3  Keeping variables // Dropping variables
#7.a. dframe2 <- c("favoflavo", "q1", "favchar")
#7.b. dframe$favoflavo <- dframe$q1 <- dframe$favchar <- NULL
#7.c. newdata <- f2[f2$age > 10]
#7.d. newdata <- f2[f2$age > 10 & f2$age < 30]
#7.e. newdata <- f2[f2$year > 2003]

#8. Removing duplicates
x <- c('A', 'B', 'B', 'A', 'B')
y <- c(40,40,50,40,50)
data = data.frame(Group=x, Age=y)
#duplicated rows found by using this
duplicated(data)
#select these rows 
data[duplicated(data),]


#BISON DATA
file <- read.csv("BisonData.csv")
attach(file)
opar <- par(no.readonly =TRUE)
#9 Remove any entry with NA
bison <- na.omit(file)
#View(bison)
#summary(bison)

#10 Data of fertile bison - plotted histogram 
data <- bison[bison$Paternity=="Yes",]
View(data)
hist(data$Dam.age, main="Age of fertile bison")

#11 Remove duplicate of the same bull in the same season
dataD = data.frame(data$Sire, data$Season)
dataD[duplicated(dataD),]

#12 
plot(Bullage, mass, col="red", main="Bull age vs. Mass")
plot([Bullage-mean(Bullage)], sd(Bullage), col="green", main="Normalized Scores")

par(opar)
detach(file)




