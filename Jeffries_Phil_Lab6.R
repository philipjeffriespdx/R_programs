#Author: Phil Jeffries
#2-23-2016
#CSC311
#Lab 6, chapter 6
#Summaries and Basic Analysis - Due March 5

#1 Sec. 6.1
#install library
install.packages("vcd")
#counts
library(vcd)
counts <- table(Arthritis$Improved)
counts
#simple bar plot
barplot(counts,
        main="Simple Bar Plot",
        xlab="Improvement", ylab="Frequency")
#simploe horizontal bar plot
barplot(counts,
        main="Horizontal Bar Plot",
        xlab = "Frequency", ylab = "Improvement",
        horiz = TRUE)

#stacked and grouped bar plots
library(vcd)
counts <- table(Arthritis$Improved, Arthritis$Treatment)
counts
#stacked bar plots
barplot(counts,
        main="Stacked Bar Plot",
        xlab="Treatment", ylab="Frequency",
        col=c("red", "yellow", "green"),
        legend=rownames(counts))
#grouped bar plot
barplot(counts,
        main="Grouped Bar Plot",
        xlab="Treatment", ylab="Frequency",
        col=c("red", "yellow", "green"),
        legend=rownames(counts), beside=TRUE)

#sorted mean bar plots
states <- data.frame(state.region, state.x77)
means <- aggregate(states$Illiteracy, by=list(state.region), FUN=means)
means
means <- means[order(means$x),]
means
barplot(means$x, names.arg=means$Group.1)
title("Mean Illiteracy Rate")

#Fitting labels in a bar plot
#increases the size of the y margin
par(mar=c(5,8,4,2))
#rotates the FL bar labels
par(las=2)
counts <- table(Arthritis$Improved)
barplot(counts,
        main="Treatment Outcome",
        horiz = TRUE,
        #decreases the font size in order to fit the labels comfortable
        cex.names = 0.8,
        names.arg=c("No Improvement", "Some Improvement", "Marked Improvement"))

#Spine()
library(vcd)
attach(Arthritis)
counts <- table(Treatment, Improved)
spine(counts, main="Spineogram Example")
detach(Arthritis)

#1.a You can have as many variables as you like.  They all have to be decimal type
#1.b Stacked bar plots can be useful if you have information that you want to group together
# and that information is related by the same type and variable
#1.c A spinogram is different because the height is one and each piece is a percentage of that

#2 Sec. 6.2
par(mfrow=c(2,2))
slices <- c(10,12,4,16,8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Simple Pie Chart")
pct <- round(slices/sum(slices)*100)
lbls2 <- paste(lbls, " ", pct, "%", sep="")
pie(slices, labels=lbls2, col=rainbow(length(lbls2)),main="Pie Chart with Percentages")
library(plotrix)
pie3D(slices, labels=lbls,explode=0.1,main="3D Pie Chart")
mytable <- table(state.region)
lbls3 <- paste(names(mytable),"\n",mytable,sep="")
pie(mytable, labels=lbls3, main="Pie Chart from a Table\n (with sample sizes)" )
#2.a You can have as many slices and variables as you like.  They must all have decimals values

#3 Sec. 6.3
par(mfrow=c(2,2))

hist(mtcars$mpg)

hist(mtcars$mpg,
     breaks=12,
     col="red",
     xlab="Miles Per Gallon",
     main="Colored histogram with 12 bins")

hist(mtcars$mpg,
     freq=FALSE,
     breaks=12,
     col="red",
     xlab="Miles Per Gallon", 
     main="Histogram, rug plot, density curve")
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg), col="blue", lwd=2)

x <- mtcars$mpg
h <- hist(x,
          breaks=12,
          col="red",
          xlab="Miles Per Gallon",
          main="Histogram with normal curve and box")
xfit <- seq(min(x), max(x), length=40)
yfit <- dnorm(xfit, mean=mean(x), sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit,yfit,col="blue",lwd=2)
box()
#3.a You can have as many bins in the histogram as you want. They have to be a decimal type.
#3.b You would want to show the density curve if you want to get a general statistical idea of the data.
#3.c The density curve on the rug plot is reasonably helpful fot the trend but it is far from perfect.

#4 Sec. 6.4
#code listing 6.7
par(mfrow=c(2,1))
d<-density(mtcars$mpg)

plot(d)

d <- density(mtcars$mpg)
plot(d,main="Kernel Density of Miles Per Gallon")
polygon(d, col="red",border="blue")
rug(mtcars$mpg, col="brown")

#code listing 6.8
library(sm)
attach(mtcars)
cyl.f <- factor(cyl, levels=c(4,6,8),
                labels=c("4 cylinder", "6 cylinder", "8 cylinder"))
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
title(main="MPG Distribution by Car Cylinders")
colfill <- c(2:(1+length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill=colfill)
detach(mtcars)
#4.a the graph did not print because there is no library sm

#5 Sec. 6.5 - code from 6.9 and 6.10
#code listing 6.9
library(sm)
attach(mtcars)
#creates a factor for the number of cylinders
mtcars$cyl.f <- factor(mtcars$cyl,
                       levels=c(4,6,8),
                       labels=c("4", "6", "8"))
#creates a factor for transmission type
mtcars$am.f <- factor(mtcars$am,
                      levels=c(0,1),
                      labels=c("auto", "standard"))
#generates the box plot
boxplot(mpg - am.f *cyl.f,
        data=mtcars,
        varwidth=TRUE,
        col=c("gold","darkgreen"),
        main="MPG Distribution by Auto Type",
        xlab="Auto Type", ylab="Miles Per Gallon"
        )
detach(mtcars)

#code listing 6.10
library(vioplot)
attach(mtcars)
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1, x2, x3,
        names = c("4 cyl", "6 cyl", "8 cyl"),
        col="gold")
detach(mtcars)
#library(sm) and library(vioplot) are not available even after download.
#5.a The violin plot shows in more depth the amount of data at a certain point since it not only has height but it also has width
#5.b library(sm) and library(vioplot) are not available even after download.  I assume 3 types sincethere are 4,6, and 8.  The amount is nondeterminable without seeing the graph

#6 Sec. 6.6

#7 Sec. 7.1.1
#7.a sapply is a summary style function that gives minimum, maximum, quartiles, and mean values

#8 Sec. 7.1.2 (and 7.1.4)
#8.a summaryBy() function is in the doBy package and it creates a systematic summary of values that are left of the "~" and groups by the item(s) on the left of the "~"
#8.b. the items on the left of the ~ that are being summarized with mean, standard deviation, skew, and kurtosis are spaced by "+" and on the right is the item(s) that those previous summaries are being grouped by

#9 Sec. 7.2.1
library(grid)
library(vcd)
head(Arthritis)
mytable <- with(Arthritis, table(Improved))
mytable

#one way frequency
prop.table(mytable)
prop.table(mytable)*100

#two way frequency
mytable <- xtabs(~ Treatment+Improved, data=Arthritis)
mytable
#more
margin.table(mytable, 1)
prop.table(mytable,1)
margin.table(mytable,2)
prop.table(mytable,2)
prop.table(mytable)
addmargins(mytable)
addmargins(prop.table(mytable))
addmargins(prop.table(mytable,1),2)

#9.a 
#one way frequency
prop.table(mytable)
prop.table(mytable)*100

#9.b
#two way frequency
mytable <- xtabs(~ Treatment+Improved, data=Arthritis)
mytable

