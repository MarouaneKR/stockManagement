-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Mer 27 Juin 2018 à 18:09
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `g_stock`
--

-- --------------------------------------------------------

--
-- Structure de la table `achats`
--

CREATE TABLE IF NOT EXISTS `achats` (
  `codeAchat` int(11) NOT NULL AUTO_INCREMENT,
  `codeArt` int(11) NOT NULL,
  `qteAchete` int(11) NOT NULL,
  `dateReception` date NOT NULL,
  PRIMARY KEY (`codeAchat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Contenu de la table `achats`
--

INSERT INTO `achats` (`codeAchat`, `codeArt`, `qteAchete`, `dateReception`) VALUES
(10, 7, 69, '2018-06-27'),
(11, 10, 80, '2018-06-12'),
(13, 7, 30, '2018-06-30'),
(14, 5, 200, '2018-06-07'),
(15, 6, 45, '2018-06-08'),
(16, 4, 45, '2018-06-22'),
(17, 10, 120, '2018-06-08'),
(18, 6, 150, '2018-06-24'),
(19, 4, 90, '2018-06-29'),
(20, 9, 305, '2018-06-24'),
(21, 6, 10, '2018-06-01'),
(22, 8, 150, '2018-06-28'),
(23, 4, 1500, '2018-06-13'),
(24, 1, 150, '2018-06-24');

-- --------------------------------------------------------

--
-- Structure de la table `inventaire`
--

CREATE TABLE IF NOT EXISTS `inventaire` (
  `codeInv` int(11) NOT NULL AUTO_INCREMENT,
  `codeArt` int(11) NOT NULL,
  `qteArt` int(11) NOT NULL,
  `descInv` varchar(200) NOT NULL,
  `dateInv` date NOT NULL,
  PRIMARY KEY (`codeInv`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Contenu de la table `inventaire`
--

INSERT INTO `inventaire` (`codeInv`, `codeArt`, `qteArt`, `descInv`, `dateInv`) VALUES
(31, 2, 54, 'DESCRETION_DEMO', '2018-06-29'),
(32, 2, 75, 'DESCRIPTION_3', '2018-05-07'),
(33, 4, 30, 'DESCRIPTION_4', '2018-06-18'),
(34, 6, 45, 'DESCRIPTION_6', '2018-06-21'),
(35, 6, 45, 'DESCRIPTION_6', '2018-06-17'),
(36, 6, 45, 'DESCRIPTION_6', '2018-06-22'),
(37, 6, 45, 'DESCRIPTION_6', '2018-06-26'),
(38, 6, 45, 'DESCRIPTION_6', '2018-06-21'),
(39, 10, 80, 'DESCRIPTION_10', '2018-06-11'),
(40, 9, 300, 'DESCRIPTION_9', '2018-06-23'),
(41, 11, 150, 'DESCRIPTION_11', '2018-06-24'),
(42, 9, 40, '', '2018-06-24'),
(43, 9, 45, 'DESCRIPTION_9', '2018-06-28'),
(44, 7, 300, 'DEscr', '2018-06-29'),
(45, 11, 200, '', '2018-06-30'),
(46, 9, 1500, 'Desc', '2018-06-12'),
(47, 4, 1550, 'DESCRIPTION_4', '2018-06-14'),
(48, 4, 50, 'DESCRIPTION_4', '2018-06-25'),
(49, 1, 1, '', '2018-06-14'),
(50, 8, 54, '', '2018-06-25'),
(51, 8, 54, '', '2018-06-25');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
