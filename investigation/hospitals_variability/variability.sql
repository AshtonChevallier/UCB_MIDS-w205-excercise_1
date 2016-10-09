select
Measure_Name,
VARIANCE(Score) as Variability
from procedures p
join measures m
on p.measure_id = m.measure_id
group by Measure_Name
Order by Variability DESC
Limit 10;