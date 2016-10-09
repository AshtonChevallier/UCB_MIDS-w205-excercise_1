CREATE TEMPORARY TABLE avg_survey
AS
Select 
       Provider_ID,
       sum(numerator)/sum(denominator) as AVG_Score
FROM surveys
WHERE question <> 'HCAHPS_Base_Score '
GROUP BY PROVIDER_ID
ORDER BY AVG_Score DESC
limit 10;