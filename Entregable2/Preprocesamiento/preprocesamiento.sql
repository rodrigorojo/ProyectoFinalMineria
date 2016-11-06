--Quitamos al atributo education_num
ALTER TABLE adult DROP COLUMN education_num;
----------------------------------------------------------------------------------------
--TABLA DE EDADES POR RANGOS DE 20
SELECT (SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 10 AND 20) as "10-20", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 21 AND 40) as "21-40", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 41 AND 60) as "41-60", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 61 AND 80) as "61-80", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 81 AND 100) as "81-100" 
	INTO AGE;
SELECT * FROM AGE;
----------------------------------------------------------------------------------------
--TABLA DE FRECUENCIAS DE WORKCLASS
SELECT (SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Private') AS "Private", 
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Self-emp-not-inc') AS "Self-emp-not-inc", 
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Self-emp-inc') AS "Self-emp-inc", 
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Federal-gov') AS "Federal-gov", 
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Local-gov') AS "Local-gov", 
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' State-gov') AS "State-gov", 
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Without-pay') AS "Without- pay", 
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Never-worked') AS "Never-worked",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' ?') AS "?"
	INTO WORKCLASS;
SELECT * FROM WORKCLASS;
-------------------------------------------------------------------------------------------
--TABLA FRECUENCIAS POR RANGOS DE 100,000 DEL ATRIBUTO FINLWGT 
SELECT (SELECT COUNT(*) FROM ADULT WHERE FNLWGT BETWEEN 0 AND 100000) AS "0-100,000", 
	(SELECT COUNT(*) FROM ADULT WHERE FNLWGT BETWEEN 100001 AND 200000) AS "100,001-200,000", 
	(SELECT COUNT(*) FROM ADULT WHERE FNLWGT BETWEEN 200001 AND 300000) AS "200,001-300,000", 
	(SELECT COUNT(*) FROM ADULT WHERE FNLWGT BETWEEN 300001 AND 400000) AS "300,001-400,000", 
	(SELECT COUNT(*) FROM ADULT WHERE FNLWGT BETWEEN 400001 AND 500000) AS "400,001-500,000"
	INTO FNLWGT;
SELECT * FROM FNLWGT;
-------------------------------------------------------------------------------------------
--TABLA DE FRECUENCIAS DE EDUCATION
SELECT (SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 10th') AS "10th", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 11th')  AS "11th", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 12th') AS "12th", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 1st-4th') AS "1st-4th", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 5th-6th') AS "5th-6th", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 7th-8th') AS "7th-8th", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 9th') AS "9th", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Assoc-acdm') AS "Assoc-acdm",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Assoc-voc') AS "Assoc-voc", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Bachelors') AS "Bachelors", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Doctorate') AS "Doctorate", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Doctorate') AS "HS-grad",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Masters') AS "Masters", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Preschool') AS "Preschool", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Prof-school') AS "Prof-school", 
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Some-college') AS "Some-college"
	INTO EDUCATION;
SELECT * FROM EDUCATION;
-------------------------------------------------------------------------------------------
--TABLA DE FRECUENCIAS DE MARITAL_STATUS
SELECT (SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-civ-spouse') AS "Married-civ-spouse",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Divorced') AS "Divorced",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Never-married') AS "Never-married",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Separated') AS "Separated",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Widowed') AS "Widowed",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-spouse-absent') AS "Married-spouse-absent",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-AF-spouse') AS "Married-AF-spouse"
	INTO MARITAL_STATUS;
SELECT * FROM MARITAL_STATUS;
-------------------------------------------------------------------------------------------
--TABLA DE FRECUENCIAS DE OCCUPATION
SELECT (SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Tech-support') AS "Tech-support",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Craft-repair') AS "Craft-repair",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Other-service') AS "Other-service",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Sales') AS "Sales",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Exec-managerial') AS "Exec-managerial",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Prof-specialty') AS "Prof-specialty",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Handlers-cleaners') AS "Handlers-cleaners",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Machine-op-inspct') AS "Machine-op-inspct",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Adm-clerical') AS "Adm-clerical",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Farming-fishing') AS "Farming-fishing",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Transport-moving') AS "Transport-moving",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Priv-house-serv') AS "Priv-house-serv",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Protective-serv') AS "Protective-serv",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Armed-Forces') AS "Armed-Forces",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' ?') AS "?"
	INTO OCCUPATION;
SELECT * FROM OCCUPATION;
-------------------------------------------------------------------------------------------
--TABLA DE FRECUENCIAS DE RELATIONSHIP
SELECT (SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Wife') AS "Wife",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Own-child') AS "Own-child",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Husband') AS "Husband",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Not-in-family') AS "Not-in-family",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Other-relative') AS "Other-relative",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Unmarried') AS "Unmarried"
	INTO RELATIONSHIP;
SELECT * FROM RELATIONSHIP;
-------------------------------------------------------------------------------------------
--TABLA DE FRECUENCIAS DE RACE
SELECT (SELECT COUNT(*) FROM ADULT WHERE RACE = ' White') AS "White",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Asian-Pac-Islander') AS "Asian-Pac-Islander",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Amer-Indian-Eskimo') AS "Amer-Indian-Eskimo",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Other') AS "Other",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Black') AS "Black"
	INTO RACE;
SELECT * FROM RACE;
-------------------------------------------------------------------------------------------
--TABLA DE FRECUENCIAS DE SEX
SELECT (SELECT COUNT(*) FROM ADULT WHERE SEX = ' Female') AS "Female",
	(SELECT COUNT(*) FROM ADULT WHERE SEX = ' Male') AS "Male"
	INTO SEX;
SELECT * FROM SEX;
-------------------------------------------------------------------------------------------
--TABLA DE HORAS A LA SEMANA POR RANGOS DE 20
SELECT (SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 0 AND 20) as "10-20", 
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 21 AND 40) as "21-40", 
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 41 AND 60) as "41-60", 
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 61 AND 80) as "61-80", 
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 81 AND 100) as "81-100" 
	INTO HOURS_PER_WEEK;
SELECT * FROM HOURS_PER_WEEK;
-------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' United-States') AS "United-States",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Cambodia') AS "Cambodia",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' England') AS "England",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Puerto-Rico') AS "Puerto-Rico",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Canada') AS "Canada",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Germany') AS "Germany",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Outlying-US(Guam-USVI-etc)') AS "Outlying-US(Guam- USVI-etc)",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' India') AS "India",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Japan') AS "Japan",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Greece') AS "Greece",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' South') AS "South",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' China') AS "China",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Cuba') AS "Cuba",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Honduras') AS "Honduras",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Philippines') AS "Philippines",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Italy') AS "Italy",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Poland') AS "Poland",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Jamaica') AS "Jamaica",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Vietnam') AS "Vietnam",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Mexico') AS "Mexico",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Portugal') AS "Portugal",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Ireland') AS "Ireland",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' France') AS "France",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Dominican-Republic') AS "Dominican-Republic",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Laos') AS "Laos",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Ecuador') AS "Ecuador",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Taiwan') AS "Taiwan",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Haiti') AS "Haiti",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Columbia') AS "Columbia",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Hungary') AS "Hungary",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Guatemala') AS "Guatemala",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Nicaragua') AS "Nicaragua",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Scotland') AS "Scotland",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Thailand') AS "Thailand",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Yugoslavia') AS "Yugoslavia",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' El-Salvador') AS "El-Salvador",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Trinadad&Tobago') AS "Trinadad&Tobago",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Hong') AS "Hong",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' Holand-Netherlands') AS "Holand-Netherlands",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' ?') AS "?"
	INTO NATIVE_COUNTRY;
SELECT * FROM NATIVE_COUNTRY;
-------------------------------------------------------------------------------------------