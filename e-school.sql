-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Sam 28 Mars 2020 à 12:51
-- Version du serveur :  10.1.44-MariaDB-0+deb9u1
-- Version de PHP :  7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `e-school`
--

-- --------------------------------------------------------

--
-- Structure de la table `AnneeAcademique`
--

CREATE TABLE `AnneeAcademique` (
  `annee_id` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Autorisation`
--

CREATE TABLE `Autorisation` (
  `autorisation_id` int(11) NOT NULL,
  `nom_autorisation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Autorisation_Type_User`
--

CREATE TABLE `Autorisation_Type_User` (
  `id` int(11) NOT NULL,
  `autorisation_id` int(11) NOT NULL,
  `type_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Classe`
--

CREATE TABLE `Classe` (
  `classe_id` int(11) NOT NULL,
  `nom_classe` varchar(20) NOT NULL,
  `serie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Coefficient`
--

CREATE TABLE `Coefficient` (
  `id` int(11) NOT NULL,
  `serie_id` int(11) NOT NULL,
  `matiere_id` int(11) NOT NULL,
  `coefficient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Cours`
--

CREATE TABLE `Cours` (
  `cours_id` int(11) NOT NULL,
  `chemin` varchar(100) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text,
  `professeur_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Cours_Classe`
--

CREATE TABLE `Cours_Classe` (
  `id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `annee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Eleve`
--

CREATE TABLE `Eleve` (
  `eleve_id` int(11) NOT NULL,
  `redoublant` tinyint(4) DEFAULT '0',
  `matricule_eleve` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Eleve_Classe_Annee`
--

CREATE TABLE `Eleve_Classe_Annee` (
  `id` int(11) NOT NULL,
  `eleve_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `annee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Matiere`
--

CREATE TABLE `Matiere` (
  `matiere_id` int(11) NOT NULL,
  `nom_matiere` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Matiere_Classe`
--

CREATE TABLE `Matiere_Classe` (
  `matiere_classe_id` int(11) NOT NULL,
  `matiere_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `valeur` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Note`
--

CREATE TABLE `Note` (
  `note_id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL,
  `eleve_id` int(11) NOT NULL,
  `trimestre_id` int(11) NOT NULL,
  `coefficient` int(11) NOT NULL,
  `valeur` int(11) NOT NULL,
  `chemin` varchar(100) DEFAULT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Parent`
--

CREATE TABLE `Parent` (
  `parent_id` int(11) NOT NULL,
  `adresse_parent` varchar(200) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Professeur`
--

CREATE TABLE `Professeur` (
  `professeur_id` int(11) NOT NULL,
  `date_enregistrement` date DEFAULT NULL,
  `date_retrait` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `matricule` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Professeur_Classe_Annee_Matiere`
--

CREATE TABLE `Professeur_Classe_Annee_Matiere` (
  `id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `annee_id` int(11) NOT NULL,
  `matiere_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Professeur_Eleve`
--

CREATE TABLE `Professeur_Eleve` (
  `id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL,
  `eleve_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Professeur_Matiere`
--

CREATE TABLE `Professeur_Matiere` (
  `professeur_matiere_id` int(11) NOT NULL,
  `matiere_id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Serie`
--

CREATE TABLE `Serie` (
  `serie_id` int(11) NOT NULL,
  `nom_serie` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Serie_Classe`
--

CREATE TABLE `Serie_Classe` (
  `serie_classe_id` int(11) NOT NULL,
  `serie_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Trimestre`
--

CREATE TABLE `Trimestre` (
  `trimestre_id` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `annee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Type_User`
--

CREATE TABLE `Type_User` (
  `type_user_id` int(11) NOT NULL,
  `nom_type_user` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE `User` (
  `user_id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenoms` varchar(40) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(50) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  `type_user_id` int(11) NOT NULL,
  `nationalite` varchar(30) DEFAULT NULL,
  `sexe` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `AnneeAcademique`
--
ALTER TABLE `AnneeAcademique`
  ADD PRIMARY KEY (`annee_id`);

--
-- Index pour la table `Autorisation`
--
ALTER TABLE `Autorisation`
  ADD PRIMARY KEY (`autorisation_id`);

--
-- Index pour la table `Autorisation_Type_User`
--
ALTER TABLE `Autorisation_Type_User`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autorisation_id` (`autorisation_id`),
  ADD KEY `type_user_id` (`type_user_id`);

--
-- Index pour la table `Classe`
--
ALTER TABLE `Classe`
  ADD PRIMARY KEY (`classe_id`),
  ADD KEY `serie_id` (`serie_id`);

--
-- Index pour la table `Coefficient`
--
ALTER TABLE `Coefficient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serie_id` (`serie_id`),
  ADD KEY `matiere_id` (`matiere_id`);

--
-- Index pour la table `Cours`
--
ALTER TABLE `Cours`
  ADD PRIMARY KEY (`cours_id`),
  ADD KEY `professeur_id` (`professeur_id`);

--
-- Index pour la table `Cours_Classe`
--
ALTER TABLE `Cours_Classe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classe_id` (`classe_id`),
  ADD KEY `cours_id` (`cours_id`),
  ADD KEY `annee_id` (`annee_id`);

--
-- Index pour la table `Eleve`
--
ALTER TABLE `Eleve`
  ADD PRIMARY KEY (`eleve_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Index pour la table `Eleve_Classe_Annee`
--
ALTER TABLE `Eleve_Classe_Annee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `annee_id` (`annee_id`),
  ADD KEY `eleve_id` (`eleve_id`),
  ADD KEY `classe_id` (`classe_id`);

--
-- Index pour la table `Matiere`
--
ALTER TABLE `Matiere`
  ADD PRIMARY KEY (`matiere_id`);

--
-- Index pour la table `Matiere_Classe`
--
ALTER TABLE `Matiere_Classe`
  ADD PRIMARY KEY (`matiere_classe_id`),
  ADD KEY `matiere_id` (`matiere_id`),
  ADD KEY `classe_id` (`classe_id`);

--
-- Index pour la table `Note`
--
ALTER TABLE `Note`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `professeur_id` (`professeur_id`),
  ADD KEY `eleve_id` (`eleve_id`),
  ADD KEY `trimestre_id` (`trimestre_id`);

--
-- Index pour la table `Parent`
--
ALTER TABLE `Parent`
  ADD PRIMARY KEY (`parent_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `Professeur`
--
ALTER TABLE `Professeur`
  ADD PRIMARY KEY (`professeur_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `Professeur_Classe_Annee_Matiere`
--
ALTER TABLE `Professeur_Classe_Annee_Matiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `annee_id` (`annee_id`),
  ADD KEY `professeur_id` (`professeur_id`),
  ADD KEY `matiere_id` (`matiere_id`),
  ADD KEY `classe_id` (`classe_id`);

--
-- Index pour la table `Professeur_Eleve`
--
ALTER TABLE `Professeur_Eleve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `professeur_id` (`professeur_id`),
  ADD KEY `eleve_id` (`eleve_id`);

--
-- Index pour la table `Professeur_Matiere`
--
ALTER TABLE `Professeur_Matiere`
  ADD PRIMARY KEY (`professeur_matiere_id`),
  ADD KEY `professeur_id` (`professeur_id`),
  ADD KEY `matiere_id` (`matiere_id`);

--
-- Index pour la table `Serie`
--
ALTER TABLE `Serie`
  ADD PRIMARY KEY (`serie_id`);

--
-- Index pour la table `Serie_Classe`
--
ALTER TABLE `Serie_Classe`
  ADD PRIMARY KEY (`serie_classe_id`),
  ADD KEY `serie_id` (`serie_id`),
  ADD KEY `classe_id` (`classe_id`);

--
-- Index pour la table `Trimestre`
--
ALTER TABLE `Trimestre`
  ADD PRIMARY KEY (`trimestre_id`),
  ADD KEY `annee_id` (`annee_id`);

--
-- Index pour la table `Type_User`
--
ALTER TABLE `Type_User`
  ADD PRIMARY KEY (`type_user_id`);

--
-- Index pour la table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `type_user_id` (`type_user_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `AnneeAcademique`
--
ALTER TABLE `AnneeAcademique`
  MODIFY `annee_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Autorisation`
--
ALTER TABLE `Autorisation`
  MODIFY `autorisation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Autorisation_Type_User`
--
ALTER TABLE `Autorisation_Type_User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Classe`
--
ALTER TABLE `Classe`
  MODIFY `classe_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Coefficient`
--
ALTER TABLE `Coefficient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Cours`
--
ALTER TABLE `Cours`
  MODIFY `cours_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Cours_Classe`
--
ALTER TABLE `Cours_Classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Eleve`
--
ALTER TABLE `Eleve`
  MODIFY `eleve_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Eleve_Classe_Annee`
--
ALTER TABLE `Eleve_Classe_Annee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Matiere`
--
ALTER TABLE `Matiere`
  MODIFY `matiere_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Matiere_Classe`
--
ALTER TABLE `Matiere_Classe`
  MODIFY `matiere_classe_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Note`
--
ALTER TABLE `Note`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Parent`
--
ALTER TABLE `Parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Professeur`
--
ALTER TABLE `Professeur`
  MODIFY `professeur_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Professeur_Classe_Annee_Matiere`
--
ALTER TABLE `Professeur_Classe_Annee_Matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Professeur_Eleve`
--
ALTER TABLE `Professeur_Eleve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Professeur_Matiere`
--
ALTER TABLE `Professeur_Matiere`
  MODIFY `professeur_matiere_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Serie`
--
ALTER TABLE `Serie`
  MODIFY `serie_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Serie_Classe`
--
ALTER TABLE `Serie_Classe`
  MODIFY `serie_classe_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Trimestre`
--
ALTER TABLE `Trimestre`
  MODIFY `trimestre_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Type_User`
--
ALTER TABLE `Type_User`
  MODIFY `type_user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `User`
--
ALTER TABLE `User`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Autorisation_Type_User`
--
ALTER TABLE `Autorisation_Type_User`
  ADD CONSTRAINT `Autorisation_Type_User_ibfk_1` FOREIGN KEY (`autorisation_id`) REFERENCES `Autorisation` (`autorisation_id`),
  ADD CONSTRAINT `Autorisation_Type_User_ibfk_2` FOREIGN KEY (`type_user_id`) REFERENCES `Type_User` (`type_user_id`);

--
-- Contraintes pour la table `Classe`
--
ALTER TABLE `Classe`
  ADD CONSTRAINT `Classe_ibfk_1` FOREIGN KEY (`serie_id`) REFERENCES `Serie` (`serie_id`);

--
-- Contraintes pour la table `Coefficient`
--
ALTER TABLE `Coefficient`
  ADD CONSTRAINT `Coefficient_ibfk_1` FOREIGN KEY (`serie_id`) REFERENCES `Serie` (`serie_id`),
  ADD CONSTRAINT `Coefficient_ibfk_2` FOREIGN KEY (`matiere_id`) REFERENCES `Matiere` (`matiere_id`);

--
-- Contraintes pour la table `Cours`
--
ALTER TABLE `Cours`
  ADD CONSTRAINT `Cours_ibfk_1` FOREIGN KEY (`professeur_id`) REFERENCES `Professeur` (`professeur_id`);

--
-- Contraintes pour la table `Cours_Classe`
--
ALTER TABLE `Cours_Classe`
  ADD CONSTRAINT `Cours_Classe_ibfk_1` FOREIGN KEY (`classe_id`) REFERENCES `Classe` (`classe_id`),
  ADD CONSTRAINT `Cours_Classe_ibfk_2` FOREIGN KEY (`cours_id`) REFERENCES `Cours` (`cours_id`),
  ADD CONSTRAINT `Cours_Classe_ibfk_3` FOREIGN KEY (`annee_id`) REFERENCES `AnneeAcademique` (`annee_id`);

--
-- Contraintes pour la table `Eleve`
--
ALTER TABLE `Eleve`
  ADD CONSTRAINT `Eleve_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  ADD CONSTRAINT `Eleve_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `Parent` (`parent_id`);

--
-- Contraintes pour la table `Eleve_Classe_Annee`
--
ALTER TABLE `Eleve_Classe_Annee`
  ADD CONSTRAINT `Eleve_Classe_Annee_ibfk_1` FOREIGN KEY (`annee_id`) REFERENCES `AnneeAcademique` (`annee_id`),
  ADD CONSTRAINT `Eleve_Classe_Annee_ibfk_2` FOREIGN KEY (`eleve_id`) REFERENCES `Eleve` (`eleve_id`),
  ADD CONSTRAINT `Eleve_Classe_Annee_ibfk_3` FOREIGN KEY (`classe_id`) REFERENCES `Classe` (`classe_id`);

--
-- Contraintes pour la table `Matiere_Classe`
--
ALTER TABLE `Matiere_Classe`
  ADD CONSTRAINT `Matiere_Classe_ibfk_1` FOREIGN KEY (`matiere_id`) REFERENCES `Matiere` (`matiere_id`),
  ADD CONSTRAINT `Matiere_Classe_ibfk_2` FOREIGN KEY (`classe_id`) REFERENCES `Classe` (`classe_id`);

--
-- Contraintes pour la table `Note`
--
ALTER TABLE `Note`
  ADD CONSTRAINT `Note_ibfk_1` FOREIGN KEY (`professeur_id`) REFERENCES `Professeur_Classe_Annee_Matiere` (`id`),
  ADD CONSTRAINT `Note_ibfk_2` FOREIGN KEY (`eleve_id`) REFERENCES `Eleve_Classe_Annee` (`id`),
  ADD CONSTRAINT `Note_ibfk_3` FOREIGN KEY (`trimestre_id`) REFERENCES `Trimestre` (`trimestre_id`);

--
-- Contraintes pour la table `Parent`
--
ALTER TABLE `Parent`
  ADD CONSTRAINT `Parent_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

--
-- Contraintes pour la table `Professeur`
--
ALTER TABLE `Professeur`
  ADD CONSTRAINT `Professeur_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

--
-- Contraintes pour la table `Professeur_Classe_Annee_Matiere`
--
ALTER TABLE `Professeur_Classe_Annee_Matiere`
  ADD CONSTRAINT `Professeur_Classe_Annee_Matiere_ibfk_1` FOREIGN KEY (`annee_id`) REFERENCES `AnneeAcademique` (`annee_id`),
  ADD CONSTRAINT `Professeur_Classe_Annee_Matiere_ibfk_2` FOREIGN KEY (`professeur_id`) REFERENCES `Professeur` (`professeur_id`),
  ADD CONSTRAINT `Professeur_Classe_Annee_Matiere_ibfk_3` FOREIGN KEY (`matiere_id`) REFERENCES `Matiere` (`matiere_id`),
  ADD CONSTRAINT `Professeur_Classe_Annee_Matiere_ibfk_4` FOREIGN KEY (`classe_id`) REFERENCES `Classe` (`classe_id`);

--
-- Contraintes pour la table `Professeur_Eleve`
--
ALTER TABLE `Professeur_Eleve`
  ADD CONSTRAINT `Professeur_Eleve_ibfk_1` FOREIGN KEY (`professeur_id`) REFERENCES `Professeur_Classe_Annee_Matiere` (`id`),
  ADD CONSTRAINT `Professeur_Eleve_ibfk_2` FOREIGN KEY (`eleve_id`) REFERENCES `Eleve_Classe_Annee` (`id`);

--
-- Contraintes pour la table `Professeur_Matiere`
--
ALTER TABLE `Professeur_Matiere`
  ADD CONSTRAINT `Professeur_Matiere_ibfk_1` FOREIGN KEY (`professeur_id`) REFERENCES `Professeur` (`professeur_id`),
  ADD CONSTRAINT `Professeur_Matiere_ibfk_2` FOREIGN KEY (`matiere_id`) REFERENCES `Matiere` (`matiere_id`);

--
-- Contraintes pour la table `Serie_Classe`
--
ALTER TABLE `Serie_Classe`
  ADD CONSTRAINT `Serie_Classe_ibfk_1` FOREIGN KEY (`serie_id`) REFERENCES `Serie` (`serie_id`),
  ADD CONSTRAINT `Serie_Classe_ibfk_2` FOREIGN KEY (`classe_id`) REFERENCES `Classe` (`classe_id`);

--
-- Contraintes pour la table `Trimestre`
--
ALTER TABLE `Trimestre`
  ADD CONSTRAINT `Trimestre_ibfk_1` FOREIGN KEY (`annee_id`) REFERENCES `AnneeAcademique` (`annee_id`);

--
-- Contraintes pour la table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `User_ibfk_1` FOREIGN KEY (`type_user_id`) REFERENCES `Type_User` (`type_user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
