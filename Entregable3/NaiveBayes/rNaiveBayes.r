datest = read.csv("/Users/rodrigorojo/Documents/CC/7Semestre/ProyectoFinalMineria/Entregable3/NaiveBayes/AdultDataSetTest.csv", header = FALSE)
library(class)
library(e1071)
classifier<-naiveBayes(datest[,1:14], datest[,15])
predicitions <- predict(classifier, datest[,-15])
pr <- as.vector(predicitions)
ok <- datest$V15 == pr
table(ok)
table(datest$V15)
table(pr)
i = 0
a = 0
b = 0
c = 0
d = 0
for (values in mc){
  
}