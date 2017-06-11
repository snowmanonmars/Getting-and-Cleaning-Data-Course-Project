#You should create one R script called run_analysis.R that does the following.
#1.Merges the training and the test sets to create one data set.
## Download and unzip raw data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "Dataset.zip")
unzip("Dataset.zip")

## Load the packages required for data manipulation.
library(dplyr)

## Read dataframes.
trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainactivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
testactivity <- read.table("./UCI HAR Dataset/test/y_test.txt")

## if using RStudio, you can see that test dataframes (3ea) are with 2947 obs. and trains (3ea) with 7352 obs. 
## Look at the variable names in the dataframes.
names(trainsubject)
names(traindata)
names(trainactivity)
names(testsubject)
names(testdata)
names(testactivity)

## Next, since the variable names seems to be redundant as V1 in all the dataframes, give them appropriate variable names.  
trainsubject <- rename(trainsubject, subjectid = V1)
trainactivity <- rename(trainactivity, activitylabel =V1)
testsubject <- rename(testsubject, subjectid = V1)
testactivity <- rename(testactivity, activitylabel =V1)

## traindata and testdata have 561 variables. Need to use the features.txt.
datavariablename <- read.table("./UCI HAR Dataset/features.txt")
length(datavariablename$V2)
length(traindata)
length(testdata)
colnames(traindata) <- datavariablename$V2
colnames(testdata) <- datavariablename$V2

## Bind the dataframes
train <- cbind(trainsubject,trainactivity,traindata)
test <- cbind(testsubject, testactivity, testdata)
fulldf <- rbind(train, test)


#2. Extracts only the measurements on the mean and standard deviation for each measurement.
## Make the column names valid and use select of package dplyr.
colnamesvalid <- make.names(names=names(fulldf), unique=TRUE, allow_ = TRUE)
colnames(fulldf) <- colnamesvalid
fulldfmeansd <- select(fulldf, subjectid, activitylabel, contains("mean"), contains("std"))
fulldfmeansd <- tbl_df(fulldfmeansd)


#3. Uses descriptive activity names to name the activities in the data set
## Use mutate() to create a new variable.
fulldfmeansd <- mutate(fulldfmeansd, activityname = factor(activitylabel,labels = c("walking", "walking_upstairs", "walking_downstairs", "sitting", "stading","laying")))
View(select(fulldfmeansd, activitylabel, activityname))


#4. Appropriately labels the data set with descriptive variable names.
## from the features_info.txt
## The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
## These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
## Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
## Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
## Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
## Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
## Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
## (Note the 'f' to indicate frequency domain signals). 
## These signals were used to estimate variables of the feature vector for each pattern:  
##  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
## Take a look on the variable names and start changing them according to the above information
## Honestly, I don't know what these terms mean anyway.
names(fulldfmeansd)
names(fulldfmeansd) <- sub("mean..", "Mean", names(fulldfmeansd))
names(fulldfmeansd) <- sub("std..", "StandardDeviation", names(fulldfmeansd))
names(fulldfmeansd) <- sub("^t", "Time", names(fulldfmeansd))
names(fulldfmeansd) <- sub("^f", "Frequency", names(fulldfmeansd))
names(fulldfmeansd) <- sub("Acc", "Accelerometer", names(fulldfmeansd))
names(fulldfmeansd) <- sub("Gyro", "Gyrometer", names(fulldfmeansd))
names(fulldfmeansd) <- sub("Mag", "Magnitude", names(fulldfmeansd))
names(fulldfmeansd) <- sub(".X", "XDirection", names(fulldfmeansd))
names(fulldfmeansd) <- sub(".Y", "YDirection", names(fulldfmeansd))
names(fulldfmeansd) <- sub(".Z", "ZDirection", names(fulldfmeansd))


#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## Remove the activitylabel column
FullDFMeanSd <- select(fulldfmeansd, -activitylabel)
## Use group_by function for grouping and subsequent summarizing which gives you the end result
GroupByActivitySubject <- group_by(FullDFMeanSd, activityname, subjectid)
TidyData <- summarize_each(GroupByActivitySubject, funs(mean))
write.table(TidyData, file = "tidydata.txt", row.name=FALSE)
## While the argument row.name=FALSE is required by the submission page, it looks better to not use it
write.table(TidyData, file = "tidydata2.txt")
