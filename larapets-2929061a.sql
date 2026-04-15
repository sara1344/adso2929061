-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2026 a las 00:26:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.5.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `larapets-2929061a`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adoptions`
--

CREATE TABLE `adoptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pet_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `adoptions`
--

INSERT INTO `adoptions` (`id`, `user_id`, `pet_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2026-04-08 04:20:53', '2026-04-08 04:20:53'),
(2, 2, 3, '2026-04-08 04:20:54', '2026-04-08 04:20:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_11_012614_create_pets_table', 1),
(5, '2026_02_11_012719_create_adoptions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pets`
--

CREATE TABLE `pets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'no-image.png',
  `kind` varchar(255) NOT NULL,
  `weight` double NOT NULL,
  `age` int(11) NOT NULL,
  `breed` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pets`
--

INSERT INTO `pets` (`id`, `name`, `image`, `kind`, `weight`, `age`, `breed`, `location`, `description`, `active`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Aaron', 'no-image.png', 'Cat', 10.5, 6, 'Native', 'Colombia', 'hermoso', 1, 0, '2026-04-08 04:20:53', '2026-04-08 04:20:53'),
(2, 'Lio', 'no-image.png', 'Cat', 6, 7, 'Bicolor', 'Colombia', 'Tiene una bacteria que puede disminuir su peso y debilitar si salud', 1, 1, '2026-04-08 04:20:53', '2026-04-08 04:20:54'),
(3, 'Princesa', 'no-image.png', 'Dog', 7, 14, 'Pincher', 'Colombia', 'Tiene cataratas en los ojos', 1, 1, '2026-04-08 04:20:53', '2026-04-08 04:20:54'),
(4, 'Oliver', 'no-image.png', 'Pig', 7.4, 9, 'Vietnamese Potbelly', 'Rico Medio', 'Ipsam adipisci nam nulla.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(5, 'Bruno', 'no-image.png', 'Pig', 6.6, 16, 'Duroc', 'Villa Bueno', 'Dolore aut sint eum.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(6, 'Rosita', 'no-image.png', 'Pig', 3.9, 20, 'Vietnamese Potbelly', 'El Valladares del Bages', 'Aut repudiandae rerum et quo velit.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(7, 'Oink', 'no-image.png', 'Dog', 0.9, 2, 'German Shepherd', 'La Lázaro del Mirador', 'Autem eum corrupti assumenda qui nisi.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(8, 'Bella', 'no-image.png', 'Mouse', 3.1, 10, 'Wood Mouse', 'Barroso del Vallès', 'Hic odio quam id illum dolorem expedita.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(9, 'Maya', 'no-image.png', 'Dog', 1.6, 15, 'Poodle', 'El Hernando del Bages', 'Qui neque possimus in magni sapiente quia.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(10, 'Garfield', 'no-image.png', 'Pig', 0.7, 1, 'Berkshire', 'La Barrios del Vallès', 'Quidem consequatur molestiae reprehenderit.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(11, 'Simba', 'no-image.png', 'Pig', 3.8, 14, 'Tamworth', 'El Rocha', 'Ut vel dolor et a.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(12, 'Daisy', 'no-image.png', 'Mouse', 5, 6, 'Albino', 'Los Barajas', 'Iusto similique quo occaecati rerum est qui.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(13, 'Waddles', 'no-image.png', 'Cat', 2.2, 11, 'Maine Coon', 'San Estévez del Penedès', 'Veritatis omnis ut voluptas.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(14, 'Daisy', 'no-image.png', 'Dog', 8.3, 17, 'Beagle', 'Medrano del Puerto', 'Vel suscipit qui ipsum.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(15, 'Pua', 'no-image.png', 'Cat', 3.4, 1, 'Persian', 'Huerta Alta', 'Qui possimus officia dolorem quo quibusdam odit.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(16, 'Daisy', 'no-image.png', 'Mouse', 1.1, 20, 'Zebra Mouse', 'Miguel de las Torres', 'Dolorum voluptates harum tempore explicabo soluta.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(17, 'Tom', 'no-image.png', 'Pig', 5.9, 15, 'Tamworth', 'L\' Miranda del Bages', 'Cupiditate sed soluta eum.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(18, 'Garfield', 'no-image.png', 'Pig', 7.8, 2, 'Hampshire', 'Partida Medio', 'Est totam repudiandae ea occaecati eveniet in.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(19, 'Stuart', 'no-image.png', 'Dog', 5.8, 15, 'Golden Retriever', 'Rivas del Vallès', 'Et modi sit id neque labore blanditiis.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(20, 'Maya', 'no-image.png', 'Pig', 6.6, 2, 'Tamworth', 'Sotelo del Puerto', 'Quia repellat architecto quas et similique sint.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(21, 'Cerebro', 'no-image.png', 'Mouse', 6, 6, 'Albino', 'Laboy de Ulla', 'Non magnam laborum cumque consectetur.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(22, 'Oliver', 'no-image.png', 'Pig', 9.1, 20, 'Duroc', 'Os Guzmán de la Sierra', 'Harum temporibus magnam temporibus numquam.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(23, 'Simba', 'no-image.png', 'Cat', 7.8, 12, 'Siamese', 'Rocha de Lemos', 'Aliquam molestiae ut sit.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(24, 'Puerqui', 'no-image.png', 'Mouse', 6.6, 11, 'Zebra Mouse', 'Muñoz del Barco', 'Earum iusto autem aut laboriosam assumenda.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(25, 'Jerry', 'no-image.png', 'Pig', 1.1, 6, 'Duroc', 'Montaño del Barco', 'Quam rem id et eius accusantium.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(26, 'Nala', 'no-image.png', 'Mouse', 8.8, 11, 'Zebra Mouse', 'As Griego', 'Neque dolor aspernatur pariatur est.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(27, 'Babe', 'no-image.png', 'Mouse', 8.3, 11, 'Zebra Mouse', 'O Meraz', 'Rerum perferendis non est magni quidem modi.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(28, 'Pua', 'no-image.png', 'Dog', 9.4, 18, 'Beagle', 'Menchaca Medio', 'Harum est ipsum quia quidem.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(29, 'Rex', 'no-image.png', 'Cat', 5.1, 15, 'Sphynx', 'Lovato Baja', 'Et sunt quos est.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(30, 'Nala', 'no-image.png', 'Mouse', 7.4, 14, 'Zebra Mouse', 'Vall Porras', 'Vel maxime ut architecto sit.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(31, 'Cerebro', 'no-image.png', 'Pig', 6.3, 8, 'Hampshire', 'As Rincón Alta', 'Veniam quam voluptatum adipisci.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(32, 'Oink', 'no-image.png', 'Dog', 6.9, 20, 'Beagle', 'Vallejo Baja', 'Voluptate consequatur consequatur eos optio ratione quibusdam.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(33, 'Garfield', 'no-image.png', 'Cat', 7.5, 13, 'Bengal', 'Los Abreu', 'Aut quaerat pariatur itaque.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(34, 'Simba', 'no-image.png', 'Pig', 5.1, 10, 'Vietnamese Potbelly', 'A Elizondo del Bages', 'Quo consequuntur maxime similique.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(35, 'Jerry', 'no-image.png', 'Mouse', 3.1, 13, 'Fancy Mouse', 'A Mora Medio', 'Dolorem neque natus nisi cum.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(36, 'Tom', 'no-image.png', 'Cat', 8, 18, 'Sphynx', 'Costa del Vallès', 'Incidunt aliquid exercitationem aliquam id.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(37, 'Rex', 'no-image.png', 'Cat', 5.3, 2, 'Siamese', 'A Solorio de San Pedro', 'Nihil est vero culpa at.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(38, 'Luna', 'no-image.png', 'Cat', 5.6, 2, 'Siamese', 'Monroy del Barco', 'Dolore voluptatem nostrum sapiente quia.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(39, 'Waddles', 'no-image.png', 'Dog', 9.5, 2, 'German Shepherd', 'Perales del Pozo', 'Rerum beatae vel incidunt dolores aut odit.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(40, 'Bruno', 'no-image.png', 'Cat', 7.2, 3, 'Maine Coon', 'Rincón del Penedès', 'Qui voluptatem accusamus sit aliquid.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(42, 'Oliver', 'no-image.png', 'Pig', 1.4, 6, 'Berkshire', 'A Cardona', 'Nisi eum vero et voluptatem.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(43, 'Stuart', 'no-image.png', 'Mouse', 3.3, 2, 'Albino', 'Vall Avilés del Vallès', 'Corrupti ut voluptas tenetur dolores necessitatibus sit.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(44, 'Bacon', 'no-image.png', 'Cat', 8.3, 17, 'Bengal', 'Las Colunga', 'Quidem omnis cupiditate qui et fugit molestiae.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(45, 'Garfield', 'no-image.png', 'Dog', 7.4, 1, 'Poodle', 'Os Jáquez', 'Voluptatum veniam repellat rerum.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(46, 'Remy', 'no-image.png', 'Pig', 1.9, 12, 'Duroc', 'Arenas de Ulla', 'Eligendi fugit aut placeat sunt quis beatae.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(47, 'Max', 'no-image.png', 'Pig', 9, 9, 'Hampshire', 'Las Rodríquez', 'Eum voluptas et vel.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(48, 'Rosita', 'no-image.png', 'Dog', 1.7, 12, 'German Shepherd', 'Las Samaniego de San Pedro', 'Vel iste fuga assumenda et molestias necessitatibus.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(49, 'Pepa', 'no-image.png', 'Dog', 1.2, 13, 'Beagle', 'Castaño del Mirador', 'Sint nam culpa tempora inventore harum.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(50, 'Speedy', 'no-image.png', 'Cat', 3.7, 19, 'Siamese', 'Bañuelos del Penedès', 'Sint in quo aperiam.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(51, 'Jerry', 'no-image.png', 'Pig', 0.7, 10, 'Vietnamese Potbelly', 'Alejandro del Penedès', 'Enim id eaque in qui et itaque.', 1, 0, '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(54, 'pepinillo', 'no-image.png', 'Dog', 10.5, 5, 'criollo', 'Manizales', 'El mejor de todos', 1, 1, '2026-04-10 06:16:57', '2026-04-10 06:16:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Iok0DqdEUP83V1bpIB73lID10tZclHDIdZhOIy2y', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSXZQaTdRMm1RalU1S0tzakRKNDd3UUlVTnhqcnJ4YzZ2cjFlMkVleSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VycyI7czo1OiJyb3V0ZSI7czoxMToidXNlcnMuaW5kZXgiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1776212678),
('Sfhr9cHkbgUMgpz4UoKManD1vSh8VFw6yHKLxDfC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHlVU3hsaENuSTA4b2plalllS25PZXF5WGdEUHNzRFN0WU4zaklQUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fX0=', 1776211442),
('x7Ttz0vduoPGYVDrLfJx6SH8Xn5G0NnrYBhQNCa3', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSXRBM2RzQ3NCTlRYSko1TmxxOXNnaTExNjNVTWFGWTJSQUpXa3ZDTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VycyI7czo1OiJyb3V0ZSI7czoxMToidXNlcnMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1776212236);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document` bigint(20) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'no-photo.png',
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `document`, `fullname`, `gender`, `birthdate`, `photo`, `phone`, `email`, `email_verified_at`, `password`, `active`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 75000001, 'John Wick', 'Male', '1964-09-02', 'no-photo.png', '3200000001', 'john@mail.com', NULL, '$2y$12$yOuZl9KcE/XEgIMjPMd15ubS1AoCqENjVogXWYwxoQO6bcP4qaNIa', 1, 'Admin', NULL, '2026-04-08 04:20:53', '2026-04-08 04:20:53'),
(2, 75000002, 'Lara Croft', 'Female', '1968-02-14', 'no-photo.png', '3200000002', 'larac@mail.com', NULL, '$2y$12$1ME/zATw6dh05iJZSdg2VueX3Y8OJVUSxT7jVRisgONfS7vljjk4i', 1, 'customer', NULL, '2026-04-08 04:20:53', '2026-04-08 04:20:53'),
(3, 75245768, ' Maya', 'male', '2000-11-12', '75245768.png', '3206895455', 'gael865@mail.com', '2026-04-08 04:21:07', '$2y$12$cfKMFvHs5/s..eY..EQM8ONO4EmzPF0PCzfhQxVsPmhJ2Zm5BXyDG', 1, 'customer', 'bqp9I4mrwx', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(4, 75922791, ' Suárez', 'female', '1985-03-27', '75922791.png', '3204049452', 'mara876@mail.com', '2026-04-08 04:21:17', '$2y$12$CDp5uUEaKbWu//gKZ9.c8OrBE3Lupi/jx.hMo2afFL9/bztFy6s/.', 1, 'customer', 'ldFnSARTXj', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(5, 75643723, ' Macias', 'female', '1995-03-11', '75643723.png', '3200483787', 'naia612@mail.com', '2026-04-08 04:21:32', '$2y$12$mo.riZvWQbrEn7okKoFcKOphmvqeUjiKHgoURMEonv.oy72KERoku', 1, 'customer', '9U4nYNOqYi', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(6, 75556102, ' Castro', 'female', '1995-03-06', '75556102.png', '3207520777', 'nadia913@mail.com', '2026-04-08 04:21:44', '$2y$12$35B5ZLWz578elr4JO4jxSelioBjo5pdCzYUCzrWTRvlvx7rEe/ac.', 1, 'customer', 'tEtXQBdEQr', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(7, 75981156, ' Zarate', 'female', '1986-05-06', '75981156.png', '3202885315', 'aurora829@mail.com', '2026-04-08 04:21:55', '$2y$12$b0iPU2MFiIe4OVg2O0od9OiFw.fpO6g4bzKDh.DqjwrDHH7JbXkNS', 1, 'customer', 'CWGx8E1mY0', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(8, 75930307, ' Herrera', 'male', '1997-03-05', '75930307.png', '3202401028', 'ander697@mail.com', '2026-04-08 04:22:05', '$2y$12$c/qvdt21KCx5apVXm32iH.dqswIOI5wW/vtI92YQuGJxr5nxbVfCy', 1, 'customer', 'p5y1mEbYJl', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(9, 75287786, ' Anaya', 'female', '1990-05-28', '75287786.png', '3207181368', 'teresa494@mail.com', '2026-04-08 04:22:15', '$2y$12$W3iVrRsVgB17wXgLwUD2N.9K/AaOAQ6lOPzKDx32oaw1zOsjngzCe', 1, 'customer', 'yl0um5Mas0', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(10, 75775977, ' Cobo', 'male', '1996-06-02', '75775977.png', '3202197980', 'josé670@mail.com', '2026-04-08 04:22:26', '$2y$12$UCqobxzREy/s8/HhCPjA.uWCtqpuV4BmT0rkeirRz2kR/Uo6T1jq.', 1, 'customer', 'RgNeqHXXpG', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(11, 75528904, ' Ríos', 'female', '1996-07-15', '75528904.png', '3203260541', 'lidia171@mail.com', '2026-04-08 04:22:36', '$2y$12$S3I6QFtxRy8wp8tfoeUaI.rTHw4trTmnJ9Hxm5VDXIXQD3PTvdF72', 1, 'customer', 'cObhSV53ZJ', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(12, 75113934, ' Villalpando', 'male', '1983-07-15', '75113934.png', '3207232773', 'gabriel573@mail.com', '2026-04-08 04:22:43', '$2y$12$wew3II8ZpCuq/ltI0aXggO4jezxWy9pg1tEUQz5a3V.51rFhBnDHe', 1, 'customer', 'zLIqNMpIhg', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(13, 75172870, ' Adorno', 'female', '1980-05-15', '75172870.png', '3203125660', 'claudia322@mail.com', '2026-04-08 04:22:47', '$2y$12$eoCsW.Vy.G/oSyuKw4W3z.EHj7U3x6PIVfG10Xsngfr9QvzR.M9Mm', 1, 'customer', 'hESBT9IJsO', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(14, 75356445, ' Morales', 'female', '1997-10-30', '75356445.png', '3206773851', 'juana950@mail.com', '2026-04-08 04:22:50', '$2y$12$RDZSHSejkKUD8yOfDA80R.ekNOTyEoCzhSq4YJWeHN1o/7rCAmTwq', 1, 'customer', '5cvyWwBXyl', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(15, 75838445, ' Silva', 'female', '2004-05-27', '75838445.png', '3202189866', 'aitana531@mail.com', '2026-04-08 04:22:53', '$2y$12$U9t8Bow.LyXwaGO5F0E10.pTGtw8xoy//oVMZjmqHIXR9eaqQvz6e', 1, 'customer', 'oQ01sYFv9C', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(16, 75225457, ' Pelayo', 'male', '1994-09-22', '75225457.png', '3209065779', 'antonio095@mail.com', '2026-04-08 04:22:57', '$2y$12$DHJBr2vFdRbqV/YUDfCS4e0gdp52nWVgIhWPtBWTm0opD1RJ7HS62', 1, 'customer', 'mg6YOp0ZvO', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(17, 75917437, ' Vallejo', 'male', '1987-11-14', '75917437.png', '3202504270', 'miguel Ángel849@mail.com', '2026-04-08 04:23:10', '$2y$12$7jBscTTRWWA3tcbAU5nQB.YTBOh17by2qUmP4/UswVu5bq9Vi4TNq', 1, 'customer', 'gLZhPTxAvJ', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(18, 75549298, ' Mondragón', 'female', '1987-07-09', '75549298.png', '3206000003', 'paula263@mail.com', '2026-04-08 04:23:20', '$2y$12$0Vk2mUoY62KH86D9ahsiWOSSViwR/C9azt1qHGJRitJ7YMXUfKwK6', 1, 'customer', 'lgfRkTqXdP', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(19, 75004783, ' Almaráz', 'male', '1997-09-16', '75004783.png', '3204746550', 'oriol302@mail.com', '2026-04-08 04:23:34', '$2y$12$0ofOH4BPdRBefCZI7uYmK.hMPZTOubjYagGAreRh4IRot/n6CSQ7e', 1, 'customer', 'd3n9tyg04X', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(20, 75658544, ' Santamaría', 'male', '2002-12-29', '75658544.png', '3204163782', 'pol102@mail.com', '2026-04-08 04:24:04', '$2y$12$uUCOqiewXYnuTueTbUtV/ORoTVyT.F04WTma4.jG2yyrtxAksM0CO', 1, 'customer', 'zETyAnXbAo', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(21, 75795623, ' Gallardo', 'female', '1994-04-19', '75795623.png', '3200109660', 'malak316@mail.com', '2026-04-08 04:24:14', '$2y$12$kUdlA725ITb2NwA7pttSzOTj6V4RGD5M/7CSnJ1eOeHnIt6BuIqfy', 1, 'customer', 'u1WCWYg1bn', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(22, 75321390, ' Amador', 'male', '1994-12-20', '75321390.png', '3209683975', 'javier458@mail.com', '2026-04-08 04:24:25', '$2y$12$yJ.g5jT.ltRK/R6d95UPJO0nuszRvsC5MgamrT1/gEUSWwa1aV8/C', 1, 'customer', '9WRqz35ghK', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(23, 75587486, ' Arellano', 'male', '2002-01-29', '75587486.png', '3203694593', 'mateo008@mail.com', '2026-04-08 04:24:36', '$2y$12$nwEhLJRXoa6N/bhJXanvL.d0doX/06QT8D120qEDn3.3IqLYbHykK', 1, 'customer', 'fm2vIWjNhL', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(24, 75802507, ' Valdés', 'female', '2000-01-30', '75802507.png', '3201336588', 'ona578@mail.com', '2026-04-08 04:24:50', '$2y$12$vzEMeS0KaBp1IuFoiFGf9.okFF9GVqU8sAI7pWV/Dlm51h.FPtzHS', 1, 'customer', '1TsErUuAIv', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(25, 75014242, ' Nazario', 'female', '1978-07-02', '75014242.png', '3209586348', 'margarita582@mail.com', '2026-04-08 04:25:00', '$2y$12$yS/D1SJTnXwqaPtXomQvJO31YhQ1/tOVTqJWlmcXYijpT/z/XxxNy', 1, 'customer', 'ytLors2Byi', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(26, 75218077, ' Zayas', 'male', '2000-07-04', '75218077.png', '3203425577', 'héctor366@mail.com', '2026-04-08 04:25:11', '$2y$12$PUZDi6/XaNKIRgb3Xf9IZuMmwYMs7N/0jzbvzruXpwkp8IaLcqzJe', 1, 'customer', 'PWM9x9PeXV', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(27, 75471267, ' Nava', 'male', '2003-03-23', '75471267.png', '3205273419', 'Ángel450@mail.com', '2026-04-08 04:25:21', '$2y$12$.d4noyugegR7Z/mAPizQnetqwvv.DXFavPwVWv.XBQKRyEseE/d7S', 1, 'customer', 'WPHLC9djy9', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(28, 75633183, ' Barroso', 'male', '2002-11-06', '75633183.png', '3207016798', 'gabriel151@mail.com', '2026-04-08 04:25:32', '$2y$12$BcDbDXGeT3Dg..A4T3FequDxWeNDdwGYn2SX/qvlnDrc9Fy8lSeWS', 1, 'customer', 'TdR6hb59Qr', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(29, 75568661, ' Baeza', 'male', '2005-02-13', '75568661.png', '3200530243', 'guillermo853@mail.com', '2026-04-08 04:25:43', '$2y$12$29NYK10Iess6AX0Yta7nqOXhSzb0lsDx3TSdQOZ/PXWWkeLVIeclu', 1, 'customer', 'iVa7qJtd2m', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(30, 75840637, ' Redondo', 'female', '1985-03-11', '75840637.png', '3203399068', 'carlota288@mail.com', '2026-04-08 04:25:54', '$2y$12$.CdTwxBoOhqPfy72vGoKDuJDA6gNk5.xpQYEngGmhWeD5XxR8cDte', 1, 'customer', 'oB9M87oyvk', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(31, 75421632, ' Delvalle', 'female', '1994-08-06', '75421632.png', '3200010333', 'clara111@mail.com', '2026-04-08 04:26:06', '$2y$12$gEWLAySKh0hp3OwQdSbdSunsNwIUweIsvysYKNBzRZVFcbmkurUJ.', 1, 'customer', '7H3sTcoKty', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(32, 75839301, ' Anguiano', 'female', '1997-04-12', '75839301.png', '3209471095', 'valentina244@mail.com', '2026-04-08 04:26:16', '$2y$12$GQuWEw0pWqRHlqb73tnnueu9EyT1CPDgHs/2lRePWOIJmD4Jv9DXO', 1, 'customer', 'nfTuyrH3KV', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(33, 75890876, ' Zarate', 'female', '2001-04-11', '75890876.png', '3202750789', 'carlota940@mail.com', '2026-04-08 04:26:27', '$2y$12$TZjiIHNbJP8QTlu9jh90RuHNfA5B/A1vVerSzTkR2eY8AFgss/D/a', 1, 'customer', 'MJv2UL4BhV', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(34, 75654520, ' Barraza', 'male', '1985-10-05', '75654520.png', '3208846895', 'hugo953@mail.com', '2026-04-08 04:26:37', '$2y$12$nvwyC9Mhf6HKI6BFSIq4nOIGeLIT7QwvciOqkHufidmbCcvUGYFw.', 1, 'customer', 'cqG1jomU6y', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(35, 75964192, ' Godínez', 'male', '1988-04-27', '75964192.png', '3209437701', 'jordi867@mail.com', '2026-04-08 04:26:48', '$2y$12$JS2pljXICzVLXPDNFtQhruZsg53cLr98lwrCSgGNt8vyE/2Oyy946', 1, 'customer', 'cFvuQDNPj6', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(36, 75978260, ' Sánchez', 'female', '1998-12-22', '75978260.png', '3204147544', 'marta820@mail.com', '2026-04-08 04:26:58', '$2y$12$HBHe1wl7lct7pPFkffva2OwEk9rJMWpHrf9CEdCao1IYWG.t2kyHC', 1, 'customer', 'lOtWKDrirX', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(37, 75853267, ' Escobar', 'male', '1999-08-09', '75853267.png', '3204037402', 'francisco091@mail.com', '2026-04-08 04:27:09', '$2y$12$7ZO3VMsaDPAeNSSjHXFJvOZoI7hW9S71hY1KsAqW8EYDMogWlneIa', 1, 'customer', 'RL28D276Zy', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(38, 75137882, ' Valentín', 'male', '1985-01-21', '75137882.png', '3205962346', 'juan josé668@mail.com', '2026-04-08 04:27:19', '$2y$12$Zu0IpVAGuwuOjHdAZFun/OYW20WPreVGdmo5e8HK7o/Yo48g72May', 1, 'customer', '4ORbuYTTs2', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(39, 75748010, ' Muñoz', 'male', '1978-07-16', '75748010.png', '3206389193', 'raúl110@mail.com', '2026-04-08 04:27:30', '$2y$12$wvIEAK116WF6KDYlVzzPQO6JEnBQh6u3Fv/8bYsu.Q410zDa88nE.', 1, 'customer', '6kBvB52s4K', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(40, 75932237, ' Montes', 'male', '1989-03-03', '75932237.png', '3201402822', 'leo975@mail.com', '2026-04-08 04:27:41', '$2y$12$CAhiFvLy/R0pw.LJPeAvCOBRIQ69.YlvRSuci8/So/6o87tUMNAYq', 1, 'customer', '5pQdrlOwxW', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(41, 75507262, ' Gallardo', 'female', '2005-12-04', '75507262.png', '3200920319', 'inmaculada965@mail.com', '2026-04-08 04:27:51', '$2y$12$IE1hd9eXkQVaEr2bDlWOHewDtRTmgP522eGKUailCzqP/xQR8EF4O', 1, 'customer', 'alaxgaOeb9', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(42, 75003664, ' Pedroza', 'female', '1981-02-16', '75003664.png', '3208592868', 'abril419@mail.com', '2026-04-08 04:28:12', '$2y$12$iJHDjdTbV34SV34meyrKGeCuBhJRNy7F4ffjrHktMWrNDmPfoVTtO', 1, 'customer', 'bT2FEf9FqQ', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(43, 75994502, ' Sanabria', 'female', '1983-03-22', '75994502.png', '3203161127', 'luna303@mail.com', '2026-04-08 04:28:39', '$2y$12$kofMJn4pYtjJIfrwqJy.nOHVEecFCpO3UNDU6t8./5Q..OKPycwOu', 1, 'customer', 'jt2dK4LWLo', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(44, 75706150, ' Reina', 'female', '2003-12-05', '75706150.png', '3205652808', 'martina217@mail.com', '2026-04-08 04:28:49', '$2y$12$eacGMxLLZ.dN1zevCuQL0.V77W.p2UwKhRxcvHWp5u4L.2OhUZhvm', 1, 'customer', 'tcEWbuYFLc', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(45, 75913148, ' Quintana', 'female', '2000-09-25', '75913148.png', '3202730260', 'amparo153@mail.com', '2026-04-08 04:29:00', '$2y$12$/ftlvXQbOwZJg7Nssqm6V.HsyB4P1dE.DbJg1ZvsPP/iee4kJPsw6', 1, 'customer', 'XzeYudXnKD', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(46, 75421005, ' Delatorre', 'male', '1998-06-29', '75421005.png', '3202792191', 'alex620@mail.com', '2026-04-08 04:29:16', '$2y$12$y45C7UO.960c0GVXFiQnwe0LuGGXT.j23vAq0S2LE./KetnINJT2e', 1, 'customer', 'WM7DpYZoBx', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(47, 75935526, ' Loera', 'male', '1992-08-18', '75935526.png', '3208431577', 'unai331@mail.com', '2026-04-08 04:29:28', '$2y$12$tUMXxqpGxtHByD59Vc22m.0CruGg6DvMnmqZnq0tzR4j/ny5w5TQ6', 1, 'customer', 'wPVBl45p7A', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(48, 75159122, ' Avilés', 'male', '2005-06-13', '75159122.png', '3201278203', 'jesús061@mail.com', '2026-04-08 04:29:45', '$2y$12$OwH5qZDmhZOMUXOunAxNZONS2a2Qf9DTsh6tG781r3yFMvvQBF2Qe', 1, 'customer', 'hBQUzoebg9', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(49, 75909173, ' Guzmán', 'female', '2000-05-16', '75909173.png', '3203607564', 'lorena470@mail.com', '2026-04-08 04:29:55', '$2y$12$hHmZWt0JN8heGGJK1A.UwuL1aSedJCcNU/vv6N0G8eprvR8VjIv.G', 1, 'customer', '1zPhqFnw2G', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(50, 75551084, ' Cuesta', 'male', '1993-09-27', '75551084.png', '3208063149', 'gael770@mail.com', '2026-04-08 04:30:06', '$2y$12$xa8U01NdEowKxBMN6CDjker258ySzwuvYNsnwR5LtMt.Rr.w6e0ZS', 1, 'customer', 'buzmjUu1Ep', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(51, 75799554, ' Castillo', 'female', '1996-05-24', '75799554.png', '3209493059', 'abril274@mail.com', '2026-04-08 04:30:19', '$2y$12$8tc3oJBbJU9sdTB/.qumlue.CUEzttD43nmV6YahsJ1K2aLlsucsC', 1, 'customer', 'FGymtXpT2s', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(52, 75323333, ' Godoy', 'female', '2003-08-06', '75323333.png', '3205713878', 'eva909@mail.com', '2026-04-08 04:30:48', '$2y$12$DXp76dDSLsvXDS2EtCbC4eJnC1VrUg9pp.MIY2LZE/VlkXXi8udSi', 1, 'customer', '6EJQhjGeqg', '2026-04-08 04:30:48', '2026-04-08 04:30:48'),
(53, 750000101, 'Pelé', 'Male', '1970-01-01', 'no-photo.png', '3205551001', 'pelé@football.com', NULL, '$2y$12$E41iM1BNpqHLr22snzNpIupwgZ9UbeqkJqaA7y8g/0ZMbToSyEMha', 1, 'customer', NULL, '2026-04-08 06:05:49', '2026-04-08 06:05:49'),
(54, 750000102, 'Diego Maradona', 'Male', '1970-01-01', 'no-photo.png', '3205551002', 'diegomaradona@football.com', NULL, '$2y$12$j9jtWWFLHE82UoMhqcLe6eLYi3d1WH34lEsTnJbF4sKoGBw5at7oK', 1, 'customer', NULL, '2026-04-08 06:05:49', '2026-04-08 06:05:49'),
(55, 750000103, 'Lionel Messi', 'Male', '1970-01-01', 'no-photo.png', '3205551003', 'lionelmessi@football.com', NULL, '$2y$12$wE3vEVDOsz8p9DUkChXheuFQA9XiZaL9Lshr3ioiPPV0MJFZ1OPGO', 1, 'customer', NULL, '2026-04-08 06:05:49', '2026-04-08 06:05:49'),
(56, 750000104, 'Cristiano Ronaldo', 'Male', '1970-01-01', 'no-photo.png', '3205551004', 'cristianoronaldo@football.com', NULL, '$2y$12$9bOz9crcYDW8W1CtLxNlPOUR78me2iQxPAMGv6cLlQiC1RibWKcrm', 1, 'customer', NULL, '2026-04-08 06:05:49', '2026-04-08 06:05:49'),
(57, 750000105, 'Johan Cruyff', 'Male', '1970-01-01', 'no-photo.png', '3205551005', 'johancruyff@football.com', NULL, '$2y$12$.H1FIlUAkrp7NEmwDpxKuuMlTyBSx8GCwuEcXCiKtSHZR6BjhGjUK', 1, 'customer', NULL, '2026-04-08 06:05:50', '2026-04-08 06:05:50'),
(58, 750000106, 'Zinedine Zidane', 'Male', '1970-01-01', 'no-photo.png', '3205551006', 'zinedinezidane@football.com', NULL, '$2y$12$gnNS2Rh1kxo7sIUsAnSlWu1wVw5azQVeibeG54raEmaJQBekaAHDC', 1, 'customer', NULL, '2026-04-08 06:05:50', '2026-04-08 06:05:50'),
(59, 750000107, 'Franz Beckenbauer', 'Male', '1970-01-01', 'no-photo.png', '3205551007', 'franzbeckenbauer@football.com', NULL, '$2y$12$Bsa7xk.WCeaPIsG/I6TBnu9bxdoH6jo0NdiAyi2/0GXtdektTBNzm', 1, 'customer', NULL, '2026-04-08 06:05:50', '2026-04-08 06:05:50'),
(60, 750000108, 'Ronaldo Nazário', 'Male', '1970-01-01', 'no-photo.png', '3205551008', 'ronaldonazário@football.com', NULL, '$2y$12$gOuNO8geBwn5LOnbiYzoweu29G2XHTgYGUfREdTj3GRNiwB5uRot2', 1, 'customer', NULL, '2026-04-08 06:05:50', '2026-04-08 06:05:50'),
(61, 750000109, 'Ronaldinho', 'Male', '1970-01-01', 'no-photo.png', '3205551009', 'ronaldinho@football.com', NULL, '$2y$12$dmWugy72cmrui/nd957n/Okj51vLIw3IkRJjx8DQQmh310alemMi6', 1, 'customer', NULL, '2026-04-08 06:05:50', '2026-04-08 06:05:50'),
(62, 750000110, 'Alfredo Di Stéfano', 'Male', '1970-01-01', 'no-photo.png', '3205551010', 'alfredodistéfano@football.com', NULL, '$2y$12$pKZisTP4AF24xfUisTfKFux3iXLMUrHsV.BtJcpF8WTU8rTBB95Nm', 1, 'customer', NULL, '2026-04-08 06:05:51', '2026-04-08 06:05:51'),
(63, 750000111, 'Garrincha', 'Male', '1970-01-01', 'no-photo.png', '3205551011', 'garrincha@football.com', NULL, '$2y$12$HrfiIu7zFaALzS6yJHEGdexD2FPxIxqPblGLvtlRy7E3my/b6A/Yu', 1, 'customer', NULL, '2026-04-08 06:05:51', '2026-04-08 06:05:51'),
(64, 750000112, 'Michel Platini', 'Male', '1970-01-01', 'no-photo.png', '3205551012', 'michelplatini@football.com', NULL, '$2y$12$IiiJmuKrxrmqv7VDDaI.XeK00oaw5gxnJ1YAyTcIDKzsgqANx7cC6', 1, 'customer', NULL, '2026-04-08 06:05:51', '2026-04-08 06:05:51'),
(65, 750000113, 'George Best', 'Male', '1970-01-01', 'no-photo.png', '3205551013', 'georgebest@football.com', NULL, '$2y$12$ScwX/jVpXQFY0TGBXggMreM7XmvNoSIdj3jUoSWEqo0xQJM1MEZIC', 1, 'customer', NULL, '2026-04-08 06:05:51', '2026-04-08 06:05:51'),
(66, 750000114, 'Ferenc Puskás', 'Male', '1970-01-01', 'no-photo.png', '3205551014', 'ferencpuskás@football.com', NULL, '$2y$12$WGGuwnReBiFlCYGhmKaqcOey/m5uIRyAZO/bOkHV.GUx3CdLj53i6', 1, 'customer', NULL, '2026-04-08 06:05:51', '2026-04-08 06:05:51'),
(67, 750000115, 'Paolo Maldini', 'Male', '1970-01-01', 'no-photo.png', '3205551015', 'paolomaldini@football.com', NULL, '$2y$12$IjUv/nFw6.5bWVRazuYI8OBp5EnV5E.sxrn7TfNL0SkVr93xZntAS', 1, 'customer', NULL, '2026-04-08 06:05:52', '2026-04-08 06:05:52'),
(68, 750000116, 'Xavi Hernández', 'Male', '1970-01-01', 'no-photo.png', '3205551016', 'xavihernández@football.com', NULL, '$2y$12$Qoa/H./PLRaaAMk873RErubepI.yAXmT8DRWNVCoLzslh0Bc8LWP.', 1, 'customer', NULL, '2026-04-08 06:05:52', '2026-04-08 06:05:52'),
(69, 750000117, 'Andrés Iniesta', 'Male', '1970-01-01', 'no-photo.png', '3205551017', 'andrésiniesta@football.com', NULL, '$2y$12$DHUtUluAM9efYMd3yrthqO1WWM//YAbtyY5O4ynWhol/MUdUsoTP2', 1, 'customer', NULL, '2026-04-08 06:05:52', '2026-04-08 06:05:52'),
(70, 750000118, 'Roberto Baggio', 'Male', '1970-01-01', 'no-photo.png', '3205551018', 'robertobaggio@football.com', NULL, '$2y$12$5GvBw29q1z3n7SRyS76Wte0GnAgnN4mR1k3HAUk4vCIu0NPhykC8m', 1, 'customer', NULL, '2026-04-08 06:05:52', '2026-04-08 06:05:52'),
(71, 750000119, 'Lothar Matthäus', 'Male', '1970-01-01', 'no-photo.png', '3205551019', 'lotharmatthäus@football.com', NULL, '$2y$12$oghhFLxhzi3HnqF70NcYBeylD0J6KeO1zDWBF3dFlY.8EtfX.37Gy', 1, 'customer', NULL, '2026-04-08 06:05:52', '2026-04-08 06:05:52'),
(72, 750000120, 'Marco van Basten', 'Male', '1970-01-01', 'no-photo.png', '3205551020', 'marcovanbasten@football.com', NULL, '$2y$12$yRwjvjw3jfiHmKfz/xG31.h3NUdV3FX689AXEHtOf3b4LZSAwv0F.', 1, 'customer', NULL, '2026-04-08 06:05:53', '2026-04-08 06:05:53'),
(73, 750000121, 'Franco Baresi', 'Male', '1970-01-01', 'no-photo.png', '3205551021', 'francobaresi@football.com', NULL, '$2y$12$OY0bDF1G8e/QUP7BMxzvG.XkIHl8J40TgYCdgnF.l/uQXMro/jO7.', 1, 'customer', NULL, '2026-04-08 06:05:53', '2026-04-08 06:05:53'),
(74, 750000122, 'Bobby Charlton', 'Male', '1970-01-01', 'no-photo.png', '3205551022', 'bobbycharlton@football.com', NULL, '$2y$12$ZYhWFbYa9gDlKENkKaql0OM25KVilU/ecw6164f09m6MzzkM.nG7a', 1, 'customer', NULL, '2026-04-08 06:05:53', '2026-04-08 06:05:53'),
(75, 750000123, 'Romário', 'Male', '1970-01-01', 'no-photo.png', '3205551023', 'romário@football.com', NULL, '$2y$12$Gb4igCJZtD/q4jpmP9Fwz.Nsdyv39UWjDn8MCiq6W3Chi3g2F3NBm', 1, 'customer', NULL, '2026-04-08 06:05:53', '2026-04-08 06:05:53'),
(76, 750000124, 'Lev Yashin', 'Male', '1970-01-01', 'no-photo.png', '3205551024', 'levyashin@football.com', NULL, '$2y$12$4sKH2ScQQ9d6kcS4mBz1Iu/TbpfushDgSK99R49Je1LtFGgI.Bh9u', 1, 'customer', NULL, '2026-04-08 06:05:53', '2026-04-08 06:05:53'),
(77, 750000125, 'Gerd Müller', 'Male', '1970-01-01', 'no-photo.png', '3205551025', 'gerdmüller@football.com', NULL, '$2y$12$7z8RNRMxs4LkUuDRzOceAu6eREUDoyPw4TV4GAfz7KzHUGyBLIKv.', 1, 'customer', NULL, '2026-04-08 06:05:54', '2026-04-08 06:05:54'),
(78, 750000126, 'Kaká', 'Male', '1970-01-01', 'no-photo.png', '3205551026', 'kaká@football.com', NULL, '$2y$12$q2/W2kcc/CX7ZRhRrefkF.8aL/L6//GktgMccJkwoZoaSa/kliEz6', 1, 'customer', NULL, '2026-04-08 06:05:54', '2026-04-08 06:05:54'),
(79, 750000127, 'Thierry Henry', 'Male', '1970-01-01', 'no-photo.png', '3205551027', 'thierryhenry@football.com', NULL, '$2y$12$VSfNop0PVOewp8d/htUUNONUBCtGvGeb3RdrM/Gs1KJvjbxslgyHm', 1, 'customer', NULL, '2026-04-08 06:05:54', '2026-04-08 06:05:54'),
(80, 750000128, 'Eusébio', 'Male', '1970-01-01', 'no-photo.png', '3205551028', 'eusébio@football.com', NULL, '$2y$12$lO/77laSeh9aqRA20SKiU.hl7.qgYVFhhGMO8FlG6LypQPiKZpaRi', 1, 'customer', NULL, '2026-04-08 06:05:54', '2026-04-08 06:05:54'),
(81, 750000129, 'Karl-Heinz Rummenigge', 'Male', '1970-01-01', 'no-photo.png', '3205551029', 'karl-heinzrummenigge@football.com', NULL, '$2y$12$/cwAEpIPDTage15FJZR.wePs7TqrnxB/PtYBir9HslllfZ/tFfRJy', 1, 'customer', NULL, '2026-04-08 06:05:54', '2026-04-08 06:05:54'),
(82, 750000130, 'Ruud Gullit', 'Male', '1970-01-01', 'no-photo.png', '3205551030', 'ruudgullit@football.com', NULL, '$2y$12$b20Sc8B0E9aRfP4S0irkYeDBfsm7y3VsHY/ouYgbqFwZBv9q1JHQS', 1, 'customer', NULL, '2026-04-08 06:05:55', '2026-04-08 06:05:55'),
(83, 750000131, 'Paolo Rossi', 'Male', '1970-01-01', 'no-photo.png', '3205551031', 'paolorossi@football.com', NULL, '$2y$12$E93F2mrhQJd6jXFeCA.dOOFldb3abtbiHyWoPgbLi2XqsmSkl6VCG', 1, 'customer', NULL, '2026-04-08 06:05:55', '2026-04-08 06:05:55'),
(84, 750000132, 'Kenny Dalglish', 'Male', '1970-01-01', 'no-photo.png', '3205551032', 'kennydalglish@football.com', NULL, '$2y$12$qTLoQtlzI6xe81z3jjUvm.AcvSGepAXpd/gHFb8wsQChQCAAf3K3e', 1, 'customer', NULL, '2026-04-08 06:05:55', '2026-04-08 06:05:55'),
(85, 750000133, 'Didier Drogba', 'Male', '1970-01-01', 'no-photo.png', '3205551033', 'didierdrogba@football.com', NULL, '$2y$12$G4K1jWRg3W4qdzp7AJSnAePSakg0Lw642cU8j8Vsgd0031wxs1.nq', 1, 'customer', NULL, '2026-04-08 06:05:55', '2026-04-08 06:05:55'),
(86, 750000134, 'Wayne Rooney', 'Male', '1970-01-01', 'no-photo.png', '3205551034', 'waynerooney@football.com', NULL, '$2y$12$cL5.F2JGQnn7NhWrAE5QLu8/stpG2MP9rACaTKuOY5YaS6bUNweYe', 1, 'customer', NULL, '2026-04-08 06:05:55', '2026-04-08 06:05:55'),
(87, 750000135, 'David Beckham', 'Male', '1970-01-01', 'no-photo.png', '3205551035', 'davidbeckham@football.com', NULL, '$2y$12$ZoenJuVHWxVg/KiwNqWEWOe.e6VPMO1lc6X7/fv/tXv0UydOpyg/O', 1, 'customer', NULL, '2026-04-08 06:05:56', '2026-04-08 06:05:56'),
(88, 750000136, 'Luis Suárez', 'Male', '1970-01-01', 'no-photo.png', '3205551036', 'luissuárez@football.com', NULL, '$2y$12$vgGZ90tfAjTHbnO8cu06d.HMAd.rVvK9vpVtvQ.uTbtkKMAUA.5wq', 1, 'customer', NULL, '2026-04-08 06:05:56', '2026-04-08 06:05:56'),
(89, 750000137, 'Neymar Jr', 'Male', '1970-01-01', 'no-photo.png', '3205551037', 'neymarjr@football.com', NULL, '$2y$12$qK0akLVkWWXj5XUD/hJ95.3jTc60ertAl4jgbOyV.uovBJPezLJkO', 1, 'customer', NULL, '2026-04-08 06:05:56', '2026-04-08 06:05:56'),
(90, 750000138, 'Arjen Robben', 'Male', '1970-01-01', 'no-photo.png', '3205551038', 'arjenrobben@football.com', NULL, '$2y$12$bg8n1EcS3oPDExOjFPwebOeIftK4F/..pitpnk1W5JK63YGwF3Ud2', 1, 'customer', NULL, '2026-04-08 06:05:56', '2026-04-08 06:05:56'),
(91, 750000139, 'Frank Lampard', 'Male', '1970-01-01', 'no-photo.png', '3205551039', 'franklampard@football.com', NULL, '$2y$12$SBPwCxLjRsqoeIsVz7jrp.Ly.KVgXk0H9vqQo0SUQtGs1.5oitsCS', 1, 'customer', NULL, '2026-04-08 06:05:56', '2026-04-08 06:05:56'),
(92, 750000140, 'Steven Gerrard', 'Male', '1970-01-01', 'no-photo.png', '3205551040', 'stevengerrard@football.com', NULL, '$2y$12$bWedJsvaD.ToH8LOaxDBtuHnBEOITzbx9NqDKmu.ubfDSj//wZ1sq', 1, 'customer', NULL, '2026-04-08 06:05:57', '2026-04-08 06:05:57'),
(93, 750000141, 'Carles Puyol', 'Male', '1970-01-01', 'no-photo.png', '3205551041', 'carlespuyol@football.com', NULL, '$2y$12$QQrv59iRdchWIDo/kqeBle6WZWwbgSxXw1IwcsjXo3.sst8N39MMW', 1, 'customer', NULL, '2026-04-08 06:05:57', '2026-04-08 06:05:57'),
(94, 750000142, 'Iker Casillas', 'Male', '1970-01-01', 'no-photo.png', '3205551042', 'ikercasillas@football.com', NULL, '$2y$12$y7pikSoNo3D71nU5MqpCEuPv.CRbsrTqCOSPjjyX6q91IfEZ1.oki', 1, 'customer', NULL, '2026-04-08 06:05:57', '2026-04-08 06:05:57'),
(95, 750000143, 'Manuel Neuer', 'Male', '1970-01-01', 'no-photo.png', '3205551043', 'manuelneuer@football.com', NULL, '$2y$12$WzCGiF5T/D8Qb3.K/arvv.3e.a.eG34R04PJwA3sefEkMDp1bihdq', 1, 'customer', NULL, '2026-04-08 06:05:57', '2026-04-08 06:05:57'),
(96, 750000144, 'Dino Zoff', 'Male', '1970-01-01', 'no-photo.png', '3205551044', 'dinozoff@football.com', NULL, '$2y$12$PjRZfxBMxVCdkfn1VNVerOWfkHB2WS1OwRULEakNNHQifv0yZtP3S', 1, 'customer', NULL, '2026-04-08 06:05:57', '2026-04-08 06:05:57'),
(97, 750000145, 'Rivaldo', 'Male', '1970-01-01', 'no-photo.png', '3205551045', 'rivaldo@football.com', NULL, '$2y$12$6txUt.nk.Vz3B.S7vxKKNO78zwMh89kouD25td4Rf430VlGk.yoVW', 1, 'customer', NULL, '2026-04-08 06:05:58', '2026-04-08 06:05:58'),
(98, 750000146, 'Hristo Stoichkov', 'Male', '1970-01-01', 'no-photo.png', '3205551046', 'hristostoichkov@football.com', NULL, '$2y$12$yqzyCDuVMlbOgiljp4Q5o.pBcwBj5IsXIzkZoZ6UrOc2htXkw7n0u', 1, 'customer', NULL, '2026-04-08 06:05:58', '2026-04-08 06:05:58'),
(99, 750000147, 'Andrea Pirlo', 'Male', '1970-01-01', 'no-photo.png', '3205551047', 'andreapirlo@football.com', NULL, '$2y$12$EflrWp8tsdOwaNWjMzxXLO5lsu6XyBBaauV/4X0EcbXLZeNnFDOPq', 1, 'customer', NULL, '2026-04-08 06:05:58', '2026-04-08 06:05:58'),
(100, 750000148, 'Sergio Ramos', 'Male', '1970-01-01', 'no-photo.png', '3205551048', 'sergioramos@football.com', NULL, '$2y$12$pVXYPZB3p8k18AbtSCphXOz7L1KGibGA82kyz2kKIBVmEn6mTy2NC', 1, 'customer', NULL, '2026-04-08 06:05:58', '2026-04-08 06:05:58'),
(101, 750000149, 'Javier Zanetti', 'Male', '1970-01-01', 'no-photo.png', '3205551049', 'javierzanetti@football.com', NULL, '$2y$12$RXfJ/K.xD8sqCRs2nKyZiOwNNDLNoQAs8OMS3sYQwKPwmPSRSPYQ.', 1, 'customer', NULL, '2026-04-08 06:05:58', '2026-04-08 06:05:58'),
(102, 750000150, 'Claude Makélélé', 'Male', '1970-01-01', 'no-photo.png', '3205551050', 'claudemakélélé@football.com', NULL, '$2y$12$n0.8D50GLbrWtFvbWwA8Qu3uS.HvwkWZcl6A3d1b/Vn24MCewOUzS', 1, 'customer', NULL, '2026-04-08 06:05:59', '2026-04-08 06:05:59'),
(103, 750000151, 'Patrick Vieira', 'Male', '1970-01-01', 'no-photo.png', '3205551051', 'patrickvieira@football.com', NULL, '$2y$12$fd/kSvtsFNRZdDXwT.rP7ulv.ynCS9pV.q83Ed5MrNtjuLIogbBoy', 1, 'customer', NULL, '2026-04-08 06:05:59', '2026-04-08 06:05:59'),
(104, 750000152, 'Fernando Redondo', 'Male', '1970-01-01', 'no-photo.png', '3205551052', 'fernandoredondo@football.com', NULL, '$2y$12$bGhFZx35MqiMVqGZYQI18uXFKI6ESVTbQfSFN9cRjqTQ39HiJJfNu', 1, 'customer', NULL, '2026-04-08 06:05:59', '2026-04-08 06:05:59'),
(105, 750000153, 'Zico', 'Male', '1970-01-01', 'no-photo.png', '3205551053', 'zico@football.com', NULL, '$2y$12$VaItSqiy0tn/DrWUxtTrXu11NrWYW9mIoOD1X/BfvUSXdyQE0mBRy', 1, 'customer', NULL, '2026-04-08 06:05:59', '2026-04-08 06:05:59'),
(106, 750000154, 'Tostão', 'Male', '1970-01-01', 'no-photo.png', '3205551054', 'tostão@football.com', NULL, '$2y$12$U/.dj7tALbwEZEPjROLnxutnad0xtKKaMwR3QH.4WQRnLRU1Nfimq', 1, 'customer', NULL, '2026-04-08 06:05:59', '2026-04-08 06:05:59'),
(107, 750000155, 'Daniel Passarella', 'Male', '1970-01-01', 'no-photo.png', '3205551055', 'danielpassarella@football.com', NULL, '$2y$12$rgRBl.bwyPtS7Q9Un3ieB.yWe41CasJIVKzUqT.A.Ykq9x0RCeqr2', 1, 'customer', NULL, '2026-04-08 06:06:00', '2026-04-08 06:06:00'),
(108, 750000156, 'José Nasazzi', 'Male', '1970-01-01', 'no-photo.png', '3205551056', 'josénasazzi@football.com', NULL, '$2y$12$sK1BhKxDqTBuUuEVgfoRS.2eRqcYRVGKTXJhW7SJzCLFwEqZDA6ne', 1, 'customer', NULL, '2026-04-08 06:06:00', '2026-04-08 06:06:00'),
(109, 750000157, 'Obdulio Varela', 'Male', '1970-01-01', 'no-photo.png', '3205551057', 'obduliovarela@football.com', NULL, '$2y$12$gAVh8MKsaCcmmOTV49qZJ..I3jEs1vi7ncs6X2HMxc5kZectgxzkG', 1, 'customer', NULL, '2026-04-08 06:06:00', '2026-04-08 06:06:00'),
(110, 750000158, 'Hugo Sánchez', 'Male', '1970-01-01', 'no-photo.png', '3205551058', 'hugosánchez@football.com', NULL, '$2y$12$eEBv39iYSwQ616eBNqG8TevPn4vQf0oOCIrIRlaj7F6EpIXCFrauO', 1, 'customer', NULL, '2026-04-08 06:06:00', '2026-04-08 06:06:00'),
(111, 750000159, 'Raúl González', 'Male', '1970-01-01', 'no-photo.png', '3205551059', 'raúlgonzález@football.com', NULL, '$2y$12$..x/5WGSQD61tbNBW/PrVOLD84cgZoBjzc3Q0ctTE5ybbpyf9BeoG', 1, 'customer', NULL, '2026-04-08 06:06:00', '2026-04-08 06:06:00'),
(112, 750000160, 'Francesco Totti', 'Male', '1970-01-01', 'no-photo.png', '3205551060', 'francescototti@football.com', NULL, '$2y$12$08sIXCkZ6fWFS7yqAG/WdOriG9E5a3DvwtYs6nsi4jGfdm7XYmWxa', 1, 'customer', NULL, '2026-04-08 06:06:01', '2026-04-08 06:06:01'),
(113, 750000161, 'Clarence Seedorf', 'Male', '1970-01-01', 'no-photo.png', '3205551061', 'clarenceseedorf@football.com', NULL, '$2y$12$CJufK14NPbQCZHaWInfuceY2KbGHH7PPCg/cuBllnG46kKelxFKDm', 1, 'customer', NULL, '2026-04-08 06:06:01', '2026-04-08 06:06:01'),
(114, 750000162, 'Samuel Eto\'o', 'Male', '1970-01-01', 'no-photo.png', '3205551062', 'samueleto\'o@football.com', NULL, '$2y$12$U1zAFQVp9yCHG8Tr55IpYuCn4G3y6/NjjwQlJqSb3ayBM53S9blRy', 1, 'customer', NULL, '2026-04-08 06:06:01', '2026-04-08 06:06:01'),
(115, 750000163, 'George Weah', 'Male', '1970-01-01', 'no-photo.png', '3205551063', 'georgeweah@football.com', NULL, '$2y$12$WNuDsv6oyZXaZhWH6JfhiegEwu1c2ua13qlD.VGIg/bie2L8.QJba', 1, 'customer', NULL, '2026-04-08 06:06:01', '2026-04-08 06:06:01'),
(116, 750000164, 'Luka Modrić', 'Male', '1970-01-01', 'no-photo.png', '3205551064', 'lukamodrić@football.com', NULL, '$2y$12$4n1GKUMx7Q1NeuAyLOauNuXKYsX35yVAODvrRStscEmV0e6bpgfcW', 1, 'customer', NULL, '2026-04-08 06:06:01', '2026-04-08 06:06:01'),
(117, 750000165, 'Antoine Griezmann', 'Male', '1970-01-01', 'no-photo.png', '3205551065', 'antoinegriezmann@football.com', NULL, '$2y$12$IGA9uwvK.6Rvjos7bUzqkOYFZnzqm4uDIW9LqqXvZKFzM8cBox6fC', 1, 'customer', NULL, '2026-04-08 06:06:02', '2026-04-08 06:06:02'),
(118, 750000166, 'Kevin De Bruyne', 'Male', '1970-01-01', 'no-photo.png', '3205551066', 'kevindebruyne@football.com', NULL, '$2y$12$phj5GtIbLUYjfsuc.XXiY.3zWUmV2Mw7SZSOIaofqzXNvzsW7z9La', 1, 'customer', NULL, '2026-04-08 06:06:02', '2026-04-08 06:06:02'),
(119, 750000167, 'Robert Lewandowski', 'Male', '1970-01-01', 'no-photo.png', '3205551067', 'robertlewandowski@football.com', NULL, '$2y$12$QTcfzq4inuvtmTOXLtlzJ.IxHgv7YAQETSfPhcnuTNkEo//NxA6Fa', 1, 'customer', NULL, '2026-04-08 06:06:02', '2026-04-08 06:06:02'),
(120, 750000168, 'Harry Kane', 'Male', '1970-01-01', 'no-photo.png', '3205551068', 'harrykane@football.com', NULL, '$2y$12$jMW56IEi.I9ZaeO615LqduE4OIZ0D/lJJmaoyUxVcIyfgyibFNhM2', 1, 'customer', NULL, '2026-04-08 06:06:02', '2026-04-08 06:06:02'),
(121, 750000169, 'Kylian Mbappé', 'Male', '1970-01-01', 'no-photo.png', '3205551069', 'kylianmbappé@football.com', NULL, '$2y$12$L7QRgfrR3lfOsEp7ArJhPez3PS7jeDPn.4J6iY9fmQ8EmiKt6CZp6', 1, 'customer', NULL, '2026-04-08 06:06:02', '2026-04-08 06:06:02'),
(122, 750000170, 'Erling Haaland', 'Male', '1970-01-01', 'no-photo.png', '3205551070', 'erlinghaaland@football.com', NULL, '$2y$12$XuqKRn5.B7Gh3gIbZYnjXOPG/sjcJ5PYnTgi8xfnHBWbP9DJI.4lG', 1, 'customer', NULL, '2026-04-08 06:06:03', '2026-04-08 06:06:03'),
(123, 750000171, 'Virgil van Dijk', 'Male', '1970-01-01', 'no-photo.png', '3205551071', 'virgilvandijk@football.com', NULL, '$2y$12$XiQF8bhSjEIeo/6vlq11VuKA1CiCkBJ6tLuhK0k4eRs7AIc3aSfTC', 1, 'customer', NULL, '2026-04-08 06:06:03', '2026-04-08 06:06:03'),
(124, 750000172, 'Sadio Mané', 'Male', '1970-01-01', 'no-photo.png', '3205551072', 'sadiomané@football.com', NULL, '$2y$12$Dl780q0mwRR4U0E7Htja/O8bNlRZRI0yklU6ESKod2.CCuildrkkS', 1, 'customer', NULL, '2026-04-08 06:06:03', '2026-04-08 06:06:03'),
(125, 750000173, 'Mohamed Salah', 'Male', '1970-01-01', 'no-photo.png', '3205551073', 'mohamedsalah@football.com', NULL, '$2y$12$KYbO95l/cVkf7Oi2Yl9ThuawQxNs/FUiUFU/ZtnYDC0wB4v6HHV.C', 1, 'customer', NULL, '2026-04-08 06:06:03', '2026-04-08 06:06:03'),
(126, 750000174, 'Philipp Lahm', 'Male', '1970-01-01', 'no-photo.png', '3205551074', 'philipplahm@football.com', NULL, '$2y$12$wTWS6Z5RQg95w3uaOEtSce2d89ob1PmoACGkzhEc3dkjiV0BlWyJG', 1, 'customer', NULL, '2026-04-08 06:06:03', '2026-04-08 06:06:03'),
(127, 750000175, 'Sandro Mazzola', 'Male', '1970-01-01', 'no-photo.png', '3205551075', 'sandromazzola@football.com', NULL, '$2y$12$rtkJSiaglohAkecXEmmw.ehhdt22fwhgyNM1dGVvLCDVmfJl6xYSe', 1, 'customer', NULL, '2026-04-08 06:06:04', '2026-04-08 06:06:04'),
(128, 750000176, 'Gianni Rivera', 'Male', '1970-01-01', 'no-photo.png', '3205551076', 'giannirivera@football.com', NULL, '$2y$12$tyoVvIbQvpf3QFTA9DxXleMvPaxZBM60uDwR.tiHyTjq.8B8zds02', 1, 'customer', NULL, '2026-04-08 06:06:04', '2026-04-08 06:06:04'),
(129, 750000177, 'Helmut Rahn', 'Male', '1970-01-01', 'no-photo.png', '3205551077', 'helmutrahn@football.com', NULL, '$2y$12$hD8k.J1acFcIcbTWpPWP/uoVXjWlsKWwWaWbtL5OPFCOaw34BeQdG', 1, 'customer', NULL, '2026-04-08 06:06:04', '2026-04-08 06:06:04'),
(130, 750000178, 'Mario Kempes', 'Male', '1970-01-01', 'no-photo.png', '3205551078', 'mariokempes@football.com', NULL, '$2y$12$FeoFsS/FPs3.PVwezERh6Of4EKFYybx5p6fvO8l9oCacIV7.jCY92', 1, 'customer', NULL, '2026-04-08 06:06:04', '2026-04-08 06:06:04'),
(131, 750000179, 'Jairzinho', 'Male', '1970-01-01', 'no-photo.png', '3205551079', 'jairzinho@football.com', NULL, '$2y$12$2KH1hVFutQ34/YiPnXydT.a32aPyyVrIwB/GbfCLqG7.WXBeBoeEm', 1, 'customer', NULL, '2026-04-08 06:06:04', '2026-04-08 06:06:04'),
(132, 750000180, 'Carlos Alberto', 'Male', '1970-01-01', 'no-photo.png', '3205551080', 'carlosalberto@football.com', NULL, '$2y$12$dr95Dzr7/2pmS.q9nIqV9OqTj5MteotYFcDXLkCAm7uHwVM1rN6C.', 1, 'customer', NULL, '2026-04-08 06:06:05', '2026-04-08 06:06:05'),
(133, 750000181, 'Cafu', 'Male', '1970-01-01', 'no-photo.png', '3205551081', 'cafu@football.com', NULL, '$2y$12$4gDa5rd8e1TVdASiP87TpO4qk1wDdduh1yQ6xLmVMSU2PDRLVDBX6', 1, 'customer', NULL, '2026-04-08 06:06:05', '2026-04-08 06:06:05'),
(134, 750000182, 'Roberto Carlos', 'Male', '1970-01-01', 'no-photo.png', '3205551082', 'robertocarlos@football.com', NULL, '$2y$12$7ymUBQ8jIYFQtovkrHByAuiIXOzeIg70eZ7YfpQbvgYxGtFblJyxO', 1, 'customer', NULL, '2026-04-08 06:06:05', '2026-04-08 06:06:05'),
(135, 750000183, 'Nílton Santos', 'Male', '1970-01-01', 'no-photo.png', '3205551083', 'níltonsantos@football.com', NULL, '$2y$12$0FFUD5Q2s.RBczzV1f9XTOV6vYJPlNcIffm4Ks95WGX0OkAsnu3Pq', 1, 'customer', NULL, '2026-04-08 06:06:05', '2026-04-08 06:06:05'),
(136, 750000184, 'Socrates', 'Male', '1970-01-01', 'no-photo.png', '3205551084', 'socrates@football.com', NULL, '$2y$12$gJm3ZlfmXnT5w3ISu17uYeZS8FuyUbDp/Tet/H0EyU1vPIP1WWS.O', 1, 'customer', NULL, '2026-04-08 06:06:05', '2026-04-08 06:06:05'),
(137, 750000185, 'Falcão', 'Male', '1970-01-01', 'no-photo.png', '3205551085', 'falcão@football.com', NULL, '$2y$12$1gij.KOgrYItODIIRBvekuLMIiu5XsG6pPWs6u2HkcCxdUmAiYgJS', 1, 'customer', NULL, '2026-04-08 06:06:06', '2026-04-08 06:06:06'),
(138, 750000186, 'Claudio Caniggia', 'Male', '1970-01-01', 'no-photo.png', '3205551086', 'claudiocaniggia@football.com', NULL, '$2y$12$5rcOULy3Sj3VtiirvMCgf.I2PIpaKUWGtjYXYIqFGTjmu2.wgsJRO', 1, 'customer', NULL, '2026-04-08 06:06:06', '2026-04-08 06:06:06'),
(139, 750000187, 'Bixente Lizarazu', 'Male', '1970-01-01', 'no-photo.png', '3205551087', 'bixentelizarazu@football.com', NULL, '$2y$12$GwFwCw/Ktixq7DZXqkPFJOi/nb9ZOsJL0CL1N9C2GvoT/4ZJn9QOq', 1, 'customer', NULL, '2026-04-08 06:06:06', '2026-04-08 06:06:06'),
(140, 750000188, 'Jay-Jay Okocha', 'Male', '1970-01-01', 'no-photo.png', '3205551088', 'jay-jayokocha@football.com', NULL, '$2y$12$PYCu5kIdYt2yz5j/WgP/8O4mCNcHibQ4AHLN1.cZt1sGAgnykugXC', 1, 'customer', NULL, '2026-04-08 06:06:06', '2026-04-08 06:06:06'),
(141, 750000189, 'Yaya Touré', 'Male', '1970-01-01', 'no-photo.png', '3205551089', 'yayatouré@football.com', NULL, '$2y$12$xQ8aX9D2vISkTdQbcp0fEO2n46tR04X8mrEEudt/lRovA3utAeaz2', 1, 'customer', NULL, '2026-04-08 06:06:06', '2026-04-08 06:06:06'),
(142, 750000190, 'Peter Schmeichel', 'Male', '1970-01-01', 'no-photo.png', '3205551090', 'peterschmeichel@football.com', NULL, '$2y$12$jtkcvGCfKTTFIsL9QRC.Yu6Nqi0R7bAMto7EDbEMek7bOCMOxncg6', 1, 'customer', NULL, '2026-04-08 06:06:07', '2026-04-08 06:06:07'),
(143, 750000191, 'Brian Laudrup', 'Male', '1970-01-01', 'no-photo.png', '3205551091', 'brianlaudrup@football.com', NULL, '$2y$12$vRMNo7j9IPJIYemLThFefesHdB7AeFkpOZMlHF7LipAJ8w3f/KcKi', 1, 'customer', NULL, '2026-04-08 06:06:07', '2026-04-08 06:06:07'),
(144, 750000192, 'Michael Laudrup', 'Male', '1970-01-01', 'no-photo.png', '3205551092', 'michaellaudrup@football.com', NULL, '$2y$12$l634HVTZ.HOIMmxPJv2RWO0ovLPyynA.77QX1RIIGpWIQHyh9S9e2', 1, 'customer', NULL, '2026-04-08 06:06:07', '2026-04-08 06:06:07'),
(145, 750000193, 'Alan Shearer', 'Male', '1970-01-01', 'no-photo.png', '3205551093', 'alanshearer@football.com', NULL, '$2y$12$oYackU9uDOVX.Dl4AV1/AeWC2MLYdQ8c2GwPSbk7B30mbEeJzbLaS', 1, 'customer', NULL, '2026-04-08 06:06:07', '2026-04-08 06:06:07'),
(146, 750000194, 'Eric Cantona', 'Male', '1970-01-01', 'no-photo.png', '3205551094', 'ericcantona@football.com', NULL, '$2y$12$OKX./LyXbiO.M9EgB7MuZuB6TNWaQIPZwr3iqQ5hWd4dVVJsWVdUq', 1, 'customer', NULL, '2026-04-08 06:06:07', '2026-04-08 06:06:07'),
(147, 750000195, 'Gabriel Batistuta', 'Male', '1970-01-01', 'no-photo.png', '3205551095', 'gabrielbatistuta@football.com', NULL, '$2y$12$p/J170N9C9mNAC9/pO3PQuuG7yKDKJHCSOl0OpsUxCLgC5UOi7z.i', 1, 'customer', NULL, '2026-04-08 06:06:08', '2026-04-08 06:06:08'),
(148, 750000196, 'Zlatan Ibrahimović', 'Male', '1970-01-01', 'no-photo.png', '3205551096', 'zlatanibrahimović@football.com', NULL, '$2y$12$wyF/KgCVUBYnVH4bZOXBKuo8941m7cKAHSTpxkjEbgzaSieJLIdIa', 1, 'customer', NULL, '2026-04-08 06:06:08', '2026-04-08 06:06:08'),
(149, 750000197, 'Mesut Özil', 'Male', '1970-01-01', 'no-photo.png', '3205551097', 'mesutözil@football.com', NULL, '$2y$12$sWn4I.NCwQPD57vSXYP/G.vS0pbgrTs9XzHg9o765A8SpqNQ4RNni', 1, 'customer', NULL, '2026-04-08 06:06:08', '2026-04-08 06:06:08'),
(150, 750000198, 'Toni Kroos', 'Male', '1970-01-01', 'no-photo.png', '3205551098', 'tonikroos@football.com', NULL, '$2y$12$KVzeWQIRsLS5r3GsrAWhjefluBtw4TCpdn7NgveDI/vBQIsjDA84S', 1, 'customer', NULL, '2026-04-08 06:06:08', '2026-04-08 06:06:08'),
(151, 750000199, 'Riyad Mahrez', 'Male', '1970-01-01', 'no-photo.png', '3205551099', 'riyadmahrez@football.com', NULL, '$2y$12$9r8RPhbfaoaCbnt7bxWn5umzPn7she2rR4WhlZjqhPNOoSWn.MC.a', 1, 'customer', NULL, '2026-04-08 06:06:08', '2026-04-08 06:06:08'),
(152, 750000200, 'Vinícius Jr', 'Male', '1970-01-01', 'no-photo.png', '3205551100', 'viníciusjr@football.com', NULL, '$2y$12$yFgeuupYZg59pt9VlHb2FOBlic5.u0WhtBb0rgQe4dsRWKc1TU8Oa', 1, 'customer', NULL, '2026-04-08 06:06:09', '2026-04-08 06:06:09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adoptions`
--
ALTER TABLE `adoptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adoptions_user_id_foreign` (`user_id`),
  ADD KEY `adoptions_pet_id_foreign` (`pet_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adoptions`
--
ALTER TABLE `adoptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pets`
--
ALTER TABLE `pets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adoptions`
--
ALTER TABLE `adoptions`
  ADD CONSTRAINT `adoptions_pet_id_foreign` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`),
  ADD CONSTRAINT `adoptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
