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

CREATE VIEW TopTenMeasurements AS
SELECT PlayerInfo.pid, bodyfatpercentage, handlength, handwidth, height, bodyweight, wingspan
FROM PlayerInfo
JOIN BodyMeasurements ON PlayerInfo.PID = BodyMeasurements.PID
ORDER BY PlayerInfo.PID
LIMIT 10;


CREATE VIEW Heights AS
SELECT pid, CAST(left(height, 1) AS INTEGER) as feet_h, 
    CAST(
    CASE 
    WHEN length(height) >= 7 THEN right(height, 5)
    WHEN length(height) < 7 THEN right(height, 4)
    END
    AS DOUBLE PRECISION) as inches_h, 
    CAST(left(wingspan, 1) AS INTEGER) as feet_ws,
    CAST(
    CASE 
    WHEN length(wingspan) >= 7 THEN right(wingspan, 5)
    WHEN length(wingspan) < 7 THEN right(wingspan, 4)
    END
    AS DOUBLE PRECISION) as inches_wg
FROM TopTenMeasurements;


insert into q1
SELECT avg(bodyfatpercentage) as ideal_bodyfat, avg(handlength) as ideal_handlength, avg(handwidth) as ideal_handwidth, avg(bodyweight) as ideal_bodyweight, avg((feet_h*12)+inches_h) as ideal_height_inches, avg((feet_ws*12)+inches_wg) as ideal_wingspan_inches
FROM TopTenMeasurements
JOIN Heights ON TopTenMeasurements.PID = Heights.PID;

SELECT * FROM q1;
