merge_data_activities_subjects <- function(data, activities_data, subjects_data){
  
  #checks that the number of observations in the "test" and "train" data corresponds
  #to the number of observations in the "activities" and "subject" data
  if (nrow(subjects_data$test_subject) != nrow(data$test_data)){
    stop("Test data observations do not coincide with test subject set")
  }
  if (nrow(subjects_data$train_subject) != nrow(data$train_data)){
    stop("Train data observations do not coincide with train subject set")
  }
  if (nrow(activities_data$test_activities) != nrow(data$test_data)){
    stop("Test data observations do not coincide with test activities set")
  }
  if (nrow(activities_data$train_activities) != nrow(data$train_data)){
    stop("Train data observations do not coincide with train activities set")
  }
  
  #merges "subject" and "activity" data to the whole "train" and "test" dataset
  
  data$train_data <- cbind(subjects_data$train_subject, 
                           activity=train_activities$activity, 
                           data$train_data)
  data$test_data <- cbind(subjects_data$test_subject, 
                          activity=test_activities$activity, 
                          data$test_data)
  data
}