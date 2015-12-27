# Getting-and-Cleaning-Data
##Study Design
The original dataset is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
The main package used in the following project is "dplyr"  

There are totally 10299 data and were dvided into groups: train and test.  
The main steps are:  
1. combine these two group into one
2. subtract the mean and variance of each measurement
3. properly label both axis
4. calculate mean for each column  

##Code Book (mean_for_each_measurement_subject.txt or "ds2" in R)  
1.  Subject: The serial of experientment participants (1~30)
2.  Activity: The activity a participant performs (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING)
3.  Features (column 3~68):
>TimeBodyAccelerometer-XYZ and TimeGravityAccelerometer-XYZ come from the accelerometer and gyroscope 3-axial raw signals. These time >domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass >Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body >and gravity acceleration signals (TimeBodyAccelerometer-XYZ and TimeGravityAccelerometer-XYZ) using another low pass Butterworth >filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals >(TimeBodyAccelerometerJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated >using the Euclidean norm (TimeBodyAccelerometerMagnitude, TimeGravityAccelerometerMagnitude, TimeBodyAccelerometerJerkMagnitude, >TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAccelerometer-XYZ, FrequencyBodyAccelerometerJerk-XYZ, FrequencyBodyGyroscope-XYZ, FrequencyBodyAccelerometerJerkMagnitude, FrequencyBodyGyroscopeoMagnitude, FrequencyBodyGyroscopeJerkMagnitude.



