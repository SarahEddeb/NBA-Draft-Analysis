DROP SCHEMA IF EXISTS NBAPlayers CASCADE;
CREATE SCHEMA NBAPlayers;
SET SEARCH_PATH TO NBAPlayers;

-- A player that was drafted to the NBA
-- PID is the player's ID
-- playerName is the first and last name of the player
-- team is the name of the team the player was drafted to
-- college is the college name the player attended before entering the draft
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
-- playerName is the player's first and last name
CREATE TABLE DraftInfo (
    PID INT,
    rank INT  NOT NULL,
    playerName TEXT NOT NULL,
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
    yearsPlayed INT NOT NULL,
    gamesPlayed INT NOT NULL,
    minutesPlayed INT NOT NULL,
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
    bodyFatPercentage FLOAT NOT NULL, 
    handLength FLOAT NOT NULL, 
    handWidth FLOAT NOT NULL, 
    height TEXT NOT NULL,
    bodyWeight FLOAT NOT NULL, 
    wingspan TEXT NOT NULL, 
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
    shuttleRun FLOAT NOT NULL, 
    threeQuarterSprint FLOAT NOT NULL, 
    standingVerticalLeap FLOAT NOT NULL, 
    maxVerticalLeap FLOAT NOT NULL,
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
    fieldGoalPercentage FLOAT NOT NULL, 
    threePointFieldGoalPercentage FLOAT NOT NULL, 
    freeThrowPercentage FLOAT NOT NULL,
    PRIMARY KEY (PID),
    FOREIGN KEY (PID) REFERENCES PlayerInfo(PID)
);

-- A players average game stats
-- PID is the player's ID
-- AvgMins is the players average minutes per game
-- AvgPPG is the players average points per game
-- AvgAPG is the players average assists per game
-- AvgRPG is the players average rebounds per game
-- AvgSPG is the players average steals per game
-- AvgTPG is the players average turnovers per game
CREATE TABLE AverageGameStats (
    PID INT, 
    AvgMins FLOAT NOT NULL, 
    AvgPPG FLOAT NOT NULL, 
    AvgAPG FLOAT NOT NULL, 
    AvgRPG FLOAT NOT NULL, 
    PRIMARY KEY (PID),
    FOREIGN KEY (PID) REFERENCES PlayerInfo(PID)
);

CREATE TABLE PlayerInfoYearly (
    year INT,
    rank INT,
    team TEXT NOT NULL,
    playerName TEXT NOT NULL,
    college TEXT,
    PRIMARY KEY (year, rank)
);