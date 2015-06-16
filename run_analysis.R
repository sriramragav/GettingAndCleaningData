
#Section 0: Download the Zip file 
setwd("C:\\MyFolder\\DataScience\\MyRWork\\3GettingAndCleaningData\\Project-ThroughTheMonth")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="project.zip")

#Go the folder specified in the Working Directory and unzip the file.  

##############################################################################
#Section 1: Load all the files
#Load x_test from file
xTestData <- read.delim(".\\UCI HAR Dataset\\test\\x_test.txt", sep = "", header=FALSE)

#Load x_train from file
xTrainData <- read.delim(".\\UCI HAR Dataset\\train\\x_train.txt", sep = "", header=FALSE)

#Load y_test from file
yTestData <- read.delim(".\\UCI HAR Dataset\\test\\y_test.txt", sep = "", header=FALSE)

#Load Subject_test from file
subjectTestData <- read.delim(".\\UCI HAR Dataset\\test\\subject_test.txt", sep = "", header=FALSE)

#Load y_train from file
yTrainData <- read.delim(".\\UCI HAR Dataset\\train\\y_train.txt", sep = "", header=FALSE)

#Load subject_train from file
subjectTrainData <- read.delim(".\\UCI HAR Dataset\\train\\subject_train.txt", sep = "", header=FALSE)

#Load Features name from file (will become header for xData (both test and train))
features <- read.delim(".\\UCI HAR Dataset\\features.txt", sep = "", header=FALSE)

#Manually modify the activity_labels.txt file.  Introduce a space between
#the number and the text so it can be parsed easily

# Load activity_labels from file
activityLabels <- read.delim(".\\UCI HAR Dataset\\activity_labels.txt", sep = "", header=FALSE)

###############################################################################

#Section 2: Working on headers and Joining Activity/Subject Data

#Change the column names of Data
names(xTestData) <- features[, 2]
names(xTrainData) <- features[, 2]

#Add the y_test and y_train data - This contains six activities
xTestData <- cbind(activity=yTestData$V1, xTestData)
xTrainData <- cbind(activity=yTrainData$V1, xTrainData)

#Add the subject_test and subject_train data to Test/Train Data. 
#This contains data from 30 subjects
xTestData <- cbind(subject=subjectTestData$V1, xTestData)
xTrainData <- cbind(subject=subjectTrainData$V1, xTrainData)

#Merge both test and training sets
xData <- rbind(xTestData, xTrainData)

###############################################################################

#Section 3: Eliminate Columns, Join ActivityDesc

#Eliminate all columns that does not contain strings in "toMatch" variable.
toMatch <- c("mean", "std", "subject", "activity")
tmpNames <- names(xData[1:5, grep(paste(toMatch,collapse="|"), names(xData))] )
xData <- xData[, tmpNames]

#Eliminate columns that have "meanFreq" its name
toMatch <- "meanFreq()"
tmpNames <- names(xData[1:5, grep(paste(toMatch,collapse="|"), names(xData))] )
xData <- xData[,!(names(xData) %in% tmpNames)]

#Convert header names into "standard" form
tmpNames <- gsub("-",".",names(xData))
tmpNames <- gsub("\\(|\\)","",tmpNames)
tmpNames <- gsub(".X",".x",tmpNames)
tmpNames <- gsub(".Y",".y",tmpNames)
tmpNames <- gsub(".Z",".z",tmpNames)
names(xData) <- tmpNames

#Rename columns in activityLabels dataFrame to join later
names(activityLabels) <- c("activity", "activityDesc")

###############################################################################
#End Result
result <- aggregate(. ~ subject+activity, xData,mean)

#required for using join
library(plyr)

#Do a join to get the Activity Labels into Result
result <- join(result, activityLabels)

#Remove Activity (integer) because we have ActivityDescription
result <- result[, -2]

#Get Activity and Subject as the first two columns for better readability
result <- result[,c(68, 1, 2:67)]

###############################################################################

