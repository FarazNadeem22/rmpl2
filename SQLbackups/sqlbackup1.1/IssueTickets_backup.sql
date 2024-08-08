-- MySQL dump 10.13  Distrib 9.0.1, for Win64 (x86_64)
--
-- Host: localhost    Database: IssueTickets
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `ClientID` int NOT NULL AUTO_INCREMENT,
  `ClientName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'DIB'),(2,'Ideas Pvt Ltd'),(3,'Quality time'),(4,'Woodcorp'),(5,'SM Cotton'),(6,'Dadex'),(7,'Ajmal Enterprises'),(8,'Jhulay Lal cotton'),(9,'Synegery Corporation'),(10,'Workshop'),(11,'AS Agro'),(12,'Office');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DepartmentID` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Mechanical'),(2,'Electrical'),(3,'Accounts'),(4,'Admin'),(5,'Sales');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generators`
--

DROP TABLE IF EXISTS `generators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generators` (
  `GeneratorID` int NOT NULL AUTO_INCREMENT,
  `RMGNo` varchar(255) DEFAULT NULL,
  `KVA` int DEFAULT NULL,
  `EngineType` varchar(255) DEFAULT NULL,
  `Internal` tinyint(1) DEFAULT NULL,
  `EngineCondition` varchar(255) DEFAULT NULL,
  `EngineLocation` varchar(255) DEFAULT NULL,
  `Particulars` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GeneratorID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generators`
--

LOCK TABLES `generators` WRITE;
/*!40000 ALTER TABLE `generators` DISABLE KEYS */;
INSERT INTO `generators` VALUES (1,'2',365,'TypeA',1,'Major Overhauling','Workshop',NULL),(2,'3',365,'TypeB',1,'Ready to hire','Yard',NULL),(3,'4',455,'TypeC',1,NULL,'SM Cotton - Bela',NULL),(4,'5',500,'TypeD',1,'Alternator & turbo change','Workshop',NULL),(5,'6',500,'TypeE',1,NULL,'AS Agro - Authal',NULL),(6,'8',725,'TypeF',1,NULL,'Workshop',NULL),(7,'9',1275,'TypeG',1,NULL,'Ajmal - Karachi',NULL),(8,'10',100,'TypeH',1,NULL,'Dadex - Hyderabad',NULL),(9,'11',250,'TypeI',1,NULL,'Workshop',NULL),(10,'12',635,'TypeJ',1,NULL,'Yard',NULL),(11,'14',500,'TypeK',1,NULL,'Yard',NULL),(12,'16',635,'TypeL',1,NULL,'Yard',NULL),(13,'18',725,'TypeM',1,NULL,'DIB - Karachi',NULL),(14,'19',100,'TypeN',1,NULL,'Yard',NULL),(15,'20',250,'TypeO',1,NULL,'Yard',NULL),(16,'21',365,'TypeP',1,NULL,'Jullay lal - Sangarh',NULL),(17,'22',1000,'TypeQ',1,NULL,'Quality dyeing - Karachi',NULL),(18,'25',25,'TypeR',1,NULL,'Maheen - Karachi',NULL),(19,'28',33,'TypeS',1,NULL,'Yard',NULL),(20,'37',20,'TypeT',1,NULL,'Parveen - Karachi',NULL),(21,'40',100,'TypeU',1,NULL,'Ideas - Faisalabad',NULL),(22,'41',365,'TypeV',1,NULL,'Yard',NULL),(23,'43',275,'TypeW',1,NULL,NULL,NULL),(24,'44',310,'TypeX',1,NULL,NULL,NULL),(25,'47',100,'TypeY',1,NULL,NULL,NULL),(26,'49',500,'TypeZ',1,NULL,NULL,NULL),(27,'50',60,'TypeAA',1,NULL,NULL,NULL),(28,'Dadex Other',1000,'TypeBB',0,NULL,'External DADEX engine',NULL),(29,'Admin & Accounts',NULL,'TypeCC',1,NULL,'Accounts and admin issues',NULL);
/*!40000 ALTER TABLE `generators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuerecognitions`
--

DROP TABLE IF EXISTS `issuerecognitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issuerecognitions` (
  `IssueRecognitionID` int NOT NULL AUTO_INCREMENT,
  `IssueRecognitionName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IssueRecognitionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuerecognitions`
--

LOCK TABLES `issuerecognitions` WRITE;
/*!40000 ALTER TABLE `issuerecognitions` DISABLE KEYS */;
INSERT INTO `issuerecognitions` VALUES (1,'Daily meeting'),(2,'Sporadic');
/*!40000 ALTER TABLE `issuerecognitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `IssueID` int NOT NULL AUTO_INCREMENT,
  `IssueName` varchar(255) DEFAULT NULL,
  `Remarks` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`IssueID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,'Head rebuild',NULL),(2,'Module card replace',NULL),(3,'Module card calibrate in-house',NULL),(4,'Card Installation',NULL),(5,'Load testing',NULL),(6,'Stolen Battery',NULL),(7,'Relay Issue','Generator is not starting because of Relay'),(8,'Stolen Cables',NULL),(9,'Canopy',NULL),(10,'Movement',NULL),(11,'Breaker',NULL),(12,'Oil Pressure Sensor',NULL),(13,'Oil Cooler Housing',NULL),(14,'Alternator Rewinding',NULL),(15,'Turbo',NULL),(18,'Cheque deposite',NULL),(19,'Cheque Collection',NULL),(20,'Other',NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `PersonID` int NOT NULL AUTO_INCREMENT,
  `PersonName` varchar(255) DEFAULT NULL,
  `Details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Tanveer Alam','Mechanical Incharge'),(2,'Muhammad Irshad','Electrical Incharge'),(3,'Abdul Waseem','Operations incharge'),(4,'Syed Zahid','Manager Sales'),(5,'Umer Nawaz','Head of Operations'),(6,'Shamir Raza','Manager Accounts'),(7,'Shahid Pervaid','Painter'),(8,'Asher Ali','Jr. Admin'),(9,'Niaz Muhammad','Fabricater'),(10,'Muhajid Abbas','Assistant Mechanic');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priorities`
--

DROP TABLE IF EXISTS `priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priorities` (
  `PriorityID` int NOT NULL AUTO_INCREMENT,
  `PriorityName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PriorityID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priorities`
--

LOCK TABLES `priorities` WRITE;
/*!40000 ALTER TABLE `priorities` DISABLE KEYS */;
INSERT INTO `priorities` VALUES (1,'Critical'),(2,'Urgent'),(3,'High'),(4,'Medium'),(5,'Low');
/*!40000 ALTER TABLE `priorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `StatusID` int NOT NULL AUTO_INCREMENT,
  `StatusName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Closed'),(2,'Open'),(3,'Void');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `TicketID` int NOT NULL AUTO_INCREMENT,
  `StartDate` date DEFAULT NULL,
  `TicketGenerationTime` time DEFAULT NULL,
  `TicketResolutionTime` time DEFAULT NULL,
  `GeneratorID` int DEFAULT NULL,
  `IssueID` int DEFAULT NULL,
  `ClientID` int DEFAULT NULL,
  `TicketTypeID` int DEFAULT NULL,
  `IssueRecognitionID` int DEFAULT NULL,
  `PriorityID` int DEFAULT NULL,
  `AssignedTo` int DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `StatusID` int DEFAULT NULL,
  `CompletedDate` date DEFAULT NULL,
  `TimeTakenDays` time DEFAULT NULL,
  `PendingDays` time DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `GeneratorID` (`GeneratorID`),
  KEY `IssueID` (`IssueID`),
  KEY `ClientID` (`ClientID`),
  KEY `TicketTypeID` (`TicketTypeID`),
  KEY `IssueRecognitionID` (`IssueRecognitionID`),
  KEY `PriorityID` (`PriorityID`),
  KEY `AssignedTo` (`AssignedTo`),
  KEY `DepartmentID` (`DepartmentID`),
  KEY `StatusID` (`StatusID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`GeneratorID`) REFERENCES `generators` (`GeneratorID`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`IssueID`) REFERENCES `issues` (`IssueID`),
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`TicketTypeID`) REFERENCES `tickettypes` (`TicketTypeID`),
  CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`IssueRecognitionID`) REFERENCES `issuerecognitions` (`IssueRecognitionID`),
  CONSTRAINT `tickets_ibfk_6` FOREIGN KEY (`PriorityID`) REFERENCES `priorities` (`PriorityID`),
  CONSTRAINT `tickets_ibfk_7` FOREIGN KEY (`AssignedTo`) REFERENCES `people` (`PersonID`),
  CONSTRAINT `tickets_ibfk_8` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `tickets_ibfk_9` FOREIGN KEY (`StatusID`) REFERENCES `statuses` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'2024-08-08','10:47:00','10:45:00',25,1,2,1,1,1,1,1,2,NULL,NULL,NULL,'Muhajid is helping Tanveer with this work.'),(2,'2024-08-08','10:50:00','00:00:00',25,5,2,1,1,1,1,1,2,NULL,NULL,NULL,''),(3,'2024-08-08','10:54:00','00:00:00',25,9,2,1,1,1,1,1,2,NULL,NULL,NULL,'Foaming and fitting. Shahid will do this.'),(4,'2024-08-08','10:55:00','00:00:00',25,10,2,1,1,1,3,4,2,NULL,NULL,NULL,'Shahmir will get the quotations'),(5,'2024-08-08','10:57:00','00:00:00',17,3,3,6,1,2,2,2,2,NULL,NULL,NULL,''),(6,'2024-08-08','10:59:00','10:59:00',7,2,7,5,1,3,2,1,1,'2024-08-08',NULL,NULL,''),(7,'2024-08-08','11:00:00','00:00:00',28,4,6,5,1,5,2,2,2,NULL,NULL,NULL,'Waiting for client response for scheduling '),(8,'2024-08-08','11:02:00','00:00:00',17,5,3,6,1,2,5,1,2,NULL,NULL,NULL,'After placing fuel tank we will know how much pipe is needed'),(9,'2024-08-08','11:07:00','00:00:00',16,11,8,6,1,1,4,2,2,NULL,NULL,NULL,''),(10,'2024-08-08','11:10:00','00:00:00',8,5,6,8,1,4,4,2,2,NULL,NULL,NULL,''),(11,'2024-08-08','11:12:00','00:00:00',23,7,2,4,1,1,5,2,2,NULL,NULL,NULL,''),(12,'2024-08-08','11:18:00','00:00:00',23,12,2,6,1,1,5,2,2,NULL,NULL,NULL,'Third time this issues has come up at this site. Different engines. Investigate'),(13,'2024-08-08','11:26:00','00:00:00',9,13,10,9,1,4,3,1,2,NULL,NULL,NULL,''),(14,'2024-08-08','11:29:00','00:00:00',4,14,10,1,1,3,1,1,2,NULL,NULL,NULL,'Alternator is with the vendor. '),(15,'2024-08-08','11:30:00','00:00:00',4,15,10,1,1,3,1,1,2,NULL,NULL,NULL,'Purchase: Exhaust and manifold '),(16,'2024-08-08','11:35:00','11:36:00',5,15,11,1,1,1,1,1,1,'2024-08-08',NULL,NULL,'Cannibalized from RMG 5'),(17,'2024-08-01','16:08:00','00:00:00',29,1,1,1,1,1,1,1,NULL,NULL,NULL,NULL,'To check Void function.'),(18,'2024-08-08','16:13:00','00:00:00',1,1,1,1,1,1,5,1,1,'2024-08-08',NULL,NULL,'closed test. This is just a test '),(19,'2024-08-08','00:00:00','00:00:00',1,1,1,1,1,1,6,1,3,NULL,NULL,NULL,'void test '),(20,'2024-08-08','16:47:00','00:00:00',29,18,10,11,2,4,3,4,2,NULL,NULL,NULL,'Going to deliver cheques to Rizwan Sahib'),(21,'2024-08-08','17:02:00','17:02:00',29,20,12,12,2,5,3,4,1,'2024-08-08',NULL,NULL,'Tire change for Faraz\'s car'),(22,'2024-08-08','18:08:00','00:00:00',29,20,12,12,2,3,6,3,2,NULL,NULL,NULL,'Prepare the trial balance for auditor - 10 working days required from today'),(23,'2024-08-08','18:13:00','00:00:00',29,20,12,12,2,2,6,3,1,NULL,NULL,NULL,'Prepare petty cash cheques FMO Aug 2024');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickettypes`
--

DROP TABLE IF EXISTS `tickettypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickettypes` (
  `TicketTypeID` int NOT NULL AUTO_INCREMENT,
  `TicketTypeName` varchar(255) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TicketTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickettypes`
--

LOCK TABLES `tickettypes` WRITE;
/*!40000 ALTER TABLE `tickettypes` DISABLE KEYS */;
INSERT INTO `tickettypes` VALUES (1,'BreakDown',NULL),(2,'Cleaning Issues',NULL),(3,'Operator Related',NULL),(4,'Repair',NULL),(5,'Outside Work for client','This is work we do for our clients that we charge them for. This is a profit generating head'),(6,'Trouble shooting',NULL),(7,'Stolen cable issue',NULL),(8,'Visit',NULL),(9,'Welding',NULL),(10,'Bank',NULL),(11,'Britelite',NULL),(12,'Other',NULL);
/*!40000 ALTER TABLE `tickettypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-08 18:23:03
