-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour woodycraftweb
CREATE DATABASE IF NOT EXISTS `woodycraftweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `woodycraftweb`;

-- Listage de la structure de table woodycraftweb. adresses
CREATE TABLE IF NOT EXISTS `adresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'France',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adresses_user_id_foreign` (`user_id`),
  CONSTRAINT `adresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table woodycraftweb.adresses : ~3 rows (environ)
INSERT INTO `adresses` (`id`, `user_id`, `nom`, `rue`, `ville`, `code_postal`, `pays`, `created_at`, `updated_at`) VALUES
	(11, 1, '20', 'chemin des gens', 'chambon feugerolles', '42500', 'France', '2025-10-14 13:21:16', '2025-10-14 13:46:31'),
	(12, 2, 'nom de', 'la rue', 'ville', '42500', 'France', '2025-10-16 09:50:48', '2025-10-16 09:50:48'),
	(13, 4, '20', 'Jean moulin', 'firminy', '25600', 'France', '2025-10-16 12:16:57', '2025-10-16 12:16:57');

-- Listage de la structure de table woodycraftweb. appartient
CREATE TABLE IF NOT EXISTS `appartient` (
  `puzzle_id` bigint unsigned NOT NULL,
  `panier_id` bigint unsigned NOT NULL,
  `quantite` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`puzzle_id`,`panier_id`),
  KEY `appartient_panier_id_foreign` (`panier_id`),
  CONSTRAINT `appartient_panier_id_foreign` FOREIGN KEY (`panier_id`) REFERENCES `paniers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appartient_puzzle_id_foreign` FOREIGN KEY (`puzzle_id`) REFERENCES `puzzles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table woodycraftweb.appartient : ~11 rows (environ)
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

-- Listage de la structure de table woodycraftweb. categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table woodycraftweb.categories : ~5 rows (environ)
INSERT INTO `categories` (`id`, `nom`, `created_at`, `updated_at`) VALUES
	(1, 'Puzzle logique', '2025-10-02 12:43:51', '2025-10-02 12:43:51'),
	(2, 'Puzzle 3D Avancé', '2025-10-02 12:43:50', '2025-10-02 12:43:52'),
	(3, 'Casse-tête en bois', '2025-10-02 12:43:53', '2025-10-02 12:43:52'),
	(4, 'Puzzle enfant Facile', '2025-10-02 12:43:53', '2025-10-02 12:43:54'),
	(5, 'Puzzle artistique', '2025-10-02 12:43:55', '2025-10-02 12:43:54');

-- Listage de la structure de table woodycraftweb. failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table woodycraftweb.failed_jobs : ~0 rows (environ)

-- Listage de la structure de table woodycraftweb. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table woodycraftweb.migrations : ~0 rows (environ)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2025_09_01_113505_create_categories_table', 1),
	(6, '2025_09_18_111445_create_puzzles_table', 1),
	(7, '2025_10_02_114641_create_paniers_table', 1),
	(8, '2025_10_02_114834_create_appartient_table', 1),
	(9, '2025_10_07_091446_create_adresses_table', 2),
	(10, '2025_10_07_140752_rename_adresse_column_to_rue_in_adresses_table', 3);

-- Listage de la structure de table woodycraftweb. paniers
CREATE TABLE IF NOT EXISTS `paniers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en cours',
  `total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `mode_paiement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paniers_user_id_foreign` (`user_id`),
  CONSTRAINT `paniers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table woodycraftweb.paniers : ~9 rows (environ)
INSERT INTO `paniers` (`id`, `statut`, `total`, `mode_paiement`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'en cours', 81.98, NULL, 1, '2025-10-02 12:48:09', '2025-10-16 09:07:45'),
	(2, 'en cours', 212.94, 'cheque', 2, '2025-10-09 09:38:39', '2025-10-16 11:45:59'),
	(3, 'en cours', 15.50, NULL, 3, '2025-10-09 09:43:14', '2025-10-09 09:43:14'),
	(4, 'preparation', 159.89, 'cheque', 4, '2025-10-16 11:49:14', '2025-10-16 12:26:19'),
	(5, 'preparation', 15.50, 'paypal', 4, '2025-10-16 12:27:32', '2025-10-16 12:29:27'),
	(6, 'preparation', 9.99, 'cheque', 4, '2025-10-16 12:29:49', '2025-10-16 12:29:52'),
	(7, 'preparation', 19.99, 'cheque', 4, '2025-10-16 12:37:22', '2025-10-16 12:38:55'),
	(8, 'preparation', 15.50, 'cheque', 4, '2025-10-16 12:53:20', '2025-10-16 12:53:23'),
	(9, 'preparation', 19.98, 'paypal', 4, '2025-10-16 12:53:57', '2025-10-16 12:54:09');

-- Listage de la structure de table woodycraftweb. password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table woodycraftweb.password_reset_tokens : ~0 rows (environ)

-- Listage de la structure de table woodycraftweb. personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table woodycraftweb.personal_access_tokens : ~0 rows (environ)

-- Listage de la structure de table woodycraftweb. puzzles
CREATE TABLE IF NOT EXISTS `puzzles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` bigint unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double(8,2) NOT NULL,
  `stock` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `puzzles_categorie_id_foreign` (`categorie_id`),
  CONSTRAINT `puzzles_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table woodycraftweb.puzzles : ~3 rows (environ)
INSERT INTO `puzzles` (`id`, `nom`, `categorie_id`, `description`, `image`, `prix`, `stock`, `created_at`, `updated_at`) VALUES
	(2, 'Puzzle 3D Avancé', 2, 'Puzzle en 3D complexe.', 'image2.jpg', 29.99, 10, '2025-10-02 12:44:03', '2025-10-02 12:44:01'),
	(3, 'Casse-tête en bois', 3, 'Un casse-tête classique en bois.', 'image3.jpg', 15.50, 10, '2025-10-02 12:44:00', '2025-10-02 12:44:00'),
	(4, 'Puzzle enfant Facile', 4, 'Puzzle pour les enfants.', 'image4.jpg', 9.99, 10, '2025-10-02 12:43:58', '2025-10-02 12:43:59'),
	(8, 'Puzzle', 3, 'un petit puzzle simple', 'puzzle.jpg', 19.99, 5, '2025-10-16 11:48:51', '2025-10-16 11:48:51');

-- Listage de la structure de table woodycraftweb. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table woodycraftweb.users : ~3 rows (environ)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'moi', 'moi@moi', NULL, '$2y$12$v0G.zk22VgC1jVE03bnBYeecElv99/pj02cbGbqcar.MCfGjaDZdW', NULL, '2025-10-02 10:47:34', '2025-10-02 10:47:34'),
	(2, 'machin', 'm@m', NULL, '$2y$12$/K/1C3k9mUMunafS6aeSQ.vGv0VtGXwETCn6RNpizYgHA15ldm2eu', NULL, '2025-10-09 09:38:36', '2025-10-09 09:38:36'),
	(3, 'totim', 'totim@p', NULL, '$2y$12$J8p9qXJFrzrsRvzB1FN2su1peEAycyzWkLcvRyjfU1RBgGd4HwkzS', NULL, '2025-10-09 09:43:11', '2025-10-09 09:43:11'),
	(4, 'user', 'user@mail', NULL, '$2y$12$BW7zdB4Yk.Zsul5A2sV11uRxtiDYg2vZ07EzHgRCJ/GiEaBiWIIVG', NULL, '2025-10-16 11:47:28', '2025-10-16 11:47:28');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
