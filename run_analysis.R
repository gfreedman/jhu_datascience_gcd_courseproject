# get into the directory where it's safe to run the analysis:
setwd("/Users/freeg007/Documents/Coursera/Johns\ Hopkins\ University/Data\ Science/Getting\ and\ Cleaning\ Data/jhu_datascience_gcd_courseproject")
getwd() 

# You could modify your setwd to where you had checked out this repository:

#########################################################################################################
#1) Merges the training and the test sets to create one data set.
#########################################################################################################
# Step 01) Configuration Data:

# We need our configuration/settings data first (what recorded stuff means) before we can make sense of our actual data (what stuff we've been recording)
# We put these in as global variables:

# root folder for raw data:
MAIN_FOLDER ="UCI HAR Dataset/"

# First we need a lookup dictionary of activity and feature labels:
activityLabels <- read.table(paste0(MAIN_FOLDER,"/activity_labels.txt"))
featuresLabels <- read.table(paste0(MAIN_FOLDER,"/features.txt"))

# Rename columns for easier lookup, since 'V1' and 'V2' are cryptic at best:
colnames(activityLabels) <- c("id", "name")
colnames(featuresLabels) <- c("id", "name")

# Make sure to convert factors to strings in activityLabels and featuresLabels:
activityLabels <- data.frame(lapply(activityLabels, as.character), stringsAsFactors=FALSE)
featuresLabels <- data.frame(lapply(featuresLabels, as.character), stringsAsFactors=FALSE)

# Define recognizable data sets: 
TEST = "test"
TRAIN = "train"

# Step 02) Binding together test data
# Now we have to go into the test and train folders and bind them together
# - "subject_test.txt" --> single column raw data consisting of a row of subject ID's for each impression recorded 
#   - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
# - "y_test.txt" --> single column of raw data consisting of a row of training labels ID's (activities) for each impression recorded 
#   - This should be linked to activityLabels
# - "X_test.txt" --> actual training set of data, the raw values we've been recording for each test impression, this is the heart of the data set and what we ultiamtely care about


####################################################################################################################
# Create either a test or train data set 
# I made a function here to avoid duplication and since this function also does a lot of heavy lifting
# @param  setType String
# @return data.frame
###################################################################################################################
createDataSet <- function(setType) 
{
  # Guard clause against invalid data sets:
  if(setType!=TEST & setType!=TRAIN)
  {
    message(paste0("setType is: ",setType))
    stop("Error we don't have a valid set to look at!")
  }
  
  # Raw data locations:
  subjectDataLoc <- paste0(MAIN_FOLDER,setType,"/","subject_",setType,".txt")
  labelsDataLoc <- paste0(MAIN_FOLDER,setType,"/","y_",setType,".txt")
  trainingSetDataLoc <- paste0(MAIN_FOLDER,setType,"/","X_",setType,".txt")
  
  # read in raw text files
  subjects <- read.table(subjectDataLoc)
  labelY <- read.table(labelsDataLoc)
  dataX <- read.table(trainingSetDataLoc) # takes awhile ...
  
  # replace column names with more readable values:
  colnames(subjects) <- c("subject_id")
  colnames(labelY) <- c("activity_id")

  # loop through all feature labels to extract label and rename columns in dataX
  numFeatureRows <- as.numeric(nrow(featuresLabels))
  for (i in 1:numFeatureRows) 
  {
    # extract label from lookup ID:
    label = featuresLabels[i,2]
    
    # change column name in dataX to a human readable name:
    colnames(dataX)[i] <- label
  }
  
  numRows <- as.numeric(nrow(labelY))
  
  # assign a blank column to labelY to contain the activity name we're going to add
  labelY$activity_name <- NA
  labelY$subject_id <- NA
  labelY$set_type <- setType # we need to distinguish that this is in the 'test' set or train set

  # iterate through all activity labels
  for (i in 1:numRows) 
  {
    # lookup the activity ID in labelY:   
    activityID = labelY[i,1]
    
    # lookup the activity name based on the activityID:
    activityName = activityLabels[activityID,2]
    
    # now update colummn in labelY:
    labelY[i,2] = activityName
    
    # now add the subject ID to the labelY data frame:
    subjectId = subjects[i,1]
    labelY[i,3] = subjectId
  }
  
  # Initialize a new data.frame:
  cleanedTestData <- data.frame()
  cleanedTestData <- cbind(labelY, dataX)
  
  # put subject ID at front of data set since it makes more sense that way:
  numColumns = as.numeric(ncol(cleanedTestData))
  cleanedTestData <- cleanedTestData[ ,c(4,3,1,2,5:numColumns)]
  
  # return data set:
  cleanedTestData
}

# Generate test and train sets using the handy 'createDataSet' function below:
trainDataSet <- createDataSet(TRAIN)
testDataSet <- createDataSet(TEST)

# now merge train and test data sets into one data set
finalDataSet <- rbind(trainDataSet,testDataSet)

# look at dimensions to make sure it makes sense
#print(dim(trainDataSet))
#print(dim(testDataSet))
#print(dim(finalDataSet))

#########################################################################################################
# 02) Extracts only the measurements on the mean and standard deviation for each measurement.
# 03) Uses descriptive activity names to name the activities in the data set
# 04) Appropriately labels the data set with descriptive variable names. 
#########################################################################################################

# let's see how hard it is to remove columns based on a condition:

# look for indices where we have mean or std in the col name:
meanCols <- grep(tolower("mean"),colnames(finalDataSet))
stdDevCols <- grep(tolower("std"),colnames(finalDataSet))

# now combine them with our first four columns we want to keep to get indices for good columns:
goodColumns <- c(1:4, meanCols, stdDevCols)

#subset the data frame with the good columns
finalDataSet <- finalDataSet[ goodColumns ] # before we had 565 columns, now we have 83

# now find and remove all columns with meanFreq since we can remove them per --> https://class.coursera.org/getdata-004/forum/thread?thread_id=229
meanColsWithMeanFreq <- grep("meanFreq", colnames(finalDataSet))
finalDataSet <- finalDataSet[ -c(meanColsWithMeanFreq) ]

#########################################################################################################
# 04) Appropriately labels the data set with descriptive variable names. 
#########################################################################################################

# Make column names more readable and easier to use in R coding later on by removing chars "(" and ")" and replacing "-" with underscore "_" chars:
colnames(finalDataSet) <- gsub('(', '', colnames(finalDataSet), fixed=TRUE)
colnames(finalDataSet) <- gsub(')', '', colnames(finalDataSet), fixed=TRUE)
colnames(finalDataSet) <- gsub('-', '_', colnames(finalDataSet), fixed=TRUE)

#######################################################################################################################
# 05) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#######################################################################################################################

# for testing:
#write.csv(finalDataSet, file = "finalDataSet.csv")

# get all unique subject ID's in the data frame:
subjects <- unique(finalDataSet$subject_id)

# now sort them from least to greatest:
subjects <- sort(subjects) 
numSubjects <- length(subjects)
numActivities <- as.numeric(nrow(activityLabels))
numCols <- ncol(finalDataSet)

# this is the second tidy set of data
secondSet <- data.frame()

# loop through all unique subject ID's
for (i in 1:numSubjects) 
{
  subjectID = i
  
  # then for each unique activity:
  for (j in 1:numActivities)
  {
    activityName = activityLabels[j,2]
    
    # create the rows for each unique subject/activity combination possible (180 rows)
    newRow = data.frame(subject_id=subjectID, activity = activityName)

    # we need to get all the measurements (rows + columns) from finalDataSet for a specific subject and activity combo:
    subjectAndActivtyName =  subset(finalDataSet, finalDataSet$subject_id==subjectID & finalDataSet$activity_name==activityName,)
    
    # let's get the colnames of all measurement values we care about:
    measurementCols = colnames(subjectAndActivtyName[,5:numCols])
    
    # initialize the measures data frame that will hold all of our average measures, # use a temp column which we'll remove later for neatness:
    measureFrame = data.frame(temp=0)
    
    # iterate through all measures that we care about:
    for(measure in measurementCols)
    {
      # now get the mean (average) for each measure
     avgMeasureVal = mean(subjectAndActivtyName[[measure]])
     
     # what is the name of this column:
     #measureName = paste0("avg_", measure)
       
     # now add this column and associated value to the measureFrame:
     measureFrame[[measure]] = avgMeasureVal
    }
    
    # add the measures columns into the newRow we want to add to the final output:
    newRow = cbind(newRow,measureFrame)
    
    # now add the newRow to the final output:
    secondSet <- rbind(secondSet, newRow)
  }
}

# get rid of the temp column:
secondSet$temp <- NULL

# Write a CSV file for local inspection in MS Excel:
# write.csv(secondSet, file = "secondSet.csv")

# Write and output the final tidy data set that is tab separated:
# Since the text file is tab delimited it also opens nicely in Excel!
write.table(secondSet, file ="tidyData.txt", quote=TRUE, sep="\t")