# HR Attrition Analytics – End-to-End SQL Project

## 📌 Project Overview
This project simulates a real **People Analytics / HR Analytics** use case.  
The goal is to analyze employee attrition using SQL and deliver business insights that can help leadership reduce turnover and improve retention.

The project follows a professional analytics workflow:
**Raw Data → Staging → Dimensions → Fact Table → Executive Analytics**

---

## 🏗️ Data Architecture


---

## 📊 Key Business Findings

### 🔴 Overall Attrition
**16.12%** company-wide attrition

### 🧑‍💼 Departments with Highest Risk
| Department | Attrition |
|-----------|-----------|
| Sales | **20.63%** |
| Human Resources | 19.05% |
| R&D | 13.84% |

### 🧩 Roles at Highest Risk
| Role | Attrition |
|------|-----------|
| **Sales Representative** | **39.76%** |
| Laboratory Technician | 23.94% |
| HR | 23.08% |

### ⏱️ Overtime Impact
| Overtime | Attrition |
|---------|-----------|
| **Yes** | **30.53%** |
| No | 10.44% |

### 💰 Income Impact
| Income Band | Attrition |
|------------|-----------|
| **Low** | **28.61%** |
| Medium | 12.03% |
| High | 10.80% |

---

## 🛠️ How to Run the Project## 📥 Dataset
This repository does not include the raw CSV file (to keep the repo lightweight).
Download the IBM HR Attrition dataset and place it here:

`data/raw/hr_attrition_raw.csv`


```bash
mysql -u root -p < sql/00_schema/create_raw.sql
mysql -u root -p < sql/01_staging/create_stg.sql
mysql -u root -p < sql/02_dimensions/create_dimensions.sql
mysql -u root -p < sql/03_facts/create_fact_attrition.sql
mysql -u root -p < sql/04_analytics/executive_queries.sql

