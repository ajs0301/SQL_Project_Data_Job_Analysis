/* Question: What are the skills required for the top-paying jobs identified in the first query?
- only include jobs that list skills
*/
WITH top_paying_jobs AS (
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
    LIMIT 10
)

SELECT tp.*, s.skills 
FROM top_paying_jobs tp
INNER JOIN skills_job_dim AS sj ON tp.job_id = sj.job_id
LEFT JOIN skills_dim AS s ON sj.skill_id = s.skill_id

