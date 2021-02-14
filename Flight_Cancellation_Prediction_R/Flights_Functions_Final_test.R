library(pROC)
library(caret)
source("Flights_Functions.R")
#setwd("C:\\Users\\Triveni\\Desktop\\MSDSBA\\Winter 2020\\DSA 6000 Data Science and Analytics\\HW\\Lab\\Flights Project\\flight-delays")
mod2 <- source("Flights_QDA.R")
flights_test<-read.csv("flights_testdata_month.csv")
flights_test$SchedElapsedTime[is.na(flights_test$SchedElapsedTime)] <- median(flights_test$SchedElapsedTime, na.rm=TRUE)
flights_test$ArrDelay[is.na(flights_test$ArrDelay)] <- median(flights_test$ArrDelay, na.rm=TRUE)
flights_test$Distance[is.na(flights_test$Distance)] <- median(flights_test$Distance, na.rm=TRUE)
flights_test$DepartureTime[is.na(flights_test$DepartureTime)] <- median(flights_test$DepartureTime, na.rm=TRUE)
flights_test$DepDelay[is.na(flights_test$DepDelay)] <- median(flights_test$DepDelay, na.rm=TRUE)

#code for QDA_CV
head(predictions(flights_test))
confusionMatrix(factor(flights_test$Canceled),factor(predictions(flights_test)))
pr<-scores(flights_test)
roc_step <- roc(factor(flights_test$Canceled), pr[,1])
roc_step$auc

#code for QDA_Month
head(predictions(flights_test))
confusionMatrix(factor(flights_test$Canceled),factor(predictions(flights_test)))
pr<-scores(flights_test)
dim(pr)
roc_step <- roc(factor(flights_test$Canceled), pr[,2])
roc_step$auc

QDA_class<-factor(predictions(test_QDA))

table(QDA_class, factor(test_QDA$Canceled))  # Confusion matrix
mean(QDA_class == factor(test_QDA$Canceled))

QDA_score<-pr[,2]
head(QDA_score)
QDA_class <- ifelse(QDA_score > 0.9, 1, 0)
sum(QDA_class)
table(QDA_class, factor(flights_test$Canceled))  # Confusion matrix
mean(QDA_class == factor(flights_test$Canceled))  # Accuracy = (140 + 25)/200

# Try different thresholds and get the accuracies
thresh <- seq(0.2, 0.95, 0.01)
nt <- length(thresh)
threshold <- numeric(nt)
accuracy <- numeric(nt)
k = 1
for(t in thresh){
  QDA_class <- ifelse(QDA_score > t, 1, 0)
  threshold[k] <- t
  accuracy[k] <- mean(QDA_class == factor(flights_test$Canceled)) 
  k <- k+1
}
plot(threshold, accuracy, type='b')

max(threshold)



