## Human Activity Recognition Code Book

Started with separate training and test data sets

Key measured variables, of which mean and standard deviation were derived:

The raw data for this analysis were taken from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and the extracted zip file contains these files and directories

$ ls -1 UCI_HAR_Dataset/
README.txt
activity_labels.txt
features.txt
features_info.txt
test
train

$ ls -1 UCI_HAR_Dataset/test
Inertial Signals
X_test.txt
subject_test.txt
y_test.txt

$ ls -1 UCI_HAR_Dataset/train
Inertial Signals
X_train.txt
subject_train.txt
y_train.txt

All of the raw files under the /Inertial Signals/ subdirectories were ignored,
as the provided summary files were sufficient for all of the assigned tasks.

Every training file contained 7352 rows, and each test file contained 2947 rows,
and the data set collected for each experimental subject was identical, 
and as far as I could tell, clean and complete.  

The training sets contained data for 21 subjects, and the test set for 9 subjects.
The training and the test sets were combined at the very first step of processing.

subject_*.txt contains a subject ID for each row
y_*.txt contains the activity ID for each variable measurement
X_*.txt contains the 561 variables of observations.  
  Only 66 of these were used at all, the mean() and std() measurements, and in the final tidy set only mean() are included.
  
activity_labels.txt  - labels for the activites
features.txt  - labels for each of the 561 measured variables

The run_analysis.R script contains comments on each processing step.
No meaningful conversions were made to any of the data, 
as primarily this was a arrangement, subsetting, and labeling exercise.

The final tidy data set is written to file tidyActivity.txt
contains just 180 rows, with column values for the mean()
of each measured mean() variable, for each experimental subject for each activity.

Below follows the detail (from the study's features_info.txt file) about the Units of measurement and collection details for each of the presented 33 data columns.  In short, the data are either angular velocity (from the gyroscopy) or acceleration (from the accelerometer), and were captured at a frequency of 50Hz.

====
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
====

