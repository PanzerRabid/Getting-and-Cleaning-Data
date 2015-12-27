# Getting-and-Cleaning-Data
##Study Design
The original dataset is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
The main package used in the my project is "dplyr"  

The orginal zip file contains totally 10299 data that were dvided into groups: train and test.The main steps to get the final result are:  
1. combine these two group into one  
2. subtract the mean and variance of each measurement  
3. properly label both axis  
4. calculate mean for each column  

##Code Book 
##(applicable for mean_for_each_measurement_subject.txt or tbl_df "ds2" in R)  
1.  Subject: The serial number of experientment participants (1~30)
2.  Activity: The activity that participants perform (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING)
3.  Features (column 3~68, the unit is normalized and bounded within [-1,1]):  

>TimeBodyAccelerometer-XYZ and TimeGravityAccelerometer-XYZ come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerometer-XYZ and TimeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerometerJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerometerMagnitude, TimeGravityAccelerometerMagnitude, TimeBodyAccelerometerJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAccelerometer-XYZ, FrequencyBodyAccelerometerJerk-XYZ, FrequencyBodyGyroscope-XYZ, FrequencyBodyAccelerometerJerkMagnitude, FrequencyBodyGyroscopeoMagnitude, FrequencyBodyGyroscopeJerkMagnitude.

The above information are mostly from features_info.txt within the original zip file but I modify a little bit to better fit into the final dataset in my project. I do not own the copyright.
