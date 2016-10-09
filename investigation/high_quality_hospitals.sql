
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
       Name,
       AVG(Normalized_Score) AS AVG_SCORE
From Normalized_Scores ns
join hospitals h
on ns.provider_id = h.provider_id
GROUP BY Name
ORDER BY AVG_SCORE DESC
limit 10;

SELECT 
       State,
       AVG(Normalized_Score) AS AVG_SCORE
From Normalized_Scores ns
join hospitals h
on ns.provider_id = h.provider_id
GROUP BY State
ORDER BY AVG_SCORE DESC
limit 10;

SELECT
	Measure_Name,
	VARIANCE(Score) as Variabilty
from procedures p
join measures m
on p.measure_id = m.measure_id
Group by Measure_Name
Order by Variability DESC
LIMIT 10;