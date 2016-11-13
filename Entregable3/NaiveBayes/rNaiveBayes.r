datest = read.csv("AdultDataSetTest.csv", header = FALSE)
library(class)
library(e1071)
classifier<-naiveBayes(datest[,1:14], datest[,15])
predicitions <- predict(classifier, datest[,-15])
pr <- as.vector(predicitions)
ok <- datest$V15 == pr
table(ok)