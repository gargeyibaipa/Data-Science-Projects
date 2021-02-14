setwd("C:\\Users\\Triveni\\Desktop\\MSDSBA\\Winter 2020\\DSA 6000 Data #Science and Analytics\\HW\\Lab\\Flights Project\\flight-delays")
mod2 <- source("Flights_QDA.R")
scores<-function(newdata = test_fligts_rf)
{
  

  model_pred<-predict(model_qda_cv, newdata,type="prob") 
   return(model_pred)
  

}

predictions<-function(newdata = test_fligts_rf)
{

 model.pred<-predict(model_qda_cv, newdata,type="prob")#,type="prob"
 QDA_score<-model.pred[,2]
 QDA_class <- ifelse(QDA_score > 0.9, 1, 0)
  return(QDA_class)

}





  