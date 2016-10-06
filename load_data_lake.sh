mkdir hospital_compare 
cd hospital_compare
 
#wget -O hospitals.zip https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip

unzip hospitals.zip
echo "Unzipping..."

echo "Removing Headers of CSV and renaming files..."
tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n +2 "Measure Dates.csv" > Measures.csv
tail -n +2 "hvbp_hcahps_05_28_2015.csv" > surveys_responses.csv

echo "Making HDFS Directories..."

hdfs dfs -mkdir /user/w205/hospital_compare 
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/Measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses

echo 'Place files in HDFS...'
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put Measures.csv /user/w205/hospital_compare/Measures
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare/surveys_responses

echo "HDFS set up and loaded"
cd ..