-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2023 at 06:00 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hojdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accused`
--

CREATE TABLE `accused` (
  `id` int(11) NOT NULL,
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
  `Notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accused`
--

INSERT INTO `accused` (`id`, `AccusedID`, `FirstName`, `MiddleName`, `LastName`, `Sex`, `DateOfBirth`, `Contact`, `Email`, `Address`, `PhotoURL`, `NationalID`, `Occupation`, `Notes`) VALUES
(5, '40785299', 'Borgart Dee', 'miller', 'Explorer', 'male', '1999-01-10', '9808098', 'itzmescottie26@gmail.com', 'jaro iloilo', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id` int(11) NOT NULL,
  `CaseNo` varchar(20) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text NOT NULL,
  `AuthorID` int(11) NOT NULL,
  `AccusedID` int(11) NOT NULL,
  `ViolationID` int(11) NOT NULL,
  `FilingDate` date DEFAULT NULL,
  `Branch` varchar(100) DEFAULT NULL,
  `Status` enum('Filed','Under Investigation','On Trial','Closed','Convicted','Acquitted','Dismissed','Archived','Reopened') DEFAULT NULL,
  `Judge` varchar(100) DEFAULT NULL,
  `Prosecutor` varchar(100) DEFAULT NULL,
  `LeadInvestigator` varchar(100) DEFAULT NULL,
  `TrialDate` datetime DEFAULT NULL,
  `HearingDate` datetime DEFAULT NULL,
  `Verdict` text DEFAULT NULL,
  `Sentence` text DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id`, `CaseNo`, `Title`, `Description`, `AuthorID`, `AccusedID`, `ViolationID`, `FilingDate`, `Branch`, `Status`, `Judge`, `Prosecutor`, `LeadInvestigator`, `TrialDate`, `HearingDate`, `Verdict`, `Sentence`, `CreatedAt`, `UpdatedAt`) VALUES
(6, '23-357570', NULL, 'mango si angel', 18, 5, 25, NULL, NULL, 'On Trial', NULL, NULL, NULL, '2023-12-12 00:00:00', '2023-12-21 00:00:00', '', '', '2023-11-10 04:28:31', '2023-11-10 04:28:31'),
(7, '23-603159', NULL, 'sample', 18, 5, 29, NULL, NULL, '', NULL, NULL, NULL, '2023-11-11 00:00:00', '2023-11-13 00:00:00', '', '', '2023-11-10 04:43:12', '2023-11-10 04:43:12'),
(8, '23-140292', NULL, 'sample', 18, 5, 29, NULL, NULL, '', NULL, NULL, NULL, '2023-11-11 00:00:00', '2023-11-13 00:00:00', '', '', '2023-11-10 04:44:52', '2023-11-10 04:44:52'),
(9, '23-747264', NULL, 'sample', 18, 5, 29, NULL, NULL, '', NULL, NULL, NULL, '2023-11-11 00:00:00', '2023-11-13 00:00:00', '', '', '2023-11-10 04:46:56', '2023-11-10 04:46:56'),
(10, '23-300328', NULL, 'sample', 18, 5, 29, NULL, NULL, 'Filed', NULL, NULL, NULL, '2023-11-11 00:00:00', '2023-11-20 00:00:00', '', '', '2023-11-10 04:50:18', '2023-11-10 04:50:18');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `Document` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `FilePath` varchar(255) NOT NULL,
  `CaseNum` int(11) DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `Document`, `Description`, `FilePath`, `CaseNum`, `CreatedAt`) VALUES
(1, 'l', 'kkk', 'uploads/654d8db164694.docx', 2, '2023-11-10 01:56:01'),
(2, 'certi', 'certificate', 'uploads/654d9921282ba.doc', 2, '2023-11-10 02:44:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Status` enum('Active','Inactive') DEFAULT 'Active',
  `Role` enum('Admin','Operator') DEFAULT 'Operator',
  `CreatedAt` timestamp NULL DEFAULT current_timestamp(),
  `ChangePassword` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `FirstName`, `MiddleName`, `LastName`, `Email`, `Username`, `Password`, `Status`, `Role`, `CreatedAt`, `ChangePassword`) VALUES
(18, 'Juan', 'D.', 'Dela Cruz', 'admin@gmail.com', 'admin', '$2y$10$nILI2nTmJ8t0xcMFGusyBu9fts/dB9XYwtNNZME7eQY3lN82rl7.K', 'Active', 'Admin', '2023-10-27 14:53:34', NULL),
(32, 'Angel Mae', '', 'Rano', 'rano.angelmaepit2011@gmail.com', 'angel123', '$2y$10$t02clKYSpjJep1i54TVwV.Mk2rM7RbtSYQj.2bJMm8viI814a4Z..', 'Active', 'Operator', '2023-11-10 02:00:53', '654D8ED4'),
(33, 'scottie', 'miller', 'mupada', 'itzmescottie26@gmail.com', 'scoth69', '$2y$10$kGCFNH7Md8OCkRMZJdxxRO9S2k/dLvIFPg9z2cF8KuGW.tERpaOFi', 'Active', 'Operator', '2023-11-10 02:20:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `violations`
--

CREATE TABLE `violations` (
  `id` int(11) NOT NULL,
  `Classification` varchar(255) NOT NULL,
  `Case` varchar(255) NOT NULL,
  `Violation` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `violations`
--

INSERT INTO `violations` (`id`, `Classification`, `Case`, `Violation`, `Description`) VALUES
(25, 'Family', 'Illegal Possession of Dangerous Drugs', 'Violation of Section 11 of Republic Act No. 9165', 'Prohibits the possession of dangerous drugs without a valid prescription or legal authority.'),
(28, 'Drugs', 'Manufacture of Dangerous Drugs', 'Violation of Section 8 of Republic Act No. 9165', 'Prohibits the manufacture of dangerous drugs and controlled precursors and essential chemicals.'),
(29, 'Drugs', 'Maintenance of a Drug Den', 'Violation of Section 6 of Republic Act No. 9165', 'Prohibits maintaining a place where illegal drugs are used or sold.'),
(30, 'Drugs', 'Possession or Use of a Dangerous Drug During Parties or Social Gatherings', 'Violation of Section 13 of Republic Act No. 9165', 'Pprohibits the possession or use of dangerous drugs during social gatherings or parties.'),
(31, 'Drugs', 'Illegal Drug Trafficking', 'Section 6 of Republic Act No. 9165', 'Covers the illegal trafficking, importation, exportation, trading, or distribution of dangerous drugs.'),
(32, 'Drugs', 'Cultivation or Culture of Plants Classified as Dangerous Drugs or are Sources Thereof', 'Violation of Section 16 of Republic Act No. 9165', 'Prohibits the cultivation or culture of plants classified as dangerous drugs or sources thereof, such as marijuana plants.'),
(33, 'Family', 'Violence Against Women and Their Children', 'Violation of Section 5 of Republic Act No. 9262', 'Prohibits any person from committing acts of violence against women and their children.'),
(34, 'Family', 'Child Abuse', 'Violation of Section 3(a) of Republic Act No. 7610', 'Prohibits child abuse, which includes physical, sexual, or emotional abuse, or neglect of children.'),
(35, 'Family', 'Bigamy', 'Violation of Article 349 of the Revised Penal Code', 'Prohibits entering into a second marriage while the first marriage is still valid and subsisting.'),
(36, 'Family', 'Adultery', 'Violation of Article 333 of the Revised Penal Code', 'Prohibits married individuals from engaging in sexual relations with someone other than their spouse.'),
(37, 'Family', 'Concubinage', 'Violation of Article 334 of the Revised Penal Code', 'Prohibits married men from maintaining a mistress in the conjugal dwelling.'),
(38, 'Family', 'Domestic Violence', 'Violation of VAWC Act, Republic Act No. 9262', 'Prohibits various forms of abuse against women and their children within a family or intimate relationship.'),
(39, 'Family', 'Child Custody Dispute', 'Legal dispute regarding child custody and visitation rights', 'May arise in cases of separation or divorce when parents cannot agree on child custody arrangements.'),
(40, 'Family', 'Annulment of Marriage', 'Legal process for dissolving a marriage based on specific grounds', 'May be pursued when a marriage is deemed void or voidable under Philippine family law.'),
(41, 'Regular', 'Theft', 'Violation of Article 308 of the Revised Penal Code', 'Involves the unlawful taking of another person\'s property without their consent and with the intent to gain.'),
(42, 'Regular', 'Robbery', 'Violation of Article 294 of the Revised Penal Code', 'Involves the use of violence or intimidation to take another person\'s property against their will.'),
(43, 'Regular', 'Estafa', 'Violation of Article 315 of the Revised Penal Code', 'Involves fraud or swindling, such as deceitful transactions, bouncing checks, or false pretenses.'),
(44, 'Regular', 'Homicide', 'Violation of Article 249 of the Revised Penal Code', 'Involves the unlawful killing of another person.'),
(45, 'Regular', 'Libel', 'Violation of Article 353 of the Revised Penal Code', 'Involves defamatory statements made in writing that harm a person\'s reputation.'),
(46, 'Regular', 'Contract Dispute', 'Civil dispute arising from a breach of contract', 'Involves disputes related to contract violations, enforcement, or termination.'),
(49, 'Regular', 'Torts', 'Civil case involving a personal injury claim', 'Involves civil wrongs or torts, such as negligence or personal injury claims.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accused`
--
ALTER TABLE `accused`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cases_accused_idx` (`AccusedID`),
  ADD KEY `cases_violations_idx` (`ViolationID`),
  ADD KEY `cases_author_idx` (`AuthorID`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`),
  ADD UNIQUE KEY `Username_UNIQUE` (`Username`),
  ADD KEY `idx_Username` (`Username`),
  ADD KEY `idx_Email` (`Email`);

--
-- Indexes for table `violations`
--
ALTER TABLE `violations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accused`
--
ALTER TABLE `accused`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `violations`
--
ALTER TABLE `violations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
