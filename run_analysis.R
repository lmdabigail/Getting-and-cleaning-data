#The run_analysis.R comprises 2 major steps:
#A. the data preparation process, and 
#B. 5 steps to create a tidy data set as described in the course project assignment's description

#---------------------------------------------------------------------------------------------------------------------------------------------------

#A. The data preparation process :

#1. Load the dplyr package
library(dplyr)

#2.Download and extract the folder (name: UCI_HAR_DATASET) from the given source link:
if(!file.exists(".data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/dataset.zip")
dataset <- unzip("./data/dataset.zip")

#3. Assigning data to variables:
activities<- read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("codeAct","activityNames"))
features<-read.table("UCI HAR Dataset/features.txt",col.names=c("codeFeat","featNames"))
subjectTest<-read.table("UCI HAR Dataset/test/subject_test.txt",col.names=("subjects"))
x_test<-read.table("UCI HAR Dataset/test/X_test.txt",col.names = features$featNames)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt",col.names="activity")
subjectTrain<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names=("subjects"))
x_train<-read.table("UCI HAR Dataset/train/X_train.txt",col.names = features$featNames)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt",col.names="activity")

#---------------------------------------------------------------------------------------------------------------------------------------------------
#B. 5 steps to create a tidy data set as described in the course project assignment's description

#Step1: Merges the training and the test sets to create one data set (which named mergedData):

subjects <- rbind(subjectTrain,subjectTest)
x <- rbind(x_train,x_test)
y <- rbind(y_train,y_test)
mergedData <- cbind(subjects,x,y)

#Step2: Extracts only the measurements on the mean and standard deviation for each measurement.
tidyDataSet <- mergedData %>% select(subjects,activity,contains("mean"),contains("std"))

#Step3: Uses descriptive activity names to name the activities in the data set.
tidyDataSet$activity <- activities[tidyDataSet$activity, 2]

#Step 4: Appropriately labels the data set with descriptive variable names.
names(tidyDataSet) <- gsub("^t","Time", names(tidyDataSet))
names(tidyDataSet) <- gsub("^f","Frequency", names(tidyDataSet))
names(tidyDataSet) <- gsub("Acc","Accelerometer", names(tidyDataSet))
names(tidyDataSet) <- gsub("Coeff","Coefficient", names(tidyDataSet))
names(tidyDataSet) <- gsub("Gyro","Gyroscope", names(tidyDataSet))
names(tidyDataSet) <- gsub("Mag","Magnitude", names(tidyDataSet))
names(tidyDataSet) <- gsub("std","StandardDeviation", names(tidyDataSet))


#Step5: From the data set in step 4, 
#creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject.

independentTidyData <- tidyDataSet %>%
  group_by(subjects, activity) %>%
  summarise_all(funs(mean))

#Export the data
write.table(independentTidyData,"independentTidyData.txt", row.name=FALSE)