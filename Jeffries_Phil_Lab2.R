#Author: Phil Jeffries
#1-26-2016
#CSC311
#Lab 2
#Script implements basic commands in R: help, demo, saving and loading work

#1 -------- vectors
#1.a. Vectors are one dimentional arrays that can hold numeric data, character data, or logical data.
# a <- c(4,6,7,8,1,3,9) creates a vector "a" with those numbers in it
a <- c("k", "j", "h", "a", "c", "m")

#1.b. Vectors are indexed from 1 in R
a[1]

#1.c. From the example in 2.2.1
#a[4] would produce "a"
a[4]
#a[c(3,5)] would produce "h" "c"
a[c(3,5)]
#a[3:4] would produce "h" "a"
a[3:4]
#a[-2] would produce everything but the value at a[2]
a[-2]

#1.d. 

#1.e. The command a[7] <- 10 adds the value 10 to the vector a at location 7
a[7] <- 10

#1.f. The command a[15] <- -1 adds the value -1 to the vector a at location 15
a[15] <- -1

#2 ------- matrix
#2.1 Example
y <- matrix(1:20, nrow=5, ncol=4)
y

cells <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE, dimnames=list(rnames, cnames))
mymatrix

#2.2 Example
x <- matrix(1:10, nrow=2)
x
x[2,]
x[,2]
x[1,4]
x[1,c(4,5)]

#2.a. An advantage to naming rows and columns is that you will be less likely to confuse them in the future

#2.b.
#i. x[2,4] would be 8
x[2,4]
#ii. x[1,] would be all of the first row: 1,3,5,7,9
x[1,] 
#iii. x[,1] would be all of the first column: 1,2
x[,1]
#iv. x[2,c(2,4)] would be: 4,8
x[2,c(2,4)]

#3 ------- arrays
#3.a. An array can be three demensional while a matrix cannot

#4 ------- data frames
patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata

patientdata$age

#4.a. A data frame is more general than a matrix in that different columns can contain differet modes of data

#4.b. dataFrameName <- data.frame(array1,array2...)

#4.c. it prints just that field of the data frame names by $fieldname

#4.d. You could use attach() and detach() so that you do not have to retype patientdata$ over and over agian.

#5 ----- Factors
patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1", "Type2", "Type1", "Type2")
status <- c("Poor", "Improved", "Excellent", "Poor")
diabetes <- factor(diabetes)
status <- factor(status, order=TRUE)
patientdata <- data.frame(patientID, age, diabetes, status)
str(patientdata)
summary(patientdata)

#5.a. Continuous variables can take on any value within some range
#     Nominal variables are catagorical without an implied order
#     Ordinal variables imply oder but not amount

#5.b. A facor stores the categorical values as a vector of integers

#5.c. The summary command gives minimum, maximum, mean, and quartiles for continuous variables

#5.d. Factors are stored in the order in which they are inputted 

#5.e. Assigning the levels defines which value is assigned to what number

#6 ------ Lists 
#6.a. A list is an ordered collections of components unlike a vector which is a ordered collection of variables

#7 ------ Data Input
file <- read.csv("~/Documents/file.csv")
View(file)
summary(file)

#Summary:
#Name   Gender ColorClothing AwesomenessLevel
#Abby   :1   F:5    Blue   :1     Min.   : 4.00   
#Bill   :1   M:5    Brown  :1     1st Qu.: 7.00   
#Dave   :1          Green  :1     Median : 8.50   
#Hannah :1          Navy   :1     Mean   : 8.10   
#John   :1          Orange :1     3rd Qu.: 9.75   
#Katy   :1          Purple :1     Max.   :10.00   
#(Other):4          (Other):4          











