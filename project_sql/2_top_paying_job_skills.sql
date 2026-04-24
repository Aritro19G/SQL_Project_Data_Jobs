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
        job_location = 'India'
    ORDER BY salary_year_avg DESC
)

SELECT 
    analysts_job.*,
    skills_dim.skills
FROM analysts_job
INNER JOIN skills_job_dim ON analysts_job.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

/*

Here's the breakdown of the most demanded skills for data analysts in India in 2023, based on job postings

* **SQL (9)** and **Excel (8)** are the most demanded skills → core requirements for data analysts
* **Python (6)** is the leading modern/technical skill → increasingly important
* **R, Tableau, Word (3 each)** show moderate demand
* Most other tools (Power BI, Looker, Oracle, etc.) appear **rarely (1–2 times)** → niche or role-specific

**Summary:**
Data analyst roles are heavily centered on **SQL + Excel**, with **Python as the key differentiator skill**.


[
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
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "104550.0",
    "skills": "excel"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "104550.0",
    "skills": "word"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "104550.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "skills": "sql"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "skills": "python"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "skills": "r"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "skills": "sheets"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "skills": "sql"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "skills": "python"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "skills": "excel"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "skills": "tableau"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "skills": "word"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "skills": "sql"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "skills": "unix"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "skills": "windows"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "skills": "tableau"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "salary_year_avg": "79200.0",
    "skills": "python"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "salary_year_avg": "79200.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "salary_year_avg": "79200.0",
    "skills": "pytorch"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "sql"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "oracle"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "excel"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "word"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "outlook"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "skills": "flow"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "salary_year_avg": "71600.0",
    "skills": "python"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "salary_year_avg": "71600.0",
    "skills": "r"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "salary_year_avg": "71600.0",
    "skills": "excel"
  },
  {
    "job_id": 306376,
    "job_title": "Project Associate - Data Analytics (Contract)",
    "company_name": "Array",
    "salary_year_avg": "64800.0",
    "skills": "sql"
  },
  {
    "job_id": 306376,
    "job_title": "Project Associate - Data Analytics (Contract)",
    "company_name": "Array",
    "salary_year_avg": "64800.0",
    "skills": "python"
  },
  {
    "job_id": 306376,
    "job_title": "Project Associate - Data Analytics (Contract)",
    "company_name": "Array",
    "salary_year_avg": "64800.0",
    "skills": "r"
  },
  {
    "job_id": 306376,
    "job_title": "Project Associate - Data Analytics (Contract)",
    "company_name": "Array",
    "salary_year_avg": "64800.0",
    "skills": "excel"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "company_name": "Merck Group",
    "salary_year_avg": "64800.0",
    "skills": "sql"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "company_name": "Merck Group",
    "salary_year_avg": "64800.0",
    "skills": "python"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "skills": "sql"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "skills": "t-sql"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "skills": "vba"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "skills": "sql server"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "skills": "looker"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "skills": "ms access"
  },
  {
    "job_id": 671340,
    "job_title": "Business Data Analyst",
    "company_name": "NetApp",
    "salary_year_avg": "54988.0",
    "skills": "tableau"
  },
  {
    "job_id": 1696350,
    "job_title": "Analyst Invoice Processing (Data Operations)",
    "company_name": "BlackRock",
    "salary_year_avg": "32400.0",
    "skills": "excel"
  },
  {
    "job_id": 1696350,
    "job_title": "Analyst Invoice Processing (Data Operations)",
    "company_name": "BlackRock",
    "salary_year_avg": "32400.0",
    "skills": "terminal"
  }
]

*/