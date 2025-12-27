-- 03_facts/create_fact_attrition.sql
USE hr_attrition;

DROP TABLE IF EXISTS fact_attrition;

CREATE TABLE fact_attrition AS
SELECT
  e.employee_id,
  d.department_id,
  j.job_id,
  s.is_attrition,
  s.monthly_income,
  s.overtime,
  s.work_life_balance,
  s.job_satisfaction,
  s.environment_satisfaction,
  s.relationship_satisfaction,
  s.performance_rating
FROM stg_hr_employee s
JOIN dim_employee e ON s.employee_id = e.employee_id
JOIN dim_department d ON s.department = d.department
JOIN dim_job j ON s.job_role = j.job_role
             AND s.job_level = j.job_level;

CREATE INDEX idx_fact_dept ON fact_attrition (department_id);
CREATE INDEX idx_fact_job ON fact_attrition (job_id);
CREATE INDEX idx_fact_attrition ON fact_attrition (is_attrition);
CREATE INDEX idx_fact_overtime ON fact_attrition (overtime);

