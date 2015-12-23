##Transformations to the tidy data
A zipped folder is downloaded from the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The zipped folder is then unzipped in the local directory and saved to the same name as the original folder. A new data set is created by 
merging the training and the test sets. In this new data set, only the measurements on the mean and standard deviation for each measurement
are extracted. Activity and label names are appropriately labled with descriptive names based on the data provided in feature.txt and 
activity_labels.txt.

##Variables
There are 180 observations (6 different activities and 30 participants) and 81 variabls. The meaning of each variable is explained below:
Activity: There are six different activities conducted by each participant.
ParticipantNumber: There are 30 participants, and all of them are numbered from 1 to 30.
All other variables: These variables represents the average measurement collected from each participant in each activity.



