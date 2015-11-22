## Summarization of the Human Activity Recognition dataset

This analysis created a summary of mean values on 33 movement variables
for 6 activites from each of 30 test subjects, drawn from smartphone 
accelerometer and gyroscope data by Reyes-Ortiz, Anguia, Ghio and their team in Italy.

The run_analysis.R script takes the raw data as prepared by UCI and explained at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and downloaded at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Running the run_analysis script creates a single tidy data set, tidyActivity.txt
which contains the mean values for each of the 30 subjects, for each of the 6 studied activities:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

My objective for this summarization is:

 You should create one R script called run_analysis.R that does the following. 

    o Merges the training and the test sets to create one data set.
    o Extracts only the measurements on the mean and standard deviation for each measurement. 
    o Uses descriptive activity names to name the activities in the data set
    o Appropriately labels the data set with descriptive variable names. 
    o From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The CodeBook.md file in this project further explains the data and our processing steps.




