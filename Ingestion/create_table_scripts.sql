create table RawLines(
  gameYear INTEGER,
  joinableDate TEXT,
  gameDate TEXT,
  playoffRound TEXT,
  visitor TEXT,
  visitorScore INTEGER,
  home TEXT,
  homeScore INTEGER,
  line REAL,
  totalLine REAL
);
create table RawResults(
  gameYear INTEGER,
  gameWeek TEXT,
  gameDay TEXT,
  gameDate TEXT,
  boxscore TEXT,
  winner TEXT,
  winnerAway TEXT,
  loser TEXT,
  winnerPoints INTEGER,
  loserPoints INTEGER,
  winnerYards INTEGER,
  winnerTurnovers INTEGER,
  loserYards INTEGER,
  loserTurnovers INTEGER
);

create table Games(
  gameYear INTEGER,
  gameWeek TEXT,
  gameDay TEXT,
  gameDate TEXT,
  gameDateISO TEXT,
  winnerTeam TEXT,
  winnerHome BOOLEAN,
  loserTeam TEXT,
  winnerPoints INTEGER,
  loserPoints INTEGER,
  winnerYards INTEGER,
  winnerTurnovers INTEGER,
  loserYards INTEGER,
  loserTurnovers INTEGER,
  line REAL,
  overUnder REAL
);
