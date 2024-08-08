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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-08 18:16:55
