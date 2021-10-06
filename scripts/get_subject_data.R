get_subject_data <- function(data_dir){
  #reads "subject_test" and "subject_train" file to get a vector of the subject
  # id corresponding to each observation in "test" and "train" data
  train_subject <- read.table(paste0(data_dir, "train//subject_train.txt"))
  test_subject <- read.table(paste0(data_dir, "test//subject_test.txt"))
  
  #changes name of the column of "subject" data to "subject"  
  names(train_subject) <- "subject"
  names(test_subject) <- "subject"
  list(test_subject=test_subject, train_subject=train_subject)
}