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

---

Results:

[
  {
    "skills": "pyspark",
    "average_salary": "165000.00"
  },
  {
    "skills": "gitlab",
    "average_salary": "165000.00"
  },
  {
    "skills": "postgresql",
    "average_salary": "165000.00"
  },
  {
    "skills": "linux",
    "average_salary": "165000.00"
  },
  {
    "skills": "mysql",
    "average_salary": "165000.00"
  },
  {
    "skills": "neo4j",
    "average_salary": "163782.00"
  },
  {
    "skills": "gdpr",
    "average_salary": "163782.00"
  },
  {
    "skills": "airflow",
    "average_salary": "138087.50"
  },
  {
    "skills": "mongodb",
    "average_salary": "135994.00"
  },
  {
    "skills": "scala",
    "average_salary": "135994.00"
  },
  {
    "skills": "databricks",
    "average_salary": "135994.00"
  },
  {
    "skills": "pandas",
    "average_salary": "122462.50"
  },
  {
    "skills": "kafka",
    "average_salary": "122100.00"
  },
  {
    "skills": "confluence",
    "average_salary": "119250.00"
  },
  {
    "skills": "visio",
    "average_salary": "119250.00"
  },
  {
    "skills": "shell",
    "average_salary": "118500.00"
  },
  {
    "skills": "spark",
    "average_salary": "118332.45"
  },
  {
    "skills": "jira",
    "average_salary": "115212.50"
  },
  {
    "skills": "no-sql",
    "average_salary": "114291.00"
  },
  {
    "skills": "hadoop",
    "average_salary": "113276.40"
  },
  {
    "skills": "snowflake",
    "average_salary": "111212.50"
  },
  {
    "skills": "matplotlib",
    "average_salary": "111175.00"
  },
  {
    "skills": "dax",
    "average_salary": "111175.00"
  },
  {
    "skills": "bash",
    "average_salary": "111175.00"
  },
  {
    "skills": "electron",
    "average_salary": "111175.00"
  }
]

*/