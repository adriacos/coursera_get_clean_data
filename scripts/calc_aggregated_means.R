

calc_aggregated_means <- function(data){
  #calculates the average (mean) of each feature grouped by subject and activity
  #and ordered by subject
  test_means <- aggregate(data$test_data[,!names(data$test_data) %in% c("subject", "activity")], 
                          by=list(subject=data$test_data$subject, activity=data$test_data$activity), 
                          FUN=mean, na.rm=TRUE)
  train_means <- aggregate(data$train_data[,!names(data$train_data) %in% c("subject", "activity")], 
                           by=list(subject=data$train_data$subject, activity=data$train_data$activity), 
                           FUN=mean, na.rm=TRUE)
  test_means <- test_means[order(test_means$subject),]
  train_means <- train_means[order(train_means$subject),]
  
  #We could also do this with dplyr
  #library(dplyr)
  #test_means <- summarise(group_by(test_data, subject, activity), across(everything(), mean))
  #train_means <- summarise(group_by(train_data, subject, activity), across(everything(), mean))
  
  list(test_means=test_means, train_means=train_means)
}