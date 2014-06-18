## Code Book for Getting and Cleaning Data Course Project

####Original Data Set and Description


[Zip File] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

[Description] ( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


####Code Actions
Zip File is downloaded and unzipped to specified directory, next:

```
run_analysis.R
``` 
performs the following actions:

  
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. Creates a second, independent tidy data set with the average of each variable
       for each activity and each subject. 


####Output
Cleaned up data is found in:

```
tidy_data.txt
```

```
tidy_data2.txt
```

