# Getting_And_Cleaning_Data

## Course Project

The attached R Script (run_analysis.R) does the following:

        * downloads and reads in data from Samsung Galaxy S smartphone website.
        
        * merges the training and test sets to create one data set
        
        * extracts measurements on the mean and standard deviation for each measurement
                assumption:  any measurement that had the word "mean" or "std" as part of its title was extracted
                
        * the descriptive activity names were used to name the activities in the data set
        
        * the data set was labeled with descriptive variable names
        
        * a tidy data set ("tidy_data.txt") was then created from the merged data set containing:
        
                + the average (mean) of each variable for each activity and each subject
                
                + "tidy_data.txt" is a wide tidy data set that can be read into R with read.table (header = TRUE). 
                 
        * The tiday dat set ("tidy_data.txt") is a data.frame of 180 observations (rows) and 81 variables (columns)
        
                + The field labels are listed in appendix C.
        
        * The script “run.analysis.R” requires that the library(dplyr) be installed.  
        
        * The script will load the library(dplyr) as part of its processing.