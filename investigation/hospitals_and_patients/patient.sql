CREATE TEMPORARY TABLE avg_survey
AS
Select 
       Provider_ID,
       sum(numerator)/sum(denominator) as AVG_Survey
FROM surveys
WHERE question <> 'HCAHPS_Base_Score '
GROUP BY PROVIDER_ID
ORDER BY AVG_survey DESC;




SELECT
	corr(Normalized_Score, AVG_survey) as COr
from avg_survey a
join Normalized_SCores_2 ns
on a.provider_id = ns.provider_id
Order by COR desc
limit 10;
