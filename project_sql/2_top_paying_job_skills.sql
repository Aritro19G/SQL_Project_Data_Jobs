/*
Question: What skills are required for the top paying Data Analyst jobs?
- Use the 10 highest paying Data Analyst jobs from the first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high paying jobs demand certain skills,
  helping job seekers understand which skills to develop that align with top salaries
*/

WITH analysts_job AS
(
    SELECT
        job_id,
        job_title,
        company_dim.name AS company_name,
        salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_country = 'India' AND job_location <> 'Anywhere'
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    analysts_job.*,
    skills_dim.skills
FROM analysts_job
INNER JOIN skills_job_dim ON analysts_job.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

/*
Here's the breakdown of the most demanded skills for Data Analysts in India in 2023, based on job postings:

* **SQL** is the most demanded skill (6 mentions), confirming it as the core requirement for data roles.
* **Power BI (5)** stands out as the leading visualization tool, ahead of Tableau.
* **Python (4)** is the dominant programming language, but appears less frequently than database skills.
* **Oracle and MongoDB (4 each)** indicate strong demand for both relational and NoSQL databases.
* **Cloud platforms (AWS, Azure – 3 each)** are consistently required but not dominant.
* **Big Data tools (Spark, Hadoop, Databricks)** appear moderately, showing importance in higher-level roles.

*/