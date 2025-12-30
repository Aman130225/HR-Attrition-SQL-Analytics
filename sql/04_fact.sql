USE hr_attrition;

DROP TABLE IF EXISTS fact_attrition;

CREATE TABLE fact_attrition AS
SELECT
    s.employee_id,
    d.department_id,
    j.job_id,

    s.attrition_flag,
    s.overtime_flag,

    s.age,
    s.monthly_income,
    s.years_at_company,
    s.total_working_years,
    s.distance_from_home,

    s.job_satisfaction,
    s.environment_satisfaction,
    s.relationship_satisfaction,
    s.work_life_balance,
    s.job_involvement,
    s.performance_rating,

    s.age_band,
    s.income_band,
    s.tenure_band
FROM stg_hr_employee s
JOIN dim_department d ON s.department = d.department
JOIN dim_job j ON s.job_role = j.job_role;

-- sanity checks
SELECT COUNT(*) AS fact_rows FROM fact_attrition;
SELECT * FROM fact_attrition LIMIT 5;

