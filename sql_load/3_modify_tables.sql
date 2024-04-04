COPY company_dim
FROM 'C:\Users\adria\OneDrive\Documents\Adrian\Developer\DataNerd\SQL_Project_Data_Job_Analysis\csv_files\company_dim.csv'
DELIMITER ',' CSV HEADER;

COPY job_postings_fact
FROM 'C:\Users\adria\OneDrive\Documents\Adrian\Developer\DataNerd\SQL_Project_Data_Job_Analysis\csv_files\job_postings_fact.csv'
DELIMITER ',' CSV HEADER;

COPY skills_dim
FROM 'C:\Users\adria\OneDrive\Documents\Adrian\Developer\DataNerd\SQL_Project_Data_Job_Analysis\csv_files\skills_dim.csv'
DELIMITER ',' CSV HEADER;

COPY skills_job_dim
FROM 'C:\Users\adria\OneDrive\Documents\Adrian\Developer\DataNerd\SQL_Project_Data_Job_Analysis\csv_files\skills_job_dim.csv'
DELIMITER ',' CSV HEADER;