#Background (contextual) Information
* "tidy dataset" found here: https://s3.amazonaws.com/coursera-uploads/user-527e0abd1f0bd70413be11b8/973502/asst-3/8b3cb730144111e596f3b5b1c590dcb6.txt
* Source for this "tidy dataset":
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Information on how "tidy dataset" was obtained from "Source"
https://github.com/sriramragav/GettingAndCleaningData/blob/master/README.md

#Summary Information "tidy dataset"
* Dimensions: 180 (observations) * 68 (variables)
* Column 1 - "activityDesc" is a factor and has six levels : Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying
* Column 2 - "subject" is an integer variable with values between 1 and 30 (both values inclusive). Each unique number stands for a subject who participated in the experiment.  In this experiment, there were 30 subjects (individuals).
* Columns 3 through 68 are of datatype numeric.  Tney have values between - 1 and 1 (both values inclusive).
* Units for variables in columns 3 - 68: "The data has been normalised into a range between -1 and 1, and dividing entries by their range makes them unitless." - Source: https://class.coursera.org/getdata-015/forum/thread?thread_id=197. 
* Interpreting Variable Headers (for variables 3 - 68): "tBodyAcc.mean.x" captures "mean" of "linear Body Acceleration" along the "x" axis.  "tBodyAcc.std.y" captures "Standard Deviation" of "linear Body Acceleration" along the "y" axis.
* The image here: https://github.com/sriramragav/GettingAndCleaningData/issues/2 is a "keyhole" view of the "tidy dataset". Here is how we interpret the first observation: For "Walking" activity, the values you see from columns 3 - 68 are averages for subject "1".  For example the original dataset (including test and train data) contains 95 observations for subject "1" for "walking".  A mean of these 95 observations is what is captured in the "tidy dataset" across various features (or variables).

# Variables (Features) List:
activityDesc

subject
tBodyAcc.mean.x
tBodyAcc.mean.y
tBodyAcc.mean.z
tBodyAcc.std.x
tBodyAcc.std.y
tBodyAcc.std.z
tGravityAcc.mean.x
tGravityAcc.mean.y
tGravityAcc.mean.z
tGravityAcc.std.x
tGravityAcc.std.y
tGravityAcc.std.z
tBodyAccJerk.mean.x
tBodyAccJerk.mean.y
tBodyAccJerk.mean.z
tBodyAccJerk.std.x
tBodyAccJerk.std.y
tBodyAccJerk.std.z
tBodyGyro.mean.x
tBodyGyro.mean.y
tBodyGyro.mean.z
tBodyGyro.std.x
tBodyGyro.std.y
tBodyGyro.std.z
tBodyGyroJerk.mean.x
tBodyGyroJerk.mean.y
tBodyGyroJerk.mean.z
tBodyGyroJerk.std.x
tBodyGyroJerk.std.y
tBodyGyroJerk.std.z
tBodyAccMag.mean
tBodyAccMag.std
tGravityAccMag.mean
tGravityAccMag.std
tBodyAccJerkMag.mean
tBodyAccJerkMag.std
tBodyGyroMag.mean
tBodyGyroMag.std
tBodyGyroJerkMag.mean
tBodyGyroJerkMag.std
fBodyAcc.mean.x
fBodyAcc.mean.y
fBodyAcc.mean.z
fBodyAcc.std.x
fBodyAcc.std.y
fBodyAcc.std.z
fBodyAccJerk.mean.x
fBodyAccJerk.mean.y
fBodyAccJerk.mean.z
fBodyAccJerk.std.x
fBodyAccJerk.std.y
fBodyAccJerk.std.z
fBodyGyro.mean.x
fBodyGyro.mean.y
fBodyGyro.mean.z
fBodyGyro.std.x
fBodyGyro.std.y
fBodyGyro.std.z
fBodyAccMag.mean
fBodyAccMag.std
fBodyBodyAccJerkMag.mean
fBodyBodyAccJerkMag.std
fBodyBodyGyroMag.mean
fBodyBodyGyroMag.std
fBodyBodyGyroJerkMag.mean
fBodyBodyGyroJerkMag.std


 
