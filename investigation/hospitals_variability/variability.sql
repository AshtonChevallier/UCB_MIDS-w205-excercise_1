drop TABLE measure_variance;
CREATE TABLE measure_variance
as
select
Measure_Name,
VARIANCE(Score) as Variability
from procedures p
join measures m
on p.measure_id = m.measure_id
group by Measure_Name
Order by Variability DESC;

select * from measure_variance 
limit 10;