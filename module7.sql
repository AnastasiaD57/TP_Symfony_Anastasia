-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 19 fév. 2024 à 16:57
-- Version du serveur :  8.0.36-0ubuntu0.20.04.1
-- Version de PHP : 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `module7`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240218102314', '2024-02-18 10:23:27', 42),
('DoctrineMigrations\\Version20240218103841', '2024-02-18 10:38:46', 49),
('DoctrineMigrations\\Version20240219093941', '2024-02-19 09:39:50', 21),
('DoctrineMigrations\\Version20240219142725', '2024-02-19 14:27:32', 57);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_creation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `pseudo`, `date_creation`) VALUES
(1, 'Ana@greta.com', '[]', '$2y$13$I/sbJPbd6GXntgZo.e7L/O3SgcJyh7J4Qk9QcXLaJvXC90JL3EPAa', 'Ana', '2024-02-18'),
(2, 'Malik@greta.com', '[]', '$2y$13$Lp9GMsoiBuecaK6fPwM2LOFiZXDO.X6rZIFh/I7Q2EjX1YrWQLSNC', 'Malik', '2024-02-18');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `id` int NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modele` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_creation` date NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `en_vente` tinyint(1) NOT NULL,
  `prix` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lien_redirection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`id`, `nom`, `modele`, `description`, `date_creation`, `image`, `en_vente`, `prix`, `lien_redirection`) VALUES
(1, 'Mercedes', 'Berline EQE', 'Jusqu’à 621 / 688km\r\nd’autonomie électrique, 621 km d\'autonomie électrique en cycle combiné WLTP, 688 km d\'autonomie électrique en ville WLTP, Puissance: Jusqu\'à 215 kW (292 ch),\r\nChargement en 32 minutes, Chargé à 80 %', '2024-02-18', 'https://www.mercedes-benz.fr/content/france/fr/passengercars/models/saloon/eqe/overview/_jcr_content/root/responsivegrid/media_slider_copy/media_slider_item_1061245308/image.component.damq4.3360554408249.jpeg/Nouveau-EQE.jpeg', 1, '69 900 €', 'https://www.mercedes-benz.fr/passengercars/models/saloon/eqe/overview.html'),
(2, 'Mercedes', 'SUV EQA', 'Jusqu’à 560 / 724 km        \r\nd’autonomie électrique,\r\n560 km d\'autonomie électrique en cycle combiné WLTP,\r\n724 km d\'autonomie électrique en ville WLTP,\r\nChargement en\r\n32 min\r\nchargé à 80 %,\r\nPuissance: Jusqu’à 215kW (292 ch)', '2024-02-18', 'https://www.mercedes-benz.fr/content/france/fr/passengercars/models/suv/h243-fl-23-2/overview/_jcr_content/root/responsivegrid/media_slider/media_slider_item_1835067967/image.component.damq4.3394381488250.jpg/mercedes-benz-eqa-h243-highlights-exterior-330', 1, '46 950 €', 'https://www.mercedes-benz.fr/passengercars/models/suv/eqa/overview.html'),
(3, 'Mercedes', 'Break CLA Shooting Brake', 'À partir de 0,9 L/100km,\r\nConsommation (en cycle mixte WLTP), Volume: Jusqu\'à 1 370 L, Chargement: Disponible en motorisation, Hybride Rechargeable et\r\nThermique', '2024-02-18', 'https://www.mercedes-benz.fr/content/france/fr/passengercars/models/estate/x118-fl-23-1/overview/_jcr_content/root/responsivegrid/media_slider/media_slider_item_750691504/image.component.damq4.3365035097060.jpg/mercedes-benz-cla-shooting-brake-x118-highli', 1, '44 899,20 €', 'https://www.mercedes-benz.fr/passengercars/models/estate/cla-shooting-brake/overview.html'),
(4, 'Mercedes', 'Compacte Classe A', 'À partir de 20 g/km, \r\nÉmissions de CO2 en cycle mixte WLTP,\r\nDe\r\n\r\n230 à 320 Nm\r\nCouple maximal,\r\nDisponible en motorisation,\r\n\r\nHybride Rechargeable et\r\nThermique\r\nVolume de chargement: Jusqu’à 370 Litres', '2024-02-18', 'https://www.mercedes-benz.fr/content/france/fr/passengercars/models/hatchback/w177-fl/overview/_jcr_content/root/responsivegrid/media_slider_copy_co/media_slider_item_2079825647/image.component.damq4.3367118929450.jpg/mercedes-benz-a-class-w177-teaser-ext', 0, '39 149,19 €', 'https://www.mercedes-benz.fr/passengercars/models/hatchback/a-class/overview.html');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
