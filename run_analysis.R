##check if file exists
if(!file.exists(".//UCI HAR Dataset")){
        fileurl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileurl,".//gettingandcleaningdata.zip")
        unzip(".//gettingandcleaningdata.zip")
}

##loading all necessary data and dplyr
library(dplyr)
read.table(".//UCI HAR Dataset//features.txt") %>% tbl_df() ->features
read.table(".//UCI HAR Dataset//test//X_test.txt") %>% tbl_df() ->xtest
read.table(".//UCI HAR Dataset//test//y_test.txt") %>% tbl_df() ->ytest
read.table(".//UCI HAR Dataset//train//X_train.txt") %>% tbl_df() ->xtrain
read.table(".//UCI HAR Dataset//train//y_train.txt") %>% tbl_df() ->ytrain
read.table(".//UCI HAR Dataset//train//subject_train.txt") %>% tbl_df() ->subjecttrain
read.table(".//UCI HAR Dataset//test//subject_test.txt") %>% tbl_df() ->subjecttest
read.table(".//UCI HAR Dataset//activity_labels.txt")->activity_labels

##1: merge dataset  with subject in first column, activity number in second and mesurement in other.
rbind(xtrain,xtest)->ds
rbind(ytrain,ytest)->activity
rbind(subjecttrain,subjecttest)->subject
cbind(subject,activity,ds)->ds
tbl_df(ds)->ds

##2: use filter and regular expression to extract measurements that contains mean and standard deviation. Also, change the name of first and second column
filter(features,grepl("mean\\(\\)|std\\(\\)",V2))$V1->contain_mean_and_std
ds[,c(1,2,contain_mean_and_std+2)]->ds

names(ds)[c(1,2)]<-c("Subject","Activity")

##3: replace numbers in activity with proper name
activity_labels$V2->alv2
as.character(alv2)->alv2
names(alv2)<-activity_labels$V1
ds$Activity<-alv2[ds$Activity]

##4 match and adjust the label
cname<-features$V2[contain_mean_and_std]
cname<-as.character(cname)
names(ds)[3:ncol(ds)]<-cname
names(ds)<-gsub("^t","Time",names(ds))
names(ds)<-gsub("^f","Frequency",names(ds))
names(ds)<-gsub("mean","Mean",names(ds))
names(ds)<-gsub("std","StandardDeviation",names(ds))
names(ds)<-gsub("Acc","Accelerometer",names(ds))
names(ds)<-gsub("Gyro","Gyroscope",names(ds))
names(ds)<-gsub("Mag","Magnitude",names(ds))

##5 use group_by to calculate the mean of each column
group_by(ds,Subject,Activity)->ds2
summarise_each(ds2,funs(mean))->ds2

##create file
write.table(ds2,"mean_for_each_measurement_subject.txt",row.name=FALSE) 
