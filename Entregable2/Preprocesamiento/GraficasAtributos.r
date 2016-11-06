adult = read.csv("/Users/rodrigorojo/Desktop/preprocess/Adult-data.csv")
#Edad
ed <- matrix(adult[,1])
barplot(table(ed),
        main = "Edad")
#Clase de trabajo 
ct <- matrix(adult[,2])
barplot(table(adult[,2]), 
        main="Clase de Trabajo")
#Peso Total 
barplot(table(matrix(adult[,3])), 
        main="Peso Total", 
        xlab = "")
hist(table(matrix(adult[,3])), 
     main="Peso Total Histograma", 
     xlab = "")
#Educacion
e <- matrix(adult[,4])
barplot(table(e), 
        main="Educacion")
#Numero de educacion
barplot(table(adult[,5]), 
        main="Numero de educacion")
#Estado Civil
ec <- matrix(adult[,6])
barplot(table(ec), 
        main="Estado Civil")
#Ocupacion
o <- matrix(adult[,7])
barplot(table(o), 
        main="Ocupacion")
#Relacion en su familia
rf <- matrix(adult[,8])
barplot(table(rf), 
        main="Realcion en su familia")
#Raza
ra <- matrix(adult[,9])
barplot(table(ra), 
        main="Raza")
#Sexo
se <- matrix(adult[,10])
barplot(table(se), 
        main="Sexo")
#Ganancia Capital
gc <- matrix(adult[,11])
barplot(table(gc), 
        main="Ganancia Capital")
#Perdida Capital
pc <- matrix(adult[,12])
barplot(table(pc), 
        main="Perdida Capital")
#Horas a la semana
hs <- matrix(adult[,13])
barplot(table(hs), 
        main="Horas de trabajo a la semana")
#Pais de Origen 
po <- matrix(adult[,14])
barplot(table(po), 
        main="Pais de Origen")
#Total de salario
ts <- matrix(adult[,15])
barplot(table(ts), 
        main="Total de salario")
plot(adult[,1],adult[,13], xlab="Edad", ylab="Horas a la Semana", main="")

############################################################################
#Graficas de dos atributos
#ocupacion-horas
ocupacion = adult[,7]
horasSemana = adult[,13]
pairs(~ocupacion+horasSemana,main="Ocupacion - Horas a la Semana")
levels(ocupacion)
#ocupacion-raza
ocupacion = adult[,7]
raza = adult[,9]
pairs(~ocupacion+raza,main="Ocupacion - Raza")
levels(ocupacion)
levels(raza)
#claseTrabajo-educacion
claseTrabajo = adult[,2]
educacion = adult[,4]
pairs(~claseTrabajo+educacion,main="Clase de Trabajo - Educacion")
levels(claseTrabajo)
levels(educacion)
#sexo-relacionEnFamilia
sexo = adult[,10]
relacionEnFamilia = adult[,8]
pairs(~sexo+relacionEnFamilia,main="Sexo - Relacion en Familia")
levels(sexo)
levels(relacionEnFamilia)
#edad-educacion
edad <- adult[,1]
educacion <- adult[,4]
pairs(~edad+educacion,main="Edad - Educacion")
levels(educacion)
#edad-claseTrabajo
edad <- adult[,1]
claseTrabajo <- adult[,2]
pairs(~edad+claseTrabajo,main="Edad - Clase de Trabajo")
levels(claseTrabajo)
#raza-horasSemana
raza <- adult[,9]
horasSemana <- adult[,13]
pairs(~raza+horasSemana,main="Raza - Horas a la Semana")
levels(raza)
#edad-horasSemana
edad <- adult[,1]
horasSemana <- adult[,13]
pairs(~edad+horasSemana,main="Edad - Horas a la Semana")
#pais-ocupacion
pais <- adult[,14]
ocupacion <- adult[,7]
pairs(~pais+ocupacion,main="Pais - Ocupacion")
levels(pais)
levels(ocupacion)
#claseTrabajo-relFam
claseTrabajo <- adult[,2]
relFam <- adult[,8]
pairs(~claseTrabajo+relFam,main="Clase de Trabajo - Relacion de Familia")
levels(claseTrabajo)
levels(relFam)
#Todos los atributos
pairs(~adult[,1]+adult[,2]+adult[,3]+adult[,4]+adult[,5]+adult[,6]+adult[,7]+adult[,8]+adult[,9]+adult[,10]+adult[,11]+adult[,12]+adult[,13]+adult[,14]+adult[,15])

