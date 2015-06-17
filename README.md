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
) 
Please note that the location of files is relative to where the run_analysis.R script is present.  run_analysis.R should be at the same level as the UCI HAR Dataset folder is.  Please check folderimage.png here (https://github.com/sriramragav/GettingAndCleaningData/issues/1) in the repository for a better view.




