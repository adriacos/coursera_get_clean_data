get_activities_data <- function(data_dir){
  #reads "y_test" and "y_train" file to get a vector of the activity id
  # corresponding to each observation in "test" and "train" data 
  test_activities <- read.table(paste0(data_dir, "test//y_test.txt"))
  train_activities <- read.table(paste0(data_dir, "train//y_train.txt"))
  #gets the activities labels (names) from the "activity_labels" file 
  activities_labels <- read.table(paste0(data_dir, "activity_labels.txt"))
  #relates each activity id both for "test" and "train" data with their labels
  train_activities <- merge(train_activities, activities_labels)
  test_activities <- merge(test_activities, activities_labels)
  #changes column names for "activities" data to "activityId" and "activity"
  names(train_activities) <- c("activityId", "activity")
  names(test_activities) <- c("activityId", "activity")
  list(test_activities=test_activities, train_activities=train_activities)
}