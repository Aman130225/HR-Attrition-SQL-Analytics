# HR Attrition Analytics — SQL & Power BI Project
##  Project Summary

This project analyzes employee attrition using a full analytics workflow:
data ingestion → transformation → dimensional modeling → KPI analysis → executive reporting.

It identifies the key drivers of employee turnover and provides actionable insights
to support HR decision-making and retention strategies.

##  About This Project

This project explores employee attrition using SQL and Power BI with the goal of understanding **why employees leave** and what actions a company could take to improve retention.

I built the complete analytics pipeline myself — starting from raw HR data, cleaning and transforming it in SQL, designing a proper data model, calculating business KPIs, and finally creating an interactive executive dashboard in Power BI.

I wanted this project to reflect the real workflow of a data analyst supporting HR teams with data-driven decisions.

---

##  Business Problems I Wanted to Answer

- What is the overall employee attrition rate?
- Which departments have the highest employee turnover?
- Which job roles are most at risk?
- Does overtime significantly increase attrition?
- How does employee tenure impact attrition?
- Are there specific high-risk employee profiles?

---

##  Data Pipeline Design

Each layer was designed deliberately so that business questions could be answered cleanly and reliably, similar to how data pipelines are structured in real analytics teams.

###  Data Model (EER Diagram)

This diagram shows how raw HR data is transformed into a clean analytics model with staging, dimension, and fact tables.

![HR Attrition EER Diagram](documentation/HR_Attrition_EER.png)

**Raw Data → Cleaning & Feature Engineering → Dimensional Modeling → KPI Analysis**

##  How to Run This Project (MySQL)

### 1) Create the database
Create a schema in MySQL called: `hr_attrition`

### 2) Run scripts in order (top → bottom)
1. **Load raw data:** [`sql/01_raw.sql`](sql/01_raw.sql)  
   > If using `LOAD DATA LOCAL INFILE`, update the CSV path inside the file to match your machine.
2. **Staging (cleaning + buckets):** [`sql/02_staging.sql`](sql/02_staging.sql)
3. **Dimensions:** [`sql/03_dimensions.sql`](sql/03_dimensions.sql)
4. **Fact table:** [`sql/04_fact.sql`](sql/04_fact.sql)
5. **KPI queries:** [`sql/05_kpis.sql`](sql/05_kpis.sql)
6. **Advanced insights:** [`sql/06_advanced_insights.sql`](sql/06_advanced_insights.sql)

### 3) Dataset
CSV is stored here: [`data/HR_Attrition.csv`](data/HR_Attrition.csv)

---

##  Key Results
| Metric | Result |
|------|------:|
| Overall Attrition Rate | **16.12%** |
| Highest-Risk Department | **Sales (20.63%)** |
| Highest-Risk Job Role | **Sales Representative (39.76%)** |
| Attrition with Overtime | **30.53%** |
| Attrition without Overtime | **10.44%** |
| Highest-Risk Tenure Group | **0–1 years (34.88%)** |

##  Business Impact

The analysis highlights critical areas for intervention:
- Improving working conditions for Sales teams could significantly reduce turnover.
- Reducing excessive overtime may lower attrition by more than 20 percentage points.
- Strengthening onboarding and mentorship for new hires can stabilize early-career retention.

These insights provide HR leaders with a data-driven foundation for strategic workforce planning.


---

##  Business Recommendations

Based on the analysis and key findings, the following actions are recommended to reduce employee attrition and improve retention:

### 1 Reduce Overtime Pressure
Employees working overtime show nearly **3× higher attrition** compared to those who do not.
- Introduce workload balancing and realistic project planning.
- Monitor departments with consistently high overtime usage.
- Encourage healthy work–life balance through policy changes.

### 2 Strengthen Sales Team Retention
Sales, especially **Sales Representatives**, experience the highest turnover.
- Review performance targets and incentive structures.
- Provide additional coaching and career progression opportunities.
- Improve manager support and feedback cycles.

### 3 Improve Onboarding for New Employees
Attrition is highest among employees with **0–1 year tenure**.
- Enhance onboarding programs and mentorship initiatives.
- Schedule regular check-ins during the first year of employment.
- Provide clear career paths and growth expectations early.

### 4 Use Predictive Monitoring
Develop early-warning indicators using:
- Overtime trends  
- Job satisfaction metrics  
- Tenure patterns  

This allows HR teams to proactively intervene before employees decide to leave.
## ✅ What These Results Suggest
- Attrition is concentrated in **Sales**, especially **Sales Representatives**.
- **Overtime** is a major risk factor (attrition is ~3x higher vs no overtime).
- The most vulnerable employees are **new hires (0–1 years)** → onboarding and early support likely matter a lot.

---

##   Power BI Dashboard (Screenshots)

### Executive Overview
![Executive Overview](powerbi/screenshots/executive_overview.png)

### Attrition by Department
![Department Attrition](powerbi/screenshots/department_attrition.png)

### Attrition by Job Role
![Job Role Attrition](powerbi/screenshots/jobrole_attrition.png)

---

##   Tools & Technologies

- MySQL  
- SQL  
- Power BI  

---

##   Repository Structure
```text
data/
  HR_Attrition.csv
sql/
  01_raw.sql
  02_staging.sql
  03_dimensions.sql
  04_fact.sql
  05_kpis.sql
  06_advanced_insights.sql
powerbi/
  screenshots/
    executive_overview.png
    department_attrition.png
    jobrole_attrition.png
README.md


---

##   Why I Built This

I created this project to strengthen my data analytics skills and to demonstrate how data can be transformed into business-ready insights.

##   What I Learned

- Building scalable SQL data pipelines
- Designing dimensional models for analytics
- Translating raw data into executive-level insights
- Communicating technical results through business dashboards




