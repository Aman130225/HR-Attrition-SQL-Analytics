-- 02_dimensions/create_dimensions.sql
USE hr_attrition;

-- Department dimension
DROP TABLE IF EXISTS dim_department;
CREATE TABLE dim_department AS
SELECT DISTINCT department
FROM stg_hr_employee;

ALTER TABLE dim_department
  ADD COLUMN department_id INT AUTO_INCREMENT PRIMARY KEY;

-- Job dimension
DROP TABLE IF EXISTS dim_job;
CREATE TABLE dim_job AS
SELECT DISTINCT job_role, job_level
FROM stg_hr_employee;

ALTER TABLE dim_job
  ADD COLUMN job_id INT AUTO_INCREMENT PRIMARY KEY;

-- Employee dimension
DROP TABLE IF EXISTS dim_employee;
CREATE TABLE dim_employee AS
SELECT
  employee_id,
  age,
  gender,
  marital_status,
  education_field,
  total_working_years,
  years_at_company,
  years_in_current_role,
  years_since_last_promotion,
  years_with_curr_manager,
  distance_from_home,
  num_companies_worked
FROM stg_hr_employee;

ALTER TABLE dim_employee
  ADD PRIMARY KEY (employee_id);

