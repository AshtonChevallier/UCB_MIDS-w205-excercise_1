
drop table best_states;
create table best_states AS
SELECT 
       State,
       AVG(Score)*ln(SUM(Score)) / VARIANCE(Score) as META_SCORE,
       AVG(Normalized_Score) AS AVG_Normalized_SCORE,
       AVG(Score) as AVG_Score,
       ln(SUM(Score)) as Aggregate_Score,
       VARIANCE(Score) as Variability
from procedures p
join hospitals h
on p.provider_id = h.provider_id
join normalized_scores ns
on p.provider_id = ns.provider_id
Group by state
Order by META_SCORE DESC;

select * from best_states limit 10;