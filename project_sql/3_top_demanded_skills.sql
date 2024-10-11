/* Question:What are the most in demand skills in data analysts jobs?
-join job_postings table to query 2
-identify the top 5 in demand skills for a data analyst
-focus on all job postings
-Why? Retrieves the top 5 skills with the highest demand
in the job market providing insights to the most valuable
skills for job seekers.
*/

SELECT skills,
       COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
     job_title_short = 'Data Analyst'AND
     job_work_from_home = True
GROUP BY
       skills
ORDER BY 
       demand_count DESC
LIMIT 5;

/* Overall Demand for Skills
SQL (7,291): SQL has the highest demand, indicating that data analysts predominantly need strong database management skills. SQL is essential for querying databases, making it a fundamental skill in data analysis.
Excel (4,611): Excel remains a crucial tool for data analysts, showcasing its enduring relevance for data manipulation, analysis, and reporting. Its versatility and widespread use in business environments contribute to its high demand.
Python (4,330): Python is increasingly important in data analytics, often used for more complex analyses, data visualization, and machine learning tasks. Its demand suggests a shift towards programming skills in data analysis roles.
Tableau (3,745): Tableau's presence indicates a significant need for data visualization skills, reflecting the importance of presenting data insights effectively to stakeholders.
Power BI (2,609): Power BI, while slightly less in demand than Tableau, still plays a vital role in business intelligence and data visualization. This suggests a competitive landscape where proficiency in both tools can be advantageous
 
 [
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/