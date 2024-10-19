--Update contents of this later
# Introduction
Exploring the Data Job Market: This project dives deep into data analyst roles, highlighting the top-paying💸positions, the most in-demand 🔥skills, and where high demand intersects with lucrative salaries in the field of data analytics.

"Curious about SQL queries? Explore them here: [project_sql_folder](/project_sql/)

# Background
"Motivated by a passion to excel in the data analyst field, this project is focused on uncovering key insights in the job market to identify optimal roles. It showcases my analytical skills and market research, positioning me as a strong candidate ready to make an impact."

## Through my SQL queries, I aimed to answer these 

Key questions:

1.Which jobs pay the most?

2.What skills do the highest-paying jobs require?

3.What are the most in-demand skills for data analysts?

4.Which skills lead to higher salaries?

5.What are the best skills to learn for a successful career?

# Tools I Used

## For my deep dive into the data analyst job market, I used several key tools:

- **SQL:** The core of my analysis, helping me query the database and uncover important insights.

- **PostgreSQL**: My database management system, perfect for managing job posting data.
- **Visual Studio Code**: My main tool for writing and running SQL queries.

- **Git & GitHub** : Essential for version control and sharing my SQL scripts, ensuring smooth collaboration and project tracking.

- **Jupyter Notebook** : Essential for running my python code and using it to visualize the graphs.

# The Analysis

Each query for this project was designed to explore critical elements of the data analyst job market. Here’s how I tackled each question to uncover valuable insights:

### 1. Top paying Data Analyst Jobs
To uncover the highest-paying roles, I filtered data analyst positions by average yearly salary and location, specifically targeting remote opportunities. This query reveals the lucrative job prospects available in the field.

```sql
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
```

#### Here’s an overview of the top data analyst jobs:

- **Significant Salary Range**: The top 10 highest-paying data analyst roles offer salaries between $184,000 and $650,000, highlighting the considerable earning potential in this profession.
- **Variety of Employers**: Companies such as SmartAsset, Meta, and AT&T are among those providing competitive salaries, reflecting widespread interest across various industries.

![Top paying roles](assets\salary_distribution_data_analyst_jobs_high.png)

Bar graph visualizing the salary for the top 10 salaries for data analysts.

### 2. Top Paying Skills Job
To gain insights into the skills needed for the highest-paying jobs, I analyzed job postings with skills data, revealing what employers prioritize for roles with high compensation.

``` sql
WITH top_paying_jobs AS (
SELECT
       job_id,
       job_title,
       salary_year_avg,
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
LIMIT 10
)

SELECT 
       top_paying_jobs.*,
       skills

FROM 
      top_paying_jobs
INNER JOIN 
    skills_job_dim
ON 
     top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim
ON 
    skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY 
      salary_year_avg DESC;
```
#### The most commonly required skills in the dataset are:

SQL – 8 mentions

Python – 7 mentions

Tableau – 6 mentions

R – 4 mentions

Snowflake, Pandas, and Excel – 3 mentions each

Azure, Bitbucket, and Go – 2 mentions each

These insights show that programming languages 
and data tools like SQL, Python, and Tableau are in high demand, with a notable focus on data analysis.

![Top Paying Skills](assets\bar_graph.png)

* Bar gragh visualizing the top paying skills for data analysts.

### 3. In demand skills for Top Paying Jobs.
This query helped identify the most in demand skills required from job postings.
 
 ``` sql
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
```
The breakdown for the most in demand skill is as follows:

**SQL (7,291)**: Most in-demand skill; essential for database management and querying.

**Excel (4,611)**: Fundamental tool for data manipulation and reporting.
**Python (4,330)**: Key programming language for data analysis and automation.
**Tableau (3,745)**: Important for data visualization; helps present insights clearly.
**Power BI (2,609)**: Valuable for creating impactful reports and dashboards.
Insights:
* Focus on mastering SQL, Excel, and Python to enhance career prospects.
* Gaining skills in Tableau and Power BI can make candidates more competitive in the job market.
* These skills are crucial for data-driven decision-making in today’s businesses.

| Skill     | Demand Count |
|-----------|--------------|
| SQL       | 7,291        |
| Excel     | 4,611        |
| Python    | 4,330        |
| Tableau   | 3,745        |
| Power BI  | 2,609        |

Table of the demand of the top skills for data analysts.

### 4. Top Paying Skills

Here I was looking at the top paying skills based on the average salary.

```sql
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
```

**Data and AI**: High-paying jobs focus on data science and AI tools like PySpark, Pandas, and DataRobot, highlighting the demand for data manipulation and machine learning skills.

**Cloud and DevOps**: Roles involving cloud platforms (e.g., GCP) and DevOps tools (such as Kubernetes and Jenkins) command high salaries, emphasizing the importance of automation and scalable infrastructure.

**Programming and Automation**: Specialized programming languages (like Golang and Swift) and automation technologies (such as Airflow and Jenkins) offer lucrative opportunities in backend, mobile, and operational roles.

| **Skills**     | **Average Salary**     |
|----------------|------------------------|
| SVN            | $400,000.00            |
| Solidity       | $179,000.00            |
| Couchbase      | $160,515.00            |
| Datarobot      | $155,485.50            |
| Golang         | $155,000.00            |
| MXNet          | $149,000.00            |
| Dplyr          | $147,633.33            |
| VMware         | $147,500.00            |
| Terraform      | $146,733.83            |
| Twilio         | $138,500.00            |
| GitLab         | $134,126.00            |
| Kafka          | $129,999.16            |
| Puppet         | $129,820.00            |
| Keras          | $127,013.33            |
| PyTorch        | $125,226.20            |
| Perl           | $124,685.75            |
| Ansible        | $124,370.00            |
| Hugging Face   | $123,950.00            |
| TensorFlow     | $120,646.83            |
| Cassandra      | $118,406.68            |
| Notion         | $118,091.67            |
| Atlassian      | $117,965.60            |
| Bitbucket      | $116,711.75            |
| Airflow        | $116,387.26            |
| Scala          | $115,479.53            |

* Table showing the skills based on the highest pay.

### 5. Most Optimal Skills to Learn
This analysis combines insights from demand and salary data to identify skills that are both highly sought after and command high salaries. This approach provides a strategic focus for skill development.

```sql
WITH skills_demand AS (
   SELECT skills_dim.skill_id,
          skills_dim.skills,
       COUNT(skills_job_dim.job_id) AS demand_count
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
       skills_dim.skill_id  
), average_salary AS (
   SELECT skills_job_dim.skill_id,
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
       skills_job_dim.skill_id
)

SELECT 
       skills_demand.skill_id,
       skills_demand.skills,
       demand_count,
       avg_salary
FROM 
     skills_demand
INNER JOIN 
      average_salary
ON  skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY 
      avg_salary DESC,
      demand_count DESC
LIMIT 25;
```
# Insights
Here's a breakdown of the optimal skills:

Top Skills:

 **Python** (236 demand)  and **Tableau** (230 demand) are crucial in data science and visualization, with salaries of $101,397 and $99,287, respectively.
**Salary vs. Demand**: Go ($115,319) and Confluence ($114,209) offer high salaries but have lower demand (27 and 11), indicating limited adoption.

**Emerging Technologies**: Snowflake (37 demand) and BigQuery (13 demand) show growing relevance in cloud data warehousing, both exceeding $100,000 in salary.

**Established Skills**: Java, SQL Server, and Oracle maintain steady demand (17-37) with mid-$100,000 salaries, emphasizing their ongoing importance.

**Niche Roles:** Looker, Qlik, and SAS, with demand counts under 50, are essential for specialized data analytics roles.


# Conclusions

The analysis shows that **Python** is a highly demanded skill, essential across tech sectors. While traditional skills like Java and **SQL** Server remain relevant, emerging technologies such as **Snowflake and BigQuery** offer lucrative opportunities as companies prioritize cloud solutions. It’s important to balance learning in-demand skills with specialized, high-paying technologies for effective career development, which can lead to significant growth and job security in a competitive landscape.


| Skill ID | Skills      | Demand Count | Average Salary   |
|----------|-------------|--------------|-------------------|
| 1        | Python      | 236          | $101,397.22       |
| 182      | Tableau     | 230          | $99,287.65        |
| 8        | Go          | 27           | $115,319.89       |
| 234      | Confluence  | 11           | $114,209.91       |
| 97       | Hadoop      | 22           | $113,192.57       |
| 80       | Snowflake   | 37           | $112,947.97       |
| 74       | Azure       | 34           | $111,225.10       |
| 77       | BigQuery    | 13           | $109,653.85       |
| 76       | AWS         | 32           | $108,317.30       |
| 4        | Java        | 17           | $106,906.44       |
| 194      | SSIS        | 12           | $106,683.33       |
| 233      | Jira        | 20           | $104,917.90       |