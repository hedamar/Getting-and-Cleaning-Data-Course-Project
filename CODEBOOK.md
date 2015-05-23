Codebook:

Below is the description of the features in the UCI HAR Dataset from the original source:

"The features selected for the database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and 
tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then 
they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 
Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using 
the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

The final output of the script ("tidy.txt") includes 66 variables. Each variable is the AVERAGE of either the mean 
("mean()") or the standard deviation ("std()") of each feature. Details of the individual features are below.

These following features are separately obsered for the "X", "Y" and "Z" directions. So, for each of these features,
the final data set contains SIX variables (X vs. Y vs. Z and mean() vs. std())

tBodyAcc-XYZ (units: standard gravity units 'g')
tGravityAcc-XYZ (units: standard gravity units 'g')
tBodyAccJerk-XYZ (units: standard gravity units 'g')
tBodyGyro-XYZ (units: radians/second)
tBodyGyroJerk-XYZ (units: radians/second)
fBodyAcc-XYZ (units: standard gravity units 'g')
fBodyAccJerk-XYZ (units: standard gravity units 'g')
fBodyGyro-XYZ (units: radians/second)

8 features * 6 variables for each feature = 48 variables for these features

The following features are only observed once, so for each of these features, the final data set contains TWO variables.
(mean() vs. std())

tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

9 features * 2 variables for each feature = 18 variables for these features

The actual definitions of these features and more details on the raw data set can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

