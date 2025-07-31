from pathlib import Path

# Define the README content
readme_content = """
# 📁 PROJECT_SQL - Data Analyst Job Market Insights (SQL Project)

## 📊 Overview

**PROJECT_SQL** is a SQL-based data analysis project that explores the **Data Analyst job market** using structured queries to extract business insights. The project aims to help aspiring and working data analysts identify:

- The **highest-paying remote jobs**
- The **most in-demand skills**
- The **skills that bring the highest salary**
- The **optimal combination of skills** that offer both demand and income

This analysis is purely done in **SQL**, using data from job postings and related dimensions.

---

## 🛠 Tools & Technologies

- SQL (PostgreSQL or similar dialect)
- GitHub for version control
- DB schema with fact and dimension tables:
  - `job_postings_fact`
  - `company_dim`
  - `skills_job_dim`
  - `skills_dim`

---

## 📚 Dataset Overview

The dataset consists of job postings for **Data Analyst** roles, including:

- Job metadata (title, location, company, posted date)
- Salary (average yearly salary where available)
- Associated required skills per job
- Company information
- Work location (remote, hybrid, onsite)

---

## 📌 Main Business Questions

1. **What are the top-paying remote Data Analyst jobs?**
2. **What skills are associated with those top-paying roles?**
3. **Which skills are in highest demand for Data Analysts?**
4. **What skills offer the highest average salary?**
5. **What are the most optimal skills to learn (high salary + high demand)?**

---

## 📁 Project File Breakdown

### ✅ `01_top_paying_jobs.sql`
- Lists the **top 10 remote Data Analyst jobs** based on annual average salary.
- Filters out postings with `NULL` salary values.
- Includes company, title, location, and posted date.

### ✅ `02_top_skills_in_top_jobs.sql`
- Identifies **skills associated with the top-paying jobs**.
- Joins job data with skill mappings and lists all required skills per role.
- Insights show dominance of skills like **SQL**, **Python**, **Tableau**, and **Excel**.

### ✅ `03_most_demanded_skills.sql`
- Returns the **top 5 most in-demand skills** for Data Analyst roles.
- Focuses on **remote jobs only**.
- Output suggests:
  - `SQL`: 7291 postings  
  - `Excel`: 4611  
  - `Python`, `Tableau`, `Power BI` also prominent

### ✅ `04_top_paying_skills.sql`
- Calculates the **average salary for each skill**.
- Focuses on **remote jobs with known salary**.
- Skills like `PySpark`, `GitLab`, `Pandas`, `Databricks`, and `Jupyter` offer top average salaries.

### ✅ `05_optimal_skills.sql`
- Merges **demand and salary metrics** to find the **most strategic skills** to learn.
- Criteria:
  - High demand (>10 job mentions)
  - High average salary
- Highlights skills like:
  - `Snowflake`, `Azure`, `AWS`, `Python`, `Tableau`, `Looker`, `Oracle`

---

## 📈 Dashboards & Summary of Insights

While this project is code-only, below are example summaries that can later be used in Tableau/Power BI dashboards:

### 💰 Top Remote Salaries
| Company        | Job Title                         | Salary ($)  |
|----------------|----------------------------------|-------------|
| AT&T           | Associate Director               | 255,829     |
| Pinterest      | Marketing Data Analyst           | 232,423     |
| UCLA Health    | Remote Data Analyst              | 217,000     |

### 🔥 Most In-Demand Skills
| Skill     | Demand Count |
|-----------|---------------|
| SQL       | 7291          |
| Excel     | 4611          |
| Python    | 4330          |
| Tableau   | 3745          |
| Power BI  | 2609          |

### 🧠 Highest Paying Skills
| Skill         | Avg Salary ($) |
|---------------|----------------|
| PySpark       | 208,172        |
| Bitbucket     | 189,155        |
| Pandas        | 151,821        |
| Databricks    | 141,907        |

### 💡 Optimal Skills to Learn
| Skill       | Demand | Avg Salary |
|-------------|--------|------------|
| Python      | 236    | 101,397    |
| Tableau     | 230    | 99,288     |
| Snowflake   | 37     | 112,948    |
| AWS         | 32     | 108,317    |
| Azure       | 34     | 111,225    |

---

## 🧠 Conclusion

This project helps aspiring **Data Analysts** make informed decisions about which skills to pursue and which job roles offer the best opportunities — all powered by **pure SQL** without external tools or libraries.
"""
