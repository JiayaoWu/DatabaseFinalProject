create table TeamVsTeam (Year INTEGER, IgID VARCHAR(4), TmID VARCHAR(3), OppID VARCHAR(4), W INTEGER, L INTEGER, T INTEGER, OTL INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/TeamVsTeam.csv' INTO TABLE TeamVsTeam FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

create table TeamSC (Year INTEGER, IgID VARCHAR(4), TmID VARCHAR(3), G INTEGER, W INTEGER, L INTEGER, T INTEGER, GF INTEGER, GA INTEGER, PIM INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/TeamsSC.csv' INTO TABLE TeamSC FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

#TeamPost very similar to TeamSC...ahhh, it's post season, so do we really want it
#create table TeamPost (Year INTEGER, IgID VARCHAR(4), TmID VARCHAR(3), G INTEGER, W INTEGER, L INTEGER, T INTEGER, GF INTEGER, GA INTEGER, PIM INTEGER);   
#LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/TeamSC.csv' INTO TABLE TeamSC FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

#another table we might not use... so ignore??
#create table TeamSplits (Year INTEGER, IgID VARCHAR(4), TmID VARCHAR(3), G INTEGER, W INTEGER, L INTEGER, T INTEGER, GF INTEGER, GA INTEGER, PIM INTEGER);   
#LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/TeamSC.csv' INTO TABLE TeamSC FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;


create table TeamHalf (Year INTEGER, IgID VARCHAR(4), TmID VARCHAR(3), Half INTEGER, Rank INTEGER, G INTEGER, W INTEGER, L INTEGER, T INTEGER, GF INTEGER, GA INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/TeamsHalf.csv' INTO TABLE TeamHalf FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

##we don't care about post season
#create table SeriesPost (Year INTEGER, IgID VARCHAR(4), TmID VARCHAR(3), Half INTEGER, Rank INTEGER, G INTEGER, W INTEGER, L INTEGER, T INTEGER, GF INTEGER, GA INTEGER);   
#LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/TeamsHalf.csv' INTO TABLE TeamHalf FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

create table Teams (Year INTEGER, IgID VARCHAR(4), TmID VARCHAR(3), FranchID VARCHAR(4), ConfID VARCHAR(4), DivID VARCHAR(4), Rank INTEGER, Playoff VARCHAR(4), G INTEGER, W INTEGER, L INTEGER, T INTEGER, OTL INTEGER, Pts INTEGER, SoW INTEGER, GF INTEGER, GA INTEGER, Name VARCHAR(50), PIM INTEGER, BenchMinor INTEGER, PPG INTEGER, PPC INTEGER, SHA INTEGER, PKG INTEGER, PKC INTEGER, SHF INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/Teams.csv' INTO TABLE Teams FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

create table ScoringShootout (PlayerID VARCHAR(11), Year INTEGER, Stint INTEGER, TmID VARCHAR(3), S INTEGER, G INTEGER, GDG INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/ScoringShootout.csv' INTO TABLE ScoringShootout FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

create table ScoringSC (PlayerID VARCHAR(11), Year INTEGER, TmID VARCHAR(3), IgID VARCHAR(3), Pos VARCHAR(1), GP INTEGER, G INTEGER, A INTEGER, Pts INTEGER, PIM INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/ScoringSC.csv' INTO TABLE ScoringSC FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

#ignored the post season columns (last few)
create table Scoring (PlayerID VARCHAR(11), Year INTEGER, Stint INTEGER, TmID VARCHAR(3), IgID VARCHAR(3), Pos VARCHAR(1), GP INTEGER, G INTEGER, A INTEGER, Pts INTEGER, PIM INTEGER, PlusOrMinus INTEGER, PPG INTEGER, PPA INTEGER, SHG INTEGER, SHA INTEGER, GWG INTEGER, GTG INTEGER, SOG INTEGER);   
LOAD DATA LOCAL INFILE '/Users/wujiayao/Desktop/Databases/FinalProjectLocal/professional-hockey-database/Scoring.csv' INTO TABLE Scoring FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;


