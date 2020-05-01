path <- "C:/Users/Home/Documents/RStudio Scripts/get clean data"
setwd(path)

library(dplyr)

# Assigning all the text files into its respective data frames

activities = read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
features = read.table("./UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
subject_test = read.table("./UCI HAR Dataset/test/subject_tests.txt", col.names = "subject")
X_test = read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test = read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "Activity code")
subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train = read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train = read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "Activity code")


