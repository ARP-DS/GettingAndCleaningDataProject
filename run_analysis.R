# load dplyr
library(dplyr)

# read test data and join all into a table
xtest <- read.table(unzip("getdata%2Fprojectfiles%2FUCI HAR Dataset.zip","UCI HAR Dataset/test/X_test.txt"))
ytest <- read.table(unzip("getdata%2Fprojectfiles%2FUCI HAR Dataset.zip","UCI HAR Dataset/test/y_test.txt"))
names(ytest)<-"activity"
stest <- read.table(unzip("getdata%2Fprojectfiles%2FUCI HAR Dataset.zip","UCI HAR Dataset/test/subject_test.txt"))
names(stest) <- "subject"
test <- cbind(stest,ytest,xtest)
test <- tbl_df(test)

# read train and join all into a table
xtrain <- read.table(unzip("getdata%2Fprojectfiles%2FUCI HAR Dataset.zip","UCI HAR Dataset/train/X_train.txt"))
ytrain <- read.table(unzip("getdata%2Fprojectfiles%2FUCI HAR Dataset.zip","UCI HAR Dataset/train/y_train.txt"))
names(ytrain)<-"activity"
strain <- read.table(unzip("getdata%2Fprojectfiles%2FUCI HAR Dataset.zip","UCI HAR Dataset/train/subject_train.txt"))
names(strain) <- "subject"
train <- cbind(strain,ytrain,xtrain)
train <- tbl_df(train)

# read labels and features
labels <- read.table(unzip("getdata%2Fprojectfiles%2FUCI HAR Dataset.zip","UCI HAR Dataset/activity_labels.txt"))
features <- read.table(unzip("getdata%2Fprojectfiles%2FUCI HAR Dataset.zip","UCI HAR Dataset/features.txt"))

# test+train
t1 <- rbind(test,train)

# select mean and standar deviation
# name activities
t1 <- select(t1, subject, activity,V1:V6,V121:V126) 
t1 <- mutate(t1, activity=as.factor(activity))

levels(t1$activity)<-labels[,2]

# name variables
varnames <- c(as.character(features$V2[1:6]),as.character(features$V2[121:126]))
varnames <- substr(varnames,6,18)
varnames <- sub("Acc","acceleration",varnames)
varnames <- sub("Gyro","velocity",varnames)
varnames <- sub("\\()","",varnames)
varnames <- gsub("-","",varnames)
varnames <- tolower(varnames)
t1names <- c(names(t1[1]),names(t1[2]),varnames)
colnames(t1) <- t1names

# mean of each variable of each variable for each activity and each subject
t2 <- group_by(t1,activity,subject)
t2 <-summarize(t2,
          Maccelerationmeanx=mean(accelerationmeanx),
          Maccelerationmeany=mean(accelerationmeany),
          Maccelerationmeanz=mean(accelerationmeanz),
          Maccelerationstdx=mean(accelerationstdx),
          Maccelerationstdy=mean(accelerationstdy),
          Maccelerationstdz=mean(accelerationstdz),
          Mvelocitymeanx=mean(velocitymeanx),
          Mvelocitymeany=mean(velocitymeany),
          Mvelocitymeanz=mean(velocitymeanz),
          Mvelocitystdx=mean(velocitystdx),
          Mvelocitystdy=mean(velocitystdy),
          Mvelocitystdz=mean(velocitystdz))
