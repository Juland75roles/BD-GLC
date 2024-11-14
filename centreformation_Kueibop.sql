
    KUIEBOP PEHUIEBO DAROL VALDES


-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 nov. 2024 à 15:39
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `centreformation`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

DROP TABLE IF EXISTS `appartient`;
CREATE TABLE IF NOT EXISTS `appartient` (
  `CODEFORM` int NOT NULL,
  `CODESPEC` int NOT NULL,
  PRIMARY KEY (`CODEFORM`,`CODESPEC`),
  KEY `I_FK_APPARTIENT_FORMATION` (`CODEFORM`),
  KEY `I_FK_APPARTIENT_SPECIALITE` (`CODESPEC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `est_inscrit`
--

DROP TABLE IF EXISTS `est_inscrit`;
CREATE TABLE IF NOT EXISTS `est_inscrit` (
  `NUMCINETUDIANT` int NOT NULL,
  `CODESESS` int NOT NULL,
  PRIMARY KEY (`NUMCINETUDIANT`,`CODESESS`),
  KEY `I_FK_EST_INSCRIT_ETUDIANTS` (`NUMCINETUDIANT`),
  KEY `I_FK_EST_INSCRIT_SESSION` (`CODESESS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
CREATE TABLE IF NOT EXISTS `etudiants` (
  `NUMCINETUDIANT` int NOT NULL,
  `NOMETU` text NOT NULL,
  `PRENOMETU` text NOT NULL,
  `DATENAISSANCE` date NOT NULL,
  `ADRESSEETU` text NOT NULL,
  `VILLEETU` text NOT NULL,
  `NIVEAUETU` text NOT NULL,
  PRIMARY KEY (`NUMCINETUDIANT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `CODEFORM` int NOT NULL,
  `TITREFORM` text NOT NULL,
  `DUREEFORM` date NOT NULL,
  `PRIXFORM` int NOT NULL,
  PRIMARY KEY (`CODEFORM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `CODESESS` int NOT NULL,
  `CODEFORM` int NOT NULL,
  `NOMSESS` text NOT NULL,
  `DATEDEBUT` date NOT NULL,
  `DATEFIN` date NOT NULL,
  PRIMARY KEY (`CODESESS`),
  KEY `I_FK_SESSION_FORMATION` (`CODEFORM`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `CODESPEC` int NOT NULL,
  `NOMSPEC` text NOT NULL,
  `DESCSPEC` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CODESPEC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
