
CREATE TEMPORARY TABLE Max_Scores
AS SELECT
   Measure_id,
   Max(Score) as Max_Score
FROM procedures
GROUP By Measure_id;

drop table Normalized_scores;
CREATE  TABLE Normalized_scores
AS SELECT 
       Provider_ID,
       p.Measure_ID,
       (Score/Max_Score) as Normalized_Score
From procedures p
left join Max_Scores ms
on p.measure_id = ms.measure_id;	
 
drop table best_hospitals;
create table best_hospitals AS
SELECT 
	Name,
	AVG(Normalized_Score)*SUM(Score) - VARIANCE(Score) as META_SCORE,
	AVG(Normalized_Score) AS AVG_Normalized_SCORE,
	AVG(Score) as AVG_Score,
	SUM(Score) as Aggregate_Score,
	VARIANCE(Score) as Variability
from procedures p
join hospitals h
on p.provider_id = h.provider_id
join normalized_scores ns
on p.provider_id = ns.provider_id
Group by Name
Order by META_SCORE DESC;

select * from best_hospitals limit 10;

