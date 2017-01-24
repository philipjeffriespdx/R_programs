#Author: Phil Jeffries
#4-5-2016
#CSC311
#

#1 Listing 22.1
install.packages("xtable")
library(rmarkdown)
render("women.Rmd", "html_document")

#2 


#3
#render("filename.rmd", "word_document")

#4
#The author suggests creating bookmarks in word and creating R code at those bookmarks that will insert the results.  

#5 
#To replace bookmarks in a word document you would use the command wdGoToBookmark("name") and then would use multiple different commands to write something new.

#Review from ch. 19
#6 Four main graphics systems
  #Base
  #pre-loaded, most graphics require it
  #Grid
  #low level with a lot of flexibility
  #Lattice
  #built upon grid package to visualize multivariate data
  #ggplot2
  #grammar oriented, powerful visualization tool

#7
#ggplot()

#8
#facet_panel(am-vs) lays out panels in a grid, the panels are Automatic/Manual and V-Engine/Straight Engine

#9

#10
#Figure 19.6 - 3
#AsstProf, AssocProf, Prof
#Figure 19.7 - 8
#Bass 2, Bass 1, Tenor 2, Tenor 1, Alto 2, Alto 1, Soprano 2, Soprano 1
#Figure 19.8 - 3
#AsstProf, AssocProf, Prof
#Figure 19.9 - 5
#AsstProf, AssocProf, Prof, Female, Male
#Figure 19.10 - 3
#AsstProf, AssocProf, Prof
#Figure 19.11 - 8
#Bass 2, Bass 1, Tenor 2, Tenor 1, Alto 2, Alto 1, Soprano 2, Soprano 1
#Figure 19.12 - 3
#AsstProf, AssocProf, Prof
#Figure 19.13 - 8
#Bass 2, Bass 1, Tenor 2, Tenor 1, Alto 2, Alto 1, Soprano 2, Soprano 1

#11
# bp + theme(legend.position=c(12,2))

#12
#The gridExtra package allows for multiple grid-based plots on a single page.


