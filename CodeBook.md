## Code Book

### The run_analysis.R comprises 2 **major** steps:
* A. the data preparation process, and 
* B. 5 steps to create a tidy data set as described in the course project assignment's description

---------------------------------------------------------------------------------------------------------------------------------------------------

### A. The data preparation process :
1. Load the dplyr package

2. Download and extract the folder (name: UCI_HAR_DATASET) from the given source link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. Assigning data to variables:
* **activities<- activity_labels.txt** : List of activities performed when the corresponding measurements were taken.
  *contains: 6 rows and 2 columns*
* **features<-features.txt** : List of all features. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
   *contains: 561 rows and 2 columns*  
* **subjectTest<-subject_test.txt** : Contains test data from 9 out of 30 volunteer (30% data) being observed.
   *contains: 2947 rows and 1 column* 
* **x_test<-X_test.txt** : contains the recorded fetures of test set.
   *contains: 2947 rows and 561 columns*    
* **y_test<-y_test.txt)** : contains the activity code labels of test data.
   *contains: 2947 rows and 1 column* 
* **subjectTrain<-subject_train.txt** :contains train data from 21 out of 30 volunteer (70% data) being observed.
   *contains: 7352 rows and 1 column*   
* **x_train<-X_train.txt** :contains the recorded fetures of train set.
   *contains: 7352 rows and 561 columns* 
* **y_train<-y_train.txt** : contains the activity code labels of train data.
   *contains: 7352 rows and 1 column*
---------------------------------------------------------------------------------------------------------------------------------------------------

### B. 5 steps to create a tidy data set as described in the course project assignment's description:

**Step1: Merges the training and the test sets to create one data set (which named mergedData):**

* **subjects** is created by merging **subjectTrain** and **subjectTest** by using **rbind()**.
  *contains: 10299 rows and 1 column*
* **x** is created by merging **x_train** and **x_test** by using **rbind()**
  *contains: 10299 rows and 561 columns*
* **y** is created by merging **y_train** and **y_test** by using **rbind()**
  *contains: 10299 rows and 1 column*
* Finally, **mergedData** is created by merging **subjects** , **x**, and **y** by using **cbind()**
  *contains: 10299 rows and 563 columns*

**Step2: Extracts only the measurements on the mean and standard deviation for each measurement.**

**tidyDataSet**  is created by:
subsetting **MergedData**, by only selecting columns: **subjects** and **activity** together with the **mean** and the **standard deviation** for each measurement.
*contains: 10299 rows and 88 columns*

**Step3: Uses descriptive activity names to name the activities in the data set.**

Each numbers in the **activity** column from the **tidyDataSet** is replaced with its corresponding activity from the **second column** of the **activities** variable

**Step4: Appropriately labels the data set with descriptive variable names.**

* All names started with **t (^t)** in every variable name is replaced by **Time**
* All names started with **f (^f)** in every variable name is replaced by **Frequency**
* All names contains **Acc** in every variable name is replaced by **Accelerometer**
* All names contains **Coeff** in every variable name is replaced by **Coefficient**
* All names contains **Gyro** in every variable name is replaced by **Gyroscope**
* All names contains **Mag** in every variable name is replaced by **Magnitude**
* All names contains **std** in every variable name is replaced by **StandardDeviation**

**Step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

* **independentTidyData**  is created by sumarizing **tidyDataSet** with the **means** of each variable for each activity and each subject, after **groupped by subjects and activity**. *contains: 180 rows and 88 columns*
* Export **independentTidyData**  into **independentTidyData.txt** file.


