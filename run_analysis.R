#Load dplyr pack.
library(dplyr)

##Load data into R.
## Load Test data.
subtest <- read.table("./courseproject/UCI HAR Dataset/test/subject_test.txt")
names(subtest) <- "subject"
xtest <- read.table("./courseproject/UCI HAR Dataset/test/X_test.txt")
ytest  <- read.table("./courseproject/UCI HAR Dataset/test/y_test.txt")
# Load Train data.
subtrain <- read.table("./courseproject/UCI HAR Dataset/train/subject_train.txt")
names(subtrain) <- "subject"
xtrain <- read.table("./courseproject/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./courseproject/UCI HAR Dataset/train/y_train.txt")
# Load Activity Labels and Feature data.
actlabels <- read.table("./courseproject/UCI HAR Dataset/activity_labels.txt")
names(actlabels) <- c("number","activity")
features <- read.table("./courseproject/UCI HAR Dataset/features.txt") 

## 1. Merges the training and the test sets to create one data set.
##Create Test dataset
test <- mutate(xtest, actcode = ytest$V1, subject = subtest$subject,code = 1:2947,type = "test")
test <- select(test,code,type,subject,actcode,V1:V561)
#Create Train dataset.
train <- mutate(xtrain, actcode = ytrain$V1, subject = subtrain$subject,code = 2948:10299,type = "train")
train <- select(train,code,type,subject,actcode,V1:V561)
#Merged Test and Train dataset.
mergedData <- merge(test,train,all = TRUE)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#Give names to columns from features.
variables <- tolower(as.character(features$V2))  
names(mergedData) <- c("code","type","subject","actcode",variables) 
# Extract measurments of Mean and Standard Deviation.
meanstd <- grep("mean|std",names(mergedData)) 
#dataset with measurments of Mean and Standard Deviation.
meanstdData <- mergedData[,c(1,2,3,4,meanstd)] 

## 3. Uses descriptive activity names to name the activities in the data set
#Merges with actlables which has the activity names.
dataset1 <- merge(meanstdData,actlabels,by.x = "actcode",by.y = "number")
# Reorders the columns.
dataset1 <- select(dataset1,code,subject,activity,type,5:90)
# Reorders rows by code.
dataset1 <- arrange(dataset1,code)

## 4. Appropriately labels the data set with descriptive variable names. 
#Clean column names
names <- names(dataset1)
cleannames <- gsub("-","",names)
cleannames <- gsub("()","",cleannames,fixed=TRUE)
cleannames <- gsub(")","",cleannames,fixed=TRUE)
cleannames <- gsub("(","",cleannames,fixed=TRUE)
cleannames <- gsub(",","",cleannames,fixed=TRUE)
cleannames <- gsub("mean","M",cleannames)
cleannames <- gsub("std","SD",cleannames)
cleannames <- gsub("^t","T",cleannames)
cleannames <- gsub("^f","F",cleannames)
cleannames <- gsub("jerk","J",cleannames)
cleannames <- gsub("angle","An",cleannames)
cleannames <- gsub("body","B",cleannames)
cleannames <- gsub("acc","Acc",cleannames)
cleannames <- gsub("gyro","Gy",cleannames)
cleannames <- gsub("mag","Mag",cleannames)
cleannames <- gsub("gravity","Grav",cleannames)
cleannames <- gsub("freq","Fr",cleannames)
#Gives new names to dataset1.
names(dataset1) <- cleannames


## 5. From the data set in step 4, creates a second, independent tidy data set with 
#  the average of each variable for each activity and each subject.
meansdata1 <- select(dataset1,subject,activity,TBAccMx:AnzGravM)
dataset2 <- meansdata1 %>% group_by(subject,activity) %>% summarize_each(funs(mean))
