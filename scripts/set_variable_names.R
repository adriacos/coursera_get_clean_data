set_variable_names <- function(data_dir, data){
  #reads "features" file, to get the names of the features
  #(every variable in test and train data corresponds to one of these features)
  features <- read.table(paste0(data_dir, "features.txt"))
  
  #cheks that the number of variables in "test" and "train" data coincides with  
  #the number of features in "features" data (each variable should correspond to 
  #one features, in order)
  if (nrow(features) != ncol(data$test_data)){
    stop("Test data variables do not coincide with features list")
  }
  if (nrow(features) != ncol(data$train_data)){
    stop("Train data variables do not coincide with features list")
  }
  
  #sets the column names of the "train" and "test" data using the name of the
  #features as obtained in the "features" data 
  names(data$train_data) <- features[[2]]
  names(data$test_data) <- features[[2]]
  
  data
}