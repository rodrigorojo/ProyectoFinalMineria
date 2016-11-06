CREATE TABLE adult(
	age INT,
	workclass VARCHAR(32),
	fnlwgt INT,
	education VARCHAR(32),
	education_num INT,
	marital_status VARCHAR(32),
	occupation VARCHAR(32),
	relationship VARCHAR(32),
	race VARCHAR(32),
	sex VARCHAR(32),
	capital_gain INT,
	capital_loss INT,
	hours_per_week INT,
	native_country VARCHAR(32),
	total VARCHAR(32)
);
--Linux
COPY adult FROM '/tmp/AdultDataSet/Adult-data.tbl' WITH DELIMITER ',';
--Mac
COPY adult FROM '/Users/Shared/AdultDataSet/Adult-data.tbl' WITH DELIMITER ',';

Select * from adult;