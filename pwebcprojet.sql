-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 15 Mars 2018 à 08:20
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `pweb17_leguern`
--

-- --------------------------------------------------------

--
-- Structure de la table `indicecreateur`
--

CREATE TABLE IF NOT EXISTS `indicecreateur` (
  `IdIndice` int(11) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `IdTresor` int(11) NOT NULL,
  PRIMARY KEY (`IdIndice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `indicecreateur`
--

INSERT INTO `indicecreateur` (`IdIndice`, `Description`, `IdTresor`) VALUES
(0, 'Je sais pas', 0),
(1, 'Je sais pas', 0),
(2, 'Test indice', 0),
(3, '', 0),
(4, '', 0),
(5, 'Test indice 2', 0),
(6, 'ee', 0),
(7, 'testing', 2),
(8, 'testIndice3', 2),
(9, 'tee', 2),
(10, 'rerer', 2),
(11, 'teeeeeest', 2),
(12, 'ReTest', 2),
(13, 'te', 2),
(14, 'testingshit', 2),
(15, 'testingshit2', 2),
(16, 'testingagain', 2),
(17, 'tamÃ¨re', 2),
(18, 'rerere', 2),
(19, 'rerere', 2),
(20, 'rerere', 2),
(21, 'testtettete', 2),
(22, 'tetetetet', 8),
(23, 'Test', 1),
(24, 'AmÃ©rique du Sud', 14),
(25, 'TestingAgain', 9),
(26, 'TestingAgain', 9),
(27, 'TestingAgain', 9);

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE IF NOT EXISTS `joueur` (
  `IdJoueur` int(11) NOT NULL,
  `NomJoueur` varchar(35) NOT NULL,
  `MotDePasse` varchar(100) NOT NULL,
  PRIMARY KEY (`IdJoueur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `joueur`
--

INSERT INTO `joueur` (`IdJoueur`, `NomJoueur`, `MotDePasse`) VALUES
(0, 'Solok', 'motdepasse'),
(1, 'Solok2', 'motdepasse2'),
(2, 'Jean', 'jean'),
(3, 'Pedro', 'pedro'),
(4, 'Carlo', 'carlo');

-- --------------------------------------------------------

--
-- Structure de la table `joueurtresor`
--

CREATE TABLE IF NOT EXISTS `joueurtresor` (
  `#IdJoueur` int(11) NOT NULL,
  `#IdTresor` int(11) NOT NULL,
  PRIMARY KEY (`#IdJoueur`,`#IdTresor`),
  KEY `FK_IdTresor_Assoc` (`#IdTresor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tresor`
--

CREATE TABLE IF NOT EXISTS `tresor` (
  `IdTresor` int(11) NOT NULL,
  `CoordonneeX` double NOT NULL,
  `CoordonneeY` double NOT NULL,
  `IdJoueurAuteur` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `BTrouve` int(11) NOT NULL,
  PRIMARY KEY (`IdTresor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tresor`
--

INSERT INTO `tresor` (`IdTresor`, `CoordonneeX`, `CoordonneeY`, `IdJoueurAuteur`, `Nom`, `BTrouve`) VALUES
(0, 0, 0, 1, 'Gants', 1),
(1, 1, 1, 1, 'Ceinture', 1),
(2, 1, 1, 0, ' test ', 1),
(3, 12, 11, 0, ' Michou ', 0),
(4, 20, 34, 0, ' Machine Ã  cafÃ© ', 0),
(5, 20, 34, 0, ' Machine Ã  cafÃ© ', 0),
(6, 20, 34, 0, ' Machine Ã  cafÃ© ', 0),
(7, 103, 1357, 0, ' Pikachu ', 0),
(8, 3, 8768, 0, ' I found a city called Kano lel ', 0),
(9, 12, 42, 0, ' testListe ', 0),
(10, 12, 42, 0, ' testListe ', 0),
(11, 9790, 98698, 0, ' TestIndice ', 0),
(12, 2, 2, 0, ' test ', 0),
(13, 10.919, -31.166, 1, ' Sardine ', 0),
(14, -6.4, -35.56, 1, ' Or ', 0),
(15, 3, 2, 0, ' 1 ', 0),
(16, 3, 2, 0, ' 1 ', 0);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `joueurtresor`
--
ALTER TABLE `joueurtresor`
  ADD CONSTRAINT `FK_IdJoueur_Assoc` FOREIGN KEY (`#IdJoueur`) REFERENCES `joueur` (`IdJoueur`),
  ADD CONSTRAINT `FK_IdTresor_Assoc` FOREIGN KEY (`#IdTresor`) REFERENCES `tresor` (`IdTresor`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
