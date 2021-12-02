/* What is the ideal physique in the 2020 draft? How does that compare to previous years? */

SELECT avg(bodyFatPercentage) as bodyFatPercentage_avg, avg(handLength) as handLength_avg, avg(handWidth) as handWidth_avg, avg(bodyWeight) as bodyWeight_avg 
FROM PlayerInfo
JOIN BodyMeasurements ON PlayerInfo.PID = BodyMeasurements.PID;

SELECT * 
FROM BodyMeasurements
WHERE PID < 25
ORDER BY PID;