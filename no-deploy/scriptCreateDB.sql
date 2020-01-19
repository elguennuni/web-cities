
    -- SELECT Concat('ALTER TABLE `', TABLE_NAME, '` RENAME TO `casablanca_', TABLE_NAME, '`;') FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'citiesvivbroot';
    
-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Hôte : citiesvivbroot.mysql.db
-- Généré le :  ven. 17 jan. 2020 à 10:33
-- Version du serveur :  5.6.46-log
-- Version de PHP :  7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `citiesvivbroot`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`cat_id`, `name`) VALUES
(1, 'Tourist Destination'),
(2, 'Food & Drink'),
(3, 'Hotels'),
(4, 'Entertainment'),
(5, 'Shopping'),
(6, 'Transportation');

-- --------------------------------------------------------

--
-- Structure de la table `gcm`
--

CREATE TABLE `gcm` (
  `id` int(11) NOT NULL,
  `device` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `version` varchar(100) NOT NULL,
  `regid` text NOT NULL,
  `date_create` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `place_id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Structure de la table `news_info`
--

CREATE TABLE `news_info` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `brief_content` varchar(200) NOT NULL,
  `full_content` text NOT NULL,
  `image` varchar(110) NOT NULL,
  `last_update` bigint(20) NOT NULL,
  `title_fr` varchar(100) NOT NULL,
  `brief_content_fr` varchar(200) NOT NULL,
  `full_content_fr` text NOT NULL,
  `title_ar` varchar(100) NOT NULL,
  `brief_content_ar` varchar(200) NOT NULL,
  `full_content_ar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `place`
--

CREATE TABLE `place` (
  `place_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(25) NOT NULL DEFAULT '-',
  `website` varchar(100) NOT NULL DEFAULT '-',
  `description` text NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `last_update` bigint(20) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `address_ar` varchar(100) NOT NULL,
  `description_ar` text NOT NULL,
  `name_fr` varchar(50) NOT NULL,
  `address_fr` varchar(100) NOT NULL,
  `description_fr` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Structure de la table `place_category`
--

CREATE TABLE `place_category` (
  `place_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Index pour les tables déchargées
--
INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`) VALUES
(1, 'Sohaib EL GUENNUNI', 'sohaib', 's.elguennuni@gmail.com', 'd35dcb0e31ece9a5a2aa24402b511968');
--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Index pour la table `gcm`
--
ALTER TABLE `gcm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_device` (`device`,`email`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD KEY `fk_table_images` (`place_id`);

--
-- Index pour la table `news_info`
--
ALTER TABLE `news_info`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`place_id`),
  ADD UNIQUE KEY `unique_name` (`name`);

--
-- Index pour la table `place_category`
--
ALTER TABLE `place_category`
  ADD KEY `fk_place_category1` (`place_id`),
  ADD KEY `fk_place_category2` (`cat_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `gcm`
--
ALTER TABLE `gcm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `news_info`
--
ALTER TABLE `news_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `place`
--
ALTER TABLE `place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
