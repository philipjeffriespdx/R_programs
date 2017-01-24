# demo graphics package for show and tell, show a pretty picture and how it was made

#Author: Phil Jeffries
#3-29-2016
#CSC311
#Lab 8, chapter 8 
#More Advanced Graphics

#1.
  #1.1. flexclust package pg.375
#The flexclust package contains different visualization methods for graphing cluster results.  
  #1.2. NbClust package pg.380
#The NbClust package provides 30 indicies for determining the best number of clusters in a cluster analysis
  #1.3. cluster package pg.384
#Contains many methods for cluster analysis
  #1.4. ggplot2 package pg.386
#Strong graphing package that can be used to create a wide array of informative graphs. 

#2. Listing 16.1
data(nutrient, package="flexclust")
row.names(nutrient) <- tolower(row.names(nutrient))
nutrient.scaled <- scale(nutrient)

d <- dist(nutrient.scaled)

fit.average <- hclust