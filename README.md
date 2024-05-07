# Introduction
 Dive into the data job market, focusing on data analyst roles. This project explores top-paying jobs, in-demand skills and the optimal skills to learn (i.e. where in-demand skills meet high salaries). 

SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others' work to find optimal jobs.

### The questions I wanted to answer through my SQL queries were:

1.	What are the top-paying jobs for my role?
2.	What are the skills required for these top-paying jobs?
3.	What are the most in-demand skills for my role?
4.	What are the top skills based on salary for my role?
5.	What are the most optimal skills to learn? Optimal: High demand AND high paying

# Tools I Used
The tools I used for the analysis were:
- **SQL:** The backbone of my analysis...
- **PostgreSQL:** The chosen database management system...
- **VSCode:** My go-to for database management and executing SQL queries...
- **Git and Github:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
### 1. Top-paying Data Analyst Jobs
Focussing on remote jobs.

```sql
SELECT
    jp.job_id,
    c.name AS company,
    jp.job_title,
    jp.job_location,
    jp.salary_year_avg
FROM
    job_postings_fact jp
LEFT JOIN company_dim AS c ON jp.company_id = c.company_id
WHERE
    jp.job_title_short = 'Data Analyst' AND
    jp.job_work_from_home = TRUE AND
    jp.salary_year_avg IS NOT NULL
ORDER BY
    jp.salary_year_avg DESC
LIMIT 10;
```

Here is the breakdown of the top data analyst jobs in 2023:
- **Wide Salary Range:** Top 10 paying 
- **Diverse Employers:** To complete
- **Job Title Variety:** To complete




# What I learned
# Conclusion
