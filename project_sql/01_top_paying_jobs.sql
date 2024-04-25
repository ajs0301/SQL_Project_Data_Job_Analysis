/* Question: What are the top-paying jobs for my role?
- we will be looking at the top 10 paying jobs for Data Analyst jobs that you can perform remotely
- we will only include jobs where the salary_year_avg is not null
*/
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
