INSERT INTO Games 
SELECT
  r.gameYear,
  r.gameWeek,
  r.gameDay,
  r.gameDate,
  SUBSTR(l.gameDate, 7) + "-" + SUBSTR(l.gameDate, 0, 2) + "-" + SUBSTR(l.gameDate, 3, 2) AS gameDateISO,
  r.winner,
  r.winnerAway != "@" AS winnerHome,
  r.loser,
  r.winnerPoints,
  r.loserPoints,
  r.winnerYards,
  r.winnerTurnovers,
  r.loserYards,
  r.loserTurnovers,
  l.line,
  l.totalLine AS overunder
from RawResults r LEFT OUTER JOIN RawLines l 
  ON r.gameYear = l.gameYear AND r.gameDate = l.joinableDate AND (r.winner = l.home OR r.loser = l.home);
