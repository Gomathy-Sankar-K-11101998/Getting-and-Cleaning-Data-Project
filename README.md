# Getting-and-Cleaning-Data-Project

Coursera project - Getting and Cleaning Data Course Project Peer-graded Assignment: Getting and Cleaning Data Course Project.
This repository contains the r files and the codebook for the submission for Getting and Cleaning Data course project.
It has the instructions on how to run analysis on Human Activity recognition dataset and also the description of different variables in the tidy dataset created.

Dataset Human Activity Recognition Using Smartphones

The file 'CodeBook.md' depicts the steps I had performed in deriving the Tidy dataset from the messy dataset and using it to summarize based on the conditions given in the project requirements.

The file 'run_Analysis.R' performs the data preparation by following the different steps described in the 'CodeBook.md' and based on the required steps as shown in the project description.
The project requirements are as follows:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Initially, the messy dataset is downloaded from the source and the files are extracted into the folder. Then the required text files are read into the program as a table. 
Then the train and test data are merged into a single dataset and tidy dataset is then created by extracting only the mean and standard deviation measurements of each measurement. The activities in the datatset are then changed into descriptive activity names and also appropriate labels have been provided for the variable names.
Finally, the required independent final dataset is then created from the tidy dataset and then exported into a text file.
