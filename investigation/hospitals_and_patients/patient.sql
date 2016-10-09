CREATE TEMPORARY TABLE avg_survey
AS
Select 
       Provider_ID,
       sum(numerator)/sum(denominator) as AVG_Survey
FROM surveys
WHERE question <> 'HCAHPS_Base_Score '
GROUP BY PROVIDER_ID
ORDER BY AVG_survey DESC;

CREATE TEMPORARY TABLE Max_Scores
AS SELECT
   Measure_id,
   Max(Score) as Max_Score
FROM procedures
GROUP By Measure_id;

CREATE TEMPORARY TABLE Normalized_SCores
AS SELECT 
       Provider_ID,
       p.Measure_ID,
       (Score/Max_Score) as Normalized_Score
From procedures p
left join Max_Scores ms
on p.measure_id = ms.measure_id;


SELECT
	corr(Normalized_Score, AVG_survey) as COV
from avg_survey a
join Normalized_SCores ns
on a.provider_id = ns.provider_id
Order by COV desc
limit 10;