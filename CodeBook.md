# The raw data
1. source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. explanations on the raw data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# The variables in tidydata.txt
### By default of the requirements which explicitly command to use the argument row.name=FALSE in write.table(), the variable names are in the first row of the file tidydata.txt. tidydata2.txt contains the variable names in the column heads.
1. subjectid: identifies the performer of the experiments (the one who walks, upstairs, down, sit, lay and stands)
2. activityname: the activity done, 
  1:WALKING
  2:WALKING_UPSTAIRS
  3:WALKING_DOWNSTAIRS
  4:SITTING
  5:STANDING
  6:LAYING
3. All the other variables are the mean of each variable measurements (which itself was also a mean) stratified by the subject and activity. For further information, read the features_info.txt in the ./UCI HAR Dataset directory, which the run_analysis will automatically produce.
4. List of variables in tidydata.txt. They are transformed to be 'readable' as much as possible.
[1] "activityname"                                                 
[2] "subjectid"                                                    
[3] "TimeBodyAccelerometer.MeanXDirection"                         
[4] "TimeBodyAccelerometer.MeanYDirection"                         
[5] "TimeBodyAccelerometer.MeanZDirection"                         
[6] "TimeGravityAccelerometer.MeanXDirection"                      
[7] "TimeGravityAccelerometer.MeanYDirection"                      
[8] "TimeGravityAccelerometer.MeanZDirection"                      
[9] "TimeBodyAccelerometerJerk.MeanXDirection"                     
[10] "TimeBodyAccelerometerJerk.MeanYDirection"                     
[11] "TimeBodyAccelerometerJerk.MeanZDirection"                     
[12] "TimeBodyGyrometer.MeanXDirection"                             
[13] "TimeBodyGyrometer.MeanYDirection"                             
[14] "TimeBodyGyrometer.MeanZDirection"                             
[15] "TimeBodyGyrometerJerk.MeanXDirection"                         
[16] "TimeBodyGyrometerJerk.MeanYDirection"                         
[17] "TimeBodyGyrometerJerk.MeanZDirection"                         
[18] "TimeBodyAccelerometerMagnitude.Mean"                          
[19] "TimeGravityAccelerometerMagnitude.Mean"                       
[20] "TimeBodyAccelerometerJerkMagnitude.Mean"                      
[21] "TimeBodyGyrometerMagnitude.Mean"                              
[22] "TimeBodyGyrometerJerkMagnitude.Mean"                          
[23] "FrequencyBodyAccelerometer.MeanXDirection"                    
[24] "FrequencyBodyAccelerometer.MeanYDirection"                    
[25] "FrequencyBodyAccelerometer.MeanZDirection"                    
[26] "FrequencyBodyAccelerometer.Meaneq..XDirection"                
[27] "FrequencyBodyAccelerometer.Meaneq..YDirection"                
[28] "FrequencyBodyAccelerometer.Meaneq..ZDirection"                
[29] "FrequencyBodyAccelerometerJerk.MeanXDirection"                
[30] "FrequencyBodyAccelerometerJerk.MeanYDirection"                
[31] "FrequencyBodyAccelerometerJerk.MeanZDirection"                
[32] "FrequencyBodyAccelerometerJerk.Meaneq..XDirection"            
[33] "FrequencyBodyAccelerometerJerk.Meaneq..YDirection"            
[34] "FrequencyBodyAccelerometerJerk.Meaneq..ZDirection"            
[35] "FrequencyBodyGyrometer.MeanXDirection"                        
[36] "FrequencyBodyGyrometer.MeanYDirection"                        
[37] "FrequencyBodyGyrometer.MeanZDirection"                        
[38] "FrequencyBodyGyrometer.Meaneq..XDirection"                    
[39] "FrequencyBodyGyrometer.Meaneq..YDirection"                    
[40] "FrequencyBodyGyrometer.Meaneq..ZDirection"                    
[41] "FrequencyBodyAccelerometerMagnitude.Mean"                     
[42] "FrequencyBodyAccelerometerMagnitude.Meaneq.."                 
[43] "FrequencyBodyBodyAccelerometerJerkMagnitude.Mean"             
[44] "FrequencyBodyBodyAccelerometerJerkMagnitude.Meaneq.."         
[45] "FrequencyBodyBodyGyrometerMagnitude.Mean"                     
[46] "FrequencyBodyBodyGyrometerMagnitude.Meaneq.."                 
[47] "FrequencyBodyBodyGyrometerJerkMagnitude.Mean"                 
[48] "FrequencyBodyBodyGyrometerJerkMagnitude.Meaneq.."             
[49] "angle.tBodyAccelerometerMean.gravity."                        
[50] "angle.tBodyAccelerometerJerkMean..gravityMean."               
[51] "angle.tBodyGyrometerMean.gravityMean."                        
[52] "angle.tBodyGyrometerJerkMean.gravityMean."                    
[53] "angleXDirection.gravityMean."                                 
[54] "angleYDirection.gravityMean."                                 
[55] "angleZDirection.gravityMean."                                 
[56] "TimeBodyAccelerometer.StandardDeviationXDirection"            
[57] "TimeBodyAccelerometer.StandardDeviationYDirection"            
[58] "TimeBodyAccelerometer.StandardDeviationZDirection"            
[59] "TimeGravityAccelerometer.StandardDeviationXDirection"         
[60] "TimeGravityAccelerometer.StandardDeviationYDirection"         
[61] "TimeGravityAccelerometer.StandardDeviationZDirection"         
[62] "TimeBodyAccelerometerJerk.StandardDeviationXDirection"        
[63] "TimeBodyAccelerometerJerk.StandardDeviationYDirection"        
[64] "TimeBodyAccelerometerJerk.StandardDeviationZDirection"        
[65] "TimeBodyGyrometer.StandardDeviationXDirection"                
[66] "TimeBodyGyrometer.StandardDeviationYDirection"                
[67] "TimeBodyGyrometer.StandardDeviationZDirection"                
[68] "TimeBodyGyrometerJerk.StandardDeviationXDirection"            
[69] "TimeBodyGyrometerJerk.StandardDeviationYDirection"            
[70] "TimeBodyGyrometerJerk.StandardDeviationZDirection"            
[71] "TimeBodyAccelerometerMagnitude.StandardDeviation"             
[72] "TimeGravityAccelerometerMagnitude.StandardDeviation"          
[73] "TimeBodyAccelerometerJerkMagnitude.StandardDeviation"         
[74] "TimeBodyGyrometerMagnitude.StandardDeviation"                 
[75] "TimeBodyGyrometerJerkMagnitude.StandardDeviation"             
[76] "FrequencyBodyAccelerometer.StandardDeviationXDirection"       
[77] "FrequencyBodyAccelerometer.StandardDeviationYDirection"       
[78] "FrequencyBodyAccelerometer.StandardDeviationZDirection"       
[79] "FrequencyBodyAccelerometerJerk.StandardDeviationXDirection"   
[80] "FrequencyBodyAccelerometerJerk.StandardDeviationYDirection"   
[81] "FrequencyBodyAccelerometerJerk.StandardDeviationZDirection"   
[82] "FrequencyBodyGyrometer.StandardDeviationXDirection"           
[83] "FrequencyBodyGyrometer.StandardDeviationYDirection"           
[84] "FrequencyBodyGyrometer.StandardDeviationZDirection"           
[85] "FrequencyBodyAccelerometerMagnitude.StandardDeviation"        
[86] "FrequencyBodyBodyAccelerometerJerkMagnitude.StandardDeviation"
[87] "FrequencyBodyBodyGyrometerMagnitude.StandardDeviation"        
[88] "FrequencyBodyBodyGyrometerJerkMagnitude.StandardDeviation"    


# Transformations and work done by the code run_analysis.R
### The code is self explainatory. The followings are the explanations inside the code with codes itself removed.
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

