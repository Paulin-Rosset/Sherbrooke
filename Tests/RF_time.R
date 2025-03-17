# Data Source: https://archive.ics.uci.edu/ml/machine-learning-databases/car/
install.packages("randomForest")
library(randomForest)
library(caret)

# Load the dataset and explore
meta <- readRDS("C:/Users/user/OneDrive/Bureau/Sherbrooke/r-novice-inflammation/directory/H23_MicrobiomeWorkshop_SB/Fichiers été printemps/meta.rds")
data1=meta
str(data1)
summary(data1)
data1=na.omit(data1)


#I had issues since R doesn't handle more than 53 factors. It seems that sample and seq were previously considered as such
for (i in seq(1,9)) {print(class(data1[,i]))}
data1$time = as.factor(data1$time)
data1$sample = as.character(data1$sample)
data1$seq = as.character(data1$seq)

data2=data1[,-c(1,2,4,7)]
data3=(data1[,-c(1,2,3,4,7)])

#Dataset used in the presentation. Useless features are removed.
data_set_size2=floor(nrow(data2)*0.8)
index2=sample(1:nrow(data2),size=data_set_size2)
training2=data2[index2,]
testing2=data2[-index2,]

#Dataset used in the presentation without the date feature
data_set_size3=floor(nrow(data3)*0.8)
index3=sample(1:nrow(data3),size=data_set_size3)
training3=data3[index3,]
testing3=data3[-index3,]



rf2=randomForest(time~ .,data=training2,mtry=2,ntree=2001,importance=TRUE) #mtree must be an odd number to avoid tie between predictions
rf3=randomForest(time~ .,data=training3,mtry=2,ntree=10001,importance=TRUE) 

rf2
plot(rf2)
result=data.frame(testing2$time,predict(rf2,testing2,type="response"))
head(result)
plot(result)
varImpPlot(rf2)
importance(rf2)



#Test
#confusionMatrix belongs to the caret library
predictions2 <- predict(rf2, testing2)
conf_matrix2 <- confusionMatrix(predictions2, testing2$time)
conf_matrix2

predictions3 <- predict(rf3, testing3)
conf_matrix3 <- confusionMatrix(predictions3, testing3$time)
conf_matrix3

