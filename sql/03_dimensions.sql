USE hr_attrition;

-- Department dimension
DROP TABLE IF EXISTS dim_department;

CREATE TABLE dim_department AS
SELECT DISTINCT department
FROM stg_hr_employee
ORDER BY department;

ALTER TABLE dim_department
ADD COLUMN department_id INT AUTO_INCREMENT PRIMARY KEY;


-- Job role dimension
DROP TABLE IF EXISTS dim_job;

CREATE TABLE dim_job AS
SELECT DISTINCT job_role
FROM stg_hr_employee
ORDER BY job_role;

ALTER TABLE dim_job
ADD COLUMN job_id INT AUTO_INCREMENT PRIMARY KEY;

-- sanity check
SELECT * FROM dim_department;
SELECT * FROM dim_job;
