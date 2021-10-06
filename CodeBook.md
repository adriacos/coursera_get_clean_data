---
title: "CodeBook"
author: "Adrià Cos del Cacho"
date: "3/10/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Getting and Cleaning Data Course Project

This is the CodeBook for the coursera course project "Getting and Cleaning Data Course Project"

This project downloads and cleans collected from the accelerometers from the Samsung Galaxy S smartphone.  

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project can be downloaded from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Data description

The output data consists of four datasets:

- One for the test data (test_data)
- One for the train data (train_data)
- One for the aggregated means of the test data for each subject and activity (test_means)
- One for the aggregated means of the train data for each subject and activity (train_means)

Variables for test and train data are:

- Subject: id of the subject (person) corresponding to each observation.
- Activity: name of the activity corresponding to each observation. Possible 
activities are: walking, walking upstairs, walking downstairs, sitting, standing, laying.
- 79 variables corresponding only to mean or standard deviation of different features. 

There are a total of 2947 observations for test data and 7352 observations for train data.

## Data transformations

### Script structure

There are 10 .R script files. Main entry point is run_analysis.R, with one function
run_analysis(), that imports the rest of the files. 

run_analysis() has one parameter "download", with predefined value "FALSE". Set
to true if files must be downloaded before runing the analysis (only first time
is necessary; files are stored in disk and can be used in further analysis)

### Downloading and unzipping data

If "download" parameter is set to true, files are downloaded, saved in disk
and unzipped in /data/raw folder. 

### Geting test and train data

Both train and test data for all features are read from the X_test and X_train
files and stored in test_data and train_data. Both are then stored in a named 
list "data".

### Set variable names

This data has a number of variables (columns) corresponding to each feature, 
but the variables are not named. Thus, in set_variable_names() we read the feature
names from features.txt file. This file contains a vector of all the features 
analysed, in the same order as the columns of the train and test data. We first
check that the length of the vector with the names of the features is equal
to the number of columns in test and train data. If they do not correspond, 
we stop the analysis and show an error message. If they do, we set the column 
names using the features vector obtained from features.txt.

### Get activities data

Each observation corresponds to a certain activity (walking, walking upstairs,
walking downstairs, sitting, standing, laying), but this data is not in the test
and train data. In y_test and y_train data we have a vector of the id of the 
activity corresponding to each observation. As we need the name of the activity
instead of their ids, we get this information from the file activity_labels.txt, 
and merge both data to have a dataset with the ids and names of the activity of
each observation both for test and train data.

### Get subjects data

Similarly, we get data of the subject corresponding to each observation. In this
case, we only need the id of the subject, and get them from subject_test.txt
and subject_train.txt files.

### Merge train and test data with their subjects and activities. 

In merge_data_activities_subjects(), we merge train and test datasets to their
subjects and activities. Thus, we get two datasets (one for test data and one 
for train data), with a row for each observation and a column for subject, 
activity, and one column for each feature.

### Filter only mean and standard deviation features

In filters_mean_std(), we filter the columns of the dataset in order to get only
the mean and standard deviation of each feature (only features that include
"mean" or "std" in their names).

### Calculate the aggregated mean of each feature grouped by subject and activity

In calc_aggregated_means(), we calculate aggregated means for every combination
of subject and activity. We store this information in two datasets (mean_test 
and mean_train).

### Store all datasets in corresponding files

In save_clean_data(), we store all four datasets obtained (test_data, train_data,
test_means and train_means) in their corresponding .csv files, saved in
/data/clean folder.
