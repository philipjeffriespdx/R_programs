#Philip Jeffries
#CSC311
#Project 1 - Evolution Poll


#5 strongly agree   1 Strongly disagree
numQuestions=40;
numRows=30;

#attach file
all_content = readLines("~/Downloads/EvolutionSurveyData2014.csv")
skip_second = all_content[-2]
file = read.csv(textConnection(skip_second), header = TRUE, stringsAsFactors = FALSE)
#file <- read.csv("~/Downloads/EvolutionSurveyData2014.csv")
file <- file[complete.cases(file),]
View(file)

#Endate, ID, 3 bio questions, 40 evolution questions
file <- setNames(file, c("EndDate","ID","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P",
                         "Q","R","S","T","U","V","W","X","Y","Z","AA","AB","AC","AD","AE","AF","AG","AH",
                         "AI","AJ","AK","AL","AM","AN","AO","AP","AQ"))
#to get a column
file[[4]]
file[["B"]]
#to get a row 1 with columns 6 through 10
file[1,c(6:10)]

#///////////////////////////////////////////////////////////////////////
#1. What are the general attitudes of students towards evolution? Identify the survey question(s)
#that would most directly answer this question and report the findings.

#Survey Questions ///
#Q1. Some parts of evolution theory could be true. column 7
#Q2. Evolution is a good explanation of how humans first emerged on the earth. column 16
#Q3. Evolution is a scientific fact. column 17
#Q4. Some parts of evolution theory could be true. column 23
#Q5. There is a lot of evidence that supports the theory of evolution. column 43
#x <- ID
x <- file[[2]]
Q1 <- file[[7]]
Q2 <- file[[16]]
Q3 <- file[[17]]
Q4 <- file[[23]]
Q5 <- file[[43]]

#plot(x,y,xlab="ID",ylab="Strongly agree                              Strongly disagree", main="Question: Some parts of evolution theory could be true.", sub="General Attitude part 1")
#counts <- table(Q1,Q2)
counts=matrix(c(Q1, Q2, Q3, Q4, Q5), nrow=length(Q1))
boxplot(counts, main = "General Attitudes Towards Evolution", ylab = "Strongly Dissagree                      Strongly Agree", 
        xlab = "Five Main Questions", horiz=TRUE)
#This takes the sum of five questions from the evolution servey which I believe are relavent and adds
# them all to one barplot which shows the trends of students.  There are the most amount of students that
# are either way, but there are also more students that agree to these statements than those who
# do not. 

#///////////////////////////////////////////////////////////////////////
#2. What student responses had the most significant changes over the duration of the course?
# (You will need to compute the differene between Pre and Post scores).

#get ids
ids <- file[[2]]
#id of row 3
ids[3]

difference <- matrix(list(),nrow=nrow(file),ncol=40)
#difference

j=1
k=2
l=1
#there are 40 questions, start at column 6
for(i in 1:(nrow(file)-1))
{
  #first
  idTemp1=ids[k]
  #last
  idTemp2=ids[j]
  
  #if the ids are the same
  if(idTemp1 == idTemp2) 
  {
    #put the first values in firstAnswers
    firstAnswers <- file[k,c(6:45)]
    #put the second values in lastAnswers
    lastAnswers <- file[j,c(6:45)]
    #add vector of values to position in the array
    difference[l,] <- c(lastAnswers-firstAnswers)
    l=l+1
  }
  j=j+1
  k=k+1
}

#matrix of the differences between the same answers from the beginning to the end of the year
difference

#there are only 30 rows of students who did it before and after.  The rest of the values are NULL which is 
#fine because NULL values will not affect calculations and I do not want to change the code to only
#work with 30 values when this works with however many values there are.

#take a sum of each column
#sums vector
colSum <- c(1:numQuestions)
bigDifference <- c(1:numQuestions)
count = 1;
for(i in 1:numQuestions)
{
    temp = 0;
    for(j in 1:numRows)
    {
      temp = temp + as.integer(difference[j,i])
    }
    colSum[i] = temp
    if(temp<=-40 || temp>=40)
    {
      bigDifference[count] = i;
      count = count + 1;
    }
    
}
for(j in count+1:numQuestions)
{
  bigDifference[j] = NA
}

bigDifference <- bigDifference[!is.na(bigDifference)]
bigDifference
#sums of overall change from the beginning of the year to the end.
colSum

#talk about the questions that changed the most
#In this plot we have the amount of change graphed for each question in the survey.  Not a single question had a 
#increase in the total of agreement with evolution. By the end of the semester the totals for all the students answers
#are all less than what they were at the beginning.  
plot(colSum, xlab="Questions 1-40", ylab="Amount of Change", main="Sum of changes of 30 students answers",
     sub="Negative numbers mean they tended to disagree with the questions more. They went from higher numbers to lower numbers.")



#///////////////////////////////////////////////////////////////////////
#3. Does the major influence attitudes? Major is in spot A.  If it is 1 they are not a biology major, 
#if it is 2 they are a biology major.
i=1
as.integer(file[i,"A"])
#majorAttitude <- c(1:nrow(file))

rowSumA <- c(1:(nrow(file)))
for(i in 1:(nrow(file)))
{
  rowSumA[i]=0
  for(j in 6:(numQuestions+5))
  {
    rowSumA[i]=rowSumA[i]+file[i,j]
  }
}
rowSumA

#I summed the numbers of all of their answer and divided them among Bio and Non-Bio students
boxplot(rowSumA ~ file[[3]], notch=FALSE, main="Sum of Answers for Bio Majors and Non-Bio Majors", 
        varwidth=TRUE, xlab="Bio         vs.         Non-Bio", ylab="Sum of Their Answers")
#From this we can see that the median for Biology students is less than that of Non-Biology students.
#And we can see that there are a wider range of values for Bio students than for Non-Bio students.

#///////////////////////////////////////////////////////////////////////
#4. Does the total number of biology courses a student has taken influence their attitude 
#towards evolution?

totalCourses <- c(1:(nrow(file)))
for(i in 1:(nrow(file)))
{
  totalCourses[i]=0
  totalCourses[i]=file[i,4] + file[i,5]
}
#I plotted the list sums of all their answers against the number of highschool and college bio
# courses they each have taken.  
boxplot(rowSumA ~ totalCourses, notch=FALSE, main="Sum of Answers against Number of Bio Courses Taken", 
        varwidth=TRUE, xlab="Number of highschool and college courses taken", ylab="Sum of Their Answers")
#From thise we can see that students who have taken six or more biology course for the most part 
# are not in favor of evolution while students who have taken less course are more supportive of
# evolution.

#///////////////////////////////////////////////////////////////////////
#5. Can we identify distinct clusters of students with similar opinions?
#if you use the clustering techniques, normalize the answers to the questions before running the
#clustering techniques).

#Each time you work with clustering it is different.  You cannot know for sure
# which cluster will mean what.  
#But since there are 3 groups normaly it clusers it into for, moderate, and against
# evolution.  
#The data then is graphed against 4 questions that give a feel for what the 
# clusters believe (questions from columns 6,9,16,20).
library(cluster)
library(ggplot2)
library(som)
mydata <- normalize(file[,6:45], byrow=TRUE)

fit <- kmeans(mydata, centers=3) 
aggregate(mydata,by=list(fit$cluster),FUN=mean)
mydata <- data.frame(mydata, fit$cluster)

View(mydata)
clusplot(mydata, fit$cluster, main = "Clusters of Similar Opinions", 
         xlab = "", ylab = "", color=TRUE, shade=TRUE, labels=2, lines=0, plotchar=FALSE)

#shows the sum of the answers of each cluster
#interesting columns are
#6 - Nothing in biology makes sense without evolution.
#9 - I would be willing to argue in favor of evolution in a small group of friends.
#16 - Evolution is a good explanation of how new species arise.
#20 - Humans have evolved from previously existing species.
#group x is in more disagreement with evolution
#group y is more moderate
#gropu z is more in favor of evolution
boxplot(file[[6]] ~ mydata$fit.cluster, notch=FALSE, main="Nothing in biology makes sense without evolution.", 
        varwidth=TRUE, xlab="Clusters", ylab="Answers from Strongly Disagree to Strongly Agree")
boxplot(file[[9]] ~ mydata$fit.cluster, notch=FALSE, main="I would be willing to argue in favor of evolution in a small group of friends.", 
        varwidth=TRUE, xlab="Clusters", ylab="Answers from Strongly Disagree to Strongly Agree")
boxplot(file[[16]] ~ mydata$fit.cluster, notch=FALSE, main="Evolution is a good explanation of how new species arise.", 
        varwidth=TRUE, xlab="Clusters", ylab="Answers from Strongly Disagree to Strongly Agree")
boxplot(file[[20]] ~ mydata$fit.cluster, notch=FALSE, main="Humans have evolved from previously existing species.", 
        varwidth=TRUE, xlab="Clusters", ylab="Answers from Strongly Disagree to Strongly Agree")

mydata <- NULL



#///////////////////////////////////////////////////////////////////////
#6. Identify at least one other interesting question that could answer from this data and 
#provide a graphical summary that could help answer the question and then describe the answer.

#MY QUESTION: Is the confortability of a student to argue in favor of evolution to a friend related to the number of
# biology clases they have taken in high school, college, or in total? (column 9)

totalCourses <- c(1:(nrow(file)))
totalHS <- c(1:(nrow(file)))
totalCollege <- c(1:(nrow(file)))
for(i in 1:(nrow(file)))
{
  totalCourses[i]=0
  totalCourses[i]=file[i,4] + file[i,5]
  totalHS[i]=0
  totalHS[i]=file[i,4]
  totalCollege[i]=0
  totalCollege[i]=file[i,5]
}

boxplot(file[[9]] ~ totalHS, notch=FALSE, main="", 
        varwidth=TRUE, ylab="Willingness to argue for evolution", xlab="Number of highschool courses passed")
boxplot(file[[9]] ~ totalCollege, notch=FALSE, main="", 
        varwidth=TRUE, ylab="Willingness to argue for evolution", xlab="Number of college courses taken")
boxplot(file[[9]] ~ totalCourses, notch=FALSE, main="", 
        varwidth=TRUE, ylab="Willingness to argue for evolution", xlab="Total number of courses taken")

par(opar)
detach(file)
