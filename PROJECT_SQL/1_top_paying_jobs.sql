/*
                        Main Question: What are the top-paying Data Analyst jobs?
Identify Roles:
    -List the top 10 highest-paying Data Analyst roles that are available remotely.
    -Their Company
Data Consideration:
    Focus on job postings that include specified salaries (remove any entries with null salaries).

Purpose:
    Highlight the highest-paying opportunities for Data Analysts, providing insights into potential employment options.
*/

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