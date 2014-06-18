require('data.table')
require('utils')


###Downloads and unzips the project data into a specified drive of your choice
download_data <- function () {
  zip.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  zip.file <- 'dataset.zip'

  download.file(zip.url, destfile = zip.file, method = 'curl') 
  unzip(zip.file, exdir=("C:/")) #replace "C:/" with the directory where you want to put the zip file
  print("Data successfully downloaded. Carry on")
}

#read test and training set files and merge the data

# for test set
#need to place directory before "UCI HAR"
test_datax<-read.table("C:/UCI HAR dataset/train/X_train.txt")
test_datay<-read.table("C:/UCI HAR dataset/train/y_train.txt")
test_subject<-read.table("C:/UCI HAR dataset/train/subject_train.txt")

# for train set
train_datax<-read.table("C:/UCI HAR dataset/test/X_test.txt")
train_datay<-read.table("C:/UCI HAR dataset/test/y_test.txt")
train_subject<-read.table("C:/UCI HAR dataset/test/subject_test.txt")

# 1. Merges the training and the test sets to create one data set.
xmerge<-rbind(test_datax, train_datax)
ymerge<-rbind(test_datay, train_datay)
subjectmerge<-rbind(test_subject, train_subject)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
# extract only the features we want--- mean, std --- aka "goodfeature"--- aka "gf"
metrics<- read.table("C:/UCI HAR dataset/features.txt")
 
goodfeature<-grep("mean\\(\\)|std\\(\\)", metrics$V2)
gf<-goodfeature
length(gf)

xmerge<-xmerge[, gf]

names(xmerge) <- gsub("\\(\\)", "", metrics[gf, 2])


#3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("C:/UCI HAR dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
activityLabel <- activity[ymerge[, 1], 2]
ymerge[, 1] <- activityLabel
names(ymerge) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.
#label ymerge with correct activity name
names(subjectmerge)<-"subject"

# 1st tidied up data set
tidy_data<-cbind( subjectmerge, ymerge, xmerge)

#write tidy_data results to text file
write.table(tidy_data, "tidy_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueact<-length(unique(ymerge[,1]))
subjectl<-length(table(subjectmerge))
numcotidy<-ncol(tidy_data)


tidy_data2<-matrix(NA, nrow=subjectl*uniqueact, ncol=numcotidy)

tidy_data2<-as.data.frame(tidy_data2)
row <- 1
for(i in 1:subjectl) {
	for(j in 1:uniqueact) {
         tidy_data2[row, 1] <- sort(unique(subjectmerge)[, 1])[i]
         tidy_data2[row, 2] <- activity[j, 2]
         bool1 <- i == tidy_data$subject
         bool2 <- activity[j, 2] == tidy_data$activity
         tidy_data2[row, 3:numcotidy] <- colMeans(tidy_data[bool1&bool2, 3:numcotidy])
         row <- row + 1
    }
}

colnames(tidy_data2)<-colnames(tidy_data)

#check the new data set
head(tidy_data2)

#write tidy_data2 results to text file
write.table(tidy_data2, "tidy_data2.txt")
