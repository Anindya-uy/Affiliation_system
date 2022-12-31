-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 31, 2022 at 11:00 PM
-- Server version: 5.7.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `softic_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_14_194248_laratrust_setup_tables', 2),
(6, '2022_12_14_224308_add_referral_code_to_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `networks`
--

DROP TABLE IF EXISTS `networks`;
CREATE TABLE IF NOT EXISTS `networks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referral_code` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `networks`
--

INSERT INTO `networks` (`id`, `referral_code`, `user_id`, `parent_user_id`, `created_at`, `updated_at`) VALUES
(10, 'asRglKju', 43, 2, '2022-12-31 20:37:03', '2022-12-31 20:37:03'),
(9, 'asRglKju', 41, 2, '2022-12-30 18:22:41', '2022-12-30 18:22:41'),
(8, 'sRpsZpsD', 37, 9, '2022-12-25 03:49:46', '2022-12-25 03:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'users-create', 'Create Users', 'Create Users', '2022-12-14 14:05:18', '2022-12-14 14:05:18'),
(2, 'users-read', 'Read Users', 'Read Users', '2022-12-14 14:05:18', '2022-12-14 14:05:18'),
(3, 'users-update', 'Update Users', 'Update Users', '2022-12-14 14:05:18', '2022-12-14 14:05:18'),
(4, 'users-delete', 'Delete Users', 'Delete Users', '2022-12-14 14:05:18', '2022-12-14 14:05:18'),
(5, 'payments-create', 'Create Payments', 'Create Payments', '2022-12-14 14:05:18', '2022-12-14 14:05:18'),
(6, 'payments-read', 'Read Payments', 'Read Payments', '2022-12-14 14:05:18', '2022-12-14 14:05:18'),
(7, 'payments-update', 'Update Payments', 'Update Payments', '2022-12-14 14:05:18', '2022-12-14 14:05:18'),
(8, 'payments-delete', 'Delete Payments', 'Delete Payments', '2022-12-14 14:05:18', '2022-12-14 14:05:18'),
(9, 'profile-read', 'Read Profile', 'Read Profile', '2022-12-14 14:05:18', '2022-12-14 14:05:18'),
(10, 'profile-update', 'Update Profile', 'Update Profile', '2022-12-14 14:05:18', '2022-12-14 14:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(9, 2),
(9, 3),
(10, 1),
(10, 2),
(10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE IF NOT EXISTS `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  KEY `permission_user_permission_id_foreign` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2022-12-14 14:05:18', '2022-12-14 14:05:18'),
(2, 'employee', 'Employee', 'Employee', '2022-12-14 14:05:18', '2022-12-14 14:05:18'),
(3, 'user', 'User', 'User', '2022-12-14 14:05:19', '2022-12-14 14:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User'),
(2, 2, 'App\\Models\\User'),
(3, 3, 'App\\Models\\User'),
(3, 5, 'App\\Models\\User'),
(2, 6, 'App\\Models\\User'),
(3, 7, 'App\\Models\\User'),
(3, 8, 'App\\Models\\User'),
(2, 9, 'App\\Models\\User'),
(2, 37, 'App\\Models\\User'),
(2, 38, 'App\\Models\\User'),
(2, 39, 'App\\Models\\User'),
(2, 40, 'App\\Models\\User'),
(2, 41, 'App\\Models\\User'),
(3, 42, 'App\\Models\\User'),
(2, 43, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referral_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `referral_code`, `is_approved`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$8pGBC8NYpQBHK.OKtTZlLenPQdop4exrYT0xpw9kyFY5oWwLltKJe', NULL, 0, NULL, '2022-12-14 14:23:33', '2022-12-14 14:23:33'),
(3, 'user', 'user@gmail.com', NULL, '$2y$10$20FtZX2BptqcNtB2C6qsP.wJ4VRcRF2mrZ4mPd9p/k5QHP6YRBM2q', NULL, 0, NULL, '2022-12-14 14:45:42', '2022-12-14 14:45:42'),
(2, 'employee', 'employee@gmail.com', NULL, '$2y$10$HfvNk1aU73QD0F.bbbBz9.b8k3t6OrmvM7y0SYWLF7FF86RlVqbsq', 'asRglKju', 1, NULL, '2022-12-14 14:47:02', '2022-12-14 14:47:02'),
(5, 'Mondal', 'user2@gmail.com', NULL, '$2y$10$G6o1QdUB92edIT7qFmIsxOyOSUiyJQAuebNEIoal6Eap4kYmmImN2', NULL, 0, NULL, '2022-12-14 14:53:06', '2022-12-14 14:53:06'),
(6, 'Anindya', 'anindya@gmail.com', NULL, '$2y$10$QqX2Fb2YmpQRklOeelACN.GhPEFYuq3Zk2BX9VG/EAqscUOkgHm4W', 'SunDer', 1, NULL, '2022-12-14 23:11:43', '2022-12-14 23:11:43'),
(7, 'keya', 'keya@gmail.com', NULL, '$2y$10$N.ZsbNeqlqIxHqdQtDIUcuQk4dKAasP8A.C2f1lWbioRo/2HVFDne', NULL, 0, NULL, '2022-12-15 00:17:58', '2022-12-15 00:17:58'),
(8, 'roy', 'monno@gmail.com', NULL, '$2y$10$U5Kb5DdA.MJnMvfgHwgs1Oo/94gWfowAVWS9pDbtiVWK5LXLR.oVq', NULL, 0, NULL, '2022-12-15 00:38:03', '2022-12-15 00:38:03'),
(9, 'joy', 'joy@gmail.com', NULL, '$2y$10$dARQryDSmOeHj6c/3CNp6eMAF0UqMUiW4BHqWPLYMeyTN/RyBcsD2', 'sRpsZpsD', 1, NULL, '2022-12-15 00:40:39', '2022-12-15 00:40:39'),
(39, 'ai.soft', 'soft17@gmail.com', NULL, '$2y$10$BzGYIbbIZxpXMjTAv4iw3.43aCtiorWk6FiWWdGjYSzG/VQvanD4i', 'TeKZqqrd', 1, NULL, '2022-12-29 09:25:35', '2022-12-29 09:25:35'),
(37, 'Anindya', 'anincse17@gmail.com', NULL, '$2y$10$JF28eDrjwOhiKFJ7uRwV1evTIahRuV4o7o4UmjiYcI.QWc66aqbK2', 'bHNJ5OhR', 1, NULL, '2022-12-24 21:49:46', '2022-12-24 21:49:46'),
(38, 'nice', 'users@gmail.com', NULL, '$2y$10$0ApTnw6Zu4WzRPuQV823uOsIu.KmAEuo824q9wylLduq8W3EKt3pW', 'qNjYln1g', 1, NULL, '2022-12-28 13:42:05', '2022-12-28 13:42:05'),
(40, 'saon', 'saon@gmail.com', NULL, '$2y$10$/7fKxZL0UUAkJmSJTNKCkuUPDBtIgpQwHcArIgQk7j/f/zynTmROO', 'r3v2F61w', 1, NULL, '2022-12-30 00:55:36', '2022-12-30 00:55:36'),
(41, 'Maruti', 'maruti@gmail.com', NULL, '$2y$10$3uSo7Valtv3excCMgzuVcOhDxup1UbO4f1MJIc0C6oZzu7T89MaDi', 'kUcrilyQ', 1, NULL, '2022-12-30 12:22:41', '2022-12-30 12:22:41'),
(42, 'bajranggi', 'baj@gmail.com', NULL, '$2y$10$wHxm8J786jM7VhOrNbuIl.5wNHQ2OT7ghi0lIHL6qOtbWpbFn1cjW', 'DIEFFMf9', 0, NULL, '2022-12-31 14:34:35', '2022-12-31 14:34:35'),
(43, 'kali', 'linux@gmail.com', NULL, '$2y$10$CNYZc0wDHg1jBzV39M4DLOPiQAz/fNHjW6SxAkl.dzS8QlRGtUM42', 'H0uUeBfw', 1, NULL, '2022-12-31 14:37:03', '2022-12-31 14:37:03');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
