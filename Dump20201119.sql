CREATE DATABASE  IF NOT EXISTS `football_scouting_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `football_scouting_database`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: football_scouting_database
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency` (
  `agencyName` varchar(40) NOT NULL,
  `agentId` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`agentId`),
  CONSTRAINT `fk_agency` FOREIGN KEY (`agentId`) REFERENCES `agent` (`agentId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES ('Letterkenny Agency',2),('Cork Footballers Agency',4);
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `agentId` int unsigned NOT NULL AUTO_INCREMENT,
  `street` varchar(20) NOT NULL,
  `town` varchar(20) NOT NULL,
  `county` enum('Antrim','Armagh','Carlow','Cavan','Clare','Cork','Derry','Donegal','Down','Dublin','Fermanagh','Galway','Kerry','Kildare','Kilkenny','Laois','Leitrim','Limerick','Longford','Louth','Mayo','Meath','Monaghan','Offaly','Roscommon','Sligo','Tipperary','Tyrone','Waterford','Westmeath','Wexford','Wicklow') NOT NULL,
  `contactNumber` varchar(15) NOT NULL,
  `emailAddress` varchar(40) NOT NULL,
  PRIMARY KEY (`agentId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'91 Bridge Street','Dundalk','Louth','0852149867','thomas@barry.ie'),(2,'Annagary','Letterkenny','Donegal','0856144964','letterkenny@agency.ie'),(3,'Kilkishen','Ennis','Clare','0874196995','steven@mccarthy.ie'),(4,'Main Street','Blarney','Cork','0874133282','corkfootballers@agency.ie'),(5,'The Square','Headford','Galway','0879026430','john@dwyer.ie');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `clubid` int unsigned NOT NULL AUTO_INCREMENT,
  `clubName` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `town` varchar(20) NOT NULL,
  `county` enum('Antrim','Armagh','Carlow','Cavan','Clare','Cork','Derry','Donegal','Down','Dublin','Fermanagh','Galway','Kerry','Kildare','Kilkenny','Laois','Leitrim','Limerick','Longford','Louth','Mayo','Meath','Monaghan','Offaly','Roscommon','Sligo','Tipperary','Tyrone','Waterford','Westmeath','Wexford','Wicklow') NOT NULL,
  `contactNumber` varchar(15) NOT NULL,
  `emailAddress` varchar(40) NOT NULL,
  PRIMARY KEY (`clubid`),
  KEY `clubNamesInd` (`clubName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (1,'Bohemians Football Club','Dalymount Park','	Phibsborough','Dublin','0854186554','info@bohemiansfc.ie'),(2,'Cork City Football Club','Bishopstown Training Ground','Curraheen','Cork','0860894659','info@corkcityfc.ie'),(3,'Derry City Football Club','Brandywell Stadium','Lone Moor Road','Derry','0871549863','info@derrycityfc.ie'),(4,'Dundalk Football Club','Oriel Park','Dundalk','Louth','0854169653','info@dundalkfc.ie'),(5,'Finn Harps Football Club','Finn Park','Ballyfobey','Donegal','0851467497','info@finnharpsfc.ie'),(6,'Saint Patricks Athletic','Richmond Park','Inchicore','Dublin','0865286894','info@stpats.ie'),(7,'Shamrock Rovers Football Club','Tallaght Stadium','Tallaght','Dublin','0854963123','info@shamrockroversfc.ie'),(8,'Shelbourne Football Club','Tolka Park','Drumcondra','Dublin','0879184962','info@shalbournefc.ie'),(9,'Sligo Rovers Football Club','The Showgrounds','Sligo Town','Sligo','0865289649','info@sligoroversfc.ie'),(10,'Waterford Football Club','Waterford Regional Sports Centre','Waterford','Waterford','0854167984','info@waterfordfc.ie');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clubnames`
--

DROP TABLE IF EXISTS `clubnames`;
/*!50001 DROP VIEW IF EXISTS `clubnames`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clubnames` AS SELECT 
 1 AS `clubName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `defenders`
--

DROP TABLE IF EXISTS `defenders`;
/*!50001 DROP VIEW IF EXISTS `defenders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `defenders` AS SELECT 
 1 AS `Name`,
 1 AS `position`,
 1 AS `defending`,
 1 AS `physicality`,
 1 AS `Scout`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `forwards`
--

DROP TABLE IF EXISTS `forwards`;
/*!50001 DROP VIEW IF EXISTS `forwards`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `forwards` AS SELECT 
 1 AS `Name`,
 1 AS `position`,
 1 AS `pace`,
 1 AS `shooting`,
 1 AS `Scout`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `goalkeepers`
--

DROP TABLE IF EXISTS `goalkeepers`;
/*!50001 DROP VIEW IF EXISTS `goalkeepers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `goalkeepers` AS SELECT 
 1 AS `Name`,
 1 AS `position`,
 1 AS `goalkeeping`,
 1 AS `Scout`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `individualagent`
--

DROP TABLE IF EXISTS `individualagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individualagent` (
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `agentId` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`agentId`),
  CONSTRAINT `fk_individualagent` FOREIGN KEY (`agentId`) REFERENCES `agent` (`agentId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individualagent`
--

LOCK TABLES `individualagent` WRITE;
/*!40000 ALTER TABLE `individualagent` DISABLE KEYS */;
INSERT INTO `individualagent` VALUES ('Thomas','Barry',1),('Steven','McCarthy',3),('John','Dwyer',5);
/*!40000 ALTER TABLE `individualagent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `midfielders`
--

DROP TABLE IF EXISTS `midfielders`;
/*!50001 DROP VIEW IF EXISTS `midfielders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `midfielders` AS SELECT 
 1 AS `Name`,
 1 AS `position`,
 1 AS `passing`,
 1 AS `dribbling`,
 1 AS `Scout`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `playerId` int unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `town` varchar(20) NOT NULL,
  `county` enum('Antrim','Armagh','Carlow','Cavan','Clare','Cork','Derry','Donegal','Down','Dublin','Fermanagh','Galway','Kerry','Kildare','Kilkenny','Laois','Leitrim','Limerick','Longford','Louth','Mayo','Meath','Monaghan','Offaly','Roscommon','Sligo','Tipperary','Tyrone','Waterford','Westmeath','Wexford','Wicklow') NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `position` enum('Goalkeeper','Defender','Midfielder','Forward') NOT NULL,
  `dob` date NOT NULL,
  `height` double(5,2) unsigned NOT NULL,
  `weight` double(5,2) unsigned NOT NULL,
  `clubid` int unsigned DEFAULT NULL,
  `agentId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`playerId`),
  KEY `fk_clubid` (`clubid`),
  KEY `fk_agentid` (`agentId`),
  KEY `playerNameInd` (`lastName`),
  KEY `playerPositionInd` (`position`),
  CONSTRAINT `fk_agentid` FOREIGN KEY (`agentId`) REFERENCES `agent` (`agentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_clubid` FOREIGN KEY (`clubid`) REFERENCES `club` (`clubid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Ian','Kemp','8 Washington Street','Cork City','Cork','Irish','Midfielder','1987-08-24',183.52,82.63,2,NULL),(2,'Terry','McCarthy','2 Blackthorn Close','Blackrock','Dublin','English','Defender','1994-01-02',172.52,91.08,6,NULL),(3,'Denis','Doyle','Knockmanagh','Killarney','Kerry','Irish','Defender','2002-10-02',184.06,67.07,5,NULL),(4,'Shane','Kennedy','Main Street','Castledermot','Kildare','Irish','Defender','1991-09-05',183.45,94.05,1,NULL),(5,'David','Jones','Main Street','Monasterevin','Kildare','Welsh','Goalkeeper','1998-10-07',69.30,201.62,8,NULL),(6,'Trevor','O Sullivan','16 The Courtyard','Sandyford','Dublin','Irish','Forward','2002-04-07',174.96,112.36,3,NULL),(7,'Colm','O Neill','24 Main Street','Martinstown','Louth','Irish','Defender','2001-03-14',173.59,75.76,9,NULL),(8,'Ryan','Smith','82 Briar Close','Quin','Clare','Irish','Midfielder','1997-12-25',179.78,111.10,6,NULL),(9,'Paul','Malone','5 Fairways','Douglas','Cork','Scottish','Goalkeeper','1996-05-29',171.27,106.82,2,3),(10,'Johnny','Williams','9 Lower Street','Ennis','Clare','Irish','Midfielder','2003-11-27',186.91,111.52,1,2),(11,'Victor','Chauve','19 Camolin','Enniscorthy','Wexford','French','Forward','1999-05-17',172.84,104.41,7,5),(12,'Neil','Murphy','Main Street','Tierquin','Cavan','Irish','Defender','1997-12-29',166.52,60.81,8,1),(13,'Michael','Lynch','81 Daffodil Close','Arklow','Wicklow','Irish','Forward','1988-03-13',189.08,72.41,9,2),(14,'Thomas','Heller','7 Kingsgate','Duleek','Meath','German','Defender','1999-10-22',179.97,69.87,3,4),(15,'David','Taylor','9 Edward Street','Swinford','Mayo','English','Midfielder','1993-08-06',187.64,109.33,NULL,NULL),(16,'Frank','Collins','30 Maynooth Road','Richhill','Armagh','Irish','Midfielder','1995-04-01',181.17,81.96,NULL,NULL),(17,'Tadgh','Coghlan','2 Churchlands','Slane','Meath','Irish','Defender','2000-11-09',162.39,61.96,NULL,NULL),(18,'Dylan','O Regan','Cork Road','Midleton','Cork','Irish','Goalkeeper','1990-08-11',210.91,81.48,NULL,NULL),(19,'Jacob','Lane','60 Cherrywood','Loughlinstown','Dublin','Scottish','Midfielder','1992-04-17',197.42,94.31,NULL,2),(20,'Emiliano','Tirado','3 The Estuary','Kings Channel','Waterford','Spanish','Defender','1995-01-18',172.39,68.46,NULL,5);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_player_update` BEFORE UPDATE ON `player` FOR EACH ROW BEGIN
	INSERT INTO transfer_history
    SET action = 'update',
		playerId = OLD.playerId,
        firstName = OLD.firstName,
        lastName = OLD.lastName,
        previousClubId = OLD.clubid,
        newClubId = NEW.clubid,
        transferDate = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `playernames`
--

DROP TABLE IF EXISTS `playernames`;
/*!50001 DROP VIEW IF EXISTS `playernames`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `playernames` AS SELECT 
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `reportid` int unsigned NOT NULL AUTO_INCREMENT,
  `reportDate` date NOT NULL,
  `pace` tinyint unsigned NOT NULL,
  `shooting` tinyint unsigned NOT NULL,
  `passing` tinyint unsigned NOT NULL,
  `dribbling` tinyint unsigned NOT NULL,
  `defending` tinyint unsigned NOT NULL,
  `physicality` tinyint unsigned NOT NULL,
  `goalkeeping` tinyint unsigned NOT NULL,
  `playerid` int unsigned NOT NULL,
  `scoutid` int unsigned NOT NULL,
  PRIMARY KEY (`reportid`),
  KEY `fk_playerid` (`playerid`),
  KEY `fk_scoutid` (`scoutid`),
  CONSTRAINT `fk_playerid` FOREIGN KEY (`playerid`) REFERENCES `player` (`playerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_scoutid` FOREIGN KEY (`scoutid`) REFERENCES `scout` (`scoutId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,'2018-02-09',16,8,11,14,8,8,1,6,5),(2,'2018-03-01',11,11,9,11,4,19,2,11,2),(3,'2018-06-13',8,12,15,7,6,12,1,2,2),(4,'2019-02-27',12,6,7,9,4,8,15,9,1),(5,'2019-10-23',14,8,4,13,5,8,1,2,4),(6,'2019-07-09',7,8,13,11,11,6,3,19,4),(7,'2020-03-08',19,7,8,12,7,19,14,18,3),(8,'2020-09-22',17,6,7,18,4,7,1,12,5),(9,'2020-10-16',9,15,20,6,16,10,2,4,4),(10,'2020-11-02',10,9,3,13,14,6,1,7,1);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scout`
--

DROP TABLE IF EXISTS `scout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scout` (
  `scoutId` int unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `town` varchar(20) NOT NULL,
  `county` enum('Antrim','Armagh','Carlow','Cavan','Clare','Cork','Derry','Donegal','Down','Dublin','Fermanagh','Galway','Kerry','Kildare','Kilkenny','Laois','Leitrim','Limerick','Longford','Louth','Mayo','Meath','Monaghan','Offaly','Roscommon','Sligo','Tipperary','Tyrone','Waterford','Westmeath','Wexford','Wicklow') NOT NULL,
  `contactNumber` varchar(15) NOT NULL,
  `emailAddress` varchar(40) NOT NULL,
  PRIMARY KEY (`scoutId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scout`
--

LOCK TABLES `scout` WRITE;
/*!40000 ALTER TABLE `scout` DISABLE KEYS */;
INSERT INTO `scout` VALUES (1,'James','Sheehan','16 The Close','Tallaght','Dublin','0854196585','james@sheehan.ie'),(2,'Ryan','O Keeffe','11 Mutton Lane','Cork','Cork','0895142889','ryan@okeeffe.ie'),(3,'Paul','Rush','4 Bridge Street','Galway','Galway','0874154497','paul@rush.ie'),(4,'Patrick','O Leary','Main Street','Ennis','Clare','0896354187','patrick@oleary.ie'),(5,'Michael','O Connor','10 The Quay','New Ross','Wexford','0856164592','michael@oconnor.ie');
/*!40000 ALTER TABLE `scout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_history`
--

DROP TABLE IF EXISTS `transfer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_history` (
  `playerId` int unsigned NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `previousClubId` int unsigned DEFAULT NULL,
  `newClubId` int unsigned DEFAULT NULL,
  `transferDate` date DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_history`
--

LOCK TABLES `transfer_history` WRITE;
/*!40000 ALTER TABLE `transfer_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `clubnames`
--

/*!50001 DROP VIEW IF EXISTS `clubnames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clubnames` AS select `club`.`clubName` AS `clubName` from `club` order by `club`.`clubName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `defenders`
--

/*!50001 DROP VIEW IF EXISTS `defenders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `defenders` AS select concat(`player`.`firstName`,' ',`player`.`lastName`) AS `Name`,`player`.`position` AS `position`,`report`.`defending` AS `defending`,`report`.`physicality` AS `physicality`,concat(`scout`.`firstName`,' ',`scout`.`lastName`) AS `Scout` from ((`player` left join `report` on((`player`.`playerId` = `report`.`playerid`))) left join `scout` on((`report`.`scoutid` = `scout`.`scoutId`))) where (`player`.`position` = 'Defender') order by concat(`player`.`firstName`,' ',`player`.`lastName`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `forwards`
--

/*!50001 DROP VIEW IF EXISTS `forwards`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `forwards` AS select concat(`player`.`firstName`,' ',`player`.`lastName`) AS `Name`,`player`.`position` AS `position`,`report`.`pace` AS `pace`,`report`.`shooting` AS `shooting`,concat(`scout`.`firstName`,' ',`scout`.`lastName`) AS `Scout` from ((`player` left join `report` on((`player`.`playerId` = `report`.`playerid`))) left join `scout` on((`report`.`scoutid` = `scout`.`scoutId`))) where (`player`.`position` = 'Forward') order by concat(`player`.`firstName`,' ',`player`.`lastName`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goalkeepers`
--

/*!50001 DROP VIEW IF EXISTS `goalkeepers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goalkeepers` AS select concat(`player`.`firstName`,' ',`player`.`lastName`) AS `Name`,`player`.`position` AS `position`,`report`.`goalkeeping` AS `goalkeeping`,concat(`scout`.`firstName`,' ',`scout`.`lastName`) AS `Scout` from ((`player` left join `report` on((`player`.`playerId` = `report`.`playerid`))) left join `scout` on((`report`.`scoutid` = `scout`.`scoutId`))) where (`player`.`position` = 'Goalkeeper') order by concat(`player`.`firstName`,' ',`player`.`lastName`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `midfielders`
--

/*!50001 DROP VIEW IF EXISTS `midfielders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `midfielders` AS select concat(`player`.`firstName`,' ',`player`.`lastName`) AS `Name`,`player`.`position` AS `position`,`report`.`passing` AS `passing`,`report`.`dribbling` AS `dribbling`,concat(`scout`.`firstName`,' ',`scout`.`lastName`) AS `Scout` from ((`player` left join `report` on((`player`.`playerId` = `report`.`playerid`))) left join `scout` on((`report`.`scoutid` = `scout`.`scoutId`))) where (`player`.`position` = 'Midfielder') order by concat(`player`.`firstName`,' ',`player`.`lastName`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `playernames`
--

/*!50001 DROP VIEW IF EXISTS `playernames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `playernames` AS select concat(`player`.`firstName`,' ',`player`.`lastName`) AS `Name` from `player` order by concat(`player`.`firstName`,' ',`player`.`lastName`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-19 20:05:14
