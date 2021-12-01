\copy PlayerInfo  FROM 'playerInfoData2017.csv' DELIMITER ',' CSV
\copy DraftInfo  FROM 'draftResults2020.csv' DELIMITER ',' CSV
\copy Career  FROM 'careerData2020.csv' DELIMITER ',' CSV
\copy BodyMeasurements  FROM 'combineAnthro2020.csv' DELIMITER ',' CSV
\copy StrengthAgility  FROM 'combineStrength2020.csv' DELIMITER ',' CSV
\copy Shooting  FROM 'shootingStats2020.csv' DELIMITER ',' CSV
\copy AverageGameStats  FROM 'gameStats2020.csv' DELIMITER ',' CSV