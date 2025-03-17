library(e1071)
library(caTools)
#I wanted at first to present the svm (Support Vecotrs Machine) as well in my talk. But using it is way more difficult than RF
#A lot of optimization has to be done. In the end svm is more accurate than RF in most cases I believe.
#This code works, but I can't really go further.
#Algorithm you should consider learning in the future
data2=meta[,-4]

data2$time = factor(data2$time,levels = c("mai", "juillet", "août"))
data2=na.omit(data2)

set.seed(123)
split = sample.split(data2$time, SplitRatio = 0.8)

training_set2 = subset(data2, split == TRUE)
test_set2 = subset(data2, split == FALSE)
train=data.frame(training_set2)
test=data.frame(test_set2)


classifier = svm(formula = time ~ .,
                 data=train,
                 type = 'C-classification',
                 kernel = 'linear')


y_pred = predict(classifier, newdata = test[-8])
cm = table(test_set2[, 8], y_pred)
cm


