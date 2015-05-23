The R script "run_analysis.R" was written in RStudio Version 0.98.1103 (for Windows).

The R script assumes that the "Samsung data" (also known as the "UCI HAR Dataset") is extracted in the
working directory. There is an initial check for the data folder and the script returns an error
if the UCI HAR Dataset is not in the working directory or if the data folder has been renamed

The script also requires that the package "dplyr" is installed.

The script follows these steps (note: these are NOT the same steps in the original assignment instructions)

Step 1.1: Take the different files associated with the "test" data and column bind them. Also, apply the
descriptive labels to the activities (Walking, etc.) using the "merge" command.

Step 1.2: Take the different files associated with the "train" data and column bind them. Also, apply the
descriptive labels to the activities (Walking, etc.) using the "merge" command.

Step 1.3: Combine the combined/formatted "test" and "train" datasets via row binding.

Step 2: Convert the feature variables from V1, V2. etc. to their descriptive names provided in the "features.txt" file.
This is done with a for loop.

Step 3: Using the "grep" function, choose the columns with means and standard deviations. The columns with
means are those variables whose names include "mean()" in them. Similarly, the standard deviation variables
are those thhat include std() in their names.

Please note that variables with "meanFreq()" in their names were NOT considered to be mean variables and they
were removed from the dataset.

Step 4: Calculate averages for each variable at the "subject ID-activity" level. Given that there are 30 subjects
and 6 activities in the dataset, the resulting tidy dataset has 180 rows and 66 variables (discussed below).

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

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ

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

