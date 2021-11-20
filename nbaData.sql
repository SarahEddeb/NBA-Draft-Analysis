\copy PlayerInfo  FROM 'data/playerInfoData2020.csv' DELIMITER ',' CSV
\copy DraftInfo  FROM 'data/draftResults2020.csv' DELIMITER ',' CSV
\copy Career  FROM 'data/careerData2020.csv' DELIMITER ',' CSV
\copy BodyMeasurements  FROM 'data/combineAnthro2020.csv' DELIMITER ',' CSV
\copy StrengthAgility  FROM 'data/combineStrength2020.csv' DELIMITER ',' CSV
\copy Shooting  FROM 'data/shootingStats2020.csv' DELIMITER ',' CSV
\copy AverageGameStats  FROM 'data/gameStats2020.csv' DELIMITER ',' CSV