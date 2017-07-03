# CleanData1
Getting and Cleaning Data
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit:

a tidy data set as described below.
a link to a Github repository with your script for performing the analysis.
a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected

For this project we use the libraries tidyr, dplyr. This libraries must be instaled before run the procedures.
The data must be downloaded and unzipped.
There are two procedures_:
	readDataSet: This procedure read a dataSet from the files unzipped (train o test dataset)
	run_analysis: The main procedure performe all the tasks and use readDataSet to read the datasets.
		The tasks perrmoformed are:
		Step 1: Merges the training and the test sets to create one data set.
		Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
		Step 3: Uses descriptive activity names to name the activities in the data set
		Step 4: Appropriately labels the data set with descriptive variable names
		Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
		
The procedure has a parameter that is the main directory in which the dataset is ("C:/.../UCI HAR Dataset" for example)