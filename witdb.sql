-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: witdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `accused`
--

DROP TABLE IF EXISTS `accused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accused` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AccusedID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FirstName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `MiddleName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Sex` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Contact` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Address` text COLLATE utf8mb4_general_ci NOT NULL,
  `PhotoURL` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NationalID` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Occupation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Notes` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accused`
--

LOCK TABLES `accused` WRITE;
/*!40000 ALTER TABLE `accused` DISABLE KEYS */;
INSERT INTO `accused` VALUES (12,'49109764','Robeert','Go','Gale','male','2001-12-23','4532707','reynamaecaculangan@gmail.com','San Juan',NULL,NULL,NULL,NULL),(13,'40404706','Collyne','Go','Samalburo','female','1999-12-03','09663101744','collynesamalburo@gmail.com','Oton',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `accused` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CaseNo` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` text COLLATE utf8mb4_general_ci NOT NULL,
  `AuthorID` int NOT NULL,
  `AccusedID` int NOT NULL,
  `ViolationID` int NOT NULL,
  `FilingDate` date DEFAULT NULL,
  `Branch` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Status` enum('Filed','Under Investigation','On Trial','Closed','Convicted','Acquitted','Dismissed','Archived','Reopened') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Judge` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Prosecutor` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LeadInvestigator` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TrialDate` datetime DEFAULT NULL,
  `HearingDate` datetime DEFAULT NULL,
  `Verdict` text COLLATE utf8mb4_general_ci,
  `Sentence` text COLLATE utf8mb4_general_ci,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cases_accused_idx` (`AccusedID`),
  KEY `cases_violations_idx` (`ViolationID`),
  KEY `cases_author_idx` (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (18,'23-926446',NULL,'on trial',40,13,58,NULL,NULL,'On Trial',NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','2023-12-13 05:46:28','2023-12-13 05:46:28'),(19,'23-859760',NULL,'on trial',40,13,58,NULL,NULL,'Filed',NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','2023-12-13 05:46:34','2023-12-13 05:52:35'),(20,'23-908829',NULL,'lack evidence',40,12,55,NULL,NULL,'Under Investigation',NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','2023-12-13 05:48:53','2023-12-13 05:48:53');
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Document` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text COLLATE utf8mb4_general_ci,
  `FilePath` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `CaseNum` int DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hearings`
--

DROP TABLE IF EXISTS `hearings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hearings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CaseNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Venue` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Schedule` date DEFAULT NULL,
  `Remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hearings`
--

LOCK TABLES `hearings` WRITE;
/*!40000 ALTER TABLE `hearings` DISABLE KEYS */;
INSERT INTO `hearings` VALUES (4,'23-921540','dfghj','2023-12-06','yonu'),(5,'23-309886','iloilo','2023-12-07','1st trial'),(6,'23-309886','antique','2023-12-07','1st trial');
/*!40000 ALTER TABLE `hearings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `MiddleName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Status` enum('Active','Inactive') COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `Role` enum('Admin','Operator') COLLATE utf8mb4_general_ci DEFAULT 'Operator',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ChangePassword` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ExpiryPassword` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  KEY `idx_Username` (`Username`),
  KEY `idx_Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan','D.','Dela Cruz','admin@gmail.com','admin','$2y$10$nILI2nTmJ8t0xcMFGusyBu9fts/dB9XYwtNNZME7eQY3lN82rl7.K','Active','Admin','2023-10-27 14:53:34',NULL,NULL),(40,'Scottie','','Mupada','itzmescottie26@gmail.com','juan123','$2y$10$OTS/duWlXpO26zKJNQNo2uaBvpMejoV/nC/9r/EnYrA5c/6y7oTRK','Active','Operator','2023-12-13 05:39:23',NULL,NULL),(42,'Angel Mae','Patriarca','Rano','rano.angelmaepit2011@gmail.com','angel123','$2y$10$1rOXIOQkx2Vp4i4uzS24puEsgHG2JxOEqo96CT1ffD.G0L9LnNUOC','Active','Operator','2024-01-12 14:31:38','65A152F0','00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violations`
--

DROP TABLE IF EXISTS `violations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `violations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Classification` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Case` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Violation` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violations`
--

LOCK TABLES `violations` WRITE;
/*!40000 ALTER TABLE `violations` DISABLE KEYS */;
INSERT INTO `violations` VALUES (55,'Family','32-34567','murder','idk'),(57,'Drug','23-23234','Homicide','asdfghjkl'),(58,'Family','23-232467','Child Abuse','asdfghjkl'),(59,'Drug','32-34567','sadasd','asdasd'),(60,'Regular','23-456782','Child Abuse','wqdudhgdku');
/*!40000 ALTER TABLE `violations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-13 12:47:18
