/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries in India
- Why? It reveals how different skills impact salary levels for Data Analyst and
  helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_country = 'India' AND job_location <> 'Anywhere'
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 25;

/*
* **Top salaries are driven by data engineering skills, not pure analysis**
  Tools like PySpark, Spark, Kafka, Airflow, and Databricks dominate, showing that building and managing data pipelines is more valuable than just analyzing data.

* **Strong database + big data expertise is a major differentiator**
  High-paying roles require depth across PostgreSQL, MySQL, MongoDB, Neo4j, and NoSQL systems, along with the ability to handle large-scale distributed data.

* **Modern data stack + niche skills significantly boost pay**
  Cloud/data platforms (Snowflake, Databricks), DevOps tools (GitLab, Jira), and specialized areas (GDPR, graph databases) increase salaries, while visualization tools play a smaller role in top-paying jobs.

*/