/*
Question:What are the top paying skills based on salary?
-Look at the Avg salary associated with each skill for
a Data Analyst position.
-Focuses on roles based on salariees regardless of location
Why?It reveals different skills impact salary levels for Data Analyst
and the most financially rewarding skill to acquire.
*/


SELECT skills,
       ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
     job_title_short = 'Data Analyst'AND
     salary_year_avg IS NOT NULL AND
     job_work_from_home = True
GROUP BY
       skills
ORDER BY 
       avg_salary DESC
LIMIT 25;



/*
Data and AI: High-paying jobs emphasize data science and AI tools like PySpark, Pandas, Jupyter, and DataRobot, reflecting the demand for data manipulation and machine learning expertise.

Cloud and DevOps: Cloud platforms (GCP) and DevOps tools (Kubernetes, Jenkins, Bitbucket) command significant salaries, indicating the importance of automation and scalable infrastructure.

Programming and Automation: Specialized programming languages (Golang, Swift) and automation technologies (Airflow, Jenkins) offer lucrative opportunities, especially in backend, mobile, and operational roles.

[
  {
    "skills": "svn",
    "avg_salary": "400000.000000000000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000.000000000000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.000000000000"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155485.500000000000"
  },
  {
    "skills": "golang",
    "avg_salary": "155000.000000000000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000.000000000000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633.333333333333"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500.000000000000"
  },
  {
    "skills": "terraform",
    "avg_salary": "146733.833333333333"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500.000000000000"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126.000000000000"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999.162500000000"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820.000000000000"
  },
  {
    "skills": "keras",
    "avg_salary": "127013.333333333333"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226.200000000000"
  },
  {
    "skills": "perl",
    "avg_salary": "124685.750000000000"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370.000000000000"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950.000000000000"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120646.833333333333"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118406.681818181818"
  },
  {
    "skills": "notion",
    "avg_salary": "118091.666666666667"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117965.600000000000"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116711.750000000000"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387.260563380282"
  },
  {
    "skills": "scala",
    "avg_salary": "115479.533898305085"
  }
]
*/