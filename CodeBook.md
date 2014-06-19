#Data Dictionary - Course Project - Getting and Cleaning Data
###author - Geoff Freedman
####questions - geoff.c.freedman@gmail.com
####date - June 17, 2014

##Code book:
**1.subject_id:** a unique integer value for each subject (person) participating in the test (ids range from 1-30). 
**2.activity:** a unique string value for what type of activity was happening when the test event was fired. Valid activities are (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING)
**3.tBodyAcc_mean_X:** a numeric value for the average body acceleration on the x axis
**4.tBodyAcc_mean_Y:** a numeric value for the average body acceleration on the y axis
**5.tBodyAcc_mean_Z:** a numeric value for the average body acceleration on the z axis
**5.tGravityAcc_mean_X:** a numeric value for the average gravity acceleration on the x axis
**6.tGravityAcc_mean_Y:** a numeric value for the average gravity acceleration on the y axis
**7.tGravityAcc_mean_Z:** a numeric value for the average gravity acceleration on the y axis
**8.tBodyAccJerk_mean_X:** a numeric value for the average time rate of change for body accelleration on the x axis
**9.tBodyAccJerk_mean_Y:** a numeric value for the average time rate of change for body accelleration on the y axis
**10.tBodyAccJerk_mean_Z:** a numeric value for the average time rate of change ofor body accelleration on the z axis
**11.tBodyGyro_mean_X:** a numeric value for the average gyro (angular momentum) on the x axis
**12.tBodyGyro_mean_Y:** a numeric value for the average gyro (angular momentum) on the y axis
**13.tBodyGyro_mean_Z:** a numeric value for the average gyro (angular momentum) on the z axis
**14.tBodyGyroJerk_mean_X:** a numeric value for the average time rate of change for gyro (angular momentum) on the x axis
**15.tBodyGyroJerk_mean_Y:** a numeric value for the average time rate of change for gyro (angular momentum) on the y axis
**16.tBodyGyroJerk_mean_Z:** a numeric value for the average time rate of change for gyro (angular momentum) on the z axis
**17.tBodyAccMag_mean:** a numeric value for the average magnitude of the body acceleration
**18.tGravityAccMag_mean:** a numeric value for the average magnitude of the variable GravityAccMag as a three dimensional signal (XYZ)
**19.tBodyAccJerkMag_mean:** a numeric value for the average magnitude of the variable tBodyAccJerk as a three dimensional signal (XYZ)
**20.tBodyGyroMag_mean:** a numeric value for the average magnitude of the variable tBodyGyro as a three dimensional signal (XYZ)
**21.tBodyGyroJerkMag_mean:** a numeric value for the average magnitude of the variable tBodyGyroJerk as a three dimensional signal (XYZ)
**22.fBodyAcc_mean_X:** a numeric value for the average frequency of body acceleration on the x axis
**23.fBodyAcc_mean_Y:** a numeric value for the average frequency of body acceleration on the y axis
**24.fBodyAcc_mean_Z:** a numeric value for the average frequency of body acceleration on the z axis
**25.fBodyAccJerk_mean_X:** a numeric value for the average frequency for the time rate of change (jerk measurement) for body accelleration on the x axis
**26.fBodyAccJerk_mean_Y:** a numeric value for the average frequency for the time rate of change (jerk measurement) for body accelleration on the y axis
**27.fBodyAccJerk_mean_Z:** a numeric value for the average frequency for the time rate of change (jerk measurement) for body accelleration on the z axis
**28.fBodyGyro_mean_X:** a numeric value for the average frequency for the gyro (angular momentum) on the x axis
**29.fBodyGyro_mean_Y:** a numeric value for the average frequency for the gyro (angular momentum) on the y axis
**30.fBodyGyro_mean_Z:** a numeric value for the average frequency for the gyro (angular momentum) on the z axis
**31.fBodyAccMag_mean:** a numeric value for the average magntitude for the variable fBodyAccMag as a three dimensional signal (XYZ)
**32.fBodyBodyAccJerkMag_mean:** a numeric value for the average magnitude for the variable fBodyAccJerk as a three dimensional signal (XYZ)
**33.fBodyBodyGyroMag_mean:** a numeric value for the average magnitude for the variable fBodyGyroMag_mean as a three dimensional signal (XYZ)
**34.fBodyBodyGyroJerkMag_mean:** a numeric value for the average magnitude for the variable fBodyGyroJerk as a three dimensional signal (XYZ)
**35.tBodyAcc_std_X:** a numeric value for the standard deviation for the body acceleration on the x axis
**36.tBodyAcc_std_Y:** a numeric value for the standard deviation for the body acceleration on the y axis
**37.tBodyAcc_std_Z:** a numeric value for the standard deviation for the body acceleration on the z axis
**38.tGravityAcc_std_X:** a numeric value for the standard deviation for the gravity acceleration on the x axis
**39.tGravityAcc_std_Y:** a numeric value for the standard deviation for the gravity acceleration on the y axis
**40.tGravityAcc_std_Z:** a numeric value for the standard deviation for the gravity acceleration on the z axis
**41.tBodyAccJerk_std_X:** a numeric value for the standard deviation for the time rate of change for body accelleration on the x axis
**42.tBodyAccJerk_std_Y:** a numeric value for the standard deviation for the time rate of change for body accelleration on the y axis
**43.tBodyAccJerk_std_Z:** a numeric value for the standard deviation for the time rate of change for body accelleration on the z axis
**44.tBodyGyro_std_X:** a numeric value for the standard deviation for the gyro (angular momentum) on the x axis
**45.tBodyGyro_std_Y:** a numeric value for the standard deviation for the gyro (angular momentum) on the y axis
**46.tBodyGyro_std_Z:** a numeric value for the standard deviation for the gyro (angular momentum) on the z axis
**47.tBodyGyroJerk_std_X:** a numeric value for the standard deviation for the average time rate of change for gyro (angular momentum) on the x axis
**48.tBodyGyroJerk_std_Y:** a numeric value for the standard deviation for the average time rate of change for gyro (angular momentum) on the y axis
**49.tBodyGyroJerk_std_Z:** a numeric value for the standard deviation for the average time rate of change for gyro (angular momentum) on the z axis
**50.tBodyAccMag_std:** a numeric value for the standard deviation of the magntitude of body acceleration as a three dimensional signal (XYZ)
**51.tGravityAccMag_std:** a numeric value for the standard deviation of the magntitude of gravity acceleration as a three dimensional signal (XYZ)
**52.tBodyAccJerkMag_std:** a numeric value for the standard deviation of the magntitude of the time rate of change for body accelleration as a three dimensional signal (XYZ)
**53.tBodyGyroMag_std:** a numeric value for the standard deviation of the magntitude of the gyro (angular momentum) as a three dimensional signal (XYZ)
**54.tBodyGyroJerkMag_std:** a numeric value for the standard deviation of the magntitude of the time rate of change for gyro (angular momentum) as a three dimensional signal (XYZ)
**55.fBodyAcc_std_X:** a numeric value for the standard deviation of the frequency of body acceleration on the x axis
**56.fBodyAcc_std_Y:** a numeric value for the standard deviation of the frequency of body acceleration on the y axis
**57.fBodyAcc_std_Z:** a numeric value for the standard deviation of the frequency of body acceleration on the z axis
**58.fBodyAccJerk_std_X:** a numeric value for the standard deviation of the time rate of change for body accelleration on the x axis
**59.fBodyAccJerk_std_Y:** a numeric value for the standard deviation of the time rate of change for body accelleration on the y axis
**60.fBodyAccJerk_std_Z:** a numeric value for the standard deviation of the time rate of change for body accelleration on the z axis
**61.fBodyGyro_std_X:** a numeric value for the standard deviation of the frequency measure for gyro (angular momentum) on the x axis
**62.fBodyGyro_std_Y:** a numeric value for the standard deviation of the frequency measure for gyro (angular momentum) on the y axis
**63.fBodyGyro_std_Z:** a numeric value for the standard deviation of the frequency measure for gyro (angular momentum) on the z axis
**63.fBodyAccMag_std:** a numeric value for the standard deviation of the magntitude of the frequency measure for body acceleration as a three dimensional signal (XYZ)
**64.fBodyBodyAccJerkMag_std:** a numeric value for the standard deviation of the magntitude of the frequency measure for the time rate of change in body acceleration as a three dimensional signal (XYZ)
**65.fBodyBodyGyroMag_std:** a numeric value for the standard deviation of the magntitude of the frequency measure for gyro (angular momentum) as a three dimensional signal (XYZ)
**66.fBodyBodyGyroJerkMag_std:** a numeric value for the standard deviation of the magntitude of the frequency measure for the time rate of change in gyro (angular momentum) as a three dimensional signal (XYZ)

##Study design:
>For additional information on how the raw data for these variables were recorded plesae review the assignment details at **http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones**

##Summary choices:
>I looked for all measures that dealt with either the mean or standard deviation in the raw data set. I decided to drop columns with "meanFreq" per this discussion on the forums **https://class.coursera.org/getdata-004/forum/thread?thread_id=229**
