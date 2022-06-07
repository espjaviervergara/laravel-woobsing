-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla laravel-woobsing.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel-woobsing.failed_jobs: ~0 rows (aproximadamente)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla laravel-woobsing.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel-woobsing.migrations: ~10 rows (aproximadamente)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_06_05_220350_create_usuarios_table', 2),
	(6, '2022_06_05_220412_create_roles_table', 2),
	(7, '2022_06_05_220435_create_permisos_table', 2),
	(8, '2022_06_05_224544_new_campo_usuarios_table', 2),
	(9, '2022_06_05_225238_create_roles_permisos_table', 2),
	(10, '2022_06_06_162815_new_campo_session_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla laravel-woobsing.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel-woobsing.password_resets: ~0 rows (aproximadamente)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla laravel-woobsing.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permiso` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel-woobsing.permisos: ~8 rows (aproximadamente)
DELETE FROM `permisos`;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` (`id`, `permiso`, `created_at`, `updated_at`) VALUES
	(1, 'ver-rol', '2022-06-05 23:51:55', '2022-06-05 23:51:55'),
	(2, 'crear-rol', '2022-06-05 23:51:55', '2022-06-05 23:51:55'),
	(3, 'editar-rol', '2022-06-05 23:51:55', '2022-06-05 23:51:55'),
	(4, 'borrar-rol', '2022-06-05 23:51:55', '2022-06-05 23:51:55'),
	(5, 'ver-grado', '2022-06-05 23:51:55', '2022-06-05 23:51:55'),
	(6, 'crear-grado', '2022-06-05 23:51:55', '2022-06-05 23:51:55'),
	(7, 'editar-grado', '2022-06-05 23:51:55', '2022-06-05 23:51:55'),
	(8, 'borrar-grado', '2022-06-05 23:51:55', '2022-06-05 23:51:55');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;

-- Volcando estructura para tabla laravel-woobsing.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel-woobsing.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla laravel-woobsing.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel-woobsing.roles: ~6 rows (aproximadamente)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', NULL, NULL),
	(2, 'Rector', NULL, NULL),
	(3, 'Coordinador', NULL, NULL),
	(4, 'Docente', NULL, NULL),
	(5, 'Estudiante', NULL, NULL),
	(6, 'secretario', NULL, NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla laravel-woobsing.roles_permisos
CREATE TABLE IF NOT EXISTS `roles_permisos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rol_id` bigint(20) unsigned NOT NULL,
  `permiso_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_permisos_rol_id_foreign` (`rol_id`),
  KEY `roles_permisos_permiso_id_foreign` (`permiso_id`),
  CONSTRAINT `roles_permisos_permiso_id_foreign` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `roles_permisos_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel-woobsing.roles_permisos: ~11 rows (aproximadamente)
DELETE FROM `roles_permisos`;
/*!40000 ALTER TABLE `roles_permisos` DISABLE KEYS */;
INSERT INTO `roles_permisos` (`id`, `rol_id`, `permiso_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL),
	(2, 1, 2, NULL, NULL),
	(3, 1, 3, NULL, NULL),
	(4, 1, 4, NULL, NULL),
	(5, 1, 5, NULL, NULL),
	(6, 2, 1, NULL, NULL),
	(7, 2, 2, NULL, NULL),
	(8, 2, 3, NULL, NULL),
	(9, 3, 1, NULL, NULL),
	(10, 3, 2, NULL, NULL),
	(11, 4, 1, NULL, NULL);
/*!40000 ALTER TABLE `roles_permisos` ENABLE KEYS */;

-- Volcando estructura para tabla laravel-woobsing.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel-woobsing.users: ~0 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla laravel-woobsing.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rol_id` bigint(20) unsigned DEFAULT NULL,
  `ultima_sesion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_correo_unique` (`correo`),
  KEY `usuarios_rol_id_foreign` (`rol_id`),
  CONSTRAINT `usuarios_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel-woobsing.usuarios: ~5 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `correo`, `telefono`, `email_verified_at`, `password`, `created_at`, `updated_at`, `rol_id`, `ultima_sesion`) VALUES
	(1, 'Super', 'Admin', 'admin@email.com', '123456', '2022-06-06 10:39:22', '$2y$10$o1V7Z4kjS3AiqNyW9SNzpe9dy4gIj2k2tkaE9zbRAVtsKepk1m9L2', '2022-06-05 23:51:55', '2022-06-05 23:51:55', 1, '2022-06-07 05:26:52'),
	(2, 'javier', 'vergara', 'javier@email.com', '123456', '2022-06-07 05:39:09', '$2y$10$TH3MHY5hp8jxVE9jEZk0zOb6oUmC9MUs7NrDjp/MpE.upBShcueq2', '2022-06-05 23:51:55', '2022-06-05 23:51:55', 2, '2022-06-07 05:44:43'),
	(3, 'yeimis', 'cervantes', 'yeimis@email.com', '123456', NULL, '$2y$10$elVBj366q/uuyOVYrYkO5OthjS4FAyH2TatVwR1hxHoldkcCbLJji', '2022-06-05 23:51:55', '2022-06-05 23:51:55', 2, NULL),
	(4, 'Gabriela', 'vergara', 'gabriela@email.com', '123456', NULL, '$2y$10$OEgDqA7R4VWnx25HAZOh/OZLayuNaj8uvKItljRRNoSCpJfb/45Vi', '2022-06-05 23:51:55', '2022-06-05 23:51:55', 3, NULL),
	(5, 'Mathia', 'vergara', 'mathia@email.com', '123456', NULL, '$2y$10$C/dHTsHRMXCiqJejRZv2mO6hiV1JoiQ5CVOwB5ekY37c/SUI35g8G', '2022-06-05 23:51:55', '2022-06-05 23:51:55', 4, NULL),
	(6, 'nuevo', 'nuevo', 'nuevo@email.com', '1234456', '2022-06-07 06:02:22', '$2y$10$L0A79hw2rMOs2am1E6BKi.ouy0bdg6RBy4ZFKy.Cewwnuk9OWiaMa', '2022-06-07 06:01:17', '2022-06-07 06:01:17', NULL, '2022-06-07 06:03:00');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
