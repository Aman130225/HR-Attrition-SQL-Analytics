USE hr_attrition;

DROP TABLE IF EXISTS stg_hr_employee;

CREATE TABLE stg_hr_employee AS
SELECT
    EmployeeNumber                                   AS employee_id,

    TRIM(Department)                                 AS department,
    TRIM(JobRole)                                    AS job_role,
    TRIM(Gender)                                     AS gender,
    TRIM(MaritalStatus)                              AS marital_status,
    TRIM(BusinessTravel)                             AS business_travel,
    TRIM(EducationField)                             AS education_field,

    Age                                               AS age,
    MonthlyIncome                                     AS monthly_income,
    YearsAtCompany                                    AS years_at_company,
    TotalWorkingYears                                 AS total_working_years,
    DistanceFromHome                                  AS distance_from_home,

    JobLevel                                          AS job_level,
    Education                                         AS education,
    NumCompaniesWorked                                AS num_companies_worked,

    JobSatisfaction                                   AS job_satisfaction,
    EnvironmentSatisfaction                           AS environment_satisfaction,
    RelationshipSatisfaction                          AS relationship_satisfaction,
    WorkLifeBalance                                   AS work_life_balance,
    JobInvolvement                                    AS job_involvement,
    PerformanceRating                                 AS performance_rating,

    -- Flags
    CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END     AS attrition_flag,
    CASE WHEN OverTime  = 'Yes' THEN 1 ELSE 0 END     AS overtime_flag,

    -- Buckets
    CASE
      WHEN Age BETWEEN 18 AND 25 THEN '18-25'
      WHEN Age BETWEEN 26 AND 35 THEN '26-35'
      WHEN Age BETWEEN 36 AND 45 THEN '36-45'
      WHEN Age BETWEEN 46 AND 55 THEN '46-55'
      ELSE '56+'
    END                                               AS age_band,

    CASE
      WHEN MonthlyIncome < 3000 THEN '<3k'
      WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN '3k-6k'
      WHEN MonthlyIncome BETWEEN 6001 AND 10000 THEN '6k-10k'
      WHEN MonthlyIncome BETWEEN 10001 AND 15000 THEN '10k-15k'
      ELSE '15k+'
    END                                               AS income_band,

    CASE
      WHEN YearsAtCompany <= 1 THEN '0-1'
      WHEN YearsAtCompany BETWEEN 2 AND 4 THEN '2-4'
      WHEN YearsAtCompany BETWEEN 5 AND 9 THEN '5-9'
      ELSE '10+'
    END                                               AS tenure_band

FROM raw_hr_attrition;

-- sanity checks
SELECT COUNT(*) AS stg_rows FROM stg_hr_employee;
SELECT attrition_flag, COUNT(*) FROM stg_hr_employee GROUP BY attrition_flag;
