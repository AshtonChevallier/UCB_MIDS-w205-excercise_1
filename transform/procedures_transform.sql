DROP TABLE procedures;
CREATE TABLE procedures AS
SELECT Provider_ID, Measure_ID, Score
from readmissions
UNION ALL 
SELECT Provider_ID, Measure_ID, Score
from effective_care