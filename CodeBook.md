<h1> Source Data </h1>
See here: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

<h1> Proccessed Data </h1>

<h2> Variables of 2 resulted DataSets</h2>
<h3>measurementsDS</h3>
SubjectID - uniqe id number of the subject in the data set </br>
ActivityType - The activity measured. (6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)</br>
The rest of the Varibles: timeBodyAccMeanX, timeBodyAccMeanY, timeBodyAccMeanZ, ... freqBodyBodyGyroJerkMagMeanFreq</br>
measurements on the mean and standard deviation for each source measurement</br>

<h3>AveragesDS</h3>
SubjectID - uniqe id number of the subject in the data set </br>
ActivityType - The activity measured. (6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)</br>
The rest of the Varibles: timeBodyAccMeanX, timeBodyAccMeanY, timeBodyAccMeanZ, ... freqBodyBodyGyroJerkMagMeanFreq</br>
averages of each variable for each activity and each subject of the measurements in measurementsDS </br>

<h2> Transformation made on the source data </h2>
1. Merged the training and the test sets to create one data set.</br>
2. Extracted only the measurements on the mean and standard deviation for each measurement.</br>
3. Used the activity names file in source to name the activities in the data set</br>
4. labeled the data set with more descriptive variable names.</br>

in addition I createed a second, independent tidy data set with the average of each variable for each activity and each subject of measurementsDS. </br>

<h2> code </h2>
In order to get the data above you need to run the R script called run_analysis.R on the source data files in the repo</br>
