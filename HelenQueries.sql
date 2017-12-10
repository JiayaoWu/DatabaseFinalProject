##
# Helen Collins SQL statements for Hockey Database
#
##

SELECT '5. List IDs of all goalies elected into the hall of fame whose coach is also in the hall of fame.' 
	AS '';

SELECT G.PlayerID AS 'Goalie ID'
FROM Coaches AS C, Goalies AS G, HOF AS H, Master AS M
WHERE G.Year = C.Year
AND G.TmID = C.TmID
AND G.PlayerID = M.PlayerID
AND M.HofID = H.HofID
GROUP BY G.PlayerID;


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
## FOR SOME REASON THE VALUES ARE ALL DOUBLED?! FIX THIS
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




