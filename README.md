

##Overview
Project seeks to take raw, untidy data from a wearable computing experiment done by [the UCI Machine Learning Repository] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and clean and convert the data for reproducible use and analysis

##Download Project Data
Download the data to your home directory from where the scripts will be able to reference and read the files.
For the purposes of this project code I have called the directory in which the UCI HAR dataset is placed "C:/"

## Clean the Data and Perform Calculations

```
run_analysis.R
```
    The abovementioned script performs the following actions:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Results: The Clean/Tidy Data Sets
```
tidy_data.txt
```
contains the mean and standard deviation

```
tidy_data2.txt 
```
contains the mean and standard deviation for each subject/test

