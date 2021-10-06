save_clean_data <- function(data){
  #saves all data into corresponding files in data/clean folder
  write.table(data$train_data, ".//data//clean//train_data.csv", sep=",", 
              row.names = FALSE, col.names = TRUE)
  write.table(data$test_data, ".//data//clean//test_data.csv", sep=",", 
              row.names = FALSE, col.names = TRUE)
  write.table(data$train_means, ".//data//clean//train_means.csv", sep=",", 
              row.names = FALSE, col.names = TRUE)
  write.table(data$test_means, ".//data//clean//test_means.csv", sep=",", 
              row.names = FALSE, col.names = TRUE)
}