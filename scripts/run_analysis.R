run_analysis <- function(download=FALSE){
  
  #downlowads the data into data/raw folder if "download" parameter set as TRUE 
  if (download){
    source("download_data.R")
    download_data()
    #unzips data into the same folder
    source("scripts/unzip_data.R")
    unzip_data()
  }
  
  #sets the data directory for further use
  data_dir = ".//data//raw//UCI HAR Dataset//"
  print(data_dir)
  #reads data for "test" and "train" observations 
  test_data <- read.table(paste0(data_dir, "test//X_test.txt"))
  train_data <- read.table(paste0(data_dir, "train//X_train.txt"))

  #stores both datasets in a named list
  data <- list(test_data=test_data, train_data=train_data)

  #reads "features" file, to get the names of the features
  #(every variable in test and train data corresponds to one of these features)
  source(".//scripts//set_variable_names.R")
  data <- set_variable_names(data_dir, data)
  
  #gets the data of the activities corresponding to each observation
  source(".//scripts//get_activities_data.R")
  activities_data <- get_activities_data(data_dir)

  #gets the data of the subjects corresponding to each observation
  source(".//scripts//get_subject_data.R")
  subjects_data <- get_subject_data(data_dir)
  #print(head(subjects_data$test_subject))

  #merges "subject" and "activity" data to the whole "train" and "test" dataset
  source(".//scripts//merge_data_activities_subjects.R")
  data <- merge_data_activities_subjects(data, activities_data, subjects_data)

  #filters data in order to get only observations corresponding to the mean and 
  #the standard deviation of each measurement
  source(".//scripts//filters_mean_std.R")
  data <- filters_mean_std(data)

  #calculates the average (mean) of each feature grouped by subject and activity
  #and ordered by subject
  source(".//scripts//calc_aggregated_means.R")
  data_means <- calc_aggregated_means(data)

  #stores all datasets in a named list
  data <- list(test_data=data$test_data, train_data=data$train_data, 
               test_means=data_means$test_means, train_means=data_means$train_means)
  
  #saves all data into corresponding files in data/clean folder
  source(".//scripts//save_clean_data.R")
  save_clean_data(data)
  
  #returns a named list with the four datasets
  data
}





       
       
       
       
       
