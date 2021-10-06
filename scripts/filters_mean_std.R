filters_mean_std <- function(data){
  #filters data in order to get only observations corresponding to the mean and 
  #the standard deviation of each measurement, using "grepl"
  data$train_data <- data$train_data[,c(1,2, 
                                        which(grepl("-mean()|-std()", 
                                                    names(data$train_data))))]
  data$test_data <- data$test_data[,c(1,2,
                                      which(grepl("-mean()|-std()", 
                                                  names(data$test_data))))]
  
  data
}