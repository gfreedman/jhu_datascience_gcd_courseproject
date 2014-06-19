#This is a walk through of how the script in the R file "run_analysis.R" works:
###author - Geoff Freedman
####questions - geoff.c.freedman@gmail.com
####date - June 17, 2014

#Overview:

## 00) Preamble --> The R file has more detailed comments:
> Sometimes reading these README.txt files makes more sense after walking through the code.
> With that in mind, I've tried to liberally comment the actual R file so you can see what I was thinking when working through the assignment.

# 01) How I Made Sense Of The Raw Data:

> Each of the two data sets in the UCI HAR Dataset (test and train) have the saw raw data and folder structure.

## 01a) Configuration Info For Test and Train Data Sets:

##Activity Labels:
> The integer ID in each acitivity label row has a corresponding human readable activity name. So we know that ID=1 is the same thing as "WALKING"
> My code makes a lookup dicitonary out of this text file

##Feature Labels:
> The vertical (row) ID in the feature labels raw text file has a corresponding human readble measurement name. So we know that ID=1 means the meaure value for tBodyAcc-mean()-X.
> This vertical (row) ID can be mapped to the horizontal (column) ID in the two X sets. This is how I renamed each column to a more human readable name.


## 01b) Test and Train Data Sets:

##Subject Data Sets:
> Data in the subject sets (subject_train.txt or subject_test.txt) is a single column of integer subject ID's. Think of these ID's as unique indentifiers. So each row in the subjects data test represents a test impression for a given subject (person). That test impression / event could be any of the six recognized activities such as walking or lying down while wearing the smartphone. 

###Inertial Signals:
> Per course forums (https://class.coursera.org/getdata-004/forum/thread?thread_id=106) re"Do we need the inertial folder?" I've ommitted looking at the inertial signals folder.

###Y Sets:
> Data in the Y sets (y_test.txt or y_train.txt) contains the same number of rows as those in the subjects data sets. The integer ID's here are identifiers that can be mapped to a particular test activity such as walking or lying down. It's worth noting that these ID's aren't distinct and the same activity ID's get repeated again and again. Since the Y sets have the same number of rows as the subject sets, we know that each test impression acitivty in the Y sets can get mapped to a particular subject in the subject sets. So the row number in the Y sets can be joined with the same row number in the subject sets. 


###X Sets:
>Data in the X set (x_test.txt or x_train.txt) contains a series of columns that record the actual measurements (i.e. body acceleration on the x-axis) for each test impression. Again it's worth noting that the number of rows in the X sets is the same as the number of rows in the subject and Y sets. So we can again use the row number as the 'primary key' to join the X sets with the Y and subject sets. The entire data frame is complete but not very readable/useful without configuration info. 
> Each column in the text file gets an integer ID associated with it when loaded into R as a data.frame. I use the feature labels dictionary above to figure out what each column means. For example "1" means that this column is measuring "tBodyAcc-mean()-X"


### Next Steps:
> Now that I have all the configuration info (so I know what the data means) as well as a "lay of the land" for the test data (what test impressions are being recorded) I can now assemble an internal R data frame that is used to generate the final tidy data set.


# 02) How I Made Assembled The Raw Data:

## Step 1) Load In All Configuration Data
> The first thing the run_analysis.R script does is to load in the text files for the activity and feature labels as data.frame objects
> Then I change the column names so that they're easier to read

## Step 2) Load In X Measurement Data for test and train sets and assemble into a readble R data.frame:
> Now that configuration info is in place, I load in the raw data for both sets.
> For code re-use I chose to use a generic funciton called "createDataSet()" that accepts one string argument with two possible values "test" and "train"
> The function loads in either the test or train data for (subjects, X and Y) and assembles it into a more human readable data.frame
> Once this funciton is finished we should have one complete data frame for either set (test or train) with proper column and activity names. 

## Step 3) Create the final raw data set that we can use to make a tidy data set from:
> An R data.frame called "finalDataSet" is created by binding together the above test and train data sets returned from "createDataSet()"
> Then I search through "finalDataSet" to remove all columns that aren't concerned with the mean, I used grep and a simple string pattern of either "mean" or "std"
> Also per course forum discussion I felt ok dropping all columns that had to do with mean frequency --> https://class.coursera.org/getdata-004/forum/thread?thread_id=229
> Then I cleaned up the column names themselves so that it would be easy to refer to them as R objects using gsub (i.e. df$myNiceColumnName)
> I exported this as a CSV file and inspected it using MS Excel to make sure that it all made sense and that the code was performing as it should.
> It's worth noting that I ran a few little mini tests, printing out values, dimensions and column names as a sanity check.

## Step 4) Create a tidy data set from the above raw data set:
> I decided to create a brand new data.frame that would contain the final tidy dat set.
> My basic approach was to get a list of all unique subject (person) ID's and create a tidy data set around them
> Here is the basic pseudo code:
##### loop through all unique subject ID's

  # then for each unique subject ID

    # loop through all unique activity ID's and associate name to ID

      # then for each unique activity

        # figure out mean (average for each measurement) for the subject_id + activity_id combo

        # figure out nice names for each of these measurements as they can be both verbose and obtuse

        # add these means to the subject_id + activity_id combo row

###### end outer loop

##### outside of main loop return your new tidy second data set

>After doing this I created another CSV file, loaded it up in MS Excel and made sure it was looking like I though it did.
>It's also worth noting that I did a few manual mean calculation myself using a very restricted subset of the tidy data set just to make sure it was actually calculating the mean values as I expected.
>The final step was to write the tidy data set as a text file so it can be uploaded to Coursera

## Step 5) Remember when coding the key is to keep fit and having fun
> Reading the forums also helps quite a bit!