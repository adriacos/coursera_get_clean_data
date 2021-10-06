# coursera_get_clean_data


This project reads and downloads data collected from the accelerometers from the
Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Raw Data is stored in the /data/raw folder after downloading.

The scripts are saved in the /scripts folder. There are ten .R files with the 
scripts:

run_analysis.R: main entry point for the analysis. Has one function "run_analysis"
that calls the rest of the functions

download_data.R: one function "download_data()" that downloads the zip file 
with the data sets from the url given

unzip_data.R: onw function unzip_data() that unzips the downloaded zip file 
and saves the folders in the /data/raw folder

get_activities_data.r: one function "get_activities_data()" that gets the data
of the activities corresponding to each observation

get_subjects_data.r: one function "get_subjects_data()" that gets the data
of the subjects corresponding to each observation

merge_data_activities_subjects.R: one function "merge_data_activities_subjects()"
that merges data for variables, activities and subjects for each observation

filters_mean_std.R: one function "filters_mean_std()" filters data in order to
get only variables corresponding to the mean and standard deviation of each observation

calc_aggregated_means.R: one function "calc_aggregated_means()" that calculates
the means of all variables for each subject and activity

save_clean_data.R: one function "save_clean_data()" that saves all the clean 
datasets into four .csv files in the folder "./data/clean"