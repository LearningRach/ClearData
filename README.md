# CleanData Project

this file describing how the script works and the code book describing the variables.

run_analysis.R does the following. 

  1- Merges the training and the test sets to create one data set.
  
  2- Extracts only the measurements on the mean and standard deviation for each measurement. 
  
  3- Uses descriptive activity names to name the activities in the data set.
  
  4- Appropriately labels the data set with descriptive variable names. 
  
  5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The dataset being used, Samsung Data is : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis.R  can be run as long as the Samsung data is in the working directory. 

The output is the tidy.txt file.
