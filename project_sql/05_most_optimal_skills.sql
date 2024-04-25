/* Question: What are the most optimal skills to learn?
- Optimal: High demand AND high paying
- Will only consider job listings that listed skill and that not null salary_year_avg
*/
WITH demand AS (
    SELECT s.skill_id, COUNT(sj.job_id) AS number_of_jobs
    FROM job_postings_fact jp
    INNER JOIN skills_job_dim AS sj ON jp.job_id = sj.job_id
    LEFT JOIN skills_dim AS s ON sj.skill_id = s.skill_id
    WHERE
        jp.job_title_short = 'Data Analyst' AND
        jp.job_work_from_home = TRUE AND
        jp.salary_year_avg IS NOT NULL
    GROUP BY
        s.skill_id
), average_pay AS (
    SELECT s.skill_id, AVG(jp.salary_year_avg) AS avg_salary
    FROM job_postings_fact jp
    INNER JOIN skills_job_dim AS sj ON jp.job_id = sj.job_id
    LEFT JOIN skills_dim AS s ON sj.skill_id = s.skill_id
    WHERE
        jp.job_title_short = 'Data Analyst' AND
        jp.job_work_from_home = TRUE AND
        jp.salary_year_avg IS NOT NULL
    GROUP BY
        s.skill_id
)

SELECT s.skills, d.number_of_jobs, ap.avg_salary
FROM demand d
INNER JOIN average_pay AS ap ON d.skill_id = ap.skill_id
INNER JOIN skills_dim AS s ON d.skill_id = s.skill_id
WHERE d.number_of_jobs > 10
ORDER BY
    ap.avg_salary DESC;




