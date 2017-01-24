#Author: Phil Jeffries
#1-23-2016
#CSC311
#Lab 1
#Script implements basic commands in R: help, demo, saving and loading work

#Number 1
demo(smooth)
demo(graphics) 
demo(error.catching)

#Number 2
#1.3.1
#Lists and plot
age <- c(1,3,5,2,11,9,3,9,12,3)
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
mean(weight)
sd(weight)
cor(age,weight)
plot(age,weight)
q()

#1.3.4
#submits code script1.R to current session
source("script1.R")

#runs script2.R with ouput to screen, appended to file, and saved as pdf
sink("myoutput", append=TRUE, split=TRUE)
pdf("mygraphs.pdf")
source("script2.R")

#script3.R is submitted and results are on screen only
sink()
dev.off()
source("script3.R")

#1.4 
#shows where the library is located
.libPaths()
#shows packages saved in library
library()
#tells which packages are loaded and ready to use
search()
#installs package gclus
install.packages("gclus")
#after authors update packages
update.packages()
#gives a list of packages in system with their information
installed.packages()
#load package gclus, you must install first
library(gclus)
#provides information about the package
help(package="package_name")

#1.5
#run an R program in batch mode
#type this in Mac OS terminal
#R CMD BATCH options infile outfile

#1.6
#saving output to an object can be helpful
#in a function such as:
lm(mpg~wt, data=mtcars)
#it could be helpful to put that data into an object lmfit
lmfit <- lm(mpg~wt, data=mtcars)
#this displays summary 
summary(lmfit)
#produces diagnostic plots
plot(lmfit)

#1.8
help.start()
install.packages("vcd")
help(package="vcd")
library(vcd)
help(Arthritis)
Arthritis
example(Arthritis)
q()

#Number 3
help()

#Number 4
#Windows kernel NT is not Linux based so its bathname structure will be different

#Number 5
#install.packages()
#you also must load the package in order to use it.

#Number 6
#save.image("") saves the workspace 

#Number 7
install.packages("shiny")
library(shiny)
demo(shiny) #no demo found
#The package shiny has all the tools necessary to create interactive web applications.  
#The applicatoins are able to be built inside of rstudio and do not require coding in 
#web development languages. Online applications are interactive and useful for publishing 
#results from rstudio straight to the web.

#Number 8
#Java: Java is much better at object oriented programming and will be easier for simple 
#application developement 
#C++: C++ is in my mind much more controlled and easier to make suffisitcated programs.  
#You are able to pick exactly what datastructure you want to use and how you want to use it
#for the best product for the users. 
#R: I could see R as being much better at creating graphics and charts.

#Number 9
#1. R allows you to integrate other languages
#2. It takes advantage of parrallelism
#3. R is cross-platform
#data analysis
#plots
#easy to make reproduceable reports

#R not best for:
#speed
#efficiency
#customization







