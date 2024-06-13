-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 13 juin 2024 à 22:34
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gesadmin_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `date_naissance`
--

CREATE TABLE `date_naissance` (
  `mat_e` varchar(50) NOT NULL,
  `nom_e` varchar(50) NOT NULL,
  `prenom_e` varchar(50) NOT NULL,
  `tel_e` int(11) NOT NULL,
  `sexe_e` enum('M','F','m','f') NOT NULL,
  `date_naiss` date NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `module_e` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `idf` int(11) NOT NULL,
  `nomf` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`idf`, `nomf`) VALUES
(1, 'Developpement'),
(2, 'Reseaux'),
(3, 'Informatique de gestion'),
(4, 'Intelligence artifielle');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id_m` int(11) NOT NULL,
  `nom_m` varchar(50) NOT NULL,
  `filiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

CREATE TABLE `prof` (
  `mat_p` varchar(50) NOT NULL,
  `nom_p` varchar(50) NOT NULL,
  `prenom_p` varchar(50) NOT NULL,
  `tel_p` int(11) NOT NULL,
  `sexe_p` enum('M','F','m','f') NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `module_p` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `date_naissance`
--
ALTER TABLE `date_naissance`
  ADD KEY `module_e` (`module_e`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`idf`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id_m`),
  ADD KEY `filiere` (`filiere`),
  ADD KEY `filiere_2` (`filiere`);

--
-- Index pour la table `prof`
--
ALTER TABLE `prof`
  ADD KEY `module_p` (`module_p`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `idf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `id_m` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `date_naissance`
--
ALTER TABLE `date_naissance`
  ADD CONSTRAINT `date_naissance_ibfk_1` FOREIGN KEY (`module_e`) REFERENCES `module` (`id_m`);

--
-- Contraintes pour la table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`filiere`) REFERENCES `filiere` (`idf`);

--
-- Contraintes pour la table `prof`
--
ALTER TABLE `prof`
  ADD CONSTRAINT `prof_ibfk_1` FOREIGN KEY (`module_p`) REFERENCES `module` (`id_m`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
