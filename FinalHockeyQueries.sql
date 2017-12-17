Select '1. List the name of all Players who have a nickname and were given at least two different awards in the same year.
' AS '';
Select distinct m.FirstName, m.LastName
FROM Master m,
(Select distinct PlayerID, Year, count(Award) counts
FROM AwardsPlayers
group by playerID, Year
having count(Award) >= 2) players
WHERE m.PlayerID = players.PlayerID and m.NameNick != '';


Select '2. List the team name with the highest number of wins in each league from 1909 to 2011.' AS ''; 
Select distinct t.LgId, t.Name, t.W
from Teams t,
(Select LgId, max(W) as maxW
From Teams
group by LgId) as leagues
where t.W = leagues.maxW and t.LgId = leagues.LgId;

Select '3. List the first name, last name, and playerID of each goalie whose coach won the First Team All-Star.' AS '';
Select distinct m.FirstName, m.LastName, m.PlayerID
From Goalies g, Master m, AwardsCoaches a
Where g.PlayerID = m.PlayerID and m.CoachID = a.CoachID
and a.Award = 'First Team All-Star';

Select '4. List the coach’s first name, last name and year of each team ranked #1 in the NHA.' AS '';
Select distinct t.year, m.FirstName, m.LastName, t.Name
From Teams t, Coaches c, Master m
where t.LgId = "NHA" and t.Rank = 1
and c.TmID = t.TmID and c.Year = t.Year and m.CoachID = c.CoachID
order by t.Year;

SELECT '5. List IDs of all goalies elected into the hall of fame whose coach is also in the hall of fame.' 
	AS '';

SELECT G.PlayerID AS 'Goalie ID'
FROM Coaches AS C, Goalies AS G, HOF AS H, Master AS M
WHERE G.Year = C.Year
AND G.TmID = C.TmID
AND G.PlayerID = M.PlayerID
AND M.HofID = H.HofID
GROUP BY G.PlayerID;

Select '6. List the top ten goal scorers in the NHL in 1980 and any awards they have received. Order by num goals scores.' AS '';
Select distinct temp.FirstName, temp.LastName, temp.Goals, a.Award, a.Year as AwardYear
From
(Select distinct m.FirstName, m.LastName, s.G as Goals, s.PlayerID 
From Scoring s, Master m
Where s.PlayerID = m.PlayerID and s.Year = 1980
Order by s.G DESC
Limit 10) as temp
left join AwardsPlayers as a on a.PlayerID = temp.PlayerID
Order by temp.Goals DESC, temp.LastName DESC, a.Year DESC;


SELECT '7. List the name, height, weight and num shutouts of top 5 goalies with most shutouts in their entire career.'
AS '';
SELECT DISTINCT M.FirstName, M.LastName, M.Height, M.Weight, x.ct AS 'Num Shutouts'
FROM Master M, (SELECT C.IDgoalie1, COUNT(C.IDgoalie1) AS ct
				FROM CombinedShutouts C
				GROUP BY C.IDgoalie1
				ORDER BY COUNT(C.IDgoalie1)
				DESC LIMIT 5) x

WHERE x.IDgoalie1 = M.PlayerID
ORDER BY x.ct
DESC LIMIT 5;

SELECT '8. List the players who scored the most points at the Stanley Cup whose coach is dead.'
AS '';
SELECT DISTINCT S.PlayerID, COUNT(S.G) as 'Num Points'
FROM ScoringSC AS S, Coaches AS C, Master AS M
WHERE S.Year = C.Year
AND S.TmID = C.TmID
AND C.CoachID = M.CoachID
AND M.DeathYear <> ''
GROUP BY S.PlayerID
ORDER BY COUNT(S.G)
DESC LIMIT 10;


SELECT '9. List the names of both players who tied for an award, as well as the year the award was given.'
AS '';
SELECT DISTINCT M.FirstName, M.LastName, A.Year, A.Award
FROM Master AS M, AwardsPlayers AS A
WHERE A.PlayerID = M.PlayerID
AND A.Note = 'tie'
ORDER BY A.Year;



SELECT '10. List the names of players with the most game deciding goals for every year between 2000 and 2010 and their position.'
AS '';
SELECT *
FROM (
	SELECT DISTINCT M.FirstName, M.LastName, S.PlayerID, S.GWG, S.Year
	FROM Master AS M, Scoring AS S
	WHERE S.PlayerID = M.PlayerID
	AND S.Year > 1999
	AND S.Year < 2011
	ORDER BY S.GWG DESC LIMIT 1
) AS x
ORDER BY x.Year ASC LIMIT 10;

Select '11. List the average number of shots made over all 1962 Hall of Famer players hocky careers.' AS '';
Select distinct h.HoFID, h.Year, s.SOG / s.GP
FROM HOF h, Scoring s
WHERE h.Year = s.Year and substring(h.HoFID, 1, length(h.HoFID)-1) = s.PlayerID;


Select '12. List all teams who ranked higher in the second half of the season than the first half.' AS '';
Select distinct t1.TmID, t1.Year
FROM TeamHalf t1, TeamHalf t2
WHERE t1.Half = 1 and t2.Half = 2 and t2.Rank > t1.Rank
and t1.TmID = t2.TmID and t1.LgID = t2.LgID and t1.Year = t2.Year;


Select '13. List all coaches who coach the same team that they previously played on.' AS '';
Select distinct m.FirstName, m.LastName, c.CoachID, c.TmID
FROM Coaches c, Scoring s, Master m
WHERE m.CoachID = c.CoachID and m.PlayerID = s.PlayerID and c.TmID = s.TmID;


Select '14. List the average number of “goals against” per game for each goalie in 1999.' AS '';
Select distinct m.FirstName, m.LastName, g.GA / g.GP as AvgGoalsAgainst, g.TmID
FROM Goalies g, Master m
WHERE g.Year = 1999 and m.PlayerID = g.PlayerID;


Select '15. List the coach of the team with the player with the most awards in 2010.' AS '';
Select distinct m.FirstName as CoachFirstName, m.LastName as CoachLastName, m2.FirstName as PlayerFirstName, m2.LastName as PlayerLastName, mostAwards.counts as AwardCounts, c.TmID as TeamID
FROM Scoring s, Coaches c, Master m, Master m2,
(Select a.PlayerID, count(a.Award) as counts
From AwardsPlayers a
WHERE a.Year = 2010
group by a.PlayerID
order by count(a.Award) DESC
Limit 1) as mostAwards
WHERE s.PlayerID = mostAwards.PlayerID
and s.TmID = c.TmID and c.Year = 2010
and m.CoachID = c.CoachID and m2.PlayerID = mostAwards.PlayerID;


