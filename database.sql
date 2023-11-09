-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hojdb
-- ------------------------------------------------------
-- Server version	8.0.34

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
  `AccusedID` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `Sex` varchar(255) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Contact` varchar(20) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` text NOT NULL,
  `PhotoURL` varchar(255) DEFAULT NULL,
  `NationalID` varchar(20) DEFAULT NULL,
  `Occupation` varchar(255) DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accused`
--

LOCK TABLES `accused` WRITE;
/*!40000 ALTER TABLE `accused` DISABLE KEYS */;
INSERT INTO `accused` VALUES (5,'61859499','Dan Alfrei','Celestial','Fuerte','male','2000-09-29','091234567891','dace.phage@gmail.com','Iloilo City',NULL,NULL,NULL,NULL);
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
  `CaseNo` varchar(20) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text NOT NULL,
  `AuthorID` int NOT NULL,
  `AccusedID` int NOT NULL,
  `ViolationID` int NOT NULL,
  `FilingDate` date DEFAULT NULL,
  `Branch` varchar(100) DEFAULT NULL,
  `Status` enum('Filed','Under Investigation','On Trial','Closed','Convicted','Acquitted','Dismissed','Archived','Reopened') DEFAULT NULL,
  `Judge` varchar(100) DEFAULT NULL,
  `Prosecutor` varchar(100) DEFAULT NULL,
  `LeadInvestigator` varchar(100) DEFAULT NULL,
  `TrialDate` datetime DEFAULT NULL,
  `HearingDate` datetime DEFAULT NULL,
  `Verdict` text,
  `Sentence` text,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cases_accused_idx` (`AccusedID`),
  KEY `cases_violations_idx` (`ViolationID`),
  KEY `cases_author_idx` (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (2,'23-112797',NULL,'This incident is filed during den',18,5,29,NULL,NULL,'Filed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-11-09 13:21:39','2023-11-09 22:38:22'),(3,'23-170239',NULL,'asdasdasdasd',18,5,31,NULL,NULL,'Closed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-11-09 13:44:24','2023-11-09 13:48:26');
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
  `Document` varchar(255) NOT NULL,
  `Description` text,
  `FilePath` varchar(255) NOT NULL,
  `CaseNum` int DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `documents_cases_idx` (`CaseNum`),
  CONSTRAINT `documents_cases` FOREIGN KEY (`CaseNum`) REFERENCES `cases` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'asdasda','sadasd','uploads/654ce53576143',NULL,'2023-11-09 13:57:09'),(4,'evidences','asdasd','uploads/654ce848d070c.csv',2,'2023-11-09 14:10:16');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Status` enum('Active','Inactive') DEFAULT 'Active',
  `Role` enum('Admin','Operator') DEFAULT 'Operator',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ChangePassword` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  KEY `idx_Username` (`Username`),
  KEY `idx_Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (18,'Dan Alfrei','Celestial','Fuerte','dace.phage@gmail.com','tiny','$2y$10$QAR0Z4mTsK8cFG9aimPPEOtxDpy23zTI6iRI.96jq0wr6jgenSobm','Active','Admin','2023-10-27 14:53:34',NULL),(25,'Scottie','Magboo','Mupadas','itzmescottie26@gmail.com','juan123','$2y$10$xq9.jGWvHnyeWSKbcIM0duMoR9JIMKnatxSYLIr8Eod7ubMlKSlrq','Active','Operator','2023-10-29 05:17:39',NULL),(27,'Dan Alfrei','Celestial','Fuerte','dace.fuerte@gmail.com','user123','$2y$10$OYWf6LryPgkGzvwqtZGyNu0VbtxpmAIAn1k6.5/Xa0KjlsjQB4792','Active','Operator','2023-11-03 08:19:55','6544AD2A'),(30,'Dan Alfrei','Celestials','Brofar','dace.fuerte.ui@phinmaed.com','admin','$2y$10$KApAcjgBRQpIYuXC.o.95.k3teZA6hWLbY3oBauUYuhsXa5ThmSui','Active','Admin','2023-11-09 22:07:47','654D5833');
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
  `Classification` varchar(255) NOT NULL,
  `Case` varchar(255) NOT NULL,
  `Violation` varchar(255) NOT NULL,
  `Description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2023-11-10  7:57:13
