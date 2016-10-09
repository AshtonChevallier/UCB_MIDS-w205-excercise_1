DROP TABLE procedures;
CREATE TABLE procedures AS
SELECT Provider_ID, Measure_ID, Score
from readmissions
WHERE Score <> 'Not Available'
AND Measure_ID == 'EDV'
UNION ALL 
SELECT Provider_ID, Measure_ID, Score
from effective_care
WHERE Score <> 'Not Available';

ALTER TABLE procedures 
CHANGE COLUMN Score Score float;
