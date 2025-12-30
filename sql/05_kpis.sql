USE hr_attrition;

-- Overall attrition KPI
SELECT
  COUNT(*) AS total_employees,
  SUM(attrition_flag) AS employees_left,
  ROUND(SUM(attrition_flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM fact_attrition;

-- Attrition by department
SELECT
  d.department,
  COUNT(*) AS total,
  SUM(f.attrition_flag) AS left_count,
  ROUND(SUM(f.attrition_flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM fact_attrition f
JOIN dim_department d ON f.department_id = d.department_id
GROUP BY d.department
ORDER BY attrition_rate_pct DESC;

-- Attrition by job role
SELECT
  j.job_role,
  COUNT(*) AS total,
  SUM(f.attrition_flag) AS left_count,
  ROUND(SUM(f.attrition_flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM fact_attrition f
JOIN dim_job j ON f.job_id = j.job_id
GROUP BY j.job_role
ORDER BY attrition_rate_pct DESC;

-- Attrition by overtime
SELECT
  CASE WHEN overtime_flag = 1 THEN 'Overtime' ELSE 'No Overtime' END AS overtime_group,
  COUNT(*) AS total,
  SUM(attrition_flag) AS left_count,
  ROUND(SUM(attrition_flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM fact_attrition
GROUP BY overtime_flag;

-- Attrition by tenure band
SELECT
  tenure_band,
  COUNT(*) AS total,
  SUM(attrition_flag) AS left_count,
  ROUND(SUM(attrition_flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM fact_attrition
GROUP BY tenure_band
ORDER BY attrition_rate_pct DESC;
