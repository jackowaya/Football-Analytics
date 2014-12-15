-- We wound up scrapping this when we decided not to do year-over-year analysis but in case we ever do, here's the beginning of it.

create table Teams(
  id INTEGER PRIMARY KEY,
  name TEXT
);
-- Why this order? It was the standings on 2014-12-14 morning
INSERT INTO Teams(id, name) VALUES(1, "Philadelphia Eagles");
INSERT INTO Teams(id, name) VALUES(2, "Dallas Cowboys");
INSERT INTO Teams(id, name) VALUES(3, "New York Giants");
INSERT INTO Teams(id, name) VALUES(4, "Washington Redskins");
INSERT INTO Teams(id, name) VALUES(5, "Green Bay Packers");
INSERT INTO Teams(id, name) VALUES(6, "Detroit Lions");
INSERT INTO Teams(id, name) VALUES(7, "Minnesota Vikings");
INSERT INTO Teams(id, name) VALUES(8, "Chicago Bears");
INSERT INTO Teams(id, name) VALUES(9, "Atlanta Falcons");
INSERT INTO Teams(id, name) VALUES(10, "New Orleans Saints");
INSERT INTO Teams(id, name) VALUES(11, "Carolina Panthers");
INSERT INTO Teams(id, name) VALUES(12, "Tampa Bay Buccaneers");
INSERT INTO Teams(id, name) VALUES(13, "Arizona Cardinals");
INSERT INTO Teams(id, name) VALUES(14, "Seattle Seahawks");
INSERT INTO Teams(id, name) VALUES(15, "San Francisco 49ers");
INSERT INTO Teams(id, name) VALUES(16, "St. Louis Rams");
INSERT INTO Teams(id, name) VALUES(17, "New England Patriots");
INSERT INTO Teams(id, name) VALUES(18, "Buffalo Bills");
INSERT INTO Teams(id, name) VALUES(19, "Miami Dolphins");
INSERT INTO Teams(id, name) VALUES(20, "New York Jets");
INSERT INTO Teams(id, name) VALUES(21, "Cincinnati Bengals");
INSERT INTO Teams(id, name) VALUES(22, "Pittsburgh Steelers");
INSERT INTO Teams(id, name) VALUES(23, "Balitmore Ravens");
INSERT INTO Teams(id, name) VALUES(24, "Cleveland Browns");
INSERT INTO Teams(id, name) VALUES(25, "Indianapolis Colts");
INSERT INTO Teams(id, name) VALUES(26, "Houston Texans");
INSERT INTO Teams(id, name) VALUES(27, "Tennessee Titans");
INSERT INTO Teams(id, name) VALUES(28, "Jacksonville Jaguars");
INSERT INTO Teams(id, name) VALUES(29, "Denver Broncos");
INSERT INTO Teams(id, name) VALUES(30, "San Diego Chargers");
INSERT INTO Teams(id, name) VALUES(31, "Kansas City Chiefs");
INSERT INTO Teams(id, name) VALUES(32, "Oakland Raiders");

create table TeamAliases(
  teamId INTEGER,
  name TEXT
);
INSERT INTO TeamAliases(teamId, name) VALUES(1, "Philadelphia Eagles");
INSERT INTO TeamAliases(teamId, name) VALUES(2, "Dallas Cowboys");
INSERT INTO TeamAliases(teamId, name) VALUES(3, "New York Giants");
INSERT INTO TeamAliases(teamId, name) VALUES(4, "Washington Redskins");
INSERT INTO TeamAliases(teamId, name) VALUES(5, "Green Bay Packers");
INSERT INTO TeamAliases(teamId, name) VALUES(6, "Detroit Lions");
INSERT INTO TeamAliases(teamId, name) VALUES(7, "Minnesota Vikings");
INSERT INTO TeamAliases(teamId, name) VALUES(8, "Chicago Bears");
INSERT INTO TeamAliases(teamId, name) VALUES(9, "Atlanta Falcons");
INSERT INTO TeamAliases(teamId, name) VALUES(10, "New Orleans Saints");
INSERT INTO TeamAliases(teamId, name) VALUES(11, "Carolina Panthers");
INSERT INTO TeamAliases(teamId, name) VALUES(12, "Tampa Bay Buccaneers");
INSERT INTO TeamAliases(teamId, name) VALUES(13, "Arizona Cardinals");
INSERT INTO TeamAliases(teamId, name) VALUES(14, "Seattle Seahawks");
INSERT INTO TeamAliases(teamId, name) VALUES(15, "San Francisco 49ers");
INSERT INTO TeamAliases(teamId, name) VALUES(16, "St. Louis Rams");
INSERT INTO TeamAliases(teamId, name) VALUES(16, "Los Angeles Rams");
INSERT INTO TeamAliases(teamId, name) VALUES(17, "New England Patriots");
INSERT INTO TeamAliases(teamId, name) VALUES(18, "Buffalo Bills");
INSERT INTO TeamAliases(teamId, name) VALUES(19, "Miami Dolphins");
INSERT INTO TeamAliases(teamId, name) VALUES(20, "New York Jets");
INSERT INTO TeamAliases(teamId, name) VALUES(21, "Cincinnati Bengals");
INSERT INTO TeamAliases(teamId, name) VALUES(22, "Pittsburgh Steelers");
INSERT INTO TeamAliases(teamId, name) VALUES(23, "Balitmore Ravens");
INSERT INTO TeamAliases(teamId, name) VALUES(24, "Cleveland Browns");
INSERT INTO TeamAliases(teamId, name) VALUES(25, "Indianapolis Colts");
INSERT INTO TeamAliases(teamId, name) VALUES(26, "Houston Texans");
INSERT INTO TeamAliases(teamId, name) VALUES(27, "Tennessee Titans");
INSERT INTO TeamAliases(teamId, name) VALUES(28, "Jacksonville Jaguars");
INSERT INTO TeamAliases(teamId, name) VALUES(29, "Denver Broncos");
INSERT INTO TeamAliases(teamId, name) VALUES(30, "San Diego Chargers");
INSERT INTO TeamAliases(teamId, name) VALUES(31, "Kansas City Chiefs");
INSERT INTO TeamAliases(teamId, name) VALUES(32, "Oakland Raiders");
