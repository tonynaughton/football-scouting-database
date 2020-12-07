/* SCRIPT 2 */

USE football_scouting_database;

/* QUERYING THE DATABASE FOR ALL REPORTS COMPILED */

SELECT concat(Scout.firstName, ' ', Scout.lastName) AS 'Scout',
concat(Player.firstName, ' ', Player.lastName) AS 'Player Name',
reportDate AS 'Report Date'
FROM Scout
JOIN Report
ON Scout.scoutid = Report.scoutid
JOIN Player
ON Report.playerid = Player.playerid
ORDER BY reportDate;

/* QUERYING THE DATABASE FOR REPORTS COMPILED ON PLAYERS WITH MINIMUM 10 DEFENDING ATTRIBUTE */

SELECT concat(Player.firstName, ' ', Player.lastName) AS 'Player Name',
Player.position AS 'Position',
Report.defending AS 'Defending',
Report.reportDate AS 'Report Date',
Club.clubName AS 'Club'
FROM Player
JOIN Report
ON Report.playerid = Player.playerid
LEFT JOIN Club
ON Player.clubid = Club.clubid
WHERE Report.defending > 10
ORDER BY Report.defending;

/* QUERYING THE DATABASE FOR PLAYERS PLAYING FOR BOHEMIANS FOOTBALL CLUB */

SELECT Player.lastName as 'Last Name',
Player.firstName as 'First Name',
position as 'Position',
clubName as 'Club Name'
FROM Player
JOIN Club
ON Player.clubid = Club.clubid
WHERE Player.clubid = 
	(SELECT clubid
	FROM Club
	WHERE clubName = 'Bohemians Football Club');

/* QUERYING THE DATABASE FOR PLAYERS NOT CURRENTLY CONTRACTED TO A CLUB */

SELECT concat(firstName, ' ', lastName) as 'Name',
position, height, weight, nationality, dob
FROM Player
WHERE clubid IS NULL
ORDER BY Name;

/* QUERYING THE DATABASE FOR PLAYERS WHO ARE NOT REPRESENTED BY AN AGENT/AGENCY */

SELECT concat(firstName, ' ', lastName) as 'Name',
position, clubName,
concat(Player.street, ', ', Player.town, ', ', Player.county, ' ') as 'Address'
FROM Player
LEFT JOIN Club
ON Player.clubid = Club.clubid
WHERE agentid IS NULL
ORDER BY Name;

/* QUERYING THE DATABASE FOR PLAYERS 23 OR YOUNGER */
/* REFERENCE: https://www.techonthenet.com/mysql/comparison_operators.php */
 
SELECT concat(Player.firstName, ' ', Player.lastName) as 'Name',
Player.position AS 'Position',
TIMESTAMPDIFF(YEAR,Player.dob,CURDATE()) AS 'Age',
clubName as 'Club'
FROM PLAYER
LEFT JOIN Club
ON Player.clubid = Club.clubid
WHERE TIMESTAMPDIFF(YEAR,Player.dob,CURDATE()) < 23
ORDER BY Age;

/* QUERYING THE DATABASE FOR REPORTS COMPILED THIS YEAR IN REVERSE CHRONOLOGICAL ORDER */

SELECT reportDate as 'Report Date',
Player.lastName as 'Last Name',
Player.firstName as 'First Name',
Report.pace AS 'PAC',
Report.shooting AS 'SHO',
Report.passing AS 'PAS',
Report.dribbling AS 'DRI',
Report.defending AS 'DEF',
Report.physicality AS 'PHY'
FROM Report
JOIN Player
ON Report.playerid = Player.playerid
WHERE reportDate >= '2020-01-01'
ORDER BY reportDate DESC;

/* QUERYING THE DATABASE FOR SCOUT CONTACT DETAILS */

SELECT concat(Scout.firstName, ' ', Scout.lastName) AS 'Name',
concat(Scout.street, ', ', Scout.town, ', ', Scout.county, ' ') as 'Address',
Scout.emailAddress AS 'Email',
Scout.contactNumber AS 'Tel'
FROM Scout
ORDER BY Name;

/* QUERYING THE DATABASE FOR CLUB CONTACT DETAILS */

SELECT clubName as 'Club',
concat(Club.street, ', ', Club.town, ', ', Club.county, ' ') as 'Address',
Club.emailAddress AS 'Email',
Club.contactNumber AS 'Tel'
FROM Club
ORDER BY Club;

/* QUERYING THE DATABASE FOR CLUBS BASED IN DUBLIN */

SELECT clubName as 'Club',
concat(Club.street, ', ', Club.town, ', ', Club.county, ' ') as 'Address'
FROM Club
WHERE Club.county = 'Dublin'
ORDER BY Club;

/* QUERYING THE DATABASE FOR PLAYERS BASED IN CORK */

SELECT concat(Player.firstName, ' ', Player.lastName) as 'Name',
concat(Player.street, ', ', Player.town, ', ', Player.county, ' ') as 'Address',
clubName as 'Club'
FROM PLAYER
LEFT JOIN Club
ON Player.clubid = Club.clubid
WHERE Player.County = 'Cork';

/* CREATING USERS */

CREATE USER 'Player' IDENTIFIED BY '12345';
CREATE USER 'Scout' IDENTIFIED BY '12345';
CREATE USER 'Manager' IDENTIFIED BY '12345';
CREATE USER 'Coach' IDENTIFIED BY '12345';

/* GRANTING PLAYER PERMISSIONS */

GRANT ALL ON Player TO Player;
GRANT SELECT ON Report TO Player;
GRANT SELECT ON Club TO Player;
GRANT SELECT ON Agent TO Player;
GRANT SELECT ON individualAgent TO Player;
GRANT SELECT ON Agency TO Player;

/* GRANTING SOCUT PERMISSIONS */

GRANT ALL ON Scout TO Scout;
GRANT ALL ON Report TO Scout;
GRANT SELECT ON Club TO Scout;
GRANT SELECT ON Player TO Scout;

/* GRANTING MANAGER PERMISSIONS */

GRANT SELECT, INSERT, UPDATE ON Player TO Manager;
GRANT SELECT, INSERT, UPDATE ON Scout TO Manager;
GRANT SELECT ON Report TO Manager;
GRANT SELECT, UPDATE ON Club TO Manager;
GRANT SELECT ON Agent TO Manager;
GRANT SELECT ON individualAgent TO Manager;
GRANT SELECT ON Agency TO Manager;

/* GRANTING COACH PERMISSIONS */

GRANT ALL ON Report TO Coach;
GRANT SELECT ON Player TO Coach;