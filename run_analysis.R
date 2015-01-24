# Starting with a clear workspace
rm(list = ls())

# Libraries neede for this to work
library(dplyr,data.table)

# Get the column names
colnames = read.table("UCI HAR Dataset/features.txt",col.names=c("column","label"))

# Read in the data
x_test = read.table("UCI HAR Dataset/test/X_test.txt",col.names=colnames$label)
y_test = read.table("UCI HAR Dataset/test/Y_test.txt",col.names="activityid")
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt",col.names="subjectid")
x_train = read.table("UCI HAR Dataset/train/X_train.txt",col.names=colnames$label)
y_train = read.table("UCI HAR Dataset/train/Y_train.txt",col.names="activityid")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt",col.names="subjectid")

# Merge all data
alldata = cbind(rbind(subject_test, subject_train),rbind(y_test, y_train),rbind(x_test, x_train))
    
# Extract mean and stardard deviation variables
smalldata = select(alldata,subjectid,activityid,contains("mean",ignore.case = FALSE),contains("std",ignore.case = FALSE))

# Name activities in the data set
activitylabels = read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("num","label"))
smalldata$activityid = factor(smalldata$activityid, levels = activitylabels$num, labels = activitylabels$label)

# Create reasonable variable labels
names(smalldata) = gsub("Acc","accelerometer",names(smalldata))
names(smalldata) = gsub("Gyro","gyroscope",names(smalldata))
names(smalldata) = gsub("Mag","magnitude",names(smalldata))
names(smalldata) = gsub("tBody","timebody",names(smalldata))
names(smalldata) = gsub("tGravity","timegravity",names(smalldata))
names(smalldata) = gsub("fBody","fourierbody",names(smalldata))
names(smalldata) = gsub("\\.\\.\\.","dimension",names(smalldata))
names(smalldata) = gsub("\\.","",names(smalldata))
names(smalldata) = tolower(names(smalldata))

# Create a tidy data set with the average of each variable for each activity
# This will be the submitted version of the data
tidydata = smalldata %>% group_by(subjectid, activityid) %>% summarise_each(funs(mean))

# Write the data to txt for submission
write.table(tidydata, file = "tidydata.txt", row.name = FALSE)