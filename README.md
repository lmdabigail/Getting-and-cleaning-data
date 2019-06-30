## README

### Peer-graded Assignment: Getting and Cleaning Data Course Project (Course 3 Week 4)

My repository (Lydia Mutiara Dewi's repository) contains the Getting and Cleaning Data Course Project (Course 3 Week 4)

The dataset that I used is the [Human Activity Recognition Using Smartphone](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This repository contains 4 files, which are:
* README.md : The general information about the repository.
* codeBook.md: The file that describes the variables, the data, and any transformations or work that I performed to clean up the data.
* run_analysis.R performs the data preparation and the 5 step to create a tidy data that can be used for later analysis. This script runs the following:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set.
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each  subject.
* independentTidyData.txt : file which contains the Independent Tidy Data after I went throught all the steps which are described above.

