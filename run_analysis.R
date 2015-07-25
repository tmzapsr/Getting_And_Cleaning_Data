##This Script does the following:
        ##downloads and reads in data from Samsung Galaxy S smartphone website.
        ##merges the training and test sets to create one data set
        ##extracts measurements on the mean and standard deviation for each measurement
                ##assumption:  I extracted any measurement that had the word "mean" or "std" as part of its title
        ##the descriptive activity names were used to name the activities in the data set
        ##the data set was labeled with descriptive variable names
        ##a tidy data set ("tidy_data.txt") was then created from the merged data set containing:
                ##the average (mean) of each variable for each activity and each subject
                ## "tidy_data.txt" is a wide tidy data set that can be read into R with read.table (header = TRUE)


##downloads and reads in data from Samsung Galaxy S smartphone website.

if (!file.exists("data")) {
        dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip")
unzip("./data/dataset.zip",exdir = "./data")

##merges the trainng and test sets to create one data set

X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
X_data <- rbind(X_test,X_train)

Y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
Y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
Y_data <- rbind(Y_test,Y_train)

S_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
S_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
S_data <- rbind(S_test,S_train)


##extracts measurements on the mean and standard deviation for each measurement
        ##assumption:  I extracted any measurement that had the word "mean" or "std" as part of its title

features <- read.table("./data/UCI HAR Dataset/features.txt")
Measurements <- grep("-mean|-std", features[,2])
X_data <- X_data[,Measurements]
names(X_data) <- features[Measurements,2]
names(X_data) <-gsub("\\(|\\)","",names(X_data))

##the descriptive activity names were used to name the activities in the data set
##the data set was labeled with descriptive variable names

activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
Y_data[,1] <- activities[Y_data[,1],2]
names(Y_data) <- "activity"

names(S_data) <- "subject"
Mean_Std <- cbind(S_data,Y_data,X_data)
write.table(Mean_Std,"./Data/Mean_Std.txt")

##a tidy data set ("tidy_data.txt") was then created from the merged data set containing:
##the average (mean) of each variable for each activity and each subject

library(dplyr)
Mean_Std <- read.table("./Data/Mean_Std.txt")
Mean_Std_Grp <- group_by(Mean_Std,subject,activity)
Mean_Std_Grp_Data <- summarise_each(Mean_Std_Grp,funs(mean))
write.table(Mean_Std_Grp_Data, "./Data/tidy_data.txt",row.names = FALSE)


