-- 01_raw.sql
-- Create raw table + load CSV into MySQL

USE hr_attrition;

SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

DROP TABLE IF EXISTS raw_hr_attrition;

CREATE TABLE raw_hr_attrition (
  Age INT,
  Attrition VARCHAR(5),
  BusinessTravel VARCHAR(50),
  DailyRate INT,
  Department VARCHAR(50),
  DistanceFromHome INT,
  Education INT,
  EducationField VARCHAR(50),
  EmployeeCount INT,
  EmployeeNumber INT,
  EnvironmentSatisfaction INT,
  Gender VARCHAR(10),
  HourlyRate INT,
  JobInvolvement INT,
  JobLevel INT,
  JobRole VARCHAR(50),
  JobSatisfaction INT,
  MaritalStatus VARCHAR(20),
  MonthlyIncome INT,
  MonthlyRate INT,
  NumCompaniesWorked INT,
  OverTime VARCHAR(5),
  PercentSalaryHike INT,
  PerformanceRating INT,
  RelationshipSatisfaction INT,
  StandardHours INT,
  StockOptionLevel INT,
  TotalWorkingYears INT,
  TrainingTimesLastYear INT,
  WorkLifeBalance INT,
  YearsAtCompany INT,
  YearsInCurrentRole INT,
  YearsSinceLastPromotion INT,
  YearsWithCurrManager INT
);

LOAD DATA LOCAL INFILE '/Users/amanjotkaur/Desktop/HR_Attrition_SQL_Project/data/HR_Attrition.csv'
INTO TABLE raw_hr_attrition
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT COUNT(*) AS total_rows FROM raw_hr_attrition;
