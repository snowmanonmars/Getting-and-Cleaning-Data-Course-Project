# Getting-and-Cleaning-Data-Course-Project
Coursera assignment week 4 of getting and cleaning data

## Project objectives
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How the codes work
1. Put the run_analysis.R file in your current working directory.
2. Run the file by source("run_analysis.R"). It will automatically download the raw data, and perform the project objectives.
3. The final outcome is saved in the working directory. They are tidydata.txt and tidydata2.txt. The second one does not use the argument row.name=FALSE while running the function write.table()

## Raw data source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Full descriptions of the above data could be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Dependencies
1. The code run_analysis.R requires the package dplyr.
