/*
Answer: What are the most optimal skills to learn (aka its in high demand and a high paying skill)
- Identify skills in high demand and associated with high average salaries for Data Scientist roles
- Concentrates on remote positions with specified salaries
- Why? Target skills that offer job security (high demand) and financial benefits (high salaries),
  offering statregic insights for career development in Data Science
*/

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_country = 'India' AND job_location <> 'Anywhere'
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 5
ORDER BY 
    average_salary DESC,
    demand_count DESC

/*

Here's a breakdown of the most optimal skills for Data Analysts in India in 2023:
* **Core skills (SQL, Python, Excel, Tableau) provide the best balance of demand and salary**
  These are essential for employability and form the foundation of most data analyst roles in India.

* **Cloud and big data tools (Spark, Azure, AWS, Oracle) drive higher salaries**
  These skills act as differentiators and can significantly boost earning potential when combined with core skills.

* **Visualization and business tools (Power BI, Looker, Excel, PowerPoint) offer strong ROI**
  They sit in the sweet spot of good demand and solid pay, highlighting the importance of data storytelling and business communication.

---

Results:

[
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "11",
    "average_salary": "118332.45"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "17",
    "average_salary": "109832.18"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "6",
    "average_salary": "104751.25"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "11",
    "average_salary": "104260.32"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "10",
    "average_salary": "102677.50"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "10",
    "average_salary": "98815.00"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "15",
    "average_salary": "98569.80"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "36",
    "average_salary": "95933.33"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "12",
    "average_salary": "95333.00"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "20",
    "average_salary": "95102.80"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "46",
    "average_salary": "92983.62"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "39",
    "average_salary": "88518.96"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "18",
    "average_salary": "86609.11"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "10",
    "average_salary": "83266.05"
  }
]

*/