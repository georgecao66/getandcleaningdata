#First set the working directory to be inside the "UCI HAR Dataset" directory
#Read all needed files into variable of the R workspace, this include
##subject test and training data set
##activity test and training data set
##feature test and training data set
##label of all features
##activity names

#Data Combine
##combines the rows of the test data with its corresponding training data using rbine
##combine columns of the feature and subject and activity data using cbine
##set the column names of the field according to the feature_label file
##select only the columns which has "mean" or "std" in it from the feature
##replace the activityid of the combined data with the activity name using activity_label.txt, by merge command.

#clean the columns names
##make all column names to lower case
##remove "()" in the column name

#After above steps we get a tidy data set with all features of mean and std and activity names and subject id and variable name

#write the final clean data set to "final.txt"
