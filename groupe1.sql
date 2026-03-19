-- phpMyAdmin SQL Dump
-- version 5.2.1deb1+deb12u1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 19 mars 2026 à 13:35
-- Version du serveur : 10.11.14-MariaDB-0+deb12u2
-- Version de PHP : 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `groupe1`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

CREATE TABLE `adresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `rue` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `code_postal` varchar(255) NOT NULL,
  `pays` varchar(255) NOT NULL DEFAULT 'France',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`id`, `user_id`, `nom`, `rue`, `ville`, `code_postal`, `pays`, `created_at`, `updated_at`, `numero`) VALUES
(11, 1, '20', 'chemin des gens', 'chambon feugerolles', '42500', 'France', '2025-10-14 11:21:16', '2025-10-14 11:46:31', NULL),
(12, 2, 'nom de', 'la rue', 'ville', '42500', 'France', '2025-10-16 07:50:48', '2025-10-16 07:50:48', NULL),
(13, 4, '20', 'Jean moulin', 'firminy', '25600', 'France', '2025-10-16 10:16:57', '2025-10-16 10:16:57', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `puzzle_id` bigint(20) UNSIGNED NOT NULL,
  `panier_id` bigint(20) UNSIGNED NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `appartient`
--

INSERT INTO `appartient` (`puzzle_id`, `panier_id`, `quantite`) VALUES
(2, 2, 3),
(3, 1, 4),
(3, 2, 6),
(3, 3, 1),
(3, 5, 1),
(3, 8, 1),
(4, 1, 2),
(4, 2, 3),
(4, 4, 6),
(4, 6, 1),
(4, 9, 2),
(8, 4, 5),
(8, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`, `created_at`, `updated_at`, `description`, `image`) VALUES
(1, 'Puzzle logique', '2025-10-02 10:43:51', '2025-10-02 10:43:51', NULL, NULL),
(2, 'Puzzle 3D Avancé', '2025-10-02 10:43:50', '2025-10-02 10:43:52', NULL, NULL),
(3, 'Casse-tête en bois', '2025-10-02 10:43:53', '2025-10-02 10:43:52', NULL, NULL),
(4, 'Puzzle enfant Facile', '2025-10-02 10:43:53', '2025-10-02 10:43:54', NULL, NULL),
(5, 'Puzzle artistique', '2025-10-02 10:43:55', '2025-10-02 10:43:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `paniers`
--

CREATE TABLE `paniers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `statut` varchar(255) NOT NULL DEFAULT 'en cours',
  `total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `mode_paiement` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paniers`
--

INSERT INTO `paniers` (`id`, `statut`, `total`, `mode_paiement`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'en cours', 81.98, NULL, 1, '2025-10-02 10:48:09', '2025-10-16 07:07:45'),
(2, 'en cours', 212.94, 'cheque', 2, '2025-10-09 07:38:39', '2025-10-16 09:45:59'),
(3, 'en cours', 15.50, NULL, 3, '2025-10-09 07:43:14', '2025-10-09 07:43:14'),
(4, 'preparation', 159.89, 'cheque', 4, '2025-10-16 09:49:14', '2025-10-16 10:26:19'),
(5, 'preparation', 15.50, 'paypal', 4, '2025-10-16 10:27:32', '2025-10-16 10:29:27'),
(6, 'preparation', 9.99, 'cheque', 4, '2025-10-16 10:29:49', '2025-10-16 10:29:52'),
(7, 'preparation', 19.99, 'cheque', 4, '2025-10-16 10:37:22', '2025-10-16 10:38:55'),
(8, 'preparation', 15.50, 'cheque', 4, '2025-10-16 10:53:20', '2025-10-16 10:53:23'),
(9, 'preparation', 19.98, 'paypal', 4, '2025-10-16 10:53:57', '2025-10-16 10:54:09');

-- --------------------------------------------------------

--
-- Structure de la table `puzzles`
--

CREATE TABLE `puzzles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `categorie_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `prix` double(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `puzzles`
--

INSERT INTO `puzzles` (`id`, `nom`, `categorie_id`, `description`, `image`, `prix`, `stock`, `created_at`, `updated_at`) VALUES
(2, 'Puzzle 3D Avancé', 2, 'Puzzle en 3D complexe.', 'image2.jpg', 30.00, 8, '2025-10-02 10:44:03', '2026-03-19 11:21:44'),
(3, 'Casse-tête en bois', 3, 'Un casse-tête classique en bois.', 'image3.jpg', 15.50, 9, '2025-10-02 10:44:00', '2026-03-17 15:53:35'),
(4, 'Puzzle enfant Facile', 4, 'Puzzle pour les enfants.', 'image4.jpg', 9.99, 10, '2025-10-02 10:43:58', '2025-10-02 10:43:59'),
(8, 'Puzzle', 3, 'un petit puzzle simple', 'puzzle.jpg', 19.99, 5, '2025-10-16 09:48:51', '2025-10-16 09:48:51');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `prenom`, `role`, `telephone`) VALUES
(1, 'moi', 'moi@moi', NULL, '$2y$12$v0G.zk22VgC1jVE03bnBYeecElv99/pj02cbGbqcar.MCfGjaDZdW', NULL, '2025-10-02 08:47:34', '2025-10-02 08:47:34', NULL, NULL, NULL),
(2, 'machin', 'm@m', NULL, '$2y$12$/K/1C3k9mUMunafS6aeSQ.vGv0VtGXwETCn6RNpizYgHA15ldm2eu', NULL, '2025-10-09 07:38:36', '2025-10-09 07:38:36', NULL, NULL, NULL),
(3, 'totim', 'totim@p', NULL, '$2y$12$J8p9qXJFrzrsRvzB1FN2su1peEAycyzWkLcvRyjfU1RBgGd4HwkzS', NULL, '2025-10-09 07:43:11', '2025-10-09 07:43:11', NULL, NULL, NULL),
(4, 'user', 'user@mail', NULL, '$2y$12$BW7zdB4Yk.Zsul5A2sV11uRxtiDYg2vZ07EzHgRCJ/GiEaBiWIIVG', NULL, '2025-10-16 09:47:28', '2025-10-16 09:47:28', NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adresses_user_id_foreign` (`user_id`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`puzzle_id`,`panier_id`),
  ADD KEY `appartient_panier_id_foreign` (`panier_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `paniers`
--
ALTER TABLE `paniers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paniers_user_id_foreign` (`user_id`);

--
-- Index pour la table `puzzles`
--
ALTER TABLE `puzzles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `puzzles_categorie_id_foreign` (`categorie_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresses`
--
ALTER TABLE `adresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `paniers`
--
ALTER TABLE `paniers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `puzzles`
--
ALTER TABLE `puzzles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `adresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_panier_id_foreign` FOREIGN KEY (`panier_id`) REFERENCES `paniers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appartient_puzzle_id_foreign` FOREIGN KEY (`puzzle_id`) REFERENCES `puzzles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `paniers`
--
ALTER TABLE `paniers`
  ADD CONSTRAINT `paniers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `puzzles`
--
ALTER TABLE `puzzles`
  ADD CONSTRAINT `puzzles_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
