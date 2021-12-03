/* What is the ideal physique in the 2020 draft? How does that compare to previous years? */

/*
Find top 10 ranked players within the combine anthro table and find the average body measurements from them
The higher up a player is ranked, the more they are valued. The ideal physique will be based on them
*/

DROP TABLE IF EXISTS q1 CASCADE;

-- The ideal physique for draft players in a given year (year is specified in the dataset that is passed in)
-- ideal_bodyfat is the ideal body fat % in the draft that year
-- ideal_handlength is the ideal hand length in inches
-- ideal_handwidth is the ideal hand width in inches
-- ideal_bodyweight is the ideal body weight in lbs
-- ideal_height_inches is the ideal height in inches
-- ideal_wingspan_inches is the ideal wingspan in inches
CREATE TABLE q1 (
    ideal_bodyfat DOUBLE PRECISION,
    ideal_handlength DOUBLE PRECISION,
    ideal_handwidth DOUBLE PRECISION,
    ideal_bodyweight DOUBLE PRECISION,
    ideal_height_inches DOUBLE PRECISION,
    ideal_wingspan_inches DOUBLE PRECISION
);

DROP VIEW IF EXISTS TopTenMeasurements CASCADE;
DROP VIEW IF EXISTS Heights CASCADE;
DROP VIEW IF EXISTS AllInfo CASCADE;
DROP VIEW IF EXISTS IdealPlayer CASCADE;



CREATE VIEW TopTenMeasurements AS
SELECT PlayerInfo.pid, bodyfatpercentage, handlength, handwidth, height, bodyweight, wingspan
FROM PlayerInfo
JOIN BodyMeasurements ON PlayerInfo.PID = BodyMeasurements.PID
ORDER BY PlayerInfo.PID
LIMIT 10;

-- SELECT * FROM TopTenMeasurements;

CREATE VIEW Heights AS
SELECT pid, CAST(left(height, 1) AS INTEGER) as feet_h, 
    CAST(
    CASE 
    WHEN length(height) = 7 THEN right(height, 5)
    WHEN length(height) = 6 THEN right(height, 4)
    WHEN length(height) = 5 THEN right(height, 3)
    END
    AS DOUBLE PRECISION) as inches_h, 
    CAST(left(wingspan, 1) AS INTEGER) as feet_ws,
    CAST(
    CASE 
    WHEN length(height) = 7 THEN right(height, 5)
    WHEN length(height) = 6 THEN right(height, 4)
    WHEN length(height) = 5 THEN right(height, 3)
    END
    AS DOUBLE PRECISION) as inches_wg
FROM TopTenMeasurements;

CREATE VIEW AllInfo AS
SELECT Heights.PID, bodyfatpercentage, handlength, handwidth, bodyweight, feet_h, inches_h, feet_ws, inches_wg, (feet_ws*12)+inches_wg as wingspan, (feet_h*12)+inches_h as height
FROM Heights
JOIN TopTenMeasurements ON Heights.PID = TopTenMeasurements.PID;

insert into q1
SELECT avg(bodyfatpercentage) as ideal_bodyfat, avg(handlength) as ideal_handlength, avg(handwidth) as ideal_handwidth, avg(bodyweight) as ideal_bodyweight, avg((feet_h*12)+inches_h) as ideal_height_inches, avg((feet_ws*12)+inches_wg) as ideal_wingspan_inches
FROM TopTenMeasurements
JOIN Heights ON TopTenMeasurements.PID = Heights.PID;

SELECT * FROM q1;

/* Finding the player with the closest body measurements to the ideal physique */
CREATE VIEW IdealPlayer AS
SELECT AllInfo.pid, DraftInfo.rank, playerName, bodyfatpercentage, ideal_bodyfat, bodyweight, ideal_bodyweight, height, ideal_height_inches
FROM AllInfo, q1, DraftInfo
WHERE AllInfo.PID = DraftInfo.PID
and (ideal_bodyfat - 3) <= bodyfatpercentage and (ideal_bodyfat + 3) >= bodyfatpercentage
and (ideal_bodyweight - 15) <= bodyweight and (ideal_bodyweight + 15) >= bodyweight
and (ideal_height_inches - 6) <= height and (ideal_height_inches + 6) >= height
and (ideal_handlength - 2) <= handlength and (ideal_handlength + 2) >= handlength
and (ideal_handwidth - 2) <= handwidth and (ideal_handwidth + 2) >= handwidth
and (ideal_wingspan_inches - 9) <= wingspan and (ideal_wingspan_inches + 9) >= wingspan;

-- SELECT * FROM IdealPlayer;

/* EXPLORITORY WORK */

/* Players closest to the ideal physique */
/*
------------ Close Ideal Player(s) 2020 ------------
 pid | rank |    playername    | bodyfatpercentage | ideal_bodyfat | bodyweight |  ideal_bodyweight  | height | ideal_height_inches 
-----+------+------------------+-------------------+---------------+------------+--------------------+--------+---------------------
  20 |   20 | Precious Achiuwa |               6.7 |         6.731 |        234 | 223.16000000000003 |  80.75 |               79.45
(1 row)

------------ Player 2019 ------------
 pid | rank |        playername        | bodyfatpercentage |   ideal_bodyfat    | bodyweight |  ideal_bodyweight  | height | ideal_height_inches 
-----+------+--------------------------+-------------------+--------------------+------------+--------------------+--------+---------------------
   6 |    6 | Jarrett Culver           |                 5 | 5.6899999999999995 |      194.2 | 207.82000000000002 |  78.75 |   79.54166666666667
  11 |   11 | Cameron Johnson          |               5.8 | 5.6899999999999995 |      205.2 | 207.82000000000002 |   80.5 |   79.54166666666667
  17 |   17 | Nickeil Alexander-Walker |               5.9 | 5.6899999999999995 |      203.8 | 207.82000000000002 |   77.5 |   79.54166666666667
  21 |   21 | Brandon Clarke           |               4.9 | 5.6899999999999995 |      207.2 | 207.82000000000002 |  80.25 |   79.54166666666667
(4 rows)

------------ Player 2018 ------------
 pid | rank |   playername   | bodyfatpercentage | ideal_bodyfat | bodyweight |  ideal_bodyweight  | height | ideal_height_inches 
-----+------+----------------+-------------------+---------------+------------+--------------------+--------+---------------------
  12 |   12 | Miles Bridges  |               5.9 |         5.935 |      220.4 | 206.86000000000004 |  78.75 |   78.45833333333333
  15 |   15 | Troy Brown Jr. |              7.05 |         5.935 |        208 | 206.86000000000004 |  78.75 |   78.45833333333333
(2 rows)
*/

/* This is using the top 10 people in the combine anthro */
/* ------------ IDEAL PHYSIQUE 2018 ------------*/
/*
 ideal_bodyfat | ideal_handlength | ideal_handwidth |  ideal_bodyweight  | ideal_height_inches | ideal_wingspan_inches 
---------------+------------------+-----------------+--------------------+---------------------+-----------------------
         5.935 |            8.825 |           9.375 | 206.86000000000004 |   78.45833333333333 |     82.45833333333333
(1 row)
*/

/* ------------ IDEAL PHYSIQUE 2019 ------------*/
/*
   ideal_bodyfat    | ideal_handlength | ideal_handwidth |  ideal_bodyweight  | ideal_height_inches | ideal_wingspan_inches 
--------------------+------------------+-----------------+--------------------+---------------------+-----------------------
 5.6899999999999995 |             8.45 |           9.175 | 207.82000000000002 |   79.54166666666667 |     81.54166666666667
(1 row)
*/

/* ------------ IDEAL PHYSIQUE 2020 ------------*/
/*
 ideal_bodyfat | ideal_handlength | ideal_handwidth |  ideal_bodyweight  | ideal_height_inches | ideal_wingspan_inches 
---------------+------------------+-----------------+--------------------+---------------------+-----------------------
         6.731 |            8.775 |             9.7 | 223.16000000000003 |               79.45 |                 83.95
(1 row)
*/



/* This is using all the people in the combine anthro */
/* ------------ IDEAL PHYSIQUE 2018 ------------*/
/*
   ideal_bodyfat   | ideal_handlength | ideal_handwidth | ideal_bodyweight | ideal_height_inches | ideal_wingspan_inches 
-------------------+------------------+-----------------+------------------+---------------------+-----------------------
 6.345000000000001 |          8.79375 |           9.325 |           206.25 |   78.06896551724138 |     83.03448275862068
(1 row)
*/

/* ------------ IDEAL PHYSIQUE 2019 ------------*/
/*
   ideal_bodyfat   | ideal_handlength  |  ideal_handwidth  | ideal_bodyweight  | ideal_height_inches | ideal_wingspan_inches 
-------------------+-------------------+-------------------+-------------------+---------------------+-----------------------
 5.609523809523809 | 8.591666666666667 | 9.386904761904763 | 210.0666666666667 |   78.67424242424242 |     82.67424242424242
(1 row)
*/

/* ------------ IDEAL PHYSIQUE 2020 ------------*/
/*
   ideal_bodyfat   | ideal_handlength | ideal_handwidth | ideal_bodyweight | ideal_height_inches | ideal_wingspan_inches 
-------------------+------------------+-----------------+------------------+---------------------+-----------------------
 6.720416666666669 |            8.625 |         9.40625 |          214.025 |   78.42708333333333 |     82.92708333333333
(1 row)
*/