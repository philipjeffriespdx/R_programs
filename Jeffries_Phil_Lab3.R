#Author: Phil Jeffries
#2-2-2016
#CSC311
#Lab 3, chapter 3
#Graphing Basics

#1 Opening and Saving Plots
#1.a. If you just want to open a plot at run time type commands into the command line.
#     If you want to creat and save as a pdf or jpeg use functions pfd("myPlot.pdf")...
#1.b. The file saves in the current directory.

#2 A Basic Example
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

plot(dose, drugA, type="b")
#type="b" indicates that dots and lines should be represented on the graph

#3 Graphical Parameteres and Modifying Your Graphs
opar <- par(no.readonly=TRUE)
par(lty=2, pch=17)
plot(dose, drugA, type="b")
par(opar)
#The par() function is a customization function which can change fonts, colors, axes, and labels

#4 Changing Symbols and Colors
library(RColorBrewer)
n <- 7
mycolors <- brewer.pal(n, "Set1")
barplot(rep(1,n), col=mycolors)

n <- 10
mycolors <- rainbow(n)
pie(rep(1, n), labels=mycolors, col=mycolors)
mygrays <- gray(0:n/n)
pie(rep(1,n), labels = mygrays, col=mygrays)

#plot command
plot(dose, drugB, type="b",lty=4,pch=13)

#5 Font Customization

#6 Labels, Titles and Axes
#Section 3.4
#plot(dose, drugA, type="b",
#     col="red", lty=2, pch=2, lwd=2,
#     main="Clinical Trials for Drug A",
#     sub="This is hypothetical data",
#     xlab="Dosage", ylab="Drug Response",
#     xlim=c(0,60), ylim=c(0,70))
#Section 3.4.1
#title(main="main title", col.main="red",
#      sub="subtitle", col.sub="blue",
#      xlab="x-axis label", ylab="y-axis label",
#      col.lab="green", cex.lab=1.5)
#Section 3.4.2
x <- c(1:10)
y <- x
z <- 10/x
opar <- par(no.readonly=TRUE)

par(mar=c(5,4,4,8)+0.1)
plot(x,y,type="b",
     pch=21, col="red",
     yaxt="n", lty=3, ann=FALSE)
lines(x, z, type="b", pch=22, col="blue", lty=2)

axis(2, at=x, labels=x, col.axis="red", las=2)

axis(4, at=z, labels=round(z, digits=2),
     col.axis="blue", las=2, cex.axis=0.7, tck=-.01)

mtext("y=1/x", side=4, line=3, cex.lab=1, las=2, col="blue")

title("An example of Creative Axes",
      xlab="X Values",
      ylab="Y=X")

par(opar)

#Section 3.4.4
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

opar <- par(no.readonly=TRUE)

par(lwd=2, cex=1.5, font.lab=2)

plot(dose, drugA, type="b",
     pch=15, lty=1, col="red",
     ylim=c(0,60), 
     main="Drug A vs. Drug B",
     xlab="Drug Dosage", ylab="Drug Response")

lines(dose, drugB, type="b",
      pch=17, lty=2, col="blue")

abline(h=c(30), lwd=1.5, lty=2, col="gray")

library(hmisc)
#no such library exists.
minor.tick(nx=3, ny=3, tick.ratio=0.5)

legend("topleft", inset=0.5, title="Druge Type", c("A","B"),
       lty=c(1,2), pch=c(15,17), col=c("red", "blue"))

par(opar)
#this did not work as well as the book showed. The text was too big for the legend and
#the legend was on the wrong side of the graph as well as it was the wrong size.


#7 Annotating Data Points
attach(mtcars)
plot(wt,mpg,
     main="Mileage vs. Car Weight",
     xlab="Weight", ylab="Mileage",
     pch=18, col="blue")
text(wt, mpg,
     row.names(mtcars),
     cex=0.6, pos=4, col="red")
detach(mtcars)

opar <- par(no.readonly=TRUE)
par(cex=1.5)
plot(1:7,1:7,type-"n")
text(3,3,"Example of default text")
text(4,4,family="mono", "Example of mono-spaced text")
text(5,5,family="serif", "Example of serif text")
par(opar)

#8 Really Custom & Beautiful Scientific Artwork
attach(mtcars)
opar<- par(no.readonly=TRUE)
par(mfrow=c(3,1))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)

attach(mtcars)
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,2))
plot(wt, mpg, main="Scatterplot of wt vs. mpg")
plot(wt, disp, main="Scatterplot of wt vs. disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")
par(opar)
detach(mtcars)

attach(mtcars)
layout(matrix(c(1,1,2,3),2,2, byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

#myplot
attach(mtcars)
opar <- par(no.readonly = TRUE)
layout(matrix(c(1,1,2,3),2,2, byrow = TRUE))
plot(cyl, mpg,col="red", main="Scatterplot of cyl vs. mgp")
hist(cyl, main="Histogram of cyl")
boxplot(carb, main="Boxplot of carb")
par(opar)
detach(mtcars)

#9 BISON
#BISON DATA
file <- read.csv("BisonData.csv")
attach(file)
opar <- par(no.readonly =TRUE)
layout(matrix(c(1,1,2,3),2,2, byrow = TRUE))
plot(Dam.age, Bullage, col="red", main="Scatterplot of bull and dam ages")
boxplot(as.numeric(Bullage), main="Boxplot of Bull age")
boxplot(Dam.age, main="Boxplot of Dam age")
par(opar)
detach(file)
#Between Sires and Dams the Bulls tend to be much older than the dams and they reproduce 
#earlier and later than the dams
#Something I see is that the ages of the bulls are who are reproducing are either older or
#younger and not so much inbetween (from the scatterplot)

#10
attach(file)
opar <- par(no.readonly =TRUE)
layout(matrix(c(1,2,1,3),2,2, byrow = TRUE))
plot(Mass, Offspring, col="red", main="Scatterplot of Mass vs. offspring")
boxplot(Mass, main="Boxplot of Mass")
boxplot(Offspring, main="Boxplot of Offspring")
par(opar)
detach(file)


