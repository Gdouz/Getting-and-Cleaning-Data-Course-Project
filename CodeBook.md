In this file, the meaning of each data, variable and transformation that has been performed to clean up the data will be explained.  
# DATA  
## Raw data
The names of raw data files aren't changed.I just download the .zip file, unzip it, and choose the files pf interest.  
So names of dataframes of them in R are: "subject_test", "x_test", "y_test", "subject_train", "x_train",  "y_train", "features".
## Merged data
1) I use Rstudio, so after reading in raw data, I find the number of rows of x_test and x_train, y_test and y_train, 
subject_test and subject_train are the same respectively. As Question 1 require, merging can be done.
I extract the first letter of "test" and "train" and combine them to name the three merged dataframes: "x_tt", "y_tt", "subject_tt".
2) sExtxy_tt: merge "subject_tt", "Extx_tt", "y_tt".  
## Extracted data  
Extx_tt: Extracts only the measurements on the mean and standard deviation for each measurement from x_tt.
## Tidy data
sExtxy_tt_: One variable per column.
## Second data  
df: a second, independent tidy data set with the average of each variable for each activity and each subject.
## Remove data  
Just to free memory. 
"subject_test", "x_test", "y_test", "subject_train", "x_train",  "y_train", "features", "x_tt"  
# VARIABLE  
WhereMean: logical vector of whether the measurement is on the mean.
WhereStd: logical vector of whether the measurement is on the standard deviation.
whereMS: logical vector of whether the measurement is on the mean or the standard deviation.
act?: logical vector of whether the attribute of activity is ?

# TRANSFORMATION
1) Before merging, I add one column, "variable", to discriminate test group and train group, which seems useless in this assighnment.  
2) Use descriptive activity names "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING" 
to name the activities in the data set y_tt.
3) Use actual feature name to name columns of "Extx_tt".
4) Rename the first column of Extxy_tt to be "object".
