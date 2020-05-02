#path <- "C:/Users/Home/Documents/RStudio Scripts/get clean data"
#setwd(path)

library(dplyr)

# Assigning all the text files into its respective data frames

activities = read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("Activity code", "activity"))
features = read.table("./UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test = read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test = read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "Activity code")
subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train = read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train = read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "Activity code")


# Performing the merging operations for the first task.

XData = rbind(X_train, X_test)
YData = rbind(y_train, y_test)
SubjectData = rbind(subject_train, subject_test)
Merged_Data = cbind(SubjectData, YData, XData)

# Exract only the columns that contains mean and standard deviation for each measurement 
# and inserting them into the newly created tidy data set

Tidy_Data = Merged_Data %>% select(subject, Activity.code, contains("mean") | contains("std"))

# Changing the activity code into respective names of the activity and changing the subject 
# and acitivity code names

Tidy_Data$Activity.code = activities[Tidy_Data$Activity.code, 2]

# Changing the names of Different masurements of the column names into more readable one

names(Tidy_Data) = gsub("subject", "SubjectID", names(Tidy_Data))
names(Tidy_Data) = gsub("Activity.code", "NameOfActivity", names(Tidy_Data))
names(Tidy_Data) = gsub("^t", "Time", names(Tidy_Data))
names(Tidy_Data) = gsub("^f", "Frequency", names(Tidy_Data))
names(Tidy_Data) = gsub("Acc", "Acceleration", names(Tidy_Data))
names(Tidy_Data) = gsub("Gyro", "Gyroscope", names(Tidy_Data))
names(Tidy_Data) = gsub("BodyBody", "Body", names(Tidy_Data))
names(Tidy_Data) = gsub("Mag", "Magnitude", names(Tidy_Data))
names(Tidy_Data) = gsub("gravity", "Gravity", names(Tidy_Data))
names(Tidy_Data) = gsub("angle", "Angle", names(Tidy_Data))


# Creation of the Final Independent DataSet representing the average of all the masurements
# and grouped based on the subjects and the activity

Final_Dataset = Tidy_Data %>% group_by(SubjectID, NameOfActivity) %>% summarise_all(funs(mean))

# Final step of writing the Final_Dataset into a text file

write.table(Final_Dataset, "Final_Dataset.txt", row.names = FALSE)