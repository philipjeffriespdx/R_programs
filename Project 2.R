#Philip Jeffries
#CSC311
#Project 2

#1 Create an interactive tool that will allow us to manually remove erroneous data 
#from the ocean navigation file from a map of the map. The cleaned up dataset should be 
#exported to a .csv
#reads in file
AUVNavF <- read.csv("AUVNavFile.csv")
AUVNavF <- AUVNavF[complete.cases(AUVNavF),]
#View(AUVNavF)

AUVNav <- as.data.frame(AUVNavF)
#plot values: column 4 is longitute, column 5 is latitude
plot(AUVNav[[4]], AUVNav[[5]], 
     xlab="Longitude", ylab="Latitude")
#store the values that are to be deleted
delete <- c(identify(AUVNav[[4]], AUVNav[[5]], labels=row.names(AUVNav)))
#move all values execpt the ones to delete to this file
AUVNav <- AUVNav[-delete,]
#write the csv file 
AUVNav
write.csv(AUVNav, file = "AUVNavCleaned.csv")

#after we write the file we can read it in again and plot the values which are much
#easier to see now
AUVNavC <- read.csv("AUVNavCleaned.csv")
AUVNavC <- AUVNavC[complete.cases(AUVNavC),]
AUVNav <- as.data.frame(AUVNavC)
#column 5 is longitute, comlumn 6 is latitute
plot(AUVNav[[5]], AUVNav[[6]], main="Records of the vehicle location", 
     xlab="Longitude", ylab="Latitude")

AUVNavC <- setNames(AUVNavC, c("column", "time", "craft", "mission", "longitutde", "latitude", "depth" ))
View(AUVNavC)


#/////////////////////////////////////////////////////////////////////
#2 Plot a smooth track of the vehicle (we learned about some regression smoothers and 
#we want something like this).
library(car)
scatterplot(AUVNav[[6]] ~ AUVNav[[5]], spread=FALSE, smoother.args=list(lty=1), pch=1,
            main="Smooth track of the vehicle", 
            xlab="Longitude", ylab="Latitude")


#/////////////////////////////////////////////////////////////////////
#3 Each row in the table represents an image that was captured from the AUV. Some 
#rows have no observations and were not analyzed as they were either taken when the AUV
#had yet to reach its destination or because it did not meet the selection criteria 
#(there are thousands and thousands of images to analyze, so some get thrown out).  
#Our ultimate goal is to be able to match each image that was analyzed to the location 
#and depth of that image as taken from the dive file using the time marker to match them.  
#You will notice that the times may not match exactly, so use the nearest entry in the 
#dive track.  Output a .csv file with new columns for the latitude, longitude and depth 
#of the image.

AUVImageF <- read.csv("AUVImageFile.csv")
AUVNavF <- AUVImageF[complete.cases(AUVImageF),]
AUVImage <- as.data.frame(AUVImageF)

View(AUVImageF)

#remove values that did not have wildlife


#in AUVNavC time is column 3
#the time is in minutes:seconds.tenths of a second
#in AUVImageFile time is column 3
#the time is in hours:minutes:seconds

C = list()
n = 0


#have a nested for loop in a for loop that checks every time in the Nav file against 
#every time in the Image file. 
for (i in 1:nrow(AUVNavC)) {
  for (j in 1:nrow(AUVImageF)) {
    #if the times are close (same minute and second) add the value to a file named
    #AUVMasterFile.csv with image number latitude, longitude, and depth
    temp1 = substr(AUVNavC[i,2], start = 0, stop = 5)
    temp2 = substr(AUVImageF[j,3], start = 4, stop = 8)
    if(temp1 == temp2)
    {
      n = n + 1
      C[[n]] <- c(AUVImageF[j,5], AUVNavC[i,5], AUVNavC[i,6], AUVNavC[i,7])
      break
    }
  }
}
#do.call(rbind, C)

write.csv(do.call(rbind, C), file = "AUVMasterFile.csv")

#For this process if it was the same minute and second in both files I added them together (The AUVNavFile only has 
#minutes and seconds so we can work with what we have).  The results were exported to a file named "AUVMasterFile.csv.

#Take a screenshot of the beginning of the file?

#/////////////////////////////////////////////////////////////////////
#4 Finally, create a graphic that would allow us to visualize the relationship between 
#the type of organism and the depth at which it was found.

#loop through AUVImageF for each creature
#if the value is not "-" and the image number is in the Master File then
#add the depth that corresponds with it to the vector for that animal

AUVMasteF <- read.csv("AUVMasterFile.csv")
AUVMasteF <- AUVMasteF[complete.cases(AUVMasteF),]
AUVMaster <- as.data.frame(AUVMasteF)

View(AUVMasteF)

#numbers
Wood_LikeN <- c(36,62,67,112,122)
#length of vector
length(Wood_LikeN)
#add to vector
Wood_LikeN <- append(Wood_LikeN, c(5))

Wood_LikeN <- NULL
FishN <- NULL
CoralsN <- NULL
SpoungesN <- NULL

#image numbers for animals
for(i in 1:nrow(AUVImageF))
{
  #wood
  if(AUVImageF[i,10] != "-")
  {
    Wood_LikeN <- append(Wood_LikeN, c(AUVImageF[i,5]))
  }
  #fish
  if(AUVImageF[i,12] != "-")
  {
     FishN <- append(FishN, c(AUVImageF[i,5]))
  }
  #corals
  if(AUVImageF[i,13] != "-")
  {
    CoralsN <- append(CoralsN, c(AUVImageF[i,5]))
  }
  #spounges
  if(AUVImageF[i,14] != "-")
  {
    SpoungesN <- append(SpoungesN, c(AUVImageF[i,5]))
  }
}

#depths
Wood_LikeD <- NULL
FishD <- NULL
CoralsD <- NULL
SpoungesD <- NULL

#
for(i in 1:length(Wood_LikeN))
{
  for(j in 1:nrow(AUVMaster))
  {
    if(Wood_LikeN[i] == AUVMaster[j,2])
    {
      #add AUVMasterF[j,5] to Wood_LikeD
      Wood_LikeD <- append(Wood_LikeD, c(AUVMaster[j,5]))
      break
    }
  }
}
for(i in 1:length(FishN))
{
  for(j in 1:nrow(AUVMaster))
  {
    if(FishN[i] == AUVMaster[j,2])
    {
      #add AUVMasterF[j,5] to Wood_LikeD
      FishD <- append(FishD, c(AUVMaster[j,5]))
      break
    }
  }
}
for(i in 1:length(CoralsN))
{
  for(j in 1:nrow(AUVMaster))
  {
    if(CoralsN[i] == AUVMaster[j,2])
    {
      #add AUVMasterF[j,5] to Wood_LikeD
      CoralsD <- append(CoralsD, c(AUVMaster[j,5]))
      break
    }
  }
}
for(i in 1:length(SpoungesN))
{
  for(j in 1:nrow(AUVMaster))
  {
    if(SpoungesN[i] == AUVMaster[j,2])
    {
      #add AUVMasterF[j,5] to Wood_LikeD
      SpoungesD <- append(SpoungesD, c(AUVMaster[j,5]))
      break
    }
  }
}

#plot the depts which are found in each vector.  Should create four boxplots one for each kind of creature
#there are no Corals!!!
boxplot(Wood_LikeD, ylab="Depths", main="Depths of Wood Like organisms")
boxplot(FishD, ylab="Depths", main="Depths of Fish organisms")
boxplot(CoralsD, ylab="Depths", main="Depths of Corals organisms")
boxplot(SpoungesN, ylab="Depths", main="Depths of Spounges organisms")


#5 Submit your code, a summary including the figures and a screen capture of your 
#interactive tool and a brief description of how you accomplished these tasks, for 
#example, in order to remove rows where the images were not analyzed, the “-“ characters 
#were replaced with an NA, then na.omit() was used to omit the rows with all NA’s.

