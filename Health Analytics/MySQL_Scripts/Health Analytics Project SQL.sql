# -- 1. Count & Pct of F vs M that have OCD & -- Average Obsession Score by Gender

with data_avg_ocd_gender as(
SELECT 
Gender, 
count(`Patient ID`) as patient_count, 
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score
FROM ocd_data.patients

Group by 1	-- represent column 1
Order by 2	-- represent column 2
)

select
sum(case when Gender = 'Female' then patient_count else 0 end) as count_female,
sum(case when Gender = 'Male' then patient_count else 0 end) as count_memale,

round(sum(case when Gender = 'Female' then patient_count else 0 end)/
(sum(case when Gender = 'Female' then patient_count else 0 end) + sum(case when Gender = 'Male' then patient_count else 0 end))*100,2)
as pct_female,
round(sum(case when Gender = 'Male' then patient_count else 0 end)/
(sum(case when Gender = 'Female' then patient_count else 0 end) + sum(case when Gender = 'Male' then patient_count else 0 end))*100,2)
as pct_male

from data_avg_ocd_gender;



# -- 2. Count of Patients by Ethnicity and their respective Average Obsession Score

select Ethnicity, count(`Patient ID`) as patient_count,
avg(`Y-BOCS Score (Obsessions)`) as obs_score
from ocd_data.patients
Group by 1
Order by 2;



# -- 3. Number of people diagnosed with OCD MoM

-- alter table ocd_data.patients
-- modify `OCD Diagnosis Date` date;	-- modify type of data

select
DATE_FORMAT(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') as month,	-- convert e.g. 2022-07-21 to the first day of the month e.g. 2022-07-01 00:00:00
-- `OCD Diagnosis Date`
count(`Patient ID`) patient_count
from ocd_data.patients
Group by 1
Order by 1	-- oldest to newest
;



# -- 4. What is the most common Obsession Type (Count) & it's respective Average Obsession Score

select 
`Obsession Type`, count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score
from ocd_data.patients
Group by 1
Order by 2;



# -- 5. What is the most common Compulsion type (Count) & it's respective Average Obsession Score

select 
`Compulsion Type`, count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score
from ocd_data.patients
Group by 1
Order by 2;