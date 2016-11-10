﻿SELECT * FROM AGE;
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
------------
SELECT (SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 10 AND 20 and TOTAL = ' >50K') as "10-20", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 21 AND 40 and TOTAL = ' >50K') as "21-40", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 41 AND 60 and TOTAL = ' >50K') as "41-60", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 61 AND 80 and TOTAL = ' >50K') as "61-80", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 81 AND 100 and TOTAL = ' >50K') as "81-100",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' >50K') AS "Total"	
UNION
SELECT (SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 10 AND 20 and TOTAL = ' <=50K') as "10-20", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 21 AND 40 and TOTAL = ' <=50K') as "21-40", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 41 AND 60 and TOTAL = ' <=50K') as "41-60", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 61 AND 80 and TOTAL = ' <=50K') as "61-80", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 81 AND 100 and TOTAL = ' <=50K') as "81-100",
	(SELECT COUNT(*) FROM ADULT WHERE TOTAL = ' <=50K') AS "Total"
UNION
SELECT (SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 10 AND 20) as "10-20", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 21 AND 40) as "21-40", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 41 AND 60) as "41-60", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 61 AND 80) as "61-80", 
	(SELECT COUNT(*) FROM ADULT WHERE AGE BETWEEN 81 AND 100) as "81-100",
	(SELECT COUNT(*) FROM ADULT) as "Total" ;
	