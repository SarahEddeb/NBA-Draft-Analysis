\copy PlayerInfo  FROM 'playerInfoData2018.csv' DELIMITER ',' CSV
\copy DraftInfo  FROM 'draftResults2018.csv' DELIMITER ',' CSV
\copy Career  FROM 'careerData2018.csv' DELIMITER ',' CSV
\copy BodyMeasurements  FROM 'combineAnthro2018.csv' DELIMITER ',' CSV
\copy StrengthAgility  FROM 'combineStrength2018.csv' DELIMITER ',' CSV
\copy Shooting  FROM 'shootingStats2018.csv' DELIMITER ',' CSV
\copy AverageGameStats  FROM 'gameStats2018.csv' DELIMITER ',' CSV