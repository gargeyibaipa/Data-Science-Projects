#Team - Sreejit Sivasankaran,Shivakala Gargeyi B,Michael Lupo,Vidhi Shah,Naveen Donthineni
library(ggplot2)
library(MASS)
library(dplyr)
library(pROC)
library(caret)
setwd("C:\\Users\\Triveni\\Desktop\\MSDSBA\\Winter 2020\\DSA 6000 Data Science and Analytics\\HW\\Lab\\Flights Project\\flight-delays\\Flights_Finalcode")
flights1<-read.csv("flight .csv")
str(flights1)
flights1<-na.omit(flights1)
set.seed(2019)
summary(flights1)

##check correlation in the dataset

cor(flights1[,-4])##seems ArrDelay,DepDelay & distance,SchedElapsedTime are highly corelated

##model selection based on subset criteria..

library(leaps)
regfit.full<-regsubsets(Canceled~.,data=flights1,nvmax = 8)
regfit.full.summary<-summary(regfit.full)
names(regfit.full.summary)
plot(regfit.full,scale='Cp')
coef(regfit.full,8)
names(regfit.full.summary)
plot(regfit.full.summary$bic)
which.min(regfit.full.summary$bic)
coef(regfit.full,6)
regfit.full_fwd<-regsubsets(Canceled~.,data=flights1,nvmax = 8,method="backward")
regfit.full.summary_fwd<-summary(regfit.full_fwd)
names(regfit.full.summary_fwd)
plot(regfit.full.summary_fwd$cp)
which.min(regfit.full.summary_fwd$cp)

#according to model selection best model is @ 6 predictors...


## Use Sampling method for QDA###

# Observe the joint distribution of predictors
library(scatterplot3d)  # install first
library(rgl)
plot3d(flights1[,c('DepartureTime','UniqueCarrier','DepDelay','Distance',"Month")], col = flights1$Canceled + 1)

train<-sample(1:nrow(flights1),0.9*nrow(flights1))
train_QDA<-flights1[train,]
test_QDA<-flights1[-train,]
model_QDA<-qda(flights1$Canceled~.-ArrDelay-SchedElapsedTime,data=flights1,subset = train)
QDA_Predict<-predict(model_QDA,newdata=test_QDA,type="response")
confusionMatrix(factor(test_QDA$Canceled),QDA_Predict$class)
roc_step <- roc(test_QDA$Canceled, QDA_Predict$posterior[,1])
roc_step$auc

#### cross Validation ####

train_cntrl<-trainControl(method="cv", number=10)
model_qda_cv <- train(factor(Canceled)~.-ArrDelay-SchedElapsedTime,data=flights1, method="qda",trControl=train_cntrl)
model_glm_cv <- train(factor(Canceled)~.-ArrDelay-SchedElapsedTime-Month-UniqueCarrier,data=flights1, method="glm",trControl=train_cntrl)
model_lda_cv <- train(factor(Canceled)~.-ArrDelay-SchedElapsedTime-Month-UniqueCarrier,data=flights1, method="lda",trControl=train_cntrl)







