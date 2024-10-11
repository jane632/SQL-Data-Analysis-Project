/* 
Question:What are the top paying Data Analyst jobs?
-Identify the top 10 paying data analyst jobs that are available remotely.
-identify job postings with a salary(removing nulls)
-Identify the company
-Why? Finding the optimal skills and roles that are required in data analyst roles
*/

SELECT
       job_id,
       job_title,
       job_location,
       job_schedule_type,
       salary_year_avg,
       job_posted_date,
       name AS company_name
FROM   
       job_postings_fact
LEFT JOIN 
        company_dim 
ON    
    job_postings_fact.company_id = company_dim.company_id      
WHERE 
       job_title_short = 'Data Analyst' AND 
       job_location = 'Anywhere' AND
       salary_year_avg IS NOT NULL
ORDER BY 
         salary_year_avg DESC
LIMIT 10;