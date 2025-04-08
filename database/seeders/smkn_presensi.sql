-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
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


-- Dumping database structure for smkn_presensi
DROP DATABASE IF EXISTS `smkn_presensi`;
CREATE DATABASE IF NOT EXISTS `smkn_presensi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smkn_presensi`;

-- Dumping structure for table smkn_presensi.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
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

-- Dumping data for table smkn_presensi.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table smkn_presensi.jurusan
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE IF NOT EXISTS `jurusan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.jurusan: ~8 rows (approximately)
INSERT INTO `jurusan` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'AK 1', NULL, NULL),
	(2, 'ATP 1', NULL, NULL),
	(3, 'TKJ 1', NULL, NULL),
	(4, 'TBSM 1', NULL, NULL),
	(5, 'AK 2', NULL, NULL),
	(6, 'ATP 2', NULL, NULL),
	(7, 'TKJ 2', NULL, NULL),
	(8, 'TBSM 2', NULL, NULL);

-- Dumping structure for table smkn_presensi.kegiatan
DROP TABLE IF EXISTS `kegiatan`;
CREATE TABLE IF NOT EXISTS `kegiatan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pembina_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kegiatan_pembina_id_foreign` (`pembina_id`),
  CONSTRAINT `kegiatan_pembina_id_foreign` FOREIGN KEY (`pembina_id`) REFERENCES `pembina` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.kegiatan: ~3 rows (approximately)
INSERT INTO `kegiatan` (`id`, `name`, `pembina_id`, `created_at`, `updated_at`) VALUES
	(1, 'Bola Kaki', 1, '2025-02-28 00:53:24', '2025-02-28 00:53:24'),
	(2, 'Bola Basket', 3, '2025-02-28 00:53:32', '2025-02-28 00:53:32'),
	(3, 'Tari', 2, '2025-02-28 00:53:41', '2025-02-28 00:53:41');

-- Dumping structure for table smkn_presensi.kegiatan_siswa
DROP TABLE IF EXISTS `kegiatan_siswa`;
CREATE TABLE IF NOT EXISTS `kegiatan_siswa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `siswa_id` bigint unsigned NOT NULL,
  `kegiatan_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kegiatan_siswa_siswa_id_foreign` (`siswa_id`),
  KEY `kegiatan_siswa_kegiatan_id_foreign` (`kegiatan_id`),
  CONSTRAINT `kegiatan_siswa_kegiatan_id_foreign` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `kegiatan_siswa_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.kegiatan_siswa: ~0 rows (approximately)

-- Dumping structure for table smkn_presensi.kelas
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE IF NOT EXISTS `kelas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.kelas: ~3 rows (approximately)
INSERT INTO `kelas` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'X', NULL, NULL),
	(2, 'XI', NULL, NULL),
	(3, 'XII', NULL, NULL);

-- Dumping structure for table smkn_presensi.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.migrations: ~14 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(2, '2019_08_19_000000_create_failed_jobs_table', 1),
	(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(4, '2024_07_14_171031_create_permission_tables', 1),
	(5, '2024_07_16_023510_create_kelas_table', 1),
	(6, '2024_07_17_023546_create_jurusan_table', 1),
	(7, '2024_07_17_173216_create_users_table', 1),
	(8, '2024_07_17_173217_create_pembina_table', 1),
	(9, '2024_07_17_173218_create_kegiatan_table', 1),
	(10, '2024_07_17_173219_create_siswa_table', 1),
	(11, '2024_07_17_173259_create_presensi_table', 1),
	(12, '2024_07_17_174338_create_penjadwalan_table', 1),
	(13, '2024_09_06_113814_create_kegiatan_siswa_table', 1),
	(14, '2024_10_29_045404_create_presensi_siswa', 1);

-- Dumping structure for table smkn_presensi.model_has_permissions
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.model_has_permissions: ~0 rows (approximately)

-- Dumping structure for table smkn_presensi.model_has_roles
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.model_has_roles: ~10 rows (approximately)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(2, 'App\\Models\\User', 2),
	(2, 'App\\Models\\User', 3),
	(2, 'App\\Models\\User', 4),
	(3, 'App\\Models\\User', 5),
	(3, 'App\\Models\\User', 6),
	(3, 'App\\Models\\User', 7),
	(3, 'App\\Models\\User', 8),
	(2, 'App\\Models\\User', 9),
	(2, 'App\\Models\\User', 10);

-- Dumping structure for table smkn_presensi.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table smkn_presensi.pembina
DROP TABLE IF EXISTS `pembina`;
CREATE TABLE IF NOT EXISTS `pembina` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `jenis_kelamin` enum('p','l') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pembina_user_id_foreign` (`user_id`),
  CONSTRAINT `pembina_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.pembina: ~3 rows (approximately)
INSERT INTO `pembina` (`id`, `user_id`, `jenis_kelamin`, `no_hp`, `alamat`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 2, 'l', '088562315520', 'Makkawing', NULL, '2025-02-28 00:51:45', '2025-02-28 01:28:51'),
	(2, 3, 'p', '088562315520', 'Matampong', NULL, '2025-02-28 00:52:24', '2025-02-28 00:52:24'),
	(3, 4, 'l', '088562315520', 'Bakung', NULL, '2025-02-28 00:53:05', '2025-02-28 00:53:05');

-- Dumping structure for table smkn_presensi.penjadwalan
DROP TABLE IF EXISTS `penjadwalan`;
CREATE TABLE IF NOT EXISTS `penjadwalan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kegiatan_id` bigint unsigned NOT NULL,
  `tanggal_mulai` datetime NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penjadwalan_kegiatan_id_foreign` (`kegiatan_id`),
  CONSTRAINT `penjadwalan_kegiatan_id_foreign` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.penjadwalan: ~9 rows (approximately)
INSERT INTO `penjadwalan` (`id`, `kegiatan_id`, `tanggal_mulai`, `tanggal_selesai`, `created_at`, `updated_at`) VALUES
	(23, 1, '2025-03-14 00:00:00', '2025-03-14 00:00:00', '2025-03-13 16:52:27', '2025-03-13 16:52:27'),
	(24, 2, '2025-03-17 00:00:00', '2025-03-17 00:00:00', '2025-03-13 16:58:04', '2025-03-13 16:58:04'),
	(29, 2, '2025-03-24 00:00:00', '2025-03-24 00:00:00', '2025-03-13 17:14:47', '2025-03-13 17:14:47'),
	(30, 3, '2025-03-21 00:00:00', '2025-03-21 00:00:00', '2025-03-13 17:20:18', '2025-03-13 17:20:18'),
	(31, 3, '2025-03-28 00:00:00', '2025-03-28 00:00:00', '2025-03-13 17:26:58', '2025-03-13 17:26:58'),
	(32, 3, '2025-03-14 00:00:00', '2025-03-14 00:00:00', '2025-03-13 17:42:30', '2025-03-13 17:42:30'),
	(33, 2, '2025-03-10 00:00:00', '2025-03-10 00:00:00', '2025-03-13 17:43:27', '2025-03-13 17:43:27'),
	(34, 1, '2025-03-21 00:00:00', '2025-03-21 00:00:00', '2025-03-13 18:06:59', '2025-03-13 18:06:59'),
	(35, 1, '2025-03-28 00:00:00', '2025-03-28 00:00:00', '2025-03-13 18:11:06', '2025-03-13 18:11:06');

-- Dumping structure for table smkn_presensi.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.permissions: ~0 rows (approximately)

-- Dumping structure for table smkn_presensi.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
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

-- Dumping data for table smkn_presensi.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table smkn_presensi.presensi
DROP TABLE IF EXISTS `presensi`;
CREATE TABLE IF NOT EXISTS `presensi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pembina_id` bigint unsigned NOT NULL,
  `kegiatan_id` bigint unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `presensi_pembina_id_foreign` (`pembina_id`),
  KEY `presensi_kegiatan_id_foreign` (`kegiatan_id`),
  CONSTRAINT `presensi_kegiatan_id_foreign` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `presensi_pembina_id_foreign` FOREIGN KEY (`pembina_id`) REFERENCES `pembina` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.presensi: ~6 rows (approximately)
INSERT INTO `presensi` (`id`, `pembina_id`, `kegiatan_id`, `tanggal`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2025-03-05', '2025-03-04 11:44:59', '2025-03-04 11:44:59'),
	(2, 1, 1, '2025-03-08', '2025-03-07 19:01:54', '2025-03-07 19:01:54'),
	(3, 1, 1, '2025-03-12', '2025-03-12 06:24:25', '2025-03-12 06:24:25'),
	(4, 2, 3, '2025-03-12', '2025-03-12 06:28:24', '2025-03-12 06:28:24'),
	(6, 1, 1, '2025-03-14', '2025-03-13 19:09:11', '2025-03-13 19:09:11'),
	(7, 1, 1, '2025-03-24', '2025-03-24 03:11:39', '2025-03-24 03:11:39');

-- Dumping structure for table smkn_presensi.presensi_siswa
DROP TABLE IF EXISTS `presensi_siswa`;
CREATE TABLE IF NOT EXISTS `presensi_siswa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `presensi_id` bigint unsigned NOT NULL,
  `siswa_id` bigint unsigned NOT NULL,
  `foto_selfie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `presensi_siswa_presensi_id_foreign` (`presensi_id`),
  KEY `presensi_siswa_siswa_id_foreign` (`siswa_id`),
  CONSTRAINT `presensi_siswa_presensi_id_foreign` FOREIGN KEY (`presensi_id`) REFERENCES `presensi` (`id`) ON DELETE CASCADE,
  CONSTRAINT `presensi_siswa_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.presensi_siswa: ~9 rows (approximately)
INSERT INTO `presensi_siswa` (`id`, `presensi_id`, `siswa_id`, `foto_selfie`, `tanggal`, `waktu`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'public/foto_selfie/67c7505f644f7.jpeg', '2025-03-05', '02:11:27', '2025-03-04 19:11:27', '2025-03-04 19:11:27'),
	(3, 1, 4, 'public/foto_selfie/67c7585070e22.jpeg', '2025-03-05', '02:45:20', '2025-03-04 19:45:20', '2025-03-04 19:45:20'),
	(4, 2, 1, 'public/foto_selfie/67cb42d68ff51.jpeg', '2025-03-08', '02:02:47', '2025-03-07 19:02:47', '2025-03-07 19:02:47'),
	(5, 2, 4, 'public/foto_selfie/67cb483204d4a.jpeg', '2025-03-08', '02:25:38', '2025-03-07 19:25:38', '2025-03-07 19:25:38'),
	(7, 4, 3, 'public/foto_selfie/67d129aee9ccf.jpeg', '2025-03-12', '13:29:02', '2025-03-12 06:29:02', '2025-03-12 06:29:02'),
	(13, 6, 1, 'public/foto_selfie/67d32d7f557d9.jpeg', '2025-03-14', '02:09:51', '2025-03-13 19:09:51', '2025-03-13 19:09:51'),
	(14, 6, 4, 'public/foto_selfie/67d32e684e71b.jpeg', '2025-03-14', '02:13:44', '2025-03-13 19:13:44', '2025-03-13 19:13:44'),
	(15, 7, 1, 'public/foto_selfie/67e0cd909c951.jpeg', '2025-03-24', '10:12:17', '2025-03-24 03:12:17', '2025-03-24 03:12:17'),
	(16, 7, 4, 'public/foto_selfie/67e0cdc7b9a7d.jpeg', '2025-03-24', '10:13:11', '2025-03-24 03:13:11', '2025-03-24 03:13:11');

-- Dumping structure for table smkn_presensi.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.roles: ~3 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'web', '2025-02-28 00:50:05', '2025-02-28 00:50:05'),
	(2, 'pembina', 'web', '2025-02-28 00:50:05', '2025-02-28 00:50:05'),
	(3, 'siswa', 'web', '2025-02-28 00:50:05', '2025-02-28 00:50:05');

-- Dumping structure for table smkn_presensi.role_has_permissions
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.role_has_permissions: ~0 rows (approximately)

-- Dumping structure for table smkn_presensi.siswa
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE IF NOT EXISTS `siswa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `kelas_id` bigint unsigned NOT NULL,
  `jurusan_id` bigint unsigned NOT NULL,
  `kegiatan_id` bigint unsigned DEFAULT NULL,
  `jenis_kelamin` enum('p','l') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `siswa_user_id_foreign` (`user_id`),
  KEY `siswa_jurusan_id_foreign` (`jurusan_id`),
  KEY `siswa_kelas_id_foreign` (`kelas_id`),
  KEY `siswa_kegiatan_id_foreign` (`kegiatan_id`),
  CONSTRAINT `siswa_jurusan_id_foreign` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `siswa_kegiatan_id_foreign` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatan` (`id`) ON DELETE SET NULL,
  CONSTRAINT `siswa_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `siswa_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.siswa: ~4 rows (approximately)
INSERT INTO `siswa` (`id`, `user_id`, `kelas_id`, `jurusan_id`, `kegiatan_id`, `jenis_kelamin`, `no_hp`, `alamat`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 5, 1, 3, 1, 'l', '088562315520', 'Segalang', NULL, '2025-02-28 00:54:45', '2025-02-28 00:54:45'),
	(2, 6, 1, 2, 2, 'l', '088562315520', 'Toba', NULL, '2025-02-28 00:55:35', '2025-02-28 01:30:48'),
	(3, 7, 1, 1, 3, 'p', '088562315520', 'Kebadu', NULL, '2025-02-28 00:57:10', '2025-02-28 00:57:10'),
	(4, 8, 1, 2, 1, 'l', '088562315520', 'Sambatu', NULL, '2025-03-04 19:44:50', '2025-03-04 19:44:50');

-- Dumping structure for table smkn_presensi.users
DROP TABLE IF EXISTS `users`;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smkn_presensi.users: ~8 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$oNkDaunTtKSpQbKI6hVoaeTUPyxXsB0JSgYjwS.wsbQOXuXNuiJsy', NULL, '2025-02-28 00:50:05', '2025-02-28 00:50:05'),
	(2, 'Aldi', 'aldi@gmail.com', NULL, '$2y$10$zicfrHfXQjYy1bvV3.BD3.4gqGbW3FkLZ5H/QRwXps5fy4wxmhN16', NULL, '2025-02-28 00:51:45', '2025-02-28 01:28:51'),
	(3, 'Novi', 'novi@gmail.com', NULL, '$2y$10$s8G6DAWdn4Ax1mXMR.EXUeGukommJo4fM82g99GJD6HH8wh91ZyLO', NULL, '2025-02-28 00:52:24', '2025-02-28 00:52:24'),
	(4, 'Natan', 'natan@gmail.com', NULL, '$2y$10$EH4hVsohIFrMsi.w4bBMeu6nvXN8n4xzTrvVmj6AKR1OHYzMxp58.', NULL, '2025-02-28 00:53:05', '2025-02-28 00:53:05'),
	(5, 'Samuel', 'samuel@gmail.com', NULL, '$2y$10$YwWqODQczK1wjmp/XKLpzus7kCGY44LAGaTspLzxYlfkw1/CMmsxG', NULL, '2025-02-28 00:54:45', '2025-02-28 00:54:45'),
	(6, 'Adi', 'adi@gmail.com', NULL, '$2y$10$/TNSiGNqA9nE48lCW1f0huivNOMDqZJxMKSIqiLsZLf6NxGPgIv.6', NULL, '2025-02-28 00:55:35', '2025-02-28 01:30:48'),
	(7, 'Putri', 'putri@gmail.com', NULL, '$2y$10$iX3QGVKkc.nncfDO7Ga6..M0SfCxDYEh24dEvbREn61HZg7L1M8i6', NULL, '2025-02-28 00:57:10', '2025-02-28 00:57:10'),
	(8, 'Bayu', 'bayu@gmail.com', NULL, '$2y$10$XEekH3udMthZisXa9sAvGOQYil9lZkf6.erIJu1p2eatvDCcog9TK', NULL, '2025-03-04 19:44:49', '2025-03-04 19:44:49');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
