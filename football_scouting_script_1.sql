/* SCRIPT 1 */

CREATE DATABASE IF NOT EXISTS football_scouting_database;

USE football_scouting_database;

CREATE TABLE IF NOT EXISTS Club (
clubid int(5) unsigned auto_increment not null,
clubName varchar(50) not null,
street varchar(50) not null,
town varchar(20) not null,
county ENUM('Antrim', 'Armagh', 'Carlow', 'Cavan', 'Clare', 'Cork', 'Derry', 'Donegal', 'Down', 'Dublin', 'Fermanagh', 'Galway', 'Kerry', 'Kildare', 'Kilkenny', 'Laois', 'Leitrim', 'Limerick', 'Longford', 'Louth', 'Mayo', 'Meath', 'Monaghan', 'Offaly', 'Roscommon', 'Sligo', 'Tipperary', 'Tyrone', 'Waterford', 'Westmeath', 'Wexford', 'Wicklow') not null,
contactNumber varchar(15) not null,
emailAddress varchar(40) not null,
primary key (clubid)
);

CREATE TABLE IF NOT EXISTS Scout (
scoutId int(5) unsigned auto_increment not null,
firstName varchar(20) not null,
lastName varchar(20) not null,
street varchar(20) not null,
town varchar(20) not null,
county ENUM('Antrim', 'Armagh', 'Carlow', 'Cavan', 'Clare', 'Cork', 'Derry', 'Donegal', 'Down', 'Dublin', 'Fermanagh', 'Galway', 'Kerry', 'Kildare', 'Kilkenny', 'Laois', 'Leitrim', 'Limerick', 'Longford', 'Louth', 'Mayo', 'Meath', 'Monaghan', 'Offaly', 'Roscommon', 'Sligo', 'Tipperary', 'Tyrone', 'Waterford', 'Westmeath', 'Wexford', 'Wicklow') not null,
contactNumber varchar(15) not null,
emailAddress varchar(40) not null,
primary key (scoutId)
);

CREATE TABLE IF NOT EXISTS Agent (
agentId int(5) unsigned auto_increment not null,
street varchar(20) not null,
town varchar(20) not null,
county ENUM('Antrim', 'Armagh', 'Carlow', 'Cavan', 'Clare', 'Cork', 'Derry', 'Donegal', 'Down', 'Dublin', 'Fermanagh', 'Galway', 'Kerry', 'Kildare', 'Kilkenny', 'Laois', 'Leitrim', 'Limerick', 'Longford', 'Louth', 'Mayo', 'Meath', 'Monaghan', 'Offaly', 'Roscommon', 'Sligo', 'Tipperary', 'Tyrone', 'Waterford', 'Westmeath', 'Wexford', 'Wicklow') not null,
contactNumber varchar(15) not null,
emailAddress varchar(40) not null,
primary key (agentId)
);

CREATE TABLE IF NOT EXISTS individualAgent (
firstName varchar(20) not null,
lastName varchar(20) not null,
agentId int(5) unsigned auto_increment not null,
primary key (agentId),
constraint fk_individualagent foreign key(agentId) references Agent(agentId)
on update cascade on delete cascade
);

CREATE TABLE IF NOT EXISTS agency (
agencyName varchar(40) not null,
agentId int(5) unsigned auto_increment not null,
primary key (agentId),
constraint fk_agency foreign key(agentId) references Agent(agentId)
on update cascade on delete cascade
);

CREATE TABLE IF NOT EXISTS Player (
playerId int(5) unsigned auto_increment not null,
firstName varchar(20) not null,
lastName varchar(20) not null,
street varchar(20) not null,
town varchar(20) not null,
county ENUM('Antrim', 'Armagh', 'Carlow', 'Cavan', 'Clare', 'Cork', 'Derry', 'Donegal', 'Down', 'Dublin', 'Fermanagh', 'Galway', 'Kerry', 'Kildare', 'Kilkenny', 'Laois', 'Leitrim', 'Limerick', 'Longford', 'Louth', 'Mayo', 'Meath', 'Monaghan', 'Offaly', 'Roscommon', 'Sligo', 'Tipperary', 'Tyrone', 'Waterford', 'Westmeath', 'Wexford', 'Wicklow') not null,
nationality varchar(20) not null,
position ENUM('Goalkeeper', 'Defender', 'Midfielder', 'Forward') not null,
dob date not null,
height double (5,2) unsigned not null,
weight double (5,2) unsigned not null,
clubid int(5) unsigned,
agentId int(5) unsigned,
primary key (playerId),
constraint fk_clubid foreign key(clubid) references Club(clubid)
on update cascade on delete cascade,
constraint fk_agentid foreign key(agentId) references Agent(agentId)
on update cascade on delete cascade
);

CREATE TABLE IF NOT EXISTS Report (
reportid int(5) unsigned auto_increment not null,
reportDate date not null,
pace tinyint unsigned not null,
shooting tinyint unsigned not null,
passing tinyint unsigned not null,
dribbling tinyint unsigned not null,
defending tinyint unsigned not null,
physicality tinyint unsigned not null,
goalkeeping tinyint unsigned not null,
playerid int(5) unsigned not null,
scoutid int(5) unsigned not null,
primary key (reportid),
constraint fk_playerid foreign key(playerid) references Player(playerid)
on update cascade on delete cascade,
constraint fk_scoutid foreign key(scoutid) references Scout(scoutid)
on update cascade on delete cascade
);

INSERT INTO Club (clubName, street, town, county, contactNumber, emailAddress) VALUES
('Bohemians Football Club', 'Dalymount Park', '	Phibsborough', 'Dublin', '0854186554', 'info@bohemiansfc.ie'),
('Cork City Football Club', 'Bishopstown Training Ground', 'Curraheen', 'Cork', '0860894659', 'info@corkcityfc.ie'),
('Derry City Football Club', 'Brandywell Stadium', 'Lone Moor Road', 'Derry', '0871549863', 'info@derrycityfc.ie'),
('Dundalk Football Club', 'Oriel Park', 'Dundalk', 'Louth', '0854169653', 'info@dundalkfc.ie'),
('Finn Harps Football Club', 'Finn Park', 'Ballyfobey', 'Donegal', '0851467497', 'info@finnharpsfc.ie'),
('Saint Patricks Athletic', 'Richmond Park', 'Inchicore', 'Dublin', '0865286894', 'info@stpats.ie'),
('Shamrock Rovers Football Club', 'Tallaght Stadium', 'Tallaght', 'Dublin', '0854963123', 'info@shamrockroversfc.ie'),
('Shelbourne Football Club', 'Tolka Park', 'Drumcondra', 'Dublin', '0879184962', 'info@shalbournefc.ie'),
('Sligo Rovers Football Club', 'The Showgrounds', 'Sligo Town', 'Sligo', '0865289649', 'info@sligoroversfc.ie'),
('Waterford Football Club', 'Waterford Regional Sports Centre', 'Waterford', 'Waterford', '0854167984', 'info@waterfordfc.ie');

INSERT INTO Agent (street, town, county, contactNumber, emailAddress) VALUES
('91 Bridge Street', 'Dundalk', 'Louth', '0852149867', 'thomas@barry.ie'),
('Annagary', 'Letterkenny', 'Donegal', '0856144964', 'letterkenny@agency.ie'),
('Kilkishen', 'Ennis', 'Clare', '0874196995', 'steven@mccarthy.ie'),
('Main Street', 'Blarney', 'Cork', '0874133282', 'corkfootballers@agency.ie'),
('The Square', 'Headford', 'Galway', '0879026430', 'john@dwyer.ie');

INSERT INTO individualAgent (firstName, lastName, agentId) VALUES
('Thomas', 'Barry', '1'),
('Steven', 'McCarthy', '3'),
('John', 'Dwyer', '5');

INSERT INTO agency (agencyName, agentId) VALUES
('Letterkenny Agency', 2),
('Cork Footballers Agency', 4);

INSERT INTO Player (firstName, lastName, street, town, county, nationality, position, dob, height, weight, clubid)  VALUES
('Ian', 'Kemp', '8 Washington Street', 'Cork City', 'Cork', 'Irish', 'Midfielder', '1987-08-24', '183.52', '82.63', '2'),
('Terry', 'McCarthy', '2 Blackthorn Close', 'Blackrock', 'Dublin', 'English', 'Defender', '1994-01-02', '172.52', '91.08', '6'),
('Denis', 'Doyle', 'Knockmanagh', 'Killarney', 'Kerry', 'Irish', 'Defender', '2002-10-02', '184.06', '67.07', '5'),
('Shane', 'Kennedy', 'Main Street', 'Castledermot', 'Kildare', 'Irish', 'Defender', '1991-09-05', '183.45', '94.05', '1'),
('David', 'Jones', 'Main Street', 'Monasterevin', 'Kildare', 'Welsh', 'Goalkeeper', '1998-10-07', '69.30', '201.62', '8'),
('Trevor', 'O Sullivan', '16 The Courtyard', 'Sandyford', 'Dublin', 'Irish', 'Forward', '2002-04-07', '174.96', '112.36', '3'),
('Colm', 'O Neill', '24 Main Street', 'Martinstown', 'Louth', 'Irish', 'Defender', '2001-03-14', '173.59', '75.76', '9'),
('Ryan', 'Smith', '82 Briar Close', 'Quin', 'Clare', 'Irish', 'Midfielder', '1997-12-25', '179.78', '111.10', '6');
INSERT INTO Player (firstName, lastName, street, town, county, nationality, position, dob, height, weight, clubid, agentid)  VALUES
('Paul', 'Malone', '5 Fairways', 'Douglas', 'Cork', 'Scottish', 'Goalkeeper', '1996-05-29', '171.27', '106.82', '2', '3'),
('Johnny', 'Williams', '9 Lower Street', 'Ennis', 'Clare', 'Irish', 'Midfielder', '2003-11-27', '186.91', '111.52', '1', '2'),
('Victor', 'Chauve', '19 Camolin', 'Enniscorthy', 'Wexford', 'French', 'Forward', '1999-05-17', '172.84', '104.41', '7', '5'),
('Neil', 'Murphy', 'Main Street', 'Tierquin', 'Cavan', 'Irish', 'Defender', '1997-12-29', '166.52', '60.81', '8', '1'),
('Michael', 'Lynch', '81 Daffodil Close', 'Arklow', 'Wicklow', 'Irish', 'Forward', '1988-03-13', '189.08', '72.41', '9', '2'),
('Thomas', 'Heller', '7 Kingsgate', 'Duleek', 'Meath', 'German', 'Defender', '1999-10-22', '179.97', '69.87', '3', '4');
INSERT INTO Player (firstName, lastName, street, town, county, nationality, position, dob, height, weight)  VALUES
('David', 'Taylor', '9 Edward Street', 'Swinford', 'Mayo', 'English', 'Midfielder', '1993-08-06', '187.64', '109.33'),
('Frank', 'Collins', '30 Maynooth Road', 'Richhill', 'Armagh', 'Irish', 'Midfielder', '1995-04-01', '181.17', '81.96'),
('Tadgh', 'Coghlan', '2 Churchlands', 'Slane', 'Meath', 'Irish', 'Defender', '2000-11-09', '162.39', '61.96'),
('Dylan', 'O Regan', 'Cork Road', 'Midleton', 'Cork', 'Irish', 'Goalkeeper', '1990-08-11', '210.91', '81.48');
INSERT INTO Player (firstName, lastName, street, town, county, nationality, position, dob, height, weight, agentid)  VALUES
('Jacob', 'Lane', '60 Cherrywood', 'Loughlinstown', 'Dublin', 'Scottish', 'Midfielder', '1992-04-17', '197.42', '94.31', '2'),
('Emiliano', 'Tirado', '3 The Estuary', 'Kings Channel', 'Waterford', 'Spanish', 'Defender', '1995-01-18', '172.39', '68.46', '5');

INSERT INTO Scout (firstName, lastName, street, town, county, contactNumber, emailAddress) VALUES
('James', 'Sheehan', '16 The Close', 'Tallaght', 'Dublin', '0854196585', 'james@sheehan.ie'),
('Ryan', 'O Keeffe', '11 Mutton Lane', 'Cork', 'Cork', '0895142889', 'ryan@okeeffe.ie'),
('Paul', 'Rush', '4 Bridge Street', 'Galway', 'Galway', '0874154497', 'paul@rush.ie'),
('Patrick', 'O Leary', 'Main Street', 'Ennis', 'Clare', '0896354187', 'patrick@oleary.ie'),
('Michael', 'O Connor', '10 The Quay', 'New Ross', 'Wexford', '0856164592', 'michael@oconnor.ie');

INSERT INTO Report (reportDate, pace, shooting, passing, dribbling, defending, physicality, goalkeeping, playerid, scoutid) VALUES
('2018-02-09', '16', '8', '11', '14', '8', '8', '1', '6', '5'),
('2018-03-01', '11', '11', '9', '11', '4', '19', '2', '11', '2'),
('2018-06-13', '8', '12', '15', '7', '6', '12', '1', '2', '2'),
('2019-02-27', '12', '6', '7', '9', '4', '8', '15', '9', '1'),
('2019-10-23', '14', '8', '4', '13', '5', '8', '1', '2', '4'),
('2019-07-09', '7', '8', '13', '11', '11', '6', '3', '19', '4'),
('2020-03-08', '19', '7', '8', '12', '7', '19', '14', '18', '3'),
('2020-09-22', '17', '6', '7', '18', '4', '7', '1', '12', '5'),
('2020-10-16', '9', '15', '20', '6', '16', '10', '2', '4', '4'),
('2020-11-02', '10', '9', '3', '13', '14', '6', '1', '7', '1');

CREATE TABLE transfer_history (
	playerId int(5) unsigned not null,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
    previousClubId int(5) unsigned,
    newClubId int(5) unsigned,
    transferDate date,
    action VARCHAR(50) DEFAULT NULL
);

/* TRIGGER FOR RECORDING PLAYER TRANSFERS */

DELIMITER $$
CREATE TRIGGER before_player_update
	BEFORE UPDATE ON Player
    FOR EACH ROW
BEGIN
	INSERT INTO transfer_history
    SET action = 'update',
		playerId = OLD.playerId,
        firstName = OLD.firstName,
        lastName = OLD.lastName,
        previousClubId = OLD.clubid,
        newClubId = NEW.clubid,
        transferDate = NOW();
END $$
DELIMITER ;

/* COMMON INDEXES */

CREATE INDEX playerNameInd ON Player(lastName);
CREATE INDEX playerPositionInd ON Player(position);
CREATE INDEX clubNamesInd ON Club(clubName);

/* VIEWS */

/* VIEW FOR ALL PLAYER NAMES */

CREATE OR REPLACE VIEW playerNames AS
SELECT concat(firstName, ' ', lastName) as 'Name'
FROM Player
ORDER BY Name;

/* VIEW FOR ALL CLUB NAMES */

CREATE OR REPLACE VIEW clubNames AS
SELECT clubName
FROM Club
ORDER BY clubName;

/* VIEW FOR FORWARDS WITH RELEVANT ATTRIBUTES */

CREATE OR REPLACE VIEW forwards AS
SELECT concat(Player.firstName, ' ', Player.lastName) as 'Name',
position, pace, shooting, concat(Scout.firstName, ' ', Scout.lastName) as 'Scout'
FROM Player left join Report
ON Player.playerId = Report.playerid
left join Scout
ON Report.scoutid = Scout.scoutId
where position = 'Forward'
ORDER BY Name;

/* VIEW FOR MIDFIELDERS WITH RELEVANT ATTRIBUTES */

CREATE OR REPLACE VIEW midfielders AS
SELECT concat(Player.firstName, ' ', Player.lastName) as 'Name',
position, passing, dribbling, concat(Scout.firstName, ' ', Scout.lastName) as 'Scout'
FROM Player left join Report
ON Player.playerId = Report.playerid
left join Scout
ON Report.scoutid = Scout.scoutId
where position = 'Midfielder'
ORDER BY Name;

/* VIEW FOR DEFENDERS WITH RELEVANT ATTRIBUTES */

CREATE OR REPLACE VIEW defenders AS
SELECT concat(Player.firstName, ' ', Player.lastName) as 'Name',
position, defending, physicality, concat(Scout.firstName, ' ', Scout.lastName) as 'Scout'
FROM Player
left join Report
ON Player.playerId = Report.playerid
left join Scout
ON Report.scoutid = Scout.scoutId
where position = 'Defender'
ORDER BY Name;

/* VIEW FOR GOALKEEPERS WITH RELEVANT ATTRIBUTES */

CREATE OR REPLACE VIEW goalkeepers AS
SELECT concat(Player.firstName, ' ', Player.lastName) as 'Name',
position, goalkeeping, concat(Scout.firstName, ' ', Scout.lastName) as 'Scout'
FROM Player
left join Report
ON Player.playerId = Report.playerid
left join Scout
ON Report.scoutid = Scout.scoutId
where position = 'Goalkeeper'
ORDER BY Name;