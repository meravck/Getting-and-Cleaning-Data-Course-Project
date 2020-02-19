library(dplyr)

# read train features measurements
trainFeatures = read.fwf("./UCI HAR Dataset/train/X_train.txt", widths = rep(16, 561))

# read train activity type
trainActivity = read.csv("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

# read train subject id
trainSubjects = read.csv("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# read test features measurements
testFeatures = read.fwf("./UCI HAR Dataset/test/X_test.txt", widths = rep(16, 561))

# read test activity type
testActivity = read.csv("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

# read test subject id
testSubjects = read.csv("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# append test data to train data
features = bind_rows(trainFeatures, testFeatures)
activity = bind_rows(trainActivity, testActivity)
subjects = bind_rows(trainSubjects, testSubjects)

# read features names and id
featuresNames = read.csv("./UCI HAR Dataset/features.txt", header = FALSE, sep=" ")

# read activities labels 
activityLabels = read.csv("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep=" ")

# label the columns
names(subjects)[1] = "SubjectID"
names(activity)[1] = "ActivityType"

# merge subjects and activities
measurementsDS = cbind.data.frame(subjects, activity)

# Extracts only the measurements on the mean and standard deviation for each measurement.
for (i in 1:length(features))
  if (length(grep("mean|std",(featuresNames$V2[i]))) != 0){
    # remove special charactecrs from
    tempColName = gsub("[[:punct:]]", "", as.character(featuresNames$V2[i]))
    # add the col to the final dataset
    measurementsDS[[tempColName]] = features[[i]]
  }

# set the name of each activity
getActivitiyLabel = activityLabels$V2
names(getActivitiyLabel) = activityLabels$V1
for (i in 1:nrow(measurementsDS))
  measurementsDS$ActivityType[[i]] <- as.character(getActivitiyLabel[[measurementsDS$ActivityType[[i]]]])

# set col names to be more friendly
names(measurementsDS) = sub("mean", "Mean", names(measurementsDS))
names(measurementsDS) = sub("std", "Std", names(measurementsDS))
names(measurementsDS) = sub("^t", "time", names(measurementsDS))
names(measurementsDS) = sub("^f", "freq", names(measurementsDS))
  
# compute data set with the average of each variable for each activity and each subject
AveragesDS = measurementsDS %>% group_by(SubjectID, ActivityType) %>% summarise_all(mean)

# write the resulted datasets to files
write.table(measurementsDS, "./MeasurementsDS.txt", row.name=FALSE)
write.table(AveragesDS, "./AveragesDS.txt", row.name=FALSE)


