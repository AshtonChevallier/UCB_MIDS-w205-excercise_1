

DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals
(
       Provider_ID  INT,
       Name STRING,
       Address string,
       City string,
       State string,
       ZIP int,
       County string,
       Phone int,
       Type string,
       Hospital_Ownership string,
       Emergency_Services string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES
(
 "separatorChar" = ",",
 "quoteChar"     = '"',
 "escapeChar"    = '\\'
)
STORED AS TEXTFILE
 LOCATION '/user/w205/hospital_compare/hospitals';

DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care
(
       Provider_ID  INT,
       Name STRING,
       Address string,	
       City string,
       State string,
       ZIP int,
       County string,
       Phone int,
       Condition string,
       Measure_ID string,
       Measure_Name string,
       Score string, 
       Sample string,
       Footnote string,
       Start_Date date,
       End_Date date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES 
(
 "separatorChar" = ",",
 "quoteChar"     = '"', 
 "escapeChar"    = '\\' 
)
STORED AS TEXTFILE
 LOCATION '/user/w205/hospital_compare/effective_care';

DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions
(
       Provider_ID  INT,
       Name STRING,
       Address string,
       City string,
       State string,
       ZIP int,
       County string,
       Phone int,
       Measure_Name string,
       Measure_ID string,
       Compared string,
       Denominator string,
       Score string,
       Lower_est string,
       Higher_est string,
       Footnote string,
       Start_Date date,
       End_Date date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES
(
 "separatorChar" = ",",
 "quoteChar"     = '"',
 "escapeChar"    = '\\'
)
STORED AS TEXTFILE
 LOCATION '/user/w205/hospital_compare/readmissions';

DROP TABLE Measures;
CREATE EXTERNAL TABLE Measures
(
       Measure_Name string,
       Measure_ID string,
       Start_Quarter string,
       Start_Date date,
       End_Quarter string,
       End_Date date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES
(
 "separatorChar" = ",",
 "quoteChar"     = '"',
 "escapeChar"    = '\\'
)
STORED AS TEXTFILE
 LOCATION '/user/w205/hospital_compare/Measures';

DROP TABLE surveys_responses;
CREATE EXTERNAL TABLE surveys_responses
(
       Provider_ID  INT,
       Name STRING,
       Address string,
       City string,
       State string,
       ZIP int,
       County string,
       Comms_Nurses_Achieve_Pts string,
       Comms_Nurses_Improve_Pts string,
       Comms_Nurses_Dimension_Score string,
       Comms_Doctors_Achieve_Pts string,
       Comms_Doctors_Improve_Pts string,
       Comms_Doctors_Dimension_Score string,
       Response_Hospital_Staff_Achieve_Pts string,
       Response_Hospital_Staff_Improve_Pts string,
       Response_Hospital_Staff_Dimension_Score string,
       Pain_Management_Achieve_Pts string,
       Pain_Management_Improve_Pts string,
       Pain_Management_Dimension_Score string,
       Comms_about_Medicines_Achieve_Pts string,
       Comms_about_Medicines_Improve_Pts string,
       Comms_about_Medicines_Dimension_Score string,
       Clean_Quiet_Hospital_Environment_Achieve_Pts string,
       Clean_Quiet_Hospital_Environment_Improve_Pts string,
       Clean_Quiet_Hospital_Environment_Dimension_Score string,
       Discharge_Information_Achieve_Pts string,
       Discharge_Information_Improve_Pts string,
       Discharge_Information_Dimension_Score string,
       Overall_Rating_Hospital_Achieve_Pts string,
       Overall_Rating_Hospital_Improve_Pts string,
       Overall_Rating_Hospital_Dimension_Score string,
       HCAHPS_Base_Score string,
       HCAHPS_Consistency_Score string

)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES
(
 "separatorChar" = ",",
 "quoteChar"     = '"',
 "escapeChar"    = '\\'
)
STORED AS TEXTFILE
 LOCATION '/user/w205/hospital_compare/surveys_responses';