USE hr_attrition;

-- 1) Department x Overtime (interaction)
SELECT
  d.department,
  CASE WHEN f.overtime_flag = 1 THEN 'Yes' ELSE 'No' END AS overtime,
  COUNT(*) AS total,
  SUM(f.attrition_flag) AS left_count,
  ROUND(SUM(f.attrition_flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM fact_attrition f
JOIN dim_department d ON f.department_id = d.department_id
GROUP BY d.department, f.overtime_flag
ORDER BY d.department, attrition_rate_pct DESC;

-- 2) High-risk profiles (multi-factor)
-- Who is leaving the most? (tenure + overtime + department)
SELECT
  d.department,
  f.tenure_band,
  CASE WHEN f.overtime_flag = 1 THEN 'Yes' ELSE 'No' END AS overtime,
  COUNT(*) AS total,
  SUM(f.attrition_flag) AS left_count,
  ROUND(SUM(f.attrition_flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM fact_attrition f
JOIN dim_department d ON f.department_id = d.department_id
GROUP BY d.department, f.tenure_band, f.overtime_flag
HAVING COUNT(*) >= 20
ORDER BY attrition_rate_pct DESC;

-- 3) Top 10 job roles by attrition volume (not rate)
SELECT
  j.job_role,
  COUNT(*) AS total,
  SUM(f.attrition_flag) AS left_count
FROM fact_attrition f
JOIN dim_job j ON f.job_id = j.job_id
GROUP BY j.job_role
ORDER BY left_count DESC
LIMIT 10;
