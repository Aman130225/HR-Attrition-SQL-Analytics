-- 04_analytics/executive_queries.sql
USE hr_attrition;

-- Overall
SELECT
  COUNT(*) AS total_employees,
  SUM(is_attrition) AS employees_left,
  ROUND(100 * AVG(is_attrition), 2) AS attrition_rate_pct
FROM fact_attrition;

-- Department
SELECT
  d.department,
  COUNT(*) AS employees,
  SUM(f.is_attrition) AS attrition_count,
  ROUND(100 * AVG(f.is_attrition), 2) AS attrition_rate_pct
FROM fact_attrition f
JOIN dim_department d ON f.department_id = d.department_id
GROUP BY d.department
ORDER BY attrition_rate_pct DESC;

-- Job role
SELECT
  j.job_role,
  COUNT(*) AS employees,
  SUM(f.is_attrition) AS attrition_count,
  ROUND(100 * AVG(f.is_attrition), 2) AS attrition_rate_pct
FROM fact_attrition f
JOIN dim_job j ON f.job_id = j.job_id
GROUP BY j.job_role
HAVING COUNT(*) >= 30
ORDER BY attrition_rate_pct DESC;

-- Overtime
SELECT
  overtime,
  COUNT(*) AS employees,
  SUM(is_attrition) AS attrition_count,
  ROUND(100 * AVG(is_attrition), 2) AS attrition_rate_pct
FROM fact_attrition
GROUP BY overtime
ORDER BY attrition_rate_pct DESC;

-- Income band
SELECT
  CASE
    WHEN monthly_income < 3000 THEN 'Low'
    WHEN monthly_income BETWEEN 3000 AND 7000 THEN 'Medium'
    ELSE 'High'
  END AS income_band,
  COUNT(*) AS employees,
  SUM(is_attrition) AS attrition_count,
  ROUND(100 * AVG(is_attrition), 2) AS attrition_rate_pct
FROM fact_attrition
GROUP BY income_band
ORDER BY attrition_rate_pct DESC;

