# GettingAndCleaningData - Project
This file does a couple of things
* It explains the HOW of things - from the "Getting And Cleaning Data" project perspective.
* Throws a brief light on all the files included in this repository namely:
     * run_analysis.md
     * CodeBook.md
     * tidyds.txt
   
# The Assignment:
The Human Activity Recognition using Smartphones Dataset Version 1.0 was created based on an experiment that was carried out with a group of 30 volunteers (referred to as "Subjects" in the dataset) who performed six activities (Walking, Walking_upstairs, Walking-downstairs,Sitting, Standing, Laying).  Information about this dataset can be found in the HAR-Readme.txt in this repository.  

The dataset itself can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The assignment demands that we do the following:

 You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#The Process - Section 1 : Downloading files
The first step in the process is to download the files from the location specified above.  To do this, first we setup a working directory in R through the command:
setwd("C:\\MyFolder\\DataScience\\MyRWork\\3GettingAndCleaningData\\Project-ThroughTheMonth")

This is followed up with downloading the zip file using the commands:
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="project.zip")

The process of unzipping is manual.  By choosing a suitable unzipping program (like winzip or 7-zip), the contents of the zip file are extracted to the same folder set by the working directory.  At the end of this process, you end up with the following:
* UCI HAR Dataset folder - with "test" and "train" subfolders
* activity_labels.txt, features.txt, features_info.txt and readme.txt files
* test and train subfolderes contain x_test/train, y_test/train and subject_test/train txt files.
* The "Inertial signals" folder present in both the test and train subfolders are not considered for the purposes of tha assignment.  This is because, even if the values were to be included during the creation of a dataset, the columns would have to be filtered during subsequent processing (see Step 2 of the requirement of this project).  Also, the Course Discussion here (https://class.coursera.org/getdata-015/forum/thread?thread_id=26 - Question: Do we need an inertial folder) points to the same fact I have stated here.

The following command reads contents of x_test.txt file in the test folder.
* xTestData <- read.delim(".\\UCI HAR Dataset\\test\\x_test.txt", sep = "", header=FALSE)

Similarly, all the other relevant files (subject_test.txt, y_test.txt, x_train.txt, subject_train.txt, y_train.txt, activity_labels.txt and features.txt are read into dataframes).

Please note that the location of files is relative to where the run_analysis.R script is present.  run_analysis.R should be at the same level as the UCI HAR Dataset folder is.  Please check folderimage.png here (https://github.com/sriramragav/GettingAndCleaningData/issues/1) in the repository for a better view.

# Cleaning and Merging Test and Training Datasets
There are a few things we can observe after loading the datasets. we have captured info about "Test" data only - to keep our discussion simple.
* Dimensions of xTest Data : 2947 x 561 (Observations (rows) vs Variables (columns) )
* Dimensions of yTest Data : 2947 x 1 
* Dimensions of subjectTest Data : 2947 x 1
* Dimensions of features Data : 561 * 2
* Dimensions of activity_labels : 6 * 2

Also,
We know that xTest does not have headers.  Looking at the dimensions and checking at readme.md that comes with the dataset, we can easily conclude that headers are in features dataset.  Using this information,
* names(xTestData) <- features[, 2]
ensures that xTestData have headers.  We repeat the same exercise for xTrainData.  

We know from readme that there are 30 subjects who have taken this test.  Looking at subjectTest Data's dimensions, we can easily add this as a column to xTestData.  After this merge, we will be able to associate each observation in xTestData to a subject.  The joining of subjectTest to xData is done through this command:
* xTestData <- cbind(subject=subjectTestData$V1, xTestData)
The same exercise is repeated for xTrainData.

We know that there are six activities and each activity is given an number.  The activity_labels dataset gives us this information.  yTest data contains the activityid for each of the 2947 observations.  We add this information to the xTest Dataset.
* xTestData <- cbind(activity=yTestData$V1, xTestData)
The same exercise is repeated for xTrainData.

With this information, now for each observation in the original xTest Data set, we have added information on who is the subject (a integer between 1 - 30) the values apply to, and which activity was performed (an integer between 1 - 6, each corresponding to an activity as specified in activity_labels table).
The same exercise is repeated for xTrainData.

Now, it is time to merge both datasets.  You would have noticed right at the beginning, that as far as the dimensions are concerned, the difference between the datasets was in the number of observations.  Since the variables are the same (563 now, because we have added two additional variables - activity and subject), we simply do a "UNION" of two datasets using the following command.
* xData <- rbind(xTestData, xTrainData)

Again, to reiterate, 
* Dimensions of xTestData (after changes):        2947 * 563
* Dimensions of xTrainData (after changes):       7352 * 563
* Dimensions of xData (xTestData + xTrainData) : 10299 * 563

This completes "Merging the two datasets" - Step 1 of our requirement.

# Extracting only the "mean" and "std" columns.
Now onto the second requirement that asks us to extract only mean and std columns.  This is accomplished by the following commands.

* toMatch <- c("mean", "std", "subject", "activity")
* tmpNames <- names(xData[1:5, grep(paste(toMatch,collapse="|"), names(xData))] )
* xData <- xData[, tmpNames]

* toMatch <- "meanFreq()"
* tmpNames <- names(xData[1:5, 
* grep(paste(toMatch,collapse="|"), names(xData))] )
* xData <- xData[,!(names(xData) %in% tmpNames)]

I chose to remove all columns that had the word either "mean" or "std" in the header.  After viewing through all discussion threads and not coming to a concrete conclusion on which way to go, I have simply taken this approach.

#Appropriately labelling the data 
I have followed the style guide here:
* https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml
for labelling the column headers.  

It is not generally recommended that we have hyphens or parenthesis and so, following the style guide, column header named "tBodyAccJerk-energy()-X" becomes "tBodyAccJerk.energy.x".  I have chosen to use capitals in the column names (instead of, say "tbodyaccjerk.energy.x", it reads "tBodyAccJerk.energy.x" for better readability.

The labelling is done through the following commands:

* tmpNames <- gsub("-",".",names(xData))
* tmpNames <- gsub("\\(|\\)","",tmpNames)
* tmpNames <- gsub(".X",".x",tmpNames)
* tmpNames <- gsub(".Y",".y",tmpNames)
* tmpNames <- gsub(".Z",".z",tmpNames)
* names(xData) <- tmpNames

