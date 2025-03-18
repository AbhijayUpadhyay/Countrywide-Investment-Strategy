-- create database mad;

use mad;

CREATE TABLE age_fixed_data AS
	SELECT * FROM age_data
    WHERE YEAR = 5;
    
    
DROP TABLE IF EXISTS total;
CREATE TABLE total AS
	SELECT fips_data_2.state, age_fixed_data.year, income_data.county_FIPS, fips_data_2.name, income_data.county, income_data.per_capita_personal_income_2019, income_data.per_capita_personal_income_2021, income_data.bachelor_degree_percentage_2015_2019, age_fixed_data.MEDIAN_AGE_TOT 
    FROM income_data
    INNER JOIN fips_data_2 ON fips_data_2.fips = income_data.county_FIPS
    INNER JOIN age_fixed_data ON age_fixed_data.CTYNAME = fips_data_2.name
    AND age_fixed_data.STNAME = fips_data_2.state;
    
SELECT distinct(state) FROM fips_data_2
	WHERE state NOT IN (SELECT distinct(state) FROM total);
    
SELECT * FROM total;