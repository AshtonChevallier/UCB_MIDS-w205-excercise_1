SELECT 
       State,
       AVG(Normalized_Score) AS AVG_SCORE,
       SUM(Score) as Aggregate_Score,
       VARIANCE(Score) as Variability
from procedures p
join hospitals h
on p.provider_id = h.provider_id
join normalized_scores ns
on p.provider_id = ns.provider_id
Group by State
Order by Avg_score DESC
limit 10;