Course Project - Getting & Cleaning Data ()

Objective: The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


@@License: [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The data were unzipped in a local directory C:/.../UCI HAR Dataset

Workings of the script The script performs following steps on the downloaded data mentioned above

Step 1: Merges the training and the test sets to create one data set.
		For this step we write a procedure readDataSet([test|train], namesX) that read the dataset passed by parameter.For each dataset procedure returns a dataFrame whith de data obtained from the files X_[train|test], y_[train|test] and subject_[train|test].
		Set up the column names based on feature names passed in the arguments. Also labels the column read in for subject as "subject" 

		Read the features.txt file, and call readDataSet for train and test datasets, using the names obtained from features file.
		Combine/Merge the data set using rbind, obtaining totalDataSet
		Add a new variable ActivityLabel mergin totalDataSet whith activitylab (read from activity_labels.txt)

		The merged data-set with 10299 observations of 563 variables (561 measurements)

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement

		Generates a subset from the merged data generated in Step 1. This subset includes all the columns that contain "mean" and std in column names. Add the ActivityLabel and subject columns
		The dataset obtained has 10299 observations, and 68 variables (whith 66 measurements). We call subTotalDataSet

Step 3: Uses descriptive activity names to name the activities in the data set

		Add a new variable ActivityLabel mergin subTotalDataSet whith activitylab (read from activity_labels.txt) and remove Activity column.
		

Step 4: Appropriately labels the data set with descriptive variable names
		For all the column names of data-set do the changes bellow:
			Remove "(", ")".
			Substitute the initial "t" by "TimeDomain_"
			Substitute the initial "f" by "FrequencyDomain_"
			Substitute "Acc" by "Accelerometer"
			Substitute "Gyro" by "Gyroscope"
			Substitute "Mag" by  "Magnitude"
			Substitute "-mean-" by "_Mean_"
			Substitute "-std-" by "_StandardDeviation_"
			Substitute "-" by "_"

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
		Use group_by, and summarise_each function to obtain, the grouped tidy data-set
		Writes out the grouped tidy data-set.
		This data set has 68 variables and 180 observations (30 subjects * 6 diferents activities)


Subject : int : Range [1 - 30] : Subjects who performed the activity 
ActivityLabel : Factor w/ 6 levels : LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS 
TimeDomain_BodyAccelerometer_StandardDeviation_X  : num : Range [-1, 1]         
TimeDomain_BodyAccelerometer_Mean_X  : num : Range [-1, 1]                              
TimeDomain_BodyAccelerometer_StandardDeviation_Y  : num : Range [-1, 1]                 
TimeDomain_BodyAccelerometer_Mean_Y  : num : Range [-1, 1]                              
TimeDomain_BodyAccelerometer_StandardDeviation_Z  : num : Range [-1, 1]                 
TimeDomain_BodyAccelerometer_Mean_Z  : num : Range [-1, 1]                              
TimeDomain_GravityAccelerometer_StandardDeviation_X  : num : Range [-1, 1]              
TimeDomain_GravityAccelerometer_Mean_X  : num : Range [-1, 1]                           
TimeDomain_GravityAccelerometer_StandardDeviation_Y  : num : Range [-1, 1]              
TimeDomain_GravityAccelerometer_Mean_Y  : num : Range [-1, 1]                           
TimeDomain_GravityAccelerometer_StandardDeviation_Z  : num : Range [-1, 1]              
TimeDomain_GravityAccelerometer_Mean_Z  : num : Range [-1, 1]                           
TimeDomain_BodyAccelerometerJerk_StandardDeviation_X  : num : Range [-1, 1]             
TimeDomain_BodyAccelerometerJerk_Mean_X  : num : Range [-1, 1]                          
TimeDomain_BodyAccelerometerJerk_StandardDeviation_Y  : num : Range [-1, 1]             
TimeDomain_BodyAccelerometerJerk_Mean_Y  : num : Range [-1, 1]                          
TimeDomain_BodyAccelerometerJerk_StandardDeviation_Z  : num : Range [-1, 1]             
TimeDomain_BodyAccelerometerJerk_Mean_Z  : num : Range [-1, 1]                          
TimeDomain_BodyGyroscope_StandardDeviation_X  : num : Range [-1, 1]                     
TimeDomain_BodyGyroscope_Mean_X  : num : Range [-1, 1]                                  
TimeDomain_BodyGyroscope_StandardDeviation_Y  : num : Range [-1, 1]                     
TimeDomain_BodyGyroscope_Mean_Y  : num : Range [-1, 1]                                  
TimeDomain_BodyGyroscope_StandardDeviation_Z  : num : Range [-1, 1]                     
TimeDomain_BodyGyroscope_Mean_Z  : num : Range [-1, 1]                                  
TimeDomain_BodyGyroscopeJerk_StandardDeviation_X  : num : Range [-1, 1]                 
TimeDomain_BodyGyroscopeJerk_Mean_X  : num : Range [-1, 1]                              
TimeDomain_BodyGyroscopeJerk_StandardDeviation_Y  : num : Range [-1, 1]                 
TimeDomain_BodyGyroscopeJerk_Mean_Y  : num : Range [-1, 1]                              
TimeDomain_BodyGyroscopeJerk_StandardDeviation_Z  : num : Range [-1, 1]                 
TimeDomain_BodyGyroscopeJerk_Mean_Z  : num : Range [-1, 1]                              
TimeDomain_BodyAccelerometerMagnitude_std  : num : Range [-1, 1]                        
TimeDomain_BodyAccelerometerMagnitude_mean  : num : Range [-1, 1]                       
TimeDomain_GravityAccelerometerMagnitude_std  : num : Range [-1, 1]                     
TimeDomain_GravityAccelerometerMagnitude_mean  : num : Range [-1, 1]                    
TimeDomain_BodyAccelerometerJerkMagnitude_std  : num : Range [-1, 1]                    
TimeDomain_BodyAccelerometerJerkMagnitude_mean  : num : Range [-1, 1]                   
TimeDomain_BodyGyroscopeMagnitude_std  : num : Range [-1, 1]                            
TimeDomain_BodyGyroscopeMagnitude_mean  : num : Range [-1, 1]                           
TimeDomain_BodyGyroscopeJerkMagnitude_std  : num : Range [-1, 1]                        
TimeDomain_BodyGyroscopeJerkMagnitude_mean  : num : Range [-1, 1]                       
FrequencyDomain_BodyAccelerometer_StandardDeviation_X  : num : Range [-1, 1]            
FrequencyDomain_BodyAccelerometer_Mean_X  : num : Range [-1, 1]                         
FrequencyDomain_BodyAccelerometer_StandardDeviation_Y  : num : Range [-1, 1]            
FrequencyDomain_BodyAccelerometer_Mean_Y  : num : Range [-1, 1]                         
FrequencyDomain_BodyAccelerometer_StandardDeviation_Z  : num : Range [-1, 1]            
FrequencyDomain_BodyAccelerometer_Mean_Z  : num : Range [-1, 1]                         
FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_X  : num : Range [-1, 1]        
FrequencyDomain_BodyAccelerometerJerk_Mean_X  : num : Range [-1, 1]                     
FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_Y  : num : Range [-1, 1]        
FrequencyDomain_BodyAccelerometerJerk_Mean_Y  : num : Range [-1, 1]                     
FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_Z  : num : Range [-1, 1]        
FrequencyDomain_BodyAccelerometerJerk_Mean_Z  : num : Range [-1, 1]                     
FrequencyDomain_BodyGyroscope_StandardDeviation_X  : num : Range [-1, 1]                
FrequencyDomain_BodyGyroscope_Mean_X  : num : Range [-1, 1]                             
FrequencyDomain_BodyGyroscope_StandardDeviation_Y  : num : Range [-1, 1]                
FrequencyDomain_BodyGyroscope_Mean_Y  : num : Range [-1, 1]                             
FrequencyDomain_BodyGyroscope_StandardDeviation_Z  : num : Range [-1, 1]                
FrequencyDomain_BodyGyroscope_Mean_Z  : num : Range [-1, 1]                             
FrequencyDomain_BodyAccelerometerMagnitude_std  : num : Range [-1, 1]                   
FrequencyDomain_BodyAccelerometerMagnitude_mean  : num : Range [-1, 1]                  
FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_std  : num : Range [-1, 1]           
FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_mean  : num : Range [-1, 1]          
FrequencyDomain_BodyBodyGyroscopeMagnitude_std  : num : Range [-1, 1]                   
FrequencyDomain_BodyBodyGyroscopeMagnitude_mean  : num : Range [-1, 1]                  
FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_std  : num : Range [-1, 1]               
FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_mean  : num : Range [-1, 1]          
