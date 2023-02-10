--Create the Database
CREATE DATABASE competition;

--Create Tables

CREATE TABLE Athlete(
athlete_id INTEGER PRIMARY KEY,
name VARCHAR(20),
age integer);

CREATE TABLE Event(
event_id INTEGER PRIMARY KEY,
title VARCHAR(30),
date DATE,
is_team_event Boolean);

CREATE TABLE Nation(
nation_id INTEGER PRIMARY KEY,
name VARCHAR(30),
flag VARCHAR(30));

--Create Table Relations

-- 1:n between Team and nation(one Nation can have different team from there but a team can have one nationality)
CREATE TABLE Team(
team_id INTEGER PRIMARY KEY,
nation_id Integer,
name VARCHAR(30),
FOREIGN KEY (nation_id) REFERENCES Nation(nation_id));

-- n:m relation between Event and Athlete

CREATE TABlE Event_Athlete(
rank INTEGER,
event_id INTEGER REFERENCES Event(event_id),
athlete_id INTEGER REFERENCES Athlete(athlete_id),
PRIMARY KEY(event_id,athlete_id),
FOREIGN KEY(event_id) REFERENCES Event(event_id),
FOREIGN KEY(athlete_id) REFERENCES Athlete(athlete_id));

-- n:m relation between Event and Team

CREATE TABlE Event_Team(
rank INTEGER,
event_id INTEGER REFERENCES Event(event_id),
team_id INTEGER REFERENCES Team(team_id),
PRIMARY KEY (event_id,team_id),
FOREIGN KEY (team_id) REFERENCES Team(team_id),
FOREIGN KEY (event_id) REFERENCES Event(event_id)); 

-- n:m relation between Athlete and Team

CREATE TABLE Team_Athlete(
team_id Integer REFERENCES Team(team_id),
athlete_id INTEGER REFERENCES Athlete(athlete_id),
PRIMARY KEY (athlete_id,team_id),
FOREIGN KEY(team_id) REFERENCES team(team_id),
FOREIGN KEY(athlete_id) REFERENCES Athlete(athlete_id));
