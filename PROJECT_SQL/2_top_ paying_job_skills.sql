/*
                Main Question: What are the top-paying Data Analyst jobs?
                Objectives:

Identify Roles:
List the top 10 highest-paying Data Analyst roles that are available remotely.

Data Consideration:
Focus on job postings that include specified salaries (remove any entries with null salaries).

Purpose:
Highlight the highest-paying opportunities for Data Analysts, providing insights into potential employment options.

*/
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
