#Author: Phil Jeffries
#3-15-2016
#CSC311
#Lab 7, chapter 11
#More Exciting Graphics

#11.2
attach(mtcars)
library(car)
scatterplot(mpg ~ wt | cyl, data=mtcars, lwd=2, span=0.75,
            main="Scatter Plot of MPG vs. Weight by # Cylinderes",
            xlab="Weight of Car (lbs/1000)",
            ylab="Miles Per Gallon",
            legend.plot=TRUE,
            id.method="identify",
            labels=row.names(mtcars),
            boxplots="xy")
detach(mtcars)

#11.4
#scatter plots of mpg vs. disp vs. drat vs. wt.  total of 12 graphs
library(car)
scatterplotMatrix(~ mpg + disp + drat + wt, data=mtcars,
            spread=FALSE, smoother.args=list(lty=2),
            main="Scatter Plot Matrix via car Packages")

#11.5
set.seed(1234)
n <- 10000
c1 <- matrix(rnorm(n, mean=0, sd=.5), ncol=2)
c2 <- matrix(rnorm(n, mean=3, sd=2), ncol=2)
mydata <- rbind(c1, c2)
mydata <- as.data.frame(mydata)
names(mydata) <- c("x", "y")
#this scatter plot has points for each of the locations created from the matrix
with(mydata, plot(x,y, pch=19, main="Scatter Plot with 10,000 Observations"))

#11.6
#this has the same data as the scater plot but it uses light and darkness to show density
with(mydata, smoothScatter(x,y,main="Scatter Plot Colored by Smoothed Densities"))

#11.8
#3D scatter plot of wt, disp, and mpg
library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt, disp, mpg, main="Basic 3D Scatter Plot")
detach(mtcars)

#11.9
library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt, disp, mpg, pch=16, highlight.3d = TRUE, 
              type="h", main="3D Scatter Plot with Vertical Lines")
detach(mtcars)

#11.13
attach(mtcars)
r <- sqrt(disp/pi)
symbols(wt, mpg, circle = r, inches=0.30,
        fg="white", bg="lightblue",
        main="Bubble Plot with point size proportional to displacement",
        ylab="Miles Per Gallon",
        xlab="Weight of Car (lbs/1000)")
text(wt, mpg, rownames(mtcars), cex=0.6)
detach(mtcars)

#11.16
Orange$Tree <- as.numeric(Orange$Tree)
ntrees <- max(Orange$Tree)

xrange <- range(Orange$age)
yrange <- range(Orange$circumference)

#sets up the plot
plot(xrange, yrange, type="n",xlab = "Age (days)",
     ylab="Circumference (mm)"
     )

#adds lines
colors <- rainbow(ntrees)
linetype <- c(1:ntrees)
plotchar <- seq(18, 18+ntrees, 1)
for (i in 1:ntrees) {
 tree <- subset(Orange, Tree==i)
 lines(tree$age, tree$circumference, type="b", lwd=2, lty=linetype[i], col=colors[i],
       pch=plotchar[i])
}

#adds legend
title("Tree Growth", "example of line plot")
legend(xrange[1], yrange[2], 1:ntrees, cex=0.8, col=colors,
       pch=plotchar, lty=linetylpe, title="Tree")

#11.20
#both creaete the same graph
library(vcd)
mosaic(Titanic, shade=TRUE, legend=TRUE)

library(vcd)
mosaic(~Class+Sex+Age+Survived, data=Titanic, shade=TRUE, legend=TRUE)

