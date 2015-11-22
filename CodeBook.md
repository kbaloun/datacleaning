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


