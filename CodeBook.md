

# Transformations and work done by the code run_analysis.R
###The code is self explainatory. The followings are the explanations inside the code with codes itself removed.
1. Merges the training and the test sets to create one data set.
* Download and unzip raw data
* Load the packages required for data manipulation.
* Read dataframes.
* if using RStudio, you can see that test dataframes (3ea) are with 2947 obs. and trains (3ea) with 7352 obs. 
* Look at the variable names in the dataframes.
* Next, since the variable names seems to be redundant as V1 in all the dataframes, give them appropriate variable names.  
* traindata and testdata have 561 variables. Need to use the features.txt.
* Bind the dataframes

2. Extracts only the measurements on the mean and standard deviation for each measurement.
* Make the column names valid and use select of package dplyr.

3. Uses descriptive activity names to name the activities in the data set
* Use mutate() to create a new variable.

4. Appropriately labels the data set with descriptive variable names.
* from the features_info.txt
* The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
* These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
* Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
* Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
* Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
* Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
* Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
* (Note the 'f' to indicate frequency domain signals). 
* These signals were used to estimate variables of the feature vector for each pattern:  
* '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* Take a look on the variable names and start changing them according to the above information
* Honestly, I don't know what these terms mean anyway.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Remove the activitylabel column
* Use group_by function for grouping and subsequent summarizing which gives you the end result
* While the argument row.name=FALSE is required by the submission page, it looks better to not use it

