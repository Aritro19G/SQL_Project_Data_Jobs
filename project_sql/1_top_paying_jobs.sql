/*
Question: What are the top-paying Data Analyst jobs in India?
- Identify the top 10 highest paying Data Analyst roles that are available in India.
- Foucuses on job postings with specified salaries
- Why? Highlight the top paying opportunities for Data Analysts, offering insights into employment options from India.
*/

SELECT
    job_id,
    job_title,
    company_dim.name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::DATE
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_country = 'India' AND job_location <> 'Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10;

/*

Here's the breakdown of the top data analyst jobs in 2023:

Wide Salary Range: Top 10 paying data analyst roles span from $111,175 to $177,283, indicating significant salary potential in the field.
Diverse Employers: Companies like Bosch Group, Srijan Technologies, and Spotify are among those offering high salaries, showing a broad interest across different industries.
Job Title Variety: There's a high diversity in job titles, from Data Analyst to Staff Applied Research Engineer, reflecting varied roles and specializations within data analytics.

---

Results:

[
  {
    "job_id": 1642893,
    "job_title": "Staff Applied Research Engineer",
    "company_name": "ServiceNow",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-06"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-07-06"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21"
  },
  {
    "job_id": 1025126,
    "job_title": "Data Analyst",
    "company_name": "Truecaller",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-15"
  },
  {
    "job_id": 1122466,
    "job_title": "Data Analyst",
    "company_name": "Spotify",
    "job_location": "Mumbai, Maharashtra, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-20"
  }
]

*/