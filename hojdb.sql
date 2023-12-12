-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hojdb
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accused`
--

LOCK TABLES `accused` WRITE;
/*!40000 ALTER TABLE `accused` DISABLE KEYS */;
INSERT INTO `accused` VALUES (5,'40785299','Borgart Dee','miller','Explorer','male','1999-01-10','9808098','itzmescottie26@gmail.com','jaro iloilo',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (6,'23-357570',NULL,'mango si angel',18,5,25,NULL,NULL,'On Trial',NULL,NULL,NULL,'2023-12-12 00:00:00','2023-12-21 00:00:00','','','2023-11-10 04:28:31','2023-11-10 04:28:31'),(7,'23-603159',NULL,'sample',18,5,29,NULL,NULL,'',NULL,NULL,NULL,'2023-11-11 00:00:00','2023-11-13 00:00:00','','','2023-11-10 04:43:12','2023-11-10 04:43:12'),(8,'23-140292',NULL,'sample',18,5,29,NULL,NULL,'Archived',NULL,NULL,NULL,'2023-11-11 00:00:00','2023-11-13 00:00:00','','','2023-11-10 04:44:52','2023-12-02 03:58:04'),(9,'23-747264',NULL,'sample',18,5,29,NULL,NULL,'',NULL,NULL,NULL,'2023-11-11 00:00:00','2023-11-13 00:00:00','','','2023-11-10 04:46:56','2023-11-10 04:46:56'),(10,'23-300328',NULL,'sample',18,5,29,NULL,NULL,'Filed',NULL,NULL,NULL,'2023-11-11 00:00:00','2023-11-20 00:00:00','','','2023-11-10 04:50:18','2023-11-10 04:50:18'),(11,'23-814185',NULL,'asdasdas',18,5,25,NULL,NULL,'Under Investigation',NULL,NULL,NULL,'2023-12-02 00:00:00','2023-12-13 00:00:00','aasdas','asdasd','2023-12-02 03:40:57','2023-12-02 03:40:57'),(12,'23-977759',NULL,'uuih',18,5,25,NULL,NULL,'On Trial',NULL,NULL,NULL,'2023-12-02 00:00:00','2023-12-12 00:00:00','aasdas','asdasd','2023-12-02 03:41:45','2023-12-02 03:41:45'),(13,'23-187230',NULL,'asdasdasd',18,5,29,NULL,NULL,'Filed',NULL,NULL,NULL,'2023-12-06 00:00:00','2023-12-14 00:00:00','asdasd','asdasdas','2023-12-02 03:42:48','2023-12-02 03:42:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'l','kkk','uploads/654d8db164694.docx',2,'2023-11-10 01:56:01'),(2,'certi','certificate','uploads/654d9921282ba.doc',2,'2023-11-10 02:44:49'),(3,'asdasda','asdasda','uploads/656aa601cc819.jpg',6,'2023-12-02 03:35:29');
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
  `CaseID` int DEFAULT NULL,
  `Venue` varchar(45) DEFAULT NULL,
  `Schedule` datetime DEFAULT NULL,
  `Remarks` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hearings`
--

LOCK TABLES `hearings` WRITE;
/*!40000 ALTER TABLE `hearings` DISABLE KEYS */;
INSERT INTO `hearings` VALUES (1,1,'Iloilo','2023-12-13 00:00:00','Final Hearing');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  KEY `idx_Username` (`Username`),
  KEY `idx_Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (18,'Juan','D.','Dela Cruz','dace.phage1@gmail.com','admin','$2y$10$L19InA9YPGgdz3U1f/mH0.azYwECP18e1KnVV3Bumg0th3uPR176u','Active','Admin','2023-10-27 14:53:34',NULL),(32,'Angel Mae','','Rano','rano.angelmaepit2011@gmail.com','angel123','$2y$10$t02clKYSpjJep1i54TVwV.Mk2rM7RbtSYQj.2bJMm8viI814a4Z..','Active','Operator','2023-11-10 02:00:53','654D8ED4'),(33,'scottie','miller','mupada','itzmescottie26@gmail.com','scoth69','$2y$10$kGCFNH7Md8OCkRMZJdxxRO9S2k/dLvIFPg9z2cF8KuGW.tERpaOFi','Active','Operator','2023-11-10 02:20:28',NULL),(34,'Dan Alfrei','Celestial','Fuerte','dace.phage@gmail.com','tiny','$2y$10$vj1Ni9t8BorwLuqpprEUxOBKupXi2jvy0nshSP7p3aXgwXI/gRRMq','Active','Operator','2023-12-02 03:27:04',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violations`
--

LOCK TABLES `violations` WRITE;
/*!40000 ALTER TABLE `violations` DISABLE KEYS */;
INSERT INTO `violations` VALUES (25,'Family','Illegal Possession of Dangerous Drugs','Violation of Section 11 of Republic Act No. 9165','Prohibits the possession of dangerous drugs without a valid prescription or legal authority.'),(28,'Drugs','Manufacture of Dangerous Drugs','Violation of Section 8 of Republic Act No. 9165','Prohibits the manufacture of dangerous drugs and controlled precursors and essential chemicals.'),(29,'Drugs','Maintenance of a Drug Den','Violation of Section 6 of Republic Act No. 9165','Prohibits maintaining a place where illegal drugs are used or sold.'),(30,'Drugs','Possession or Use of a Dangerous Drug During Parties or Social Gatherings','Violation of Section 13 of Republic Act No. 9165','Pprohibits the possession or use of dangerous drugs during social gatherings or parties.'),(31,'Drugs','Illegal Drug Trafficking','Section 6 of Republic Act No. 9165','Covers the illegal trafficking, importation, exportation, trading, or distribution of dangerous drugs.'),(32,'Drugs','Cultivation or Culture of Plants Classified as Dangerous Drugs or are Sources Thereof','Violation of Section 16 of Republic Act No. 9165','Prohibits the cultivation or culture of plants classified as dangerous drugs or sources thereof, such as marijuana plants.'),(33,'Family','Violence Against Women and Their Children','Violation of Section 5 of Republic Act No. 9262','Prohibits any person from committing acts of violence against women and their children.'),(34,'Family','Child Abuse','Violation of Section 3(a) of Republic Act No. 7610','Prohibits child abuse, which includes physical, sexual, or emotional abuse, or neglect of children.'),(35,'Family','Bigamy','Violation of Article 349 of the Revised Penal Code','Prohibits entering into a second marriage while the first marriage is still valid and subsisting.'),(36,'Family','Adultery','Violation of Article 333 of the Revised Penal Code','Prohibits married individuals from engaging in sexual relations with someone other than their spouse.'),(37,'Family','Concubinage','Violation of Article 334 of the Revised Penal Code','Prohibits married men from maintaining a mistress in the conjugal dwelling.'),(38,'Family','Domestic Violence','Violation of VAWC Act, Republic Act No. 9262','Prohibits various forms of abuse against women and their children within a family or intimate relationship.'),(39,'Family','Child Custody Dispute','Legal dispute regarding child custody and visitation rights','May arise in cases of separation or divorce when parents cannot agree on child custody arrangements.'),(40,'Family','Annulment of Marriage','Legal process for dissolving a marriage based on specific grounds','May be pursued when a marriage is deemed void or voidable under Philippine family law.'),(41,'Regular','Theft','Violation of Article 308 of the Revised Penal Code','Involves the unlawful taking of another person\'s property without their consent and with the intent to gain.'),(42,'Regular','Robbery','Violation of Article 294 of the Revised Penal Code','Involves the use of violence or intimidation to take another person\'s property against their will.'),(43,'Regular','Estafa','Violation of Article 315 of the Revised Penal Code','Involves fraud or swindling, such as deceitful transactions, bouncing checks, or false pretenses.'),(44,'Regular','Homicide','Violation of Article 249 of the Revised Penal Code','Involves the unlawful killing of another person.'),(45,'Regular','Libel','Violation of Article 353 of the Revised Penal Code','Involves defamatory statements made in writing that harm a person\'s reputation.'),(46,'Regular','Contract Dispute','Civil dispute arising from a breach of contract','Involves disputes related to contract violations, enforcement, or termination.'),(49,'Regular','Torts','Civil case involving a personal injury claim','Involves civil wrongs or torts, such as negligence or personal injury claims.');
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

-- Dump completed on 2023-12-12 15:30:06
