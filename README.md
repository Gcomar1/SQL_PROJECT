
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
Lists the **top 10 remote Data Analyst jobs** based on annual average salary.
```sql
SELECT 
    j.job_id,
    j.job_country,
    c.name AS company_name,
    j.job_title,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date
FROM job_postings_fact j
LEFT JOIN company_dim c ON j.company_id = c.company_id
WHERE j.job_title_short = 'Data Analyst' 
  AND j.salary_year_avg IS NOT NULL 
  AND j.job_location = 'Anywhere'
ORDER BY j.salary_year_avg DESC
LIMIT 10;
```

### ✅ `02_top_skills_in_top_jobs.sql`
Identifies **skills associated with the top-paying jobs**.
```sql
WITH job_ids AS (
    SELECT 
        j.job_id,
        j.job_country,
        c.name AS company_name,
        j.job_title,
        j.job_location,
        j.job_schedule_type,
        j.salary_year_avg,
        j.job_posted_date
    FROM job_postings_fact j
    LEFT JOIN company_dim c ON j.company_id = c.company_id
    WHERE j.job_title_short = 'Data Analyst' 
      AND j.salary_year_avg IS NOT NULL 
      AND j.job_location = 'Anywhere'
    ORDER BY j.salary_year_avg DESC
)
SELECT
    sjd.skill_id,
    sd.skills,
    ji.*
FROM job_ids ji
INNER JOIN skills_job_dim sjd ON ji.job_id = sjd.job_id
LEFT JOIN skills_dim sd ON sjd.skill_id = sd.skill_id;
```

### ✅ `03_most_demanded_skills.sql`
Returns the **top 5 most in-demand skills** for Data Analyst roles.
```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```

### ✅ `04_top_paying_skills.sql`
Calculates the **average salary for each skill**.
```sql
SELECT 
    skills,
    round(AVG(salary_year_avg)) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    and salary_year_avg is not null 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 50;
```

### ✅ `05_optimal_skills.sql`
Finds the most **strategic skills to learn** (high salary + high demand).
```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

---

## 📈 Dashboards & Summary of Insights

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
