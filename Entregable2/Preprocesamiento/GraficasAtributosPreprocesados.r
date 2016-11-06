#Edad por rangos
ageValues <- c(2410,16708,11111,2233,99)
ageTags <- c("10-20","21-40","41-60","61-80","81-100")
barplot(ageValues,  names.arg = ageTags, main = "Edades")
#Clases de trabajo
workclassValues <- c(22696,2541,1116,960,2093,1298,14,7,1836)
workclassTags <- c("Private","Self-emp-not-inc","Self-emp-inc","Federal-gov","Local-gov","State-gov","Without- pay","Never-worked","?")
barplot(workclassValues, names.arg = workclassTags, main = "Clase de Trabajo")
#final weight por rangos
finalValues <- c(5670,14503,7976,3148,892)
finalTags <-c("0-100,000", "100,001-200,000", "200,001-300,000", "300,001-400,000", "400,001-500,000")
barplot(finalValues, names.arg = finalTags, main = "Final Weight")
# Education por frecuencias
educationValues <- c(933,1175,433,168,333,646,514,1067,1382,5355,413,10501,1723,51,576,7291)
educationTags <- c("10th", "11th", "12th", "1st-4th", "5th-6th", "7th-8th", "9th", "Assoc-acdm", "Assoc-voc","Bachelors", "Doctorate", "HS-grad", "Masters","Preschool", "Prof-school", "Some-college")
barplot(educationValues,names.arg = educationTags, main = "Education")
# marital-status por frecuencia
maritalValues <- c(14976,4443,10683,1025,993,418,23)
maritalTags <- c("Married-civ-spouse","Divorced","Never-married","Separated","Widowed","Married-spouse-absent","Married-AF-spouse")
barplot(maritalValues, names.arg = maritalTags, main = "Estado Civil")
# occupation por frecuencias
occupationValues <- c(928,4099,3295,3650,4066,4140,1370,2002,3770,994,1597,149,649,9,1843)
occupationTags <- c("Tech-support","Craft-repair","Other-service","Sales","Exec-managerial","Prof-specialty","Handlers-cleaners","Machine-op-inspct","Adm-clerical","Farming-fishing","Transport-moving","Priv-house-serv","Protective-serv","Armed-Forces","?")
barplot(occupationValues, names.arg = occupationTags, main = "Ocupacion")
#relationship por frecuecias
relationshipValues <- c(1568,5068,13193,8305,981,3446)
relationshipTags <- c("Wife","Own-child","Husband","Not-in-family","Other-relative","Unmarried")
barplot(relationshipValues, names.arg = relationshipTags, main = "Relacion en Familia")
# race por frecuencias
raceValues <- c(27816,1039,311,271,3124)
raceTags <- c("White","Asian-Pac-Islander","Amer-Indian-Eskimo","Other","Black")
barplot(raceValues,names.arg = raceTags, main = "Raza")
#sex por frecuencias
sexValues <- c(10771,21790)
sexTags <- c("Female","Male")
barplot(sexValues, names.arg = sexTags, main = "Sexo")
#hours_per_week por rangos
hpwValues <- c(2928,20052,8471,902,208)
hpwTags <- c("10-20","21-40","41-60","61-80","81-100")
barplot(hpwValues, names.arg = hpwTags, main = "Horas a la semana")
#Paises por frecuencia
ncValues <- c(29170,19,90,114,121,137,14,100,62,29,80,75,95,13,198,73,60,81,67,643,37,24,29,70,18,28,51,44,59,13,64,34,12,18,16,106,19,20,1,583)
ncTags <- c("United-States","Cambodia","England","Puerto-Rico","Canada","Germany","Outlying-US(Guam- USVI-etc)","India","Japan","Greece","South","China","Cuba","Honduras","Philippines","Italy","Poland","Jamaica","Vietnam","Mexico","Portugal","Ireland","France","Dominican-Republic","Laos","Ecuador","Taiwan","Haiti","Columbia","Hungary","Guatemala","Nicaragua","Scotland","Thailand","Yugoslavia","El-Salvador","Trinadad&Tobago","Hong","Holand-Netherlands","?")
barplot(ncValues, names.arg = ncTags, main = "Paises")
#total por frecuencia
totValues <- c(24720,7841)
totTags <- c("<=50K",">50K")
barplot(totValues, names.arg = totTags, main = "Total")

