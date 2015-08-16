-- MySQL dump 10.13  Distrib 5.6.25, for osx10.8 (x86_64)
--
-- Host: localhost    Database: jmt
-- ------------------------------------------------------
-- Server version	5.6.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `jmt`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jmt` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jmt`;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `phoneNumber` text NOT NULL,
  `duration` text NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `weatherSensitive` tinyint(1) NOT NULL,
  `allDay` tinyint(1) NOT NULL,
  `booked` tinyint(1) NOT NULL,
  `fixedTime` tinyint(1) NOT NULL,
  `picUrl` text NOT NULL,
  `type` text NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Weingalerie und Café NÖ!','Glinkastr. 23','191','7200000','2015-08-24 10:30:00','2015-08-24 12:29:00',1,1,1,1,'www.blabla.come/imageid=123','RES'),(2,'Rembrandt-Burger','Richard-Sorge-Str. 21','191','7200000','2015-08-25 09:45:00','2015-08-25 11:44:00',1,1,1,1,'www.blabla.come/imageid=123','RES'),(3,'Hudson Bar','Elßholzstr. 10','191','14400000','2015-08-26 13:30:00','2015-08-26 17:29:00',1,1,1,1,'www.blabla.come/imageid=123','BAR'),(4,'Wild At Heart','Wiener Str. 20','191','14400000','2015-08-24 14:30:00','2015-08-24 18:29:00',1,1,1,1,'www.blabla.come/imageid=123','BAR'),(5,'Larder Lisl','Oberbaumbrücke','191','3600000','2015-08-27 11:00:00','2015-08-27 11:59:00',1,1,1,1,'www.blabla.come/imageid=123','MUSIC'),(6,'AQUA Bootsparty meets Memory Travel - Die Reise in deine Erinnerung - Das Abenteuer 2.0 - 12.09.2015','Am Müggelberg 1','191','3600000','2015-08-26 10:15:00','2015-08-26 11:14:00',1,1,1,1,'www.blabla.come/imageid=123','MUSIC'),(7,'12. Winterwelt am Potsdamer Platz','10785 Berlin','191','10800000','2015-08-25 13:00:00','2015-08-25 15:59:00',1,1,1,1,'www.blabla.come/imageid=123','SPORT'),(8,'BOOT & FUN BERLIN 2015','Messedamm 22 14055 Berlin','191','10800000','2015-08-27 12:15:00','2015-08-27 15:14:00',1,1,1,1,'www.blabla.come/imageid=123','SPORT'),(9,'Weingalerie und Café NÖ!','Glinkastr. 23','191','7200000','2015-08-27 11:00:00','2015-08-27 12:59:00',1,1,1,1,'www.blabla.come/imageid=123','RES'),(10,'Rembrandt-Burger','Richard-Sorge-Str. 21','191','7200000','2015-08-25 09:45:00','2015-08-25 11:44:00',1,1,1,1,'www.blabla.come/imageid=123','RES'),(11,'Hudson Bar','Elßholzstr. 10','191','14400000','2015-08-26 10:30:00','2015-08-26 14:29:00',1,1,1,1,'www.blabla.come/imageid=123','BAR'),(12,'Wild At Heart','Wiener Str. 20','191','14400000','2015-08-24 11:30:00','2015-08-24 15:29:00',1,1,1,1,'www.blabla.come/imageid=123','BAR'),(13,'Larder Lisl','Oberbaumbrücke','191','3600000','2015-08-27 13:15:00','2015-08-27 14:14:00',1,1,1,1,'www.blabla.come/imageid=123','MUSIC'),(14,'AQUA Bootsparty meets Memory Travel - Die Reise in deine Erinnerung - Das Abenteuer 2.0 - 12.09.2015','Am Müggelberg 1','191','3600000','2015-08-26 10:15:00','2015-08-26 11:14:00',1,1,1,1,'www.blabla.come/imageid=123','MUSIC'),(15,'12. Winterwelt am Potsdamer Platz','10785 Berlin','191','10800000','2015-08-25 12:15:00','2015-08-25 15:14:00',1,1,1,1,'www.blabla.come/imageid=123','SPORT'),(16,'BOOT & FUN BERLIN 2015','Messedamm 22 14055 Berlin','191','10800000','2015-08-27 14:30:00','2015-08-27 17:29:00',1,1,1,1,'www.blabla.come/imageid=123','SPORT');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemfortrip`
--

DROP TABLE IF EXISTS `itemfortrip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemfortrip` (
  `tripId` int(11) NOT NULL DEFAULT '0',
  `itemId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tripId`,`itemId`),
  KEY `eventfortrip_ibfk_2` (`itemId`),
  CONSTRAINT `itemfortrip_ibfk_1` FOREIGN KEY (`tripId`) REFERENCES `trip` (`tripId`),
  CONSTRAINT `itemfortrip_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemfortrip`
--

LOCK TABLES `itemfortrip` WRITE;
/*!40000 ALTER TABLE `itemfortrip` DISABLE KEYS */;
INSERT INTO `itemfortrip` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16);
/*!40000 ALTER TABLE `itemfortrip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_item`
--

DROP TABLE IF EXISTS `temp_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_item` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `phoneNumber` text NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `weatherSensitive` tinyint(1) NOT NULL,
  `allDay` tinyint(1) NOT NULL,
  `booked` tinyint(1) NOT NULL,
  `fixedTime` tinyint(1) NOT NULL,
  `picUrl` text NOT NULL,
  `type` text NOT NULL,
  `UUID` text NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_item`
--

LOCK TABLES `temp_item` WRITE;
/*!40000 ALTER TABLE `temp_item` DISABLE KEYS */;
INSERT INTO `temp_item` VALUES (1,'Weingalerie und Café NÖ!','Glinkastr. 23','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','361ed3b5-1f7a-41fd-9f37-0b34fda1d0cd'),(2,'Marral','Torstr. 222','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','8d493472-8167-4314-9591-9fb216ac06e3'),(3,'Rembrandt-Burger','Richard-Sorge-Str. 21','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','3ca723a3-63b1-4771-a9b9-154215dbc01b'),(4,'Restaurant Bastard','Reichenberger Str. 122','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','e6f04f19-4e96-4a09-a0fd-4f877e19cab4'),(5,'Wawa','Grunewaldstr. 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','fe98b372-9fdf-42e8-9f8e-b0f78393d45b'),(6,'Mabuhay','Köthener Str. 28','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','727260b5-ef17-464e-860a-4365206a60c2'),(7,'Focaccia','Alt-Moabit 51','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','0005d1d8-a451-4d37-9084-9501357b06ad'),(8,'Keule Berliner Mundart','Simon-Dach-Str. 22','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','88935761-f0e8-4a07-a135-720f1f44635b'),(9,'Matreshka','Boxhagener Str. 60','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','ef2faab5-1874-4dff-aac1-d3e29a2039ec'),(10,'Butterhandlung','Scharnweberstr. 54','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','fdc266c8-ae46-46d7-8715-dba0b8dac14b'),(11,'Al-Andalos','Sonnenallee 40','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','b28f50e1-4e50-4f31-a64e-4a58e8a39005'),(12,'Lecker Song','Schliemannstr. 19','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','a49a1c89-c0ea-408a-bf3c-e92ca8f04f50'),(13,'Cocoro','Mehringdamm 64','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','05e15466-ea56-4a8f-a5db-05a1324a6154'),(14,'Thai Window Asia','Torstr. 22','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','85500b25-05a4-45d5-a248-f80fb4ec9e84'),(15,'Chipps','Jägerstr. 35','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','bb34285f-fdc9-4257-8f83-44213f009b5c'),(16,'Dabangg','Hedwigstr. 18','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','5f5e5827-6d0f-4432-9a0d-0b95bbd7511c'),(17,'Facil','Potsdamer Str. 3','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','f3dd4af2-3a6a-4d25-89b0-8880ea87e1f6'),(18,'Buscaglione','Rochstr. 3','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','1578017a-1af4-4776-9007-97bcf9288db3'),(19,'Mezem','Kantstr. 124','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','ad28aea4-a55c-448f-a59b-9346f4ae8b89'),(20,'L\'Escargot','Brüsseler Str. 39','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','7afbf83a-750b-4387-aa08-c06692c2b8e7'),(21,'Würgeengel','Dresdenerstr. 122','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','7b5989da-cdee-4821-b2b1-9a5e378fbddf'),(22,'Hudson Bar','Elßholzstr. 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','4688614f-4490-42e7-9929-a6b7eedab4fe'),(23,'rivabar','Dircksenstr.','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','5b8ba6d0-35c4-45aa-8632-39f410693587'),(24,'Wild At Heart','Wiener Str. 20','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','a9e47381-7de7-4b4b-83ac-2641bbded771'),(25,'Weingalerie und Café NÖ!','Glinkastr. 23','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','37421619-2f9e-4cd2-9df4-1929f39f8717'),(26,'Hops & Barley Hausbrauerei','Wühlischstr. 22-23','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','6288c25c-42c8-462e-aff0-2715a70f2026'),(27,'Stagger Lee','Nollendorfstr. 27','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','9a04561d-8d23-4bae-bdd1-4649253027bd'),(28,'Saphire Bar','Bötzowstr. 31','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','e2f0f1ed-9081-4885-8b2e-5b5e7daef4b1'),(29,'Lerchen&Eulen','Pücklerstr. 33','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','7784dd8b-af46-4c69-9ed6-f3dc82d8beb7'),(30,'Moritz Bar','Adolfstr. 17','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','0e89577a-aeb1-49b4-9107-18ee54dfb454'),(31,'NOER','Falckensteinstr. 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','2f538a9b-fb9e-401a-9280-ca71d7964837'),(32,'Destille','Mehringdamm 67','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','90f7c493-76f5-460b-b8e2-9b2bc56dd855'),(33,'Die Legende von Paula & Ben','Gneisenaustr. 58','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','b518f330-e270-4511-8a48-68365505a5d8'),(34,'Becketts Kopf','Pappelallee 64','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','be911e10-c185-4a31-82fe-04a58a5705af'),(35,'W. Prassnik','Torstr. 65','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','9f095356-448b-4c01-9b6a-7ab4faedbb8e'),(36,'Goldfisch Bar','Grünberger Str. 67','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','e9e2a483-57a9-4c3e-baac-cd5fedb4f03b'),(37,'Windhorst','Dorotheenstr. 65','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','668f456f-73ac-4065-baa9-d0211b065aee'),(38,'meisterschueler','Friedrichstr. 105b','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','a25e15e1-31dd-41c5-ad14-bf01d694bedb'),(39,'Fire Bar','Krausnickstr. 5','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','7d35688c-c9d5-4f56-9854-0751b02795ab'),(40,'Catwalk','Inge-Beisheimplatz 1','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','6a2dbc0f-991e-43a3-ae69-5d72f938db16'),(41,'12. Winterwelt am Potsdamer Platz','10785 Berlin','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','07d37bab-aa89-44f7-bb84-06e9e6e0f3f5'),(42,'„Wer wir waren, wer wir sind“ – Buchvorstellung und Gespräch','Deutsches Historisches Museum(Schlüterhof) Unter den Linden 2 10117 Berlin Mitte','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','0b55b872-f3fa-4123-a2ac-5a4e590f9153'),(43,'BOOT & FUN BERLIN 2015','Messedamm 22 14055 Berlin','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','877a7bd6-f277-4b0d-8673-7ac0c90a81cd'),(44,'Muhammad Ali','Kantstrasse 149','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','ab5dc71b-9ed1-43f1-900d-f478d68d4390'),(45,'TIPPN x NEUE HEIMAT Präsentieren FOODBALL FEST','Berlin Germany','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','001ff676-0cfc-4224-be78-624c0e41196f'),(46,'Berliner Vollmond-Marathon','Harriesstraße 1','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','3c9492a9-a552-4e2a-8c85-bece6103664d'),(47,'Compared with – ein Showing von Dafi Altabeb und Nini Moshe mit anschließendem Publikumsgespräch','Kastanienallee 79','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','873d17ea-1af5-4ef5-8548-35f4b7c64afc'),(48,'Structures for Success II','Karl-Marx-Platz 6','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','08145d2d-65b1-408f-a975-84ea8f6c4e07'),(49,'German Bowl XXXVII','U-Bahnhof Eberswalder Str /Ausg Danziger Straße vor dem Kiosk 10437 Prenzlauer Berg','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','8aaf3b8c-0536-4e49-b718-3b0c83e381da'),(50,'Germany v England','Olympischer Platz 3','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','8ffa8df2-cfca-401b-81c1-5f5abf009311'),(51,'2nd Annual Sportdata & Performance Forum (2015)','Friedrichstraße 96','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','3f231340-7048-4ee8-9d82-b62296dfd34c'),(52,'Euroleague Final Four 2016 - Semi Finals 1 & 2','Mühlenstraße 12-30','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','525ee25c-b6cb-45f1-9686-0e6e349374a9'),(53,'Mega Manga Convention','Wilhelmsruher Damm 142 c','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','8f30e5e8-80c7-468b-a9f8-a5071cc56cfa'),(54,'European eSports Conference','Steigenberger Hotel Berlin Los-Angeles-Platz 1 10789 Berlin Charlottenburg','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','ab9c5765-da6f-402c-a3fe-22e01226456e'),(55,'Retro Race','Sonnenallee 225','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','e46477d7-0f0f-4452-a284-0b45fcda664b'),(56,'PA SPORTS - Eiskalter Engel Tour 2015','Skalitzer Straße 85/86','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','3fc0299e-e968-40d8-858d-330ffcdae3fa'),(57,'frei.wild - theater.sport','Viktoriastraße 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','9e2c64fb-50b0-4c1b-a4b9-598dce241016'),(58,'frei.wild - theater.sport','Viktoriastraße 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','2966a43d-76db-41dd-bc0d-e7d518d638a3'),(59,'Pa Sports','Pücklerstrasse 34','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','f0db18dd-c076-482d-8bd2-33eb21618461'),(60,'Larder Lisl','Oberbaumbrücke','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','f3e75573-d546-4a62-8f02-e9b273b3520c'),(61,'Kultursommer im Spreepark','Berlin Germany','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','35404b0c-efb4-4bc2-930f-b943bbcd882f'),(62,'Endless Night: German Vampire Ball 2015 Weekend \"Film Noir\"','Gustav-Adolf-Str. 2','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','a5ebe372-8011-4d6a-ab99-1936bc532230'),(63,'Boulangerie XIV - Musik, Wein und Gespräche','Radialsystem V, Holzmarktstraße 33, 10243 Berlin, Friedrichshain,','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','fb408ad1-cf8d-4507-be29-55b8d2e67272'),(64,'Invisible People - Im Rahmen des ufaFabrik Boulevards – Ein Programm der Londoner Theatergruppe 1st Framework in Zusammenarbeit mit dem Theater der Erfahrungen, den Golden Gorkis und den weisen Sehern, Berlin','Friedrichstraße 101','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','96d58c7e-f83e-421b-a897-43f8f0377ed1'),(65,'Blue Man Group','Marlene-dietrich-platz 1','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','f0bdb385-870a-4114-b326-78321f36a690'),(66,'La Boheme: Deutsche Oper Berlin','Bismarckstraße 35','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','89aa92f5-03bb-4e3b-aa5d-c226360702f2'),(67,'Tales from the Vienna Woods: Komische Oper Berlin','Behrenstraße 55-57','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','7b8e70d5-80af-482a-9fc8-575590fddc2f'),(68,'Tales from the Vienna Woods: Komische Oper Berlin','Behrenstraße 55-57','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','33f246ec-3f9b-44b2-96bb-56c84e23f8e7'),(69,'VOICE & MOVEMENT with Laur Fugère and Claudia Kohl','Bleibtreustraße','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','476abf86-0887-4d47-bbe7-da1a567b1822'),(70,'Sufjan Stevens + Mina Tindle','Friedrichstr. 101','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','cbf40263-16db-4ce2-9b5b-c37a456b40b0'),(71,'Jewgeni Onegin: Komische Oper Berlin','Behrenstraße 55-57','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','d3efd96d-7b09-41f5-b103-2e42988013c0'),(72,'Invisible People - Im Rahmen des ufaFabrik Boulevard','Viktoriastraße 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','c5b6c41b-a9b4-4b3d-9ef9-09ae1708c50d'),(73,'SÁMI CONTEMPORARY NIGHT - an arctic world of sights & sounds','Prinzenstrasse 85','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','2a8ef49f-f9d1-4b7a-8e6e-228ac3d7e226'),(74,'Käptn Peng & die Tentakel von Delphi (Forever Now Festival)','Revaler Strasse 99','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','d308add5-8b26-401f-98d1-37cb0e22a125'),(75,'THE WYLD - Nicht von dieser Welt','Friedrichstraße 107','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','996ccc61-56c4-4320-8e68-d44338872652'),(76,'Die verflixte Klassik – Mit Felix Reuter am Flügel','SchloßBritz, Alt-Britz 73, 12359 Berlin, Neukölln,','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','c1ed2d35-86d9-4592-a300-f374800abc5c'),(77,'AQUA Bootsparty meets Memory Travel - Die Reise in deine Erinnerung - Das Abenteuer 2.0 - 12.09.2015','Am Müggelberg 1','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','049049ea-ee59-45b3-a930-e6f18300ab7c'),(78,'Relations in Time!','Auguststr. 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','86048e3b-7e5f-4ab8-a49c-4fbb16afbf36'),(79,'Kenny Dope\'s Reminder at Prince Charles','Prinzenstrasse 85','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','8767e6f8-bb13-49b7-9f6b-e58fe008f75a'),(80,'Weingalerie und Café NÖ!','Glinkastr. 23','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','6257f7a8-6e66-4621-9afe-098364cc518f'),(81,'Marral','Torstr. 222','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','83715207-fe39-4ba3-980d-6049e2976a44'),(82,'Rembrandt-Burger','Richard-Sorge-Str. 21','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','c741f070-680e-45c0-922d-e457a4e189c7'),(83,'Restaurant Bastard','Reichenberger Str. 122','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','04bee0cf-0515-462b-9595-710ebedee841'),(84,'Wawa','Grunewaldstr. 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','7adcc45e-229b-43a6-b2f0-b09216c795f2'),(85,'Mabuhay','Köthener Str. 28','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','2cdebf12-679b-41ee-9cce-3ba4c89e5ee0'),(86,'Focaccia','Alt-Moabit 51','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','f55695ff-7897-4ce5-bfe8-90242f957c44'),(87,'Keule Berliner Mundart','Simon-Dach-Str. 22','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','e4324ec3-0b43-446a-ba7b-f3de4c0a8c71'),(88,'Matreshka','Boxhagener Str. 60','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','1a9e6964-efda-449d-a548-3a54f710310b'),(89,'Butterhandlung','Scharnweberstr. 54','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','fc191a7e-08e6-460f-b97c-d11da4911dcb'),(90,'Al-Andalos','Sonnenallee 40','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','29672dd0-2a1b-48f2-8f0c-b62ec4c8c579'),(91,'Lecker Song','Schliemannstr. 19','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','c70d75cb-0a35-4f1c-bb9d-e5b90a5db164'),(92,'Cocoro','Mehringdamm 64','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','c84afaac-97a2-4376-a561-1386cc5e0b1a'),(93,'Thai Window Asia','Torstr. 22','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','b279fa32-6445-47ad-8a13-3446f8a47d36'),(94,'Chipps','Jägerstr. 35','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','1fb0f0f5-bda7-406e-ba82-7a14e1dc8de9'),(95,'Dabangg','Hedwigstr. 18','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','50506529-05ce-4820-af3c-d68c7bf42fb4'),(96,'Facil','Potsdamer Str. 3','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','91fbbcbc-15d6-48b5-b462-24bb26bf25cd'),(97,'Buscaglione','Rochstr. 3','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','3afad30d-715d-4d92-a173-8bda541dd9d7'),(98,'Mezem','Kantstr. 124','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','f1042abe-77da-4cbd-bf46-36b45671ae61'),(99,'L\'Escargot','Brüsseler Str. 39','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','RES','7b05ccec-a170-4efe-a56d-ea5487db28f6'),(100,'Würgeengel','Dresdenerstr. 122','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','38619637-dab0-4af3-9fc4-9a3927776aa1'),(101,'Hudson Bar','Elßholzstr. 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','24525e71-ebee-4081-8a02-ac275e28acb3'),(102,'rivabar','Dircksenstr.','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','0a25a70b-9d39-4c44-a564-b36f7d884c8a'),(103,'Wild At Heart','Wiener Str. 20','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','805287e6-c7d0-411b-ae02-66cb3177e638'),(104,'Weingalerie und Café NÖ!','Glinkastr. 23','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','c194bf86-9b41-4ee1-969f-ef217729e3f8'),(105,'Hops & Barley Hausbrauerei','Wühlischstr. 22-23','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','45f80081-93f8-4ac3-9f2d-955a26601728'),(106,'Stagger Lee','Nollendorfstr. 27','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','dd27ca76-f539-40e5-8938-76731abc0e3d'),(107,'Saphire Bar','Bötzowstr. 31','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','91d2fdb0-db9c-48c8-87f8-b381017f4b70'),(108,'Lerchen&Eulen','Pücklerstr. 33','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','230b784d-5bbf-420d-b1a1-059b393dd3ea'),(109,'Moritz Bar','Adolfstr. 17','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','7b6ed50d-8387-4a6c-9648-afb548654bd6'),(110,'NOER','Falckensteinstr. 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','253462d6-6228-49e2-935c-7df0d0603338'),(111,'Destille','Mehringdamm 67','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','fd077c4b-f968-4cc3-af2e-c98d1ad1c419'),(112,'Die Legende von Paula & Ben','Gneisenaustr. 58','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','1aca12dc-c91b-4397-9743-7126cd8ce516'),(113,'Becketts Kopf','Pappelallee 64','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','d7a05e55-16ed-4229-a0d3-106f5b53fe1e'),(114,'W. Prassnik','Torstr. 65','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','147a4182-328a-4fdf-ab51-852c822e9882'),(115,'Goldfisch Bar','Grünberger Str. 67','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','264ca505-a701-4625-b7ca-52ae09d76b06'),(116,'Windhorst','Dorotheenstr. 65','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','b4fd9d67-7037-467b-88ae-f3157079e62f'),(117,'meisterschueler','Friedrichstr. 105b','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','af83fdb1-dd1f-41e4-931a-ed08482729df'),(118,'Fire Bar','Krausnickstr. 5','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','ba1db5a0-037e-44da-b2e9-cfe4c01aba82'),(119,'Catwalk','Inge-Beisheimplatz 1','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','BAR','8e490de0-76ed-4a19-8d2d-c0bfd3edde0c'),(120,'12. Winterwelt am Potsdamer Platz','10785 Berlin','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','e92baa96-c8d3-43b1-b25c-7c499592b499'),(121,'„Wer wir waren, wer wir sind“ – Buchvorstellung und Gespräch','Deutsches Historisches Museum(Schlüterhof) Unter den Linden 2 10117 Berlin Mitte','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','6eac15fe-4680-4723-970b-2d2ce85707b1'),(122,'BOOT & FUN BERLIN 2015','Messedamm 22 14055 Berlin','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','fff4d9ed-b7c7-4302-b85f-c97b1b401c76'),(123,'Muhammad Ali','Kantstrasse 149','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','bc8f422f-0715-40d0-b9c0-c7e5d344ce25'),(124,'TIPPN x NEUE HEIMAT Präsentieren FOODBALL FEST','Berlin Germany','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','e7789684-5609-43aa-9141-412616c41186'),(125,'Berliner Vollmond-Marathon','Harriesstraße 1','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','cf816f4c-1755-4d40-b079-2d3ba4fede95'),(126,'Compared with – ein Showing von Dafi Altabeb und Nini Moshe mit anschließendem Publikumsgespräch','Kastanienallee 79','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','a6c6bdd0-b101-48d3-81f3-ffebe662cea1'),(127,'Structures for Success II','Karl-Marx-Platz 6','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','fe36bd9e-6e95-4f25-ac15-2a3859152e82'),(128,'German Bowl XXXVII','U-Bahnhof Eberswalder Str /Ausg Danziger Straße vor dem Kiosk 10437 Prenzlauer Berg','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','68fc72fc-c324-459e-8f83-c9227cb22f58'),(129,'Germany v England','Olympischer Platz 3','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','425a1cc0-f54d-4279-9050-859a20b1e48d'),(130,'2nd Annual Sportdata & Performance Forum (2015)','Friedrichstraße 96','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','5e07542d-ae0e-4652-af4a-60971ca69af3'),(131,'Euroleague Final Four 2016 - Semi Finals 1 & 2','Mühlenstraße 12-30','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','0e76abf3-86c5-4859-bc3d-10da328c05af'),(132,'Mega Manga Convention','Wilhelmsruher Damm 142 c','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','67fe89c6-404e-496e-9388-957cd9630368'),(133,'European eSports Conference','Steigenberger Hotel Berlin Los-Angeles-Platz 1 10789 Berlin Charlottenburg','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','c0ed3ed3-dc04-4cf9-896f-be10ba319e66'),(134,'Retro Race','Sonnenallee 225','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','a7b293a7-db69-4a7c-bd17-133e82a0ba57'),(135,'PA SPORTS - Eiskalter Engel Tour 2015','Skalitzer Straße 85/86','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','467a95c1-d091-479d-bdcf-b4ca03e5d718'),(136,'frei.wild - theater.sport','Viktoriastraße 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','412182c4-b46b-49bf-86d7-e13c21de40cb'),(137,'frei.wild - theater.sport','Viktoriastraße 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','af465410-2a12-423a-933f-6cf28a96dc1f'),(138,'Pa Sports','Pücklerstrasse 34','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','SPORT','cd6495a7-da68-47f1-b569-264cbf690df6'),(139,'Larder Lisl','Oberbaumbrücke','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','cacb2b99-1cb1-46a2-9d0f-eecb120cfc80'),(140,'Kultursommer im Spreepark','Berlin Germany','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','e48565c2-3471-440d-8964-af6ce20dc483'),(141,'Endless Night: German Vampire Ball 2015 Weekend \"Film Noir\"','Gustav-Adolf-Str. 2','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','195cdfe8-83b2-43ed-ae1f-18cc106208cb'),(142,'Boulangerie XIV - Musik, Wein und Gespräche','Radialsystem V, Holzmarktstraße 33, 10243 Berlin, Friedrichshain,','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','8c6b6940-cb93-4e26-9b51-0ead3057df78'),(143,'Invisible People - Im Rahmen des ufaFabrik Boulevards – Ein Programm der Londoner Theatergruppe 1st Framework in Zusammenarbeit mit dem Theater der Erfahrungen, den Golden Gorkis und den weisen Sehern, Berlin','Friedrichstraße 101','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','2df00b9d-9ffa-4460-a789-da6a402ebdac'),(144,'Blue Man Group','Marlene-dietrich-platz 1','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','cc814167-a537-450e-8a36-627a82c81414'),(145,'La Boheme: Deutsche Oper Berlin','Bismarckstraße 35','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','58d48cc1-e09f-4841-8c22-61a17a9d3a37'),(146,'Tales from the Vienna Woods: Komische Oper Berlin','Behrenstraße 55-57','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','d8ba781c-00fa-40ad-8c4b-c95ef467b4b9'),(147,'Tales from the Vienna Woods: Komische Oper Berlin','Behrenstraße 55-57','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','6951ee5b-ab56-497e-8aa5-13617c471c50'),(148,'VOICE & MOVEMENT with Laur Fugère and Claudia Kohl','Bleibtreustraße','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','707fddaa-d6be-43d1-bd6e-07ff9eba42e9'),(149,'Sufjan Stevens + Mina Tindle','Friedrichstr. 101','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','70a23dfa-d179-4327-8edb-9aac5a55e33c'),(150,'Jewgeni Onegin: Komische Oper Berlin','Behrenstraße 55-57','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','18f0eb8a-4a09-4e25-9d59-6003c52e1e5d'),(151,'Invisible People - Im Rahmen des ufaFabrik Boulevard','Viktoriastraße 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','0446b2ca-70c4-43ad-ba33-0f8b293b060a'),(152,'SÁMI CONTEMPORARY NIGHT - an arctic world of sights & sounds','Prinzenstrasse 85','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','f36aefe3-93c4-49d3-94d8-ee99728c9f52'),(153,'Käptn Peng & die Tentakel von Delphi (Forever Now Festival)','Revaler Strasse 99','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','dc74b705-b3ff-4f12-ab17-61eb653facb1'),(154,'THE WYLD - Nicht von dieser Welt','Friedrichstraße 107','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','66b35918-2cc6-4331-939b-b0529e6c92d8'),(155,'Die verflixte Klassik – Mit Felix Reuter am Flügel','SchloßBritz, Alt-Britz 73, 12359 Berlin, Neukölln,','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','d766b2fc-f1bb-48fa-aab9-8124d664ee06'),(156,'AQUA Bootsparty meets Memory Travel - Die Reise in deine Erinnerung - Das Abenteuer 2.0 - 12.09.2015','Am Müggelberg 1','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','09b70c03-9ac3-4834-a442-37a57c2c181f'),(157,'Relations in Time!','Auguststr. 10','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','8bde7cff-3509-4886-b32a-35349497f2ea'),(158,'Kenny Dope\'s Reminder at Prince Charles','Prinzenstrasse 85','191','2015-08-24','2015-08-31',1,1,1,1,'www.blabla.come/imageid=123','MUSIC','b6219387-abae-4d90-b032-86c9b617cbe1');
/*!40000 ALTER TABLE `temp_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traveller`
--

DROP TABLE IF EXISTS `traveller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traveller` (
  `travellerId` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `surname` text NOT NULL,
  `email` text NOT NULL,
  `username` text,
  `password` text,
  `placeOfBirth` text NOT NULL,
  `dateOfBirth` date NOT NULL,
  `photo` text NOT NULL COMMENT 'for now url',
  `facebook_id` text COMMENT 'NULL means registration is not done with fb',
  PRIMARY KEY (`travellerId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traveller`
--

LOCK TABLES `traveller` WRITE;
/*!40000 ALTER TABLE `traveller` DISABLE KEYS */;
INSERT INTO `traveller` VALUES (1,'Pater','Nostrum','pater.nostrum@jackmytour.com','demone','demone1990','Bolzano','3910-01-11','blabla',NULL),(2,'Giuseppe','Aina','giuseppe.aina@gmail.com',NULL,NULL,'Bolzano','3910-01-11','blabla','796999480415342'),(5,'Tihomir','Vachkov','carletto_prague@yahoo.it','tihomirski','qwe','Bolzano','3910-01-11','blabla',NULL),(6,'Andrea','Iannone','andrea@yahoo.com','maniac','qwe','Bolzano','3910-01-11','blabla',NULL),(7,'Sam','Lowes','lowes@yahoo.com','lowes','qwe','Bolzano','3910-01-11','blabla',NULL),(8,'John','Smith','test@jmt-test.com','test','test','Bolzano','3910-01-11','blabla',NULL);
/*!40000 ALTER TABLE `traveller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trip` (
  `tripId` int(11) NOT NULL AUTO_INCREMENT,
  `city` text NOT NULL,
  `startDate` text NOT NULL,
  `endDate` text NOT NULL,
  `startingPoint` text NOT NULL,
  `link` text NOT NULL,
  `travellerId` int(11) NOT NULL,
  PRIMARY KEY (`tripId`),
  KEY `fk_triptraveller` (`travellerId`),
  CONSTRAINT `fk_triptraveller` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`travellerId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,'Berlin','08/24/2015','08/31/2015','Via Splendente','jackmytour.com',8),(2,'Berlin','08/24/2015','08/31/2015','Via Splendente','jackmytour.com',8);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-16 19:27:31
