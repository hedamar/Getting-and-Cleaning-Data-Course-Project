library(dplyr)

setwd("C:/Users/dama/Desktop/r_class/class2_data")

if(!file.exists("./UCI HAR Dataset")){stop("Error: Data not found")}

# Step 1.1: Merge all of the test data together
actv_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
actv_labels <- rename(actv_labels, Actv_Label = V1, Activity = V2)

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_test <- rename(subject_test, Subj_ID = V1)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_test <- rename(y_test, Actv_Label = V1)

test_data <- cbind(subject_test, X_test, y_test)
test_data <- merge(test_data, actv_labels, by.x="Actv_Label", by.y="Actv_Label", all=TRUE)

# Remove the unnecessary stuff
rm(subject_test, X_test, y_test)

# Step 1.2: Merge all of the training data together
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_train <- rename(subject_train, Subj_ID = V1)

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_train <- rename(y_train, Actv_Label = V1)

train_data <- cbind(subject_train, X_train, y_train)
train_data <- merge(train_data, actv_labels, by.x="Actv_Label", by.y="Actv_Label", all=TRUE)

rm(subject_train, X_train, y_train)

# Step 1.3: Combine the two, by row binding
data <- rbind(test_data, train_data)

rm(train_data, test_data)

# Step 2: Now convert the feature variables from V1, V2, ... to their actual (and confusing looking) names
feature_names <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")

for(i in 1:561){
names(data)[i+2] <- feature_names[i,2]
}
 
# Step 3: Select Columns with means (interpreted as mean() only) and standard deviations (interpreted as std() only)
data_mean_std <- data[grep("mean()|Actv_Label|std()|Subj_ID|Activity", names(data))]

# The meanFreq() variables are NOT considered as means, remove them
data_mean_std <- data_mean_std[-grep("meanFreq()", names(data_mean_std))]

# Step 4: Create the average values of each variable by subject ID and by activity
tidy <- aggregate(x = data_mean_std, by = list(data_mean_std$Activity, data_mean_std$Subj_ID), FUN = "mean")

# Finally, get rid of some duplicate columns created by the aggregate function and do some renaming
drops <- c("Group.2", "Activity")
tidy <- tidy[,!names(tidy) %in% drops]

tidy <- rename(tidy, Activity = Group.1)

write.table(tidy, "./UCI HAR Dataset/tidy.txt", row.name = FALSE)
