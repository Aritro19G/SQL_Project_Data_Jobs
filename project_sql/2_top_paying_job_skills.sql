/*
Question: What skills are required for the top paying Data Analyst jobs in India?
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

---

Results:

[
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "sap"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "nosql"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "scala"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "shell"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "databricks"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "aws"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "oracle"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "spark"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "pandas"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "airflow"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "kafka"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "unix"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "linux"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "power bi"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "jenkins"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "flow"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "salary_year_avg": "165000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "mongo"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "mysql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "postgresql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "sql server"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "azure"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "aws"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "redshift"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "oracle"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "spark"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "salary_year_avg": "165000.0",
    "skills": "power bi"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "sql"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "python"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "scala"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "go"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "mongodb"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "no-sql"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "neo4j"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "mongodb"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "azure"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "databricks"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "aws"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "oracle"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "spark"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "hadoop"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "gdpr"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "power bi"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "salary_year_avg": "163782.0",
    "skills": "gdpr"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "skills": "sql"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "skills": "excel"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "skills": "visio"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "skills": "jira"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "skills": "confluence"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "skills": "sql"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "skills": "azure"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "skills": "excel"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "skills": "power bi"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "skills": "flow"
  },
  {
    "job_id": 998086,
    "job_title": "Data Analyst",
    "company_name": "Poshmark",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 998086,
    "job_title": "Data Analyst",
    "company_name": "Poshmark",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 998086,
    "job_title": "Data Analyst",
    "company_name": "Poshmark",
    "salary_year_avg": "111175.0",
    "skills": "r"
  },
  {
    "job_id": 998086,
    "job_title": "Data Analyst",
    "company_name": "Poshmark",
    "salary_year_avg": "111175.0",
    "skills": "spark"
  },
  {
    "job_id": 998086,
    "job_title": "Data Analyst",
    "company_name": "Poshmark",
    "salary_year_avg": "111175.0",
    "skills": "express"
  },
  {
    "job_id": 998086,
    "job_title": "Data Analyst",
    "company_name": "Poshmark",
    "salary_year_avg": "111175.0",
    "skills": "excel"
  },
  {
    "job_id": 998086,
    "job_title": "Data Analyst",
    "company_name": "Poshmark",
    "salary_year_avg": "111175.0",
    "skills": "looker"
  },
  {
    "job_id": 998086,
    "job_title": "Data Analyst",
    "company_name": "Poshmark",
    "salary_year_avg": "111175.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1127808,
    "job_title": "Data Analyst - Procurement",
    "company_name": "Snowflake Inc.",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 1127808,
    "job_title": "Data Analyst - Procurement",
    "company_name": "Snowflake Inc.",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 1127808,
    "job_title": "Data Analyst - Procurement",
    "company_name": "Snowflake Inc.",
    "salary_year_avg": "111175.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1127808,
    "job_title": "Data Analyst - Procurement",
    "company_name": "Snowflake Inc.",
    "salary_year_avg": "111175.0",
    "skills": "redshift"
  },
  {
    "job_id": 1127808,
    "job_title": "Data Analyst - Procurement",
    "company_name": "Snowflake Inc.",
    "salary_year_avg": "111175.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1127808,
    "job_title": "Data Analyst - Procurement",
    "company_name": "Snowflake Inc.",
    "salary_year_avg": "111175.0",
    "skills": "excel"
  },
  {
    "job_id": 1127808,
    "job_title": "Data Analyst - Procurement",
    "company_name": "Snowflake Inc.",
    "salary_year_avg": "111175.0",
    "skills": "tableau"
  },
  {
    "job_id": 1127808,
    "job_title": "Data Analyst - Procurement",
    "company_name": "Snowflake Inc.",
    "salary_year_avg": "111175.0",
    "skills": "power bi"
  },
  {
    "job_id": 1127808,
    "job_title": "Data Analyst - Procurement",
    "company_name": "Snowflake Inc.",
    "salary_year_avg": "111175.0",
    "skills": "looker"
  }
]

*/