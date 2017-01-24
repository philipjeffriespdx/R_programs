#Author: Phil Jeffries
#2-16-2016
#CSC311
#Lab 5, chapter 5
#Loops, Coniditonals, and Functions

#1 Sec. 5.1
#describe what must be done
#1.a. add all three scores together for each student and save it as new variable performance indicator
#1.b. order the students from highest to lowest. add a new variable, values = the top 20% get A's, next 20% B's...
#1.c. get the last name of the student. sort the table by those values

#2 Sec. 5.2.1, 5.2.2, and 5.2.4
#2.a. 
x <- c(2,6,4,5,7,8,9)
sqrt(sum(abs(x - mean(x))/sd(x)))

x[1]
#2.b. the scale method centers and scales the columns of a matrix
#     name <- scale(x[,c(1,3)])
(1.1*10^4) + (3.3*10^-4)
# answer was 11000. No the number is not correct. 

#2.c. Changes the names in the dataframe
#sub("\\s", "_", dataframe$name, ignore.case=FALSE, fixed=TRUE)

#3 Sec. 5.2.6
#3.a. 
col1 <- c(2,5,10)
col2 <- c(4,7,3)
x <- data.frame(col1, col2)
View(x)
#3.b. find the max of each row
# apply is a function that evaluates each row or column. x is the list, 1 means rows, and max is a function to find the maximum value
apply(x, 1, max)
#3.c. find the min of each column
# apply is a function that evaluates each row or column. x is the list, 2 means columns, and min is a function to find the minimum value
apply(x, 2, min)
#3.d. find the max column value for only the first and second rows
apply(x[c(1,2),], 2, max)

#4. Sec. 5.3
options(digits=2)
Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose", "David Jones")
Math <- c(502,600,412,358)
Science <- c(95,99,80,82)
English <- c(25,22,18,15)
roster <- data.frame(Student, Math, Science, English, stringsAsFactors=FALSE)

#4.a.
#creates even scale between all columns so they are weighed evenly
z <- scale(roster[,2:4])
# creates new column with the mean score of the row
score <- apply(z, 1, mean)
#add score to roster
roster <- cbind(roster, score)

#4.b.
#quantile() function gives you the percentile rank of each student's performance score
y <- quantile(score, c(.8,.6,.4,.2))
roster$grade[score >=y[1]] <- "A"
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"

#4.c.
#splits name at " " 
name <- strsplit((roster$Student)," ")
#takes second element of name and puts it in Lastname. "[" is a function that extracts part of an object
Lastname <- sapply(name, "[", 2)
Firstname <- sapply(name, "[", 1)
#cbind() adds columns to roster.  roster[,-1] drops "name" from roster
roster <- cbind(Firstname, Lastname, roster[,-1])

roster <- roster[order(Lastname,Firstname),]

#prints roster
roster

#5 Sec. 5.4
#5.a. For loop: for (var in seq) statement
# Example: for (i in 1:10) print("Hello")
#5.b. While loop: while (cond) statement
# Example: while (i > 0) {print("Hello"); i <- i - 1}
#5.c. If-Else: if (cond) statement else statement2
# Example:if(is.factor(grade)) grade <- as.factor(grade))
#         if(!is.factor(grade)) grade <- as.factor(grade) else print ("Grade already is a factor")
#5.d. User definition function:
# myfunction <- function(arg1, arg2, ...){
#   statements
#   return(object)
#}

#6 Sec. 5.5
#6.i. three inputs: x, parametric, and print
mystats <- function(x, parametric=TRUE, print=FALSE){
  if(parametric){
    center <- mean(x); spread <- sd(x)
  } else {
    center <- median(x); spread <- mad(x)
  }
  if (print & parametric) {
    cat("Mean=", center, "\n", "SD=", spread, "\n")
  } else if (print & !parametric) {
    cat("Median=", center, "\n", "MAD=", spread, "\n")
  }
  result <- list(center=center, spread=spread)
  return(result)
}
#6.ii. ouptut: result
#6.iii.if parametric and print did not have boolean values assigned then they be assigned default boolean values

#7. Sec. 5.6.2
#7.a. it would return an organized list with favdisneychar (Group.2) as primary key and gender (Group.1) as secondary key.

#8. Sec. 5.6.3
#8.a. The melt function restructures a dataset so that each measurement or values are alongside their ID.
#8.b. The best way to restructure this dataset would be to have Year as the ID so that each year/department have a row of students 
# md <- melt(dframe, id=c("Year"))


 










