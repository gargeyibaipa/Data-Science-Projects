library(ggplot2)
library(MASS)
library(dplyr)
setwd("C:\\Users\\Triveni\\Desktop\\MSDSBA\\Winter 2020\\DSA 6000 Data Science and Analytics\\HW\\Lab\\Flights Project\\flight-delays")
flights1<-read.csv("flight .csv")
str(flights1)
flights1<-na.omit(flights1)
set.seed(2019)
summary(flights1)

## Use Sampling method for QDA###

train<-sample(1:nrow(flights1),0.9*nrow(flights1))
train_QDA<-flights1[train,]
test_QDA<-flights1[-train,]
model_QDA_1<-qda(flights1$Canceled~.-ArrDelay-SchedElapsedTime,data=flights1,subset = train)
model_QDA_exmonth<-qda(flights1$Canceled~.-ArrDelay-SchedElapsedTime-Month,data=flights1,subset = train)
train_month<-flights1%>%
  filter(flights1$Month<11)
test_month<- flights1%>%
  filter(flights1$Month>=11)
nrow(test_month)
model_QDA_month<-qda(Canceled~.-ArrDelay-SchedElapsedTime,data=train_month)
pr_month<-predict(model_QDA_month,test_month,type="reponse")
summary(model_QDA_month)


#### cross Validation of QDA####
library(pROC)
library(caret)
confusionMatrix(factor(test_month$Canceled),pr_month$class)
roc_step <- roc(test_month$Canceled, pr_month$posterior[,1])
roc_step$auc


train_cntrl<-trainControl(method="cv", number=10)
model_qda_cv <- train(factor(Canceled)~.-ArrDelay-SchedElapsedTime,data=flights1, method="qda",trControl=train_cntrl)

###Use Sample method for Random forest##
library(randomForest)
library(gbm)
model_rf<-randomForest(factor(Canceled)~.,data=flights1,mtry=4,importance=TRUE)
names(model_rf)
varImpPlot(model_rf)
pr.rf<-predict(model_rf,newdata=test_QDA,type="prob")
cl.rf = predict(model_rf,newdata=test_QDA,type="class")
head(pr.rf)
summary(predict_rf)
print(predict_rf)
confusionMatrix(factor(test_QDA$Canceled),cl.rf)
roc_step <- roc(test_QDA$Canceled, pr.rf[,1],levels=c("1", "0"), direction="<")
roc_step$auc
plot(roc_step)
head(test_QDA$Canceled)

####Random forest####

