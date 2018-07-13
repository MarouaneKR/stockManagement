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
-- Base de données: `g_vente`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `codeArt` int(11) NOT NULL,
  `nomArt` varchar(20) NOT NULL,
  `descArt` varchar(200) NOT NULL,
  `prixArt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `articles`
--

INSERT INTO `articles` (`codeArt`, `nomArt`, `descArt`, `prixArt`) VALUES
(3, 'NOM_ART_3', 'DESCRIPTION_3', 1000),
(1, 'NOM_ART_1', 'DESCRIPTION_1', 2000),
(2, 'NOM_ART_2', 'DESCRIPTION_2', 2587),
(4, 'NOM_ART_4', 'DESCRIPTION_4', 2540),
(5, 'NOM_ART_5', 'DESCRIPTION_5', 1050),
(6, 'NOM_ART_6', 'DESCRIPTION_6', 3000),
(7, 'NOM_ART_7', 'DESCRIPTION_7', 1280),
(8, 'NOM_ART_8', 'DESCRIPTION_8', 500),
(9, 'NOM_ART_9', 'DESCRIPTION_9', 3250),
(10, 'NOM_ART_10', 'DESCRIPTION_10', 4500),
(11, 'NOM_ART_11', 'DESCRIPTION_11', 7500),
(0, 'NOM_ART_0', 'DESCRIPTION_0', 1500);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `codeCmd` int(11) NOT NULL,
  `client` varchar(20) NOT NULL,
  `codeArt` int(200) NOT NULL,
  `qteCmd` int(11) NOT NULL,
  `dateCmd` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`codeCmd`, `client`, `codeArt`, `qteCmd`, `dateCmd`) VALUES
(0, 'Marouane', 0, 50, '2018-06-13'),
(1, 'Ahmed', 2, 120, '2018-06-20'),
(2, 'Marouane', 5, 150, '2018-06-01'),
(3, 'Hicham', 6, 45, '2018-06-26');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `codeUser` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  PRIMARY KEY (`codeUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`codeUser`, `login`, `pass`) VALUES
(1, 'MarouaneKR', '123456');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
