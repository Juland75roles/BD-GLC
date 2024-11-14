-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 13, 2024 at 03:46 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `centre_formation`
--

-- --------------------------------------------------------

--
-- Table structure for table `appartient`
--

DROP TABLE IF EXISTS `appartient`;
CREATE TABLE IF NOT EXISTS `appartient` (
  `CODEFORM` char(32) NOT NULL,
  `CODESPEC` char(32) NOT NULL,
  PRIMARY KEY (`CODEFORM`,`CODESPEC`),
  KEY `I_FK_APPARTIENT_FORMATION` (`CODEFORM`),
  KEY `I_FK_APPARTIENT_SPECIALITE` (`CODESPEC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `est_inscrit`
--

DROP TABLE IF EXISTS `est_inscrit`;
CREATE TABLE IF NOT EXISTS `est_inscrit` (
  `NUMCINETU` char(32) NOT NULL,
  `CODESESS` char(32) NOT NULL,
  `TYPECOURS` char(32) NOT NULL,
  PRIMARY KEY (`NUMCINETU`,`CODESESS`),
  KEY `I_FK_EST_INSCRIT_ETUDIANT` (`NUMCINETU`),
  KEY `I_FK_EST_INSCRIT_SESSION` (`CODESESS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `NUMCINETU` char(32) NOT NULL,
  `NOMETU` char(32) NOT NULL,
  `PRENOMETU` char(32) NOT NULL,
  `DATENAISSANCE` date NOT NULL,
  `ADRESSEETU` char(32) NOT NULL,
  `VILLEETU` char(32) NOT NULL,
  `NIVEAUETU` char(32) NOT NULL,
  PRIMARY KEY (`NUMCINETU`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `CODEFORM` char(32) NOT NULL,
  `TITREFORM` char(32) NOT NULL,
  `DUREEFORM` char(32) NOT NULL,
  `PRIXFORM` char(32) NOT NULL,
  PRIMARY KEY (`CODEFORM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `CODESESS` char(32) NOT NULL,
  `CODEFORM` char(32) NOT NULL,
  `NOMSESS` char(32) NOT NULL,
  `DATEDEBUT` date NOT NULL,
  `DATEFIIN` date NOT NULL,
  PRIMARY KEY (`CODESESS`),
  KEY `I_FK_SESSION_FORMATION` (`CODEFORM`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `CODESPEC` char(32) NOT NULL,
  `NOMSPEC` char(32) NOT NULL,
  `DESCSPEC` char(32) NOT NULL,
  `Active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`CODESPEC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
