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

