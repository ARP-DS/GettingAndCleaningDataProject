Data analysis of data placed in: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data file named: "getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"  should be placed in the working directory.

All steps placed in scrip: run_analysis.R

The script consist on:
- Load library dplyr
- Read file, using read.table function, and using unzip function, into data frames.
- Define table as data table to be able to use dplyr functions
- Merge test and train data into a data set using rbind function
- Select mean and standard deviation using select function
- Convert activity column to factor and update activity codes to activity names from activity_labels.txt file by changing the levels
. Update variable names: remove non-descriptive string, change upercase letters, remove non-letters characters
- Group the data set by activity and by subject
- Calculate the mean of the mean and standard variation variables

The dataset includes the following files:

- 'README.md'
- 'run_analysis.R': Script with the code of the analysis.
- 'CodeBook.md': Describes data and variables.

