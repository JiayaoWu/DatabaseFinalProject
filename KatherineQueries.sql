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

Select '6. List the top ten goal scorers in the NHL in 1920 and any awards they have received. Order by num goals scores.' AS '';
Select distinct temp.FirstName, temp.LastName, temp.Goals, a.Award, a.Year as AwardYear
From
(Select distinct m.FirstName, m.LastName, s.G as Goals, s.PlayerID 
From Scoring s, Master m
Where s.PlayerID = m.PlayerID and s.Year = 1920
Order by s.G DESC
Limit 10) as temp
left join AwardsPlayers as a on a.PlayerID = temp.PlayerID
Order by temp.Goals DESC;

#should we sum all the scores for all years?
Select '11. List the average number of shots made over all 1962 Hall of Famer players hocky careers.' AS '';
Select distinct h.HoFID, h.Year, s.SOG / s.GP
FROM HOF h, Scoring s
WHERE h.Year = s.Year and substring(h.HoFID, 1, length(h.HoFID)-1) = s.PlayerID;


#maybe can calculate the percentage? more advanced....
#changed the question a little bit.....
Select '12. List all teams who ranked higher in the second half of the season than the first half.' AS '';
Select distinct t1.TmID, t1.Year
FROM TeamHalf t1, TeamHalf t2
WHERE t1.Half = 1 and t2.Half = 2 and t2.Rank > t1.Rank
and t1.TmID = t2.TmID and t1.LgID = t2.LgID and t1.Year = t2.Year;


#all coachID ends with 'C'
Select '13. List all coaches who coach the same team that they previously played on.' AS '';
Select distinct m.FirstName, m.LastName, c.CoachID, c.TmID
FROM Coaches c, Scoring s, Master m
WHERE m.CoachID = c.CoachID and m.PlayerID = s.PlayerID and c.TmID = s.TmID;


#gives duplicated names tho...some goalies are in different teams in the same year
Select '14. List the average number of “goals against” per game for each goalie in 1999.' AS '';
Select distinct m.FirstName, m.LastName, g.GA / g.GP as AvgGoalsAgainst, g.TmID
FROM Goalies g, Master m
WHERE g.Year = 1999 and m.PlayerID = g.PlayerID;


Select '15. List the coaches of the teams whose players won the most awards in 2010.' AS '';
Select distinct m.FirstName as CoachFirstName, m.LastName as CoachLastName, m2.FirstName as PlayerFirstName, m2.LastName as PlayerLastName, mostAwards.counts as AwardCounts
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


