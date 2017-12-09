drop table Abbrev;
create table Abbrev (Type VARCHAR(10), Code VARCHAR(5), Fullname VARCHAR(54));

LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/abbrev.csv' INTO TABLE abbrev FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

drop table AwardsCoaches;
create table AwardsCoaches (CoachID VARCHAR(10), Award VARCHAR(20), Year INT, LgID VARCHAR(3), Note VARCHAR(0));

LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/AwardsCoaches.csv' INTO TABLE AwardsCoaches FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table AwardsPlayers;
create table AwardsPlayers (PlayerID VARCHAR(10), Award VARCHAR(20), Year INT, LgID VARCHAR(3), Note VARCHAR(16), Pos VARCHAR(2));

LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/AwardsPlayers.csv' INTO TABLE AwardsPlayers FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table Coaches;
create table Coaches (CoachID VARCHAR(10), Year INT, TmID VARCHAR(3), LgID VARCHAR(3), Stint INT, Notes VARCHAR(26), G INT, W INT, L INT, T INT, Postg INT, Postw INT, Postl INT, Postt INT);

LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/Coaches.csv' INTO TABLE Coaches FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table CombinedShutouts;
create table CombinedShutouts (Year INT, Month INT, Date INT, TmID VARCHAR(3), OppID VARCHAR(3), RorP VARCHAR(1), IDgoalie1 VARCHAR(10), IDgoalie2 VARCHAR(10));

LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/CombinedShutouts.csv' INTO TABLE CombinedShutouts FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table Goalies;
create table Goalies (PlayerID VARCHAR(10), Year INT, Stint INT, TmID VARCHAR(3), LgID VARCHAR(3), GP INT, Min INT, W INT, L INT, TorOL INT, ENG INT, SHO INT, GA INT, SA INT);

LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/Goalies.csv' INTO TABLE Goalies FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table GoaliesSC;
create table GoaliesSC (PlayerID VARCHAR(10), Year INT, TmID VARCHAR(3), LgID VARCHAR(3), GP INT, Min INT, W INT, L INT, T INT, SHO INT, GA INT);

LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/GoaliesSC.csv' INTO TABLE GoaliesSC FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table GoaliesShootout;
create table GoaliesShootout (PlayerID VARCHAR(10), Year INT, Stint INT, TmID VARCHAR(3), W INT, L INT, SA INT, GA INT);

LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/GoaliesShootout.csv' INTO TABLE GoaliesShootout FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table HOF;
create table HOF (Year INT, HofID VARCHAR(10), Name VARCHAR(20), Category VARCHAR(17));

LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/HOF.csv' INTO TABLE HOF FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table Master;
create table Master (PlayerID VARCHAR(10), CoachID VARCHAR(10), HofID VARCHAR(10), FirstName VARCHAR(15), LastName VARCHAR(20), NameNote VARCHAR(35), NameGiven VARCHAR(30), NameNick VARCHAR(40), Height INT, Weight INT, ShootCatch VARCHAR (1), LegendsID VARCHAR(10), IhdbID INT, HrefID VARCHAR(10), FirstNHL INT, LastNHL INT, FirstWHA INT, LastWHA INT, Pos VARCHAR(4), BirthYear INT, BirthMon INT, BirthDay INT, BirthCountry VARCHAR(18), BirthState VARCHAR(15), BirthCity VARCHAR(21), DeathYear INT, DeathMon INT, DeathDay INT, DeathCountry VARCHAR(15), DeathState VARCHAR(15), DeathCity VARCHAR(25));

LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/Master.csv' INTO TABLE Master FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table TeamVsTeam;
create table TeamVsTeam (Year INTEGER, LgID VARCHAR(4), TmID VARCHAR(3), OppID VARCHAR(4), W INTEGER, L INTEGER, T INTEGER, OTL INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/TeamVsTeam.csv' INTO TABLE TeamVsTeam FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table TeamSC;
create table TeamSC (Year INTEGER, LgID VARCHAR(4), TmID VARCHAR(3), G INTEGER, W INTEGER, L INTEGER, T INTEGER, GF INTEGER, GA INTEGER, PIM INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/TeamsSC.csv' INTO TABLE TeamSC FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table TeamHalf;
create table TeamHalf (Year INTEGER, LgID VARCHAR(4), TmID VARCHAR(3), Half INTEGER, Rank INTEGER, G INTEGER, W INTEGER, L INTEGER, T INTEGER, GF INTEGER, GA INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/TeamsHalf.csv' INTO TABLE TeamHalf FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table Teams;
create table Teams (Year INTEGER, LgID VARCHAR(4), TmID VARCHAR(3), FranchID VARCHAR(4), ConfID VARCHAR(4), DivID VARCHAR(4), Rank INTEGER, Playoff VARCHAR(4), G INTEGER, W INTEGER, L INTEGER, T INTEGER, OTL INTEGER, Pts INTEGER, SoW INTEGER, SoL INTEGER, GF INTEGER, GA INTEGER, Name VARCHAR(50), PIM INTEGER, BenchMinor INTEGER, PPG INTEGER, PPC INTEGER, SHA INTEGER, PKG INTEGER, PKC INTEGER, SHF INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/Teams.csv' INTO TABLE Teams FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table ScoringShootout;
create table ScoringShootout (PlayerID VARCHAR(11), Year INTEGER, Stint INTEGER, TmID VARCHAR(3), S INTEGER, G INTEGER, GDG INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/ScoringShootout.csv' INTO TABLE ScoringShootout FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table ScoringSC;
create table ScoringSC (PlayerID VARCHAR(11), Year INTEGER, TmID VARCHAR(3), LgID VARCHAR(3), Pos VARCHAR(1), GP INTEGER, G INTEGER, A INTEGER, Pts INTEGER, PIM INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/ScoringSC.csv' INTO TABLE ScoringSC FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table Scoring;
create table Scoring (PlayerID VARCHAR(11), Year INTEGER, Stint INTEGER, TmID VARCHAR(3), LgID VARCHAR(3), Pos VARCHAR(1), GP INTEGER, G INTEGER, A INTEGER, Pts INTEGER, PIM INTEGER, PlusOrMinus INTEGER, PPG INTEGER, PPA INTEGER, SHG INTEGER, SHA INTEGER, GWG INTEGER, GTG INTEGER, SOG INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/Scoring.csv' INTO TABLE Scoring FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;


