## ===Load packages and set working directory===
library(plyr)
library(dplyr)
library(tidyr)
setwd("C:\\Users\\14911\\Documents\\Statistics\\ÑĞÑ¡¿Î\\JHU\\´íÌâ²¾\\Getting and Cleaning Data\\Week 4\\UCI HAR Dataset")

## ===Read in data===
subject_test <- read.table("test\\subject_test.txt",sep="")
x_test <- read.table("test\\X_test.txt",sep="")
y_test <- read.table("test\\y_test.txt",sep="")
subject_train <- read.table("train\\subject_train.txt",sep="")
x_train <- read.table("train\\X_train.txt",sep="")
y_train <- read.table("train\\y_train.txt",sep="")
features <- read.table("features.txt",stringsAsFactors = FALSE)

## ===Q1===
## Merge the training and the test sets to create one data set.
subject_test$tt <- rep("test", 2947)
subject_train$tt <- rep("train", 7352)
subject_tt <- rbind(subject_test, subject_train) #merge.1

identical(names(x_test),names(x_train))
x_test$tt <- rep("test", 2947)
x_train$tt <- rep("train", 7352)
x_tt <- rbind(x_test, x_train) #merge.2

y_test$tt <- rep("test", 2947)
y_train$tt <- rep("train", 7352)
y_tt <- rbind(y_test, y_train) #merge.3

rm(subject_test, subject_train, x_test,x_train, y_test, y_train) #free memory
## ===Q2===
## Extract only the measurements on the mean and standard deviation for each measurement.
WhereMean <- grep("mean", features$V2)
WhereStd <- grep("std", features$V2)
whereMS <- sort(union(WhereMean,WhereStd))
Extx_tt <- x_tt[, c(whereMS, 562)]
rm(x_tt)
## ===Q3===
## Use descriptive activity names to name the activities in the data set
colnames(y_tt)[1] <- "activity"
act1 <- y_tt$activity == 1 
act2 <- y_tt$activity == 2  
act3 <- y_tt$activity == 3  
act4 <- y_tt$activity == 4  
act5 <- y_tt$activity == 5  
act6 <- y_tt$activity == 6  

y_tt[act1, 1] <- "WALKING"
y_tt[act2, 1] <- "WALKING_UPSTAIRS"
y_tt[act3, 1] <- "WALKING_DOWNSTAIRS"
y_tt[act4, 1] <- "SITTING"
y_tt[act5, 1] <- "STANDING"
y_tt[act6, 1] <- "LAYING"

## ===Q4===
## Appropriately label the data set with descriptive variable names. 
colnames(Extx_tt)[-80] <- features$V2[whereMS]
identical(Extx_tt$tt, y_tt$tt)
identical(Extx_tt$tt, subject_tt$tt)
sExtxy_tt <- cbind(subject_tt, Extx_tt, y_tt)[,-c(2,84)]
colnames(sExtxy_tt)[1] <- "subject"
sExtxy_tt_ <- gather(sExtxy_tt, FEATURE, count, -subject,-tt,-activity)
# Now variable names of the data set are: 
# "subject", "tt", "activity", "FEATRUE", "count". 
## ===Q5===
df <- ddply(sExtxy_tt_,.(subject,activity),summarize,mean=mean(count))
write.table(df, file="df.txt", row.name=FALSE)
