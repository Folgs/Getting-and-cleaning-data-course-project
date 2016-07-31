##Unzip and read the data

if(!file.exists("./data")){dir.create("./data")}
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./data/zipdata")
unzip("./data/zipdata",exdir="./data")

###Now we have unziped all the data, and we need to load it. First we load the
##train and test files and then we merge it.

subjecttrain<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
xtrain<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("./data/UCI HAR Dataset/train/Y_train.txt")
train<-cbind(subjecttrain,xtrain,ytrain)

subjecttest<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
xtest<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
test<-cbind(subjecttest,xtest,ytest)


##Merges the training and the test sets to create one data set (first there will
##be the test data and then the train ones)

features<-read.table("./data/UCI HAR Dataset/features.txt",colClasses=c("numeric","character"),stringsAsFactors=FALSE)
mydata<-rbind(test,train)

names(mydata)<-c("subjectId",features[,2],"activity")

##Extracts only the measurements on the mean and standard deviation for each 
##measurement.

###First we find the names of the columns of my data which contain std or mean.

sbst<-grep("[Mm]ean|std",names(mydata))
msdata<-mydata[,c(1,ncol(mydata),sbst)] ##This is the data containing only the columns related to std or mean

##Uses descriptive activity names to name the activities in the data set

activitylabels<-read.table("./data/UCI HAR Dataset/activity_labels.txt",colClasses = c("numeric","character"),stringsAsFactors = FALSE)
msdata$activity<-activitylabels[msdata$activity,2]


##Appropriately labels the data set with descriptive variable names.
##t means time, f frequency (freq), and we should also eliminate the "-" and the "()"

names(msdata)<-gsub("^t","time ",names(msdata))
names(msdata)<-gsub("^f","freq ",names(msdata))
names(msdata)<-gsub("+-+"," ",names(msdata))
names(msdata)<-gsub("\\()","",names(msdata))

##From the data set in step 4, creates a second, independent tidy data set with
##the average of each variable for each activity and each subject.

library(dplyr)
finaldatamean<-summarise_all(group_by(msdata,activity),mean)
finaldatamean$subjectId<-NULL

###We only need to save that data in another file
write.table(finaldatamean,file="./datameanact.txt",row.names = F)