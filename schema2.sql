DROP SCHEMA IF EXISTS NBAPlayers CASCADE;
CREATE SCHEMA NBAPlayers;
SET SEARCH_PATH TO NBAPlayers;

-- A player in the NBA 
-- PID is the player's ID
-- playerName is the first and last name of the player
-- team is the name of the team the player was drafted to
-- college is the college name the player attended before getting drafted. 
-- If the college value is NULL, that means the player was drafted from over seas (drafted outside the US)
CREATE TABLE PlayerInfo (
    PID INT,
    team TEXT NOT NULL,
    playerName TEXT NOT NULL,
    college TEXT,
    PRIMARY KEY (PID)
);

-- A player in the draft
-- PID is the player's ID
-- rank is the players rank in the draft
-- draftRound is the round the player was drafted in 
CREATE TABLE DraftInfo (
    PID INT,
    rank INT,
    draftRound INT,
    PRIMARY KEY (PID),
    FOREIGN KEY (PID) REFERENCES PlayerInfo(PID)
);

-- A player's career
-- PID is the player's ID
-- yearsPlayed is the number of years the player played in the NBA
-- gamesPlayed is the total number of games the player played in the NBA
-- minutesPlayed is the total number of minutes the player played in the NBA
CREATE TABLE Career (
    PID INT,
    yearsPlayed INT,
    gamesPlayed INT,
    minutesPlayed INT,
    PRIMARY KEY (PID),
    FOREIGN KEY (PID) REFERENCES PlayerInfo(PID)
);

-- A player's body measurements
-- PID is the player's ID
-- bodyFatPercentage is the player’s body fat percentage.
-- handWidth is the player's hands width
-- handLength is the player's hands length
-- wingspan is the player's wingspan
-- bodyWeight is the player's weight
-- height is the player's height
CREATE TABLE BodyMeasurements(
    PID INT, 
    bodyFatPercentage INT, 
    handWidth INT, 
    handLength INT, 
    wingspan INT, 
    bodyWeight INT, 
    height INT,
    PRIMARY KEY (PID),
    FOREIGN KEY (PID) REFERENCES PlayerInfo(PID)
);

-- A players strength and agility measurements
-- PID is the player's ID
-- shuttleRun is the player's result in running in spontaneous directions
-- 3quarterSprint is the player's results in 3 quarter NBA court sprint
-- standingVerticalLeap is how high the player jumps stationary on the ground
-- maxVerticalLeap is how high the player jumps while running in metres
CREATE TABLE StrengthAgility (
    PID INT, 
    shuttleRun INT, 
    threeQuarterSprint INT, 
    standingVerticalLeap INT, 
    maxVerticalLeap INT,
    PRIMARY KEY (PID),
    FOREIGN KEY (PID) REFERENCES PlayerInfo(PID)
);

-- A players shooting statistics
-- PID is the player's ID
-- fieldGoalPercentage is the player’s successful field goal percentage
-- 3pointFielsGoalPercentage is a player’s successful 3 point field goal percentage
-- freeThrowPercentage is a player’s successful free throw percentage
CREATE TABLE Shooting(
    PID INT,
    fieldGoalPercentage INT, 
    threePointFieldGoalPercentage INT, 
    freeThrowPercentage INT,
    PRIMARY KEY (PID),
    FOREIGN KEY (PID) REFERENCES PlayerInfo(PID)
);