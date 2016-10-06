
select Provider_ID, Question, Score
from surveys_responses
UNPIVOT
(
for Question in (Comms_Nurses_Improve_Pts ,
Comms_Nurses_Dimension_Score ,
Comms_Doctors_Achieve_Pts ,
Comms_Doctors_Improve_Pts ,
Comms_Doctors_Dimension_Score ,
Response_Hospital_Staff_Achieve_Pts ,
Response_Hospital_Staff_Improve_Pts ,
Response_Hospital_Staff_Dimension_Score ,
Pain_Management_Achieve_Pts ,
Pain_Management_Improve_Pts ,
Pain_Management_Dimension_Score ,
Comms_about_Medicines_Achieve_Pts ,
Comms_about_Medicines_Improve_Pts ,
Comms_about_Medicines_Dimension_Score ,
Clean_Quiet_Hospital_Environment_Achieve_Pts ,
Clean_Quiet_Hospital_Environment_Improve_Pts ,
Clean_Quiet_Hospital_Environment_Dimension_Score ,
Discharge_Information_Achieve_Pts ,
Discharge_Information_Improve_Pts ,
Discharge_Information_Dimension_Score ,
Overall_Rating_Hospital_Achieve_Pts ,
Overall_Rating_Hospital_Improve_Pts ,
Overall_Rating_Hospital_Dimension_Score ,
HCAHPS_Base_Score
)) as P;
