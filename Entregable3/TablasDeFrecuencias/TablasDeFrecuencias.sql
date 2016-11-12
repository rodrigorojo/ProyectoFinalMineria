SELECT * FROM AGE;
SELECT * FROM WORKCLASS;
SELECT * FROM FNLWGT;
SELECT * FROM EDUCATION;
SELECT * FROM MARITAL_STATUS;
SELECT * FROM OCCUPATION;
SELECT * FROM RELATIONSHIP;
SELECT * FROM RACE;
SELECT * FROM SEX;
SELECT * FROM HOURS_PER_WEEK;
SELECT * FROM NATIVE_COUNTRY;
SELECT * FROM TOTAL;
-- Tablas de frecuencias
------------------------------------------------------------------------------------------------
--FRECUAENCIAS_AGE
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 10 AND 20 and TOTAL = ' >50K') as "10y-20y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 21 AND 40 and TOTAL = ' >50K') as "21y-40y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 41 AND 60 and TOTAL = ' >50K') as "41y-60y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 61 AND 80 and TOTAL = ' >50K') as "61y-80y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 81 AND 100 and TOTAL = ' >50K') as "81y-100y",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total"	INTO FRECUENCIAS_AGE
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 10 AND 20 and TOTAL = ' <=50K') as "10y-20y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 21 AND 40 and TOTAL = ' <=50K') as "21y-40y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 41 AND 60 and TOTAL = ' <=50K') as "41y-60y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 61 AND 80 and TOTAL = ' <=50K') as "61y-80y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 81 AND 100 and TOTAL = ' <=50K') as "81y-100y",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 10 AND 20) as "10y-20y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 21 AND 40) as "21y-40y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 41 AND 60) as "41y-60y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 61 AND 80) as "61y-80y",
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 81 AND 100) as "81y-100y",
	(SELECT COUNT(*) FROM ADULT) as "Total";
SELECT * FROM FRECUENCIAS_AGE;
------------------------------------------------------------------------------------------------
-- FRECUENCIAS_WORKCLASS
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Private' AND TOTAL = ' >50K') AS "Private",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Self-emp-not-inc' AND TOTAL = ' >50K') AS "Self-emp-not-inc",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Self-emp-inc' AND TOTAL = ' >50K') AS "Self-emp-inc",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Federal-gov' AND TOTAL = ' >50K') AS "Federal-gov",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Local-gov' AND TOTAL = ' >50K') AS "Local-gov",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' State-gov' AND TOTAL = ' >50K') AS "State-gov",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Without-pay' AND TOTAL = ' >50K') AS "Without- pay",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Never-worked' AND TOTAL = ' >50K') AS "Never-worked",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' ?' AND TOTAL = ' >50K') AS "WORKCLASS-?",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total" INTO FRECUENCIAS_WORKCLASS
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Private' AND TOTAL = ' <=50K') AS "Private",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Self-emp-not-inc' AND TOTAL = ' <=50K') AS "Self-emp-not-inc",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Self-emp-inc' AND TOTAL = ' <=50K') AS "Self-emp-inc",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Federal-gov' AND TOTAL = ' <=50K') AS "Federal-gov",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Local-gov' AND TOTAL = ' <=50K') AS "Local-gov",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' State-gov' AND TOTAL = ' <=50K') AS "State-gov",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Without-pay' AND TOTAL = ' <=50K') AS "Without- pay",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Never-worked' AND TOTAL = ' <=50K') AS "Never-worked",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' ?' AND TOTAL = ' <=50K') AS "WORKCLASS-?",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Private') AS "Private",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Self-emp-not-inc') AS "Self-emp-not-inc",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Self-emp-inc') AS "Self-emp-inc",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Federal-gov') AS "Federal-gov",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Local-gov') AS "Local-gov",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' State-gov') AS "State-gov",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Without-pay') AS "Without- pay",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' Never-worked') AS "Never-worked",
	(SELECT COUNT(*) FROM ADULT WHERE WORKCLASS = ' ?') AS "WORKCLASS-?",
	(SELECT COUNT(*) FROM ADULT ) AS "Total";
SELECT * FROM FRECUENCIAS_WORKCLASS;
------------------------------------------------------------------------------------------------
-- FRECUENCIAS_EDUCATION
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 10th' AND TOTAL = ' >50K') AS "10th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 11th' AND TOTAL = ' >50K')  AS "11th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 12th' AND TOTAL = ' >50K') AS "12th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 1st-4th' AND TOTAL = ' >50K') AS "1st-4th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 5th-6th' AND TOTAL = ' >50K') AS "5th-6th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 7th-8th' AND TOTAL = ' >50K') AS "7th-8th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 9th' AND TOTAL = ' >50K') AS "9th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Assoc-acdm' AND TOTAL = ' >50K') AS "Assoc-acdm",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Assoc-voc' AND TOTAL = ' >50K') AS "Assoc-voc",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Bachelors' AND TOTAL = ' >50K') AS "Bachelors",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Doctorate' AND TOTAL = ' >50K') AS "Doctorate",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' HS-grad' AND TOTAL = ' >50K') AS "HS-grad",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Masters' AND TOTAL = ' >50K') AS "Masters",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Preschool' AND TOTAL = ' >50K') AS "Preschool",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Prof-school' AND TOTAL = ' >50K') AS "Prof-school",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Some-college' AND TOTAL = ' >50K') AS "Some-college",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total" INTO FRECUENCIAS_EDUCATION
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 10th' AND TOTAL = ' <=50K') AS "10th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 11th' AND TOTAL = ' <=50K')  AS "11th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 12th' AND TOTAL = ' <=50K') AS "12th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 1st-4th' AND TOTAL = ' <=50K') AS "1st-4th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 5th-6th' AND TOTAL = ' <=50K') AS "5th-6th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 7th-8th' AND TOTAL = ' <=50K') AS "7th-8th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' 9th' AND TOTAL = ' <=50K') AS "9th",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Assoc-acdm' AND TOTAL = ' <=50K') AS "Assoc-acdm",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Assoc-voc' AND TOTAL = ' <=50K') AS "Assoc-voc",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Bachelors' AND TOTAL = ' <=50K') AS "Bachelors",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Doctorate' AND TOTAL = ' <=50K') AS "Doctorate",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' HS-grad' AND TOTAL = ' <=50K') AS "HS-grad",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Masters' AND TOTAL = ' <=50K') AS "Masters",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Preschool' AND TOTAL = ' <=50K') AS "Preschool",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Prof-school' AND TOTAL = ' <=50K') AS "Prof-school",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Some-college' AND TOTAL = ' <=50K') AS "Some-college",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION ALL
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
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' HS-grad') AS "HS-grad",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Masters') AS "Masters",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Preschool') AS "Preschool",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Prof-school') AS "Prof-school",
	(SELECT COUNT(*) FROM ADULT WHERE EDUCATION = ' Some-college') AS "Some-college",
	(SELECT COUNT(*) FROM ADULT ) AS "Total";
SELECT * FROM FRECUENCIAS_EDUCATION;
------------------------------------------------------------------------------------------------
-- FRECUENCIAS_MARITAL_STATUS
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-civ-spouse' AND TOTAL = ' >50K') AS "Married-civ-spouse",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Divorced' AND TOTAL = ' >50K') AS "Divorced",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Never-married' AND TOTAL = ' >50K') AS "Never-married",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Separated' AND TOTAL = ' >50K') AS "Separated",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Widowed' AND TOTAL = ' >50K') AS "Widowed",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-spouse-absent' AND TOTAL = ' >50K') AS "Married-spouse-absent",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-AF-spouse' AND TOTAL = ' >50K') AS "Married-AF-spouse",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total" INTO FRECUENCIAS_MARITAL_STATUS
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-civ-spouse' AND TOTAL = ' <=50K') AS "Married-civ-spouse",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Divorced' AND TOTAL = ' <=50K') AS "Divorced",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Never-married' AND TOTAL = ' <=50K') AS "Never-married",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Separated' AND TOTAL = ' <=50K') AS "Separated",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Widowed' AND TOTAL = ' <=50K') AS "Widowed",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-spouse-absent' AND TOTAL = ' <=50K') AS "Married-spouse-absent",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-AF-spouse' AND TOTAL = ' <=50K') AS "Married-AF-spouse",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-civ-spouse') AS "Married-civ-spouse",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Divorced') AS "Divorced",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Never-married') AS "Never-married",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Separated') AS "Separated",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Widowed') AS "Widowed",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-spouse-absent') AS "Married-spouse-absent",
	(SELECT COUNT(*) FROM ADULT WHERE MARITAL_STATUS = ' Married-AF-spouse') AS "Married-AF-spouse",
	(SELECT COUNT(*) FROM ADULT ) AS "Total";
SELECT * FROM FRECUENCIAS_MARITAL_STATUS;
------------------------------------------------------------------------------------------------
-- FRECUENCIAS_OCCUPATION
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Tech-support' AND TOTAL = ' >50K') AS "Tech-support",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Craft-repair' AND TOTAL = ' >50K') AS "Craft-repair",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Other-service' AND TOTAL = ' >50K') AS "Other-service",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Sales' AND TOTAL = ' >50K') AS "Sales",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Exec-managerial' AND TOTAL = ' >50K') AS "Exec-managerial",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Prof-specialty' AND TOTAL = ' >50K') AS "Prof-specialty",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Handlers-cleaners' AND TOTAL = ' >50K') AS "Handlers-cleaners",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Machine-op-inspct' AND TOTAL = ' >50K') AS "Machine-op-inspct",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Adm-clerical' AND TOTAL = ' >50K') AS "Adm-clerical",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Farming-fishing' AND TOTAL = ' >50K') AS "Farming-fishing",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Transport-moving' AND TOTAL = ' >50K') AS "Transport-moving",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Priv-house-serv' AND TOTAL = ' >50K') AS "Priv-house-serv",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Protective-serv' AND TOTAL = ' >50K') AS "Protective-serv",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Armed-Forces' AND TOTAL = ' >50K') AS "Armed-Forces",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' ?' AND TOTAL = ' >50K') AS "OCCUPATION-?",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total" INTO FRECUENCIAS_OCCUPATION
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Tech-support' AND TOTAL = ' <=50K') AS "Tech-support",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Craft-repair' AND TOTAL = ' <=50K') AS "Craft-repair",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Other-service' AND TOTAL = ' <=50K') AS "Other-service",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Sales' AND TOTAL = ' <=50K') AS "Sales",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Exec-managerial' AND TOTAL = ' <=50K') AS "Exec-managerial",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Prof-specialty' AND TOTAL = ' <=50K') AS "Prof-specialty",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Handlers-cleaners' AND TOTAL = ' <=50K') AS "Handlers-cleaners",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Machine-op-inspct' AND TOTAL = ' <=50K') AS "Machine-op-inspct",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Adm-clerical' AND TOTAL = ' <=50K') AS "Adm-clerical",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Farming-fishing' AND TOTAL = ' <=50K') AS "Farming-fishing",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Transport-moving' AND TOTAL = ' <=50K') AS "Transport-moving",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Priv-house-serv' AND TOTAL = ' <=50K') AS "Priv-house-serv",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Protective-serv' AND TOTAL = ' <=50K') AS "Protective-serv",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' Armed-Forces' AND TOTAL = ' <=50K') AS "Armed-Forces",
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' ?' AND TOTAL = ' <=50K') AS "OCCUPATION-?",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION ALL
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
	(SELECT COUNT(*) FROM ADULT WHERE OCCUPATION = ' ?') AS "OCCUPATION-?",
	(SELECT COUNT(*) FROM ADULT ) AS "Total";
SELECT * FROM FRECUENCIAS_OCCUPATION;
------------------------------------------------------------------------------------------------
-- FRECUENCIAS_RELATIONSHIP
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Wife' AND TOTAL = ' >50K') AS "Wife",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Own-child' AND TOTAL = ' >50K') AS "Own-child",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Husband' AND TOTAL = ' >50K') AS "Husband",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Not-in-family' AND TOTAL = ' >50K') AS "Not-in-family",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Other-relative' AND TOTAL = ' >50K') AS "Other-relative",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Unmarried' AND TOTAL = ' >50K') AS "Unmarried",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total" INTO FRECUENCIAS_RELATIONSHIP
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Wife' AND TOTAL = ' <=50K') AS "Wife",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Own-child' AND TOTAL = ' <=50K') AS "Own-child",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Husband' AND TOTAL = ' <=50K') AS "Husband",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Not-in-family' AND TOTAL = ' <=50K') AS "Not-in-family",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Other-relative' AND TOTAL = ' <=50K') AS "Other-relative",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Unmarried' AND TOTAL = ' <=50K') AS "Unmarried",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Wife') AS "Wife",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Own-child') AS "Own-child",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Husband') AS "Husband",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Not-in-family') AS "Not-in-family",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Other-relative') AS "Other-relative",
	(SELECT COUNT(*) FROM ADULT WHERE RELATIONSHIP = ' Unmarried') AS "Unmarried",
	(SELECT COUNT(*) FROM ADULT ) AS "Total";
SELECT * FROM FRECUENCIAS_RELATIONSHIP;
------------------------------------------------------------------------------------------------
-- FRECUENCIAS_RACE
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE RACE = ' White' AND TOTAL = ' >50K') AS "White",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Asian-Pac-Islander' AND TOTAL = ' >50K') AS "Asian-Pac-Islander",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Amer-Indian-Eskimo' AND TOTAL = ' >50K') AS "Amer-Indian-Eskimo",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Other' AND TOTAL = ' >50K') AS "Other-Race",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Black' AND TOTAL = ' >50K') AS "Black",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total" INTO FRECUENCIAS_RACE
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE RACE = ' White' AND TOTAL = ' <=50K') AS "White",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Asian-Pac-Islander' AND TOTAL = ' <=50K') AS "Asian-Pac-Islander",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Amer-Indian-Eskimo' AND TOTAL = ' <=50K') AS "Amer-Indian-Eskimo",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Other' AND TOTAL = ' <=50K') AS "Other-Race",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Black' AND TOTAL = ' <=50K') AS "Black",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE RACE = ' White') AS "White",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Asian-Pac-Islander') AS "Asian-Pac-Islander",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Amer-Indian-Eskimo') AS "Amer-Indian-Eskimo",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Other') AS "Other-Race",
	(SELECT COUNT(*) FROM ADULT WHERE RACE = ' Black') AS "Black",
	(SELECT COUNT(*) FROM ADULT ) AS "Total";
SELECT * FROM FRECUENCIAS_RACE;
------------------------------------------------------------------------------------------------
-- FRECUENCIAS_SEX
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE SEX = ' Female' AND TOTAL = ' >50K') AS "Female",
	(SELECT COUNT(*) FROM ADULT WHERE SEX = ' Male' AND TOTAL = ' >50K') AS "Male",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total" INTO FRECUENCIAS_SEX
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE SEX = ' Female' AND TOTAL = ' <=50K') AS "Female",
	(SELECT COUNT(*) FROM ADULT WHERE SEX = ' Male' AND TOTAL = ' <=50K') AS "Male",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE SEX = ' Female') AS "Female",
	(SELECT COUNT(*) FROM ADULT WHERE SEX = ' Male') AS "Male",
	(SELECT COUNT(*) FROM ADULT) AS "Total";
SELECT * FROM FRECUENCIAS_SEX;
------------------------------------------------------------------------------------------------
-- FRECUENCIAS_CAPITAL_GAIN
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE CAPITAL_GAIN = 0 AND TOTAL = ' >50K') AS "CG-CERO",
	(SELECT COUNT(*) FROM ADULT WHERE CAPITAL_GAIN > 0 AND TOTAL = ' >50K') AS "CG-MAYOR-CERO",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total" INTO FRECUENCIAS_CAPITAL_GAIN
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE CAPITAL_GAIN = 0 AND TOTAL = ' <=50K') AS "CG-CERO",
	(SELECT COUNT(*) FROM ADULT WHERE CAPITAL_GAIN > 0 AND TOTAL = ' <=50K') AS "CG-MAYOR-CERO",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE CAPITAL_GAIN = 0) AS "CG-CERO",
	(SELECT COUNT(*) FROM ADULT WHERE CAPITAL_GAIN > 0) AS "CG-MAYOR-CERO",
	(SELECT COUNT(*) FROM ADULT) AS "Total";
SELECT * FROM FRECUENCIAS_CAPITAL_GAIN;
------------------------------------------------------------------------------------------------
-- FRECUENCIAS_CAPITAL_LOSS
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE CAPITAL_LOSS = 0 AND TOTAL = ' >50K') AS "CL-CERO",
	(SELECT COUNT(*) FROM ADULT WHERE CAPITAL_LOSS > 0 AND TOTAL = ' >50K') AS "CL-MAYOR-CERO",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total" INTO FRECUENCIAS_CAPITAL_LOSS
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE CAPITAL_LOSS = 0 AND TOTAL = ' <=50K') AS "CL-CERO",
	(SELECT COUNT(*) FROM ADULT WHERE CAPITAL_LOSS > 0 AND TOTAL = ' <=50K') AS "CL-MAYOR-CERO",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION ALL
SELECT (SELECT COUNT(*) FROM ADULT WHERE CAPITAL_LOSS = 0) AS "CL-CERO",
	(SELECT COUNT(*) FROM ADULT WHERE CAPITAL_LOSS > 0) AS "CL-MAYOR-CERO",
	(SELECT COUNT(*) FROM ADULT) AS "Total";
SELECT * FROM FRECUENCIAS_CAPITAL_LOSS;
------------------------------------------------------------------------------------------------
-- FRECUENCIAS_HOURS_PER_WEEK
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 0 AND 20 AND TOTAL = ' >50K') as "10h-20h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 21 AND 40 AND TOTAL = ' >50K') as "21h-40h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 41 AND 60 AND TOTAL = ' >50K') as "41h-60h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 61 AND 80 AND TOTAL = ' >50K') as "61h-80h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 81 AND 100 AND TOTAL = ' >50K') as "81h-100h",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total" INTO FRECUENCIAS_HOURS_PER_WEEK
UNION
SELECT (SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 0 AND 20 AND TOTAL = ' <=50K') as "10h-20h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 21 AND 40 AND TOTAL = ' <=50K') as "21h-40h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 41 AND 60 AND TOTAL = ' <=50K') as "41h-60h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 61 AND 80 AND TOTAL = ' <=50K') as "61h-80h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 81 AND 100 AND TOTAL = ' <=50K') as "81h-100h",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION
SELECT (SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 0 AND 20) as "10h-20h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 21 AND 40) as "21h-40h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 41 AND 60) as "41h-60h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 61 AND 80) as "61h-80h",
	(SELECT COUNT(*) FROM ADULT WHERE HOURS_PER_WEEK BETWEEN 81 AND 100) as "81h-100h",
	(SELECT COUNT(*) FROM ADULT) AS "Total"
SELECT * FROM FRECUENCIAS_HOURS_PER_WEEK
------------------------------------------------------------------------------------------------
--FRECUENCIAS_NATIVE_COUNTRY
------------------------------------------------------------------------------------------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' United-States' and TOTAL = ' >50K') AS "United-States",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY NOT LIKE ' United-States' AND NATIVE_COUNTRY NOT LIKE ' ?' and TOTAL = ' >50K') AS "Foreigner",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' ?' and TOTAL = ' >50K') AS "COUNTRY-?",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total"	INTO FRECUENCIAS_NATIVE_COUNTRY
UNION
SELECT (SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' United-States' and TOTAL = ' <=50K') AS "United-States",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY NOT LIKE ' United-States' AND NATIVE_COUNTRY NOT LIKE ' ?' and TOTAL = ' <=50K') AS "Foreigner",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' ?' and TOTAL = ' <=50K') AS "COUNTRY-?",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION
SELECT (SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' United-States') AS "United-States",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY NOT LIKE ' United-States' AND NATIVE_COUNTRY NOT LIKE ' ?') AS "Foreigner",
	(SELECT COUNT(*) FROM ADULT WHERE NATIVE_COUNTRY = ' ?') AS "COUNTRY-?",
	(SELECT COUNT(*) FROM ADULT) as "Total";
SELECT * FROM FRECUENCIAS_NATIVE_COUNTRY;

SELECT * INTO TABLAFRECUENCIAS
FROM frecuencias_age
NATURAL JOIN frecuencias_capital_gain
NATURAL JOIN frecuencias_capital_loss
NATURAL JOIN frecuencias_education
NATURAL JOIN frecuencias_hours_per_week
NATURAL JOIN frecuencias_marital_status
NATURAL JOIN frecuencias_native_country
NATURAL JOIN frecuencias_occupation
NATURAL JOIN frecuencias_race
NATURAL JOIN frecuencias_relationship
NATURAL JOIN frecuencias_sex
NATURAL JOIN frecuencias_workclass;

SELECT * FROM TABLAFRECUENCIAS

COPY TABLAFRECUENCIAS TO '/tmp/TABLAFRECUENCIAS.csv' DELIMITER ',' CSV HEADER;
