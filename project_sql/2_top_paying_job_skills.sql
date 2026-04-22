/*
Question: What skills are required for the top paying Data Scientist jobs?
- Use the 10 highest paying Data Scientist jobs from the first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high paying jobs demand certain skills,
  helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS
(
    SELECT
        job_id,
        job_title,
        company_dim.name AS company_name,
        salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Scientist' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

/*
1. Most Frequent Skills
Foundational tools for data manipulation and programming remain the most critical.

SQL and Python are the most frequently mentioned skills, appearing in nearly half of the analyzed job postings.

Java also shows strong presence, likely due to its use in enterprise-level big data applications.

Cloud and Machine Learning frameworks like AWS, Spark, TensorFlow, and PyTorch are consistently required for these high-tier roles.

2. High-Value Skillsets
When looking at the skills associated with the highest average annual salaries, we see a mix of core languages and specialized big data tools:

SQL and Python lead the pack, not just in frequency but also in the premium they command, with average salaries reaching over $380,000.

Big Data Infrastructure: Skills like Cassandra and Hadoop are associated with high-paying roles (averaging $375,000), indicating that managing and processing massive datasets is a top-tier requirement.

Specialized Platforms: Tools like DataRobot (Automated ML) and Tableau (Visualization) also appear in the top salary brackets.

Summary Insights
Breadth vs. Depth: The highest-paying roles often require a combination of core programming (Python/Java), database management (SQL/Cassandra), and modern ML frameworks (TensorFlow/PyTorch).

The Cloud Factor: Proficiency in cloud platforms like AWS, Azure, and GCP is a common denominator for these high-salary positions.


*/