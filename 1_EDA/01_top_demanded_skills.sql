/*
Question: What are the most in-demand skills for data engineers globally?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data engineers in Egypt
- Why? Retrieves the top 10 skills with the highest demand in the job market,
    providing insights into the most valuable skills for data engineers seeking remote work
*/
SELECT
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
GROUP BY
    sd.skills
ORDER BY
    demand_count DESC
LIMIT 10;

/*
Output:
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │       233132 │
│ python     │       224102 │
│ aws        │       130205 │
│ azure      │       128822 │
│ spark      │       106904 │
│ java       │        69657 │
│ databricks │        63012 │
│ snowflake  │        60379 │
│ scala      │        57079 │
│ kafka      │        56410 │
└────────────┴──────────────┘
  10 rows         2 columns
  Key takeaways:
- SQL and Python remain the foundational skills for data engineers
- Cloud platforms (AWS, Azure) are critical for modern data engineering
- Big data tools like Spark continue to be highly valued
- Data pipeline tools (I.e: Snowflake, Databricks) show growing demand
- Java rounds out the top 10 most requested skills
*/