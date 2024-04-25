/* Question: What are the most in-demand skills for my role (i.e. Data Analyst with remote work)?
- For this I will be considering all jobs i.e. not only those where salary_year_avg is not null
- I need to find the skills that appear the most numbers times in the job listing
- Obviously ignore jobs listings that don't list skills - inner join on the skills_job_dim would work well.
- I will focus on the top 5 skills
*/
SELECT s.skills, COUNT(sj.job_id) AS number_of_jobs
FROM job_postings_fact jp
INNER JOIN skills_job_dim AS sj ON jp.job_id = sj.job_id
LEFT JOIN skills_dim AS s ON sj.skill_id = s.skill_id
WHERE
    jp.job_title_short = 'Data Analyst' AND
    jp.job_work_from_home = TRUE
GROUP BY
    s.skills
ORDER BY
    number_of_jobs DESC
LIMIT 5;
