/* Question: What are the top skills based on salary for my role?
- I need to determine for each skill the average salary from the job postings with salary
- Obviously ignore jobs listings that don't list skills - inner join on the skills_job_dim would work well.
*/
SELECT s.skills, AVG(jp.salary_year_avg) AS avg_salary
FROM job_postings_fact jp
INNER JOIN skills_job_dim AS sj ON jp.job_id = sj.job_id
LEFT JOIN skills_dim AS s ON sj.skill_id = s.skill_id
WHERE
    jp.job_title_short = 'Data Analyst' AND
    jp.job_work_from_home = TRUE AND
    jp.salary_year_avg IS NOT NULL
GROUP BY
    s.skills
ORDER BY
    avg_salary DESC
LIMIT 25;
