-- 01_staging/create_stg.sql
USE hr_attrition;

DROP TABLE IF EXISTS stg_hr_employee;

CREATE TABLE stg_hr_employee AS
SELECT
  EmployeeNumber AS employee_id,
  Age AS age,
  CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END AS is_attrition,
  BusinessTravel AS business_travel,
  Department AS department,
  EducationField AS education_field,
  Gender AS gender,
  JobRole AS job_role,
  JobLevel AS job_level,
  MaritalStatus AS marital_status,
  OverTime AS overtime,
  MonthlyIncome AS monthly_income,
  PercentSalaryHike AS percent_salary_hike,
  PerformanceRating AS performance_rating,
  StockOptionLevel AS stock_option_level,
  TotalWorkingYears AS total_working_years,
  TrainingTimesLastYear AS training_times_last_year,
  WorkLifeBalance AS work_life_balance,
  YearsAtCompany AS years_at_company,
  YearsInCurrentRole AS years_in_current_role,
  YearsSinceLastPromotion AS years_since_last_promotion,
  YearsWithCurrManager AS years_with_curr_manager,
  EnvironmentSatisfaction AS environment_satisfaction,
  JobSatisfaction AS job_satisfaction,
  JobInvolvement AS job_involvement,
  RelationshipSatisfaction AS relationship_satisfaction,
  DistanceFromHome AS distance_from_home,
  DailyRate AS daily_rate,
  HourlyRate AS hourly_rate,
  MonthlyRate AS monthly_rate,
  NumCompaniesWorked AS num_companies_worked
FROM raw_hr_attrition;

ALTER TABLE stg_hr_employee
  ADD PRIMARY KEY (employee_id);

CREATE INDEX idx_stg_attrition ON stg_hr_employee (is_attrition);
CREATE INDEX idx_stg_dept_role ON stg_hr_employee (department, job_role);
CREATE INDEX idx_stg_overtime ON stg_hr_employee (overtime);

