-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 30 Sep 2026 pada 21.53
-- Versi server: 8.0.35
-- Versi PHP: 8.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dc_stream`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `name`, `created_at`) VALUES
(1, 'admin', '$2y$10$5jGqze5VxQtbHxgOJdX6ke2kbFnf.RSpcZfFIQUqLWMPgpxsoUniC', 'Administrator', '2026-06-03 10:15:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int NOT NULL,
  `app_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `maintenance_message` text,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `min_version_code` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `app_settings`
--

INSERT INTO `app_settings` (`id`, `app_enabled`, `maintenance_message`, `updated_at`, `min_version_code`) VALUES
(1, 0, 'Mohon tunggu, aplikasi sedang di update. Mohon update aplikasi di DC Store App.', '2026-06-05 18:31:39', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`) VALUES
(1, 'Movie', 'active', '2026-06-03 10:08:38'),
(2, 'Series', 'active', '2026-06-03 10:08:38'),
(3, 'Drama', 'active', '2026-06-03 10:08:38'),
(4, 'Action', 'active', '2026-06-03 10:08:38'),
(5, 'Anime', 'active', '2026-06-03 10:08:38'),
(6, 'TV Live', 'active', '2026-06-03 10:08:38'),
(7, 'Horror', 'active', '2026-06-03 13:08:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `devices`
--

CREATE TABLE `devices` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `devices`
--

INSERT INTO `devices` (`id`, `user_id`, `device_id`, `device_name`, `last_login`, `created_at`) VALUES
(38, 31, 'a4e21b6559cd3d40', 'OPPO CPH2333', '2026-09-27 16:50:23', '2026-09-26 18:44:24'),
(39, 31, '613305a9edf25e1a', 'SZMTC X1Lite', '2026-09-27 00:02:31', '2026-09-27 00:02:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `episodes`
--

CREATE TABLE `episodes` (
  `id` int NOT NULL,
  `film_id` int NOT NULL,
  `episode_number` int DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `video_url` text NOT NULL,
  `video_type` enum('hls','mp4') DEFAULT 'hls',
  `referer` text,
  `origin` text,
  `user_agent` text,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `episodes`
--

INSERT INTO `episodes` (`id`, `film_id`, `episode_number`, `title`, `video_url`, `video_type`, `referer`, `origin`, `user_agent`, `status`, `created_at`, `updated_at`) VALUES
(101, 37, 1, 'Play Now', 'https://server.vip-001.workers.dev/2026072519190522eb70b7/playlist.m3u8', 'hls', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'active', '2026-06-26 12:41:56', '2026-09-26 18:52:50'),
(102, 38, 1, 'Play Now', 'https://room.web-id.id/dilan-itb/dilan-itb-2026.m3u8', 'hls', '', '', '', 'active', '2026-09-26 18:47:51', '2026-09-26 18:47:51'),
(103, 39, 1, 'Play Now', 'https://stream.playcdn.de/playlist/e72aebe56682e5dcb8537f373af0f4d4/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 21:28:03', '2026-09-26 21:28:03'),
(104, 40, 1, 'Play Now', 'https://room.web-id.id/gic/gic-2026.m3u8', 'hls', '', '', '', 'active', '2026-09-26 21:34:15', '2026-09-26 21:36:56'),
(105, 41, 1, 'Play Now', 'https://stream.playcdn.de/playlist/ea1f84dda9d31504bca5afa472a164e7/2/480.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 21:41:58', '2026-09-26 21:43:07'),
(106, 42, 1, 'Play Now', 'https://stream.playcdn.de/playlist/2b000c2ac3c0413b195c3b696a648ef2/2/480.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 21:47:48', '2026-09-26 21:48:23'),
(107, 43, 1, 'Episode 1', 'https://stream.playcdn.de/playlist/9fb06cdadd68feb52518a338f9da8d71/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:15:03', '2026-09-26 22:15:03'),
(108, 43, 2, 'Episode 2', 'https://stream.playcdn.de/playlist/2418232c7b8ed072a479aa9b215e036d/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:15:37', '2026-09-26 22:16:15'),
(109, 43, 3, 'Episode 3', 'https://stream.playcdn.de/playlist/1f83f554c0cb66c2fc756f78509132e4/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:16:09', '2026-09-26 22:16:09'),
(110, 43, 4, 'Epiosde 4', 'https://stream.playcdn.de/playlist/2074cde9c08d89686e929f14648452d4/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:17:17', '2026-09-26 22:17:17'),
(111, 43, 5, 'Episode 5', 'https://stream.playcdn.de/playlist/a798a4dee5526834291b8b9b5bb9ece9/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:17:55', '2026-09-26 22:17:55'),
(112, 43, 6, 'Episode 6', 'https://stream.playcdn.de/playlist/9787a89220856379b12c5f702bfac583/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:19:02', '2026-09-26 22:19:02'),
(113, 43, 7, 'Episode 7', 'https://stream.playcdn.de/playlist/535ff463b11375f715c073ee42b7334d/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:21:13', '2026-09-26 22:21:13'),
(114, 43, 8, 'Episode 8', 'https://stream.playcdn.de/playlist/7982ad1ffc32361aa66db0f12ea99d8e/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:22:02', '2026-09-26 22:22:02'),
(115, 43, 9, 'Episode 9', 'https://stream.playcdn.de/playlist/0f9b7d5ae99fa9bb2502a6e56ff011b2/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:22:53', '2026-09-26 22:22:53'),
(116, 43, 10, 'Episode 10', 'https://stream.playcdn.de/playlist/77406d755ff68c81327ce308dfe930ab/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:23:34', '2026-09-26 22:23:34'),
(117, 43, 11, 'Episode 11', 'https://stream.playcdn.de/playlist/ce72f3ab339340002405366658281eba/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:24:17', '2026-09-26 22:24:17'),
(118, 43, 12, 'Episode 12', 'https://stream.playcdn.de/playlist/73edd6d3c82d0bfa94b57a455acaf617/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:24:56', '2026-09-26 22:24:56'),
(119, 43, 13, 'Episode 13', 'https://stream.playcdn.de/playlist/e8d34c5b14d4c6811677aaecd530e040/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:25:36', '2026-09-26 22:25:36'),
(120, 43, 14, 'Episode 14', 'https://stream.playcdn.de/playlist/5e80b8b3cc028ae4caa2784785abf476/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:26:17', '2026-09-26 22:26:17'),
(121, 43, 15, 'Episode 15', 'https://stream.playcdn.de/playlist/b6f672e5f96eefb213f9602f4bbc90ed/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:26:57', '2026-09-26 22:26:57'),
(122, 43, 16, 'Episode 16', 'https://stream.playcdn.de/playlist/d9869916b3a5aed4070598f9e4b91fb8/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:27:40', '2026-09-26 22:27:40'),
(123, 43, 17, 'Episode 17', 'https://stream.playcdn.de/playlist/9ed93e471b6ddecd6d37416dec74f1b0/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:28:20', '2026-09-26 22:28:20'),
(124, 43, 18, 'Episode 18', 'https://stream.playcdn.de/playlist/4edc96f599be669415d023a4448b9bc6/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:29:06', '2026-09-26 22:29:06'),
(125, 43, 19, 'Episode 19', 'https://stream.playcdn.de/playlist/4d5cf1fa4e6448059e897b742a07b77d/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:29:49', '2026-09-26 22:29:49'),
(126, 43, 20, 'Episode 20', 'https://stream.playcdn.de/playlist/d69ef93504c773caa9bb2c804220ac57/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:30:31', '2026-09-26 22:30:31'),
(127, 43, 21, 'Episode 21', 'https://stream.playcdn.de/playlist/28db4c3ac85a69c7caca682a6405b5ac/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:31:13', '2026-09-26 22:31:13'),
(128, 44, 1, 'Play Now', 'https://stream.playcdn.de/playlist/3f41ab63051ce848fe16cc41d6887039/2/480.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'active', '2026-09-26 22:36:50', '2026-09-26 22:36:50'),
(129, 45, 1, 'Episode 1', 'https://stream.playcdn.de/playlist/8c0a9e1a3297bba7d60c6a1256416563/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'active', '2026-09-26 22:41:40', '2026-09-26 22:41:40'),
(130, 45, 2, 'Episode 2', 'https://stream.playcdn.de/playlist/97128dbcc148174df5126d5616bf78e2/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'active', '2026-09-26 22:42:47', '2026-09-26 22:42:47'),
(131, 46, 1, 'Play Now', 'https://stream.playcdn.de/playlist/cdd5c4e9db57eef9843c3946b5c34aeb/2/480.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'active', '2026-09-26 22:49:42', '2026-09-26 22:49:42'),
(132, 47, 1, 'Play Now', 'https://stream.playcdn.de/playlist/b3d49b2a3681d8a1edddd97758a95cdf/2/480.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'active', '2026-09-26 22:52:32', '2026-09-26 22:52:32'),
(133, 48, 1, 'Play Now', 'https://stream.playcdn.de/playlist/9963448f871829f32d2acca886ac3aa9/2/480.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'active', '2026-09-26 22:54:15', '2026-09-26 22:54:15'),
(134, 49, 1, 'Play Now', 'https://stream.playcdn.de/playlist/9870e9c275668772cb8fdbb9ad13e7b6/2/480.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'active', '2026-09-26 22:56:06', '2026-09-26 22:56:06'),
(135, 50, 1, 'Play Now', 'https://room.web-id.id/id-26/id-26.m3u8', 'hls', '', '', '', 'active', '2026-09-27 15:19:52', '2026-09-27 15:19:52'),
(136, 51, 1, 'Play Now', 'https://server.token-media-002-muti21-de.workers.dev/202604040648418bdc47a5/playlist.m3u8', 'hls', 'https://embed.puthra.de/', 'https://embed.puthra.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36\r\n', 'active', '2026-09-27 15:30:15', '2026-09-27 15:30:15'),
(137, 52, 1, 'Play Now', 'https://stream.playcdn.de/playlist/5e40d3d976a8343559399ae0ba0b3696/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Linux\\; Android 9\\; Pixel 3a XL Build/PQ3B.190801.002\\; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/76.0.3809.111 Mobile Safari/537.36 GSA/10.33.5.21.arm64', 'active', '2026-09-27 15:33:59', '2026-09-27 15:33:59'),
(138, 53, 1, 'Play Now', 'https://stream.playcdn.de/playlist/e30393245917ce0b10d6c6b4d0d2c68e/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Linux\\; Android 10\\; Pixel 2 XL Build/QPP6.190730.005\\; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/76.0.3809.111 Mobile Safari/537.36 GSA/10.41.5.21.arm64', 'active', '2026-09-27 15:36:04', '2026-09-27 15:36:04'),
(139, 54, 1, 'Play Now', 'https://stream.playcdn.de/playlist/30bc8e2ff1240115f3a0f01395017727/2/480.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Macintosh\\; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36 OPR/62.0.3331.119', 'active', '2026-09-27 15:46:03', '2026-09-27 15:46:03'),
(140, 55, 1, 'Play Now', 'https://stream.playcdn.de/playlist/376543dc6374ddd87ece2c873c4e17ab/2/480.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'iTunes/12.9.6 (Windows\\; Microsoft Windows 10 x64 Enterprise Edition (Build 17763)\\; x64) AppleWebKit/7607.3009.0.19', 'active', '2026-09-27 15:48:43', '2026-09-27 15:48:43'),
(141, 56, 1, 'Play Now', 'https://stream.playcdn.de/playlist/96f8cb3549a41c96278fbdbd47925790/2/480.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko)', 'active', '2026-09-27 22:40:11', '2026-09-27 22:40:11'),
(142, 43, 22, 'Episode 22', 'https://stream.playcdn.de/playlist/3ce36375eeafdd7e855880a151ad0609/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77', 'active', '2026-09-29 22:23:38', '2026-09-29 22:23:38'),
(143, 43, 23, 'Episode 23', 'https://stream.playcdn.de/playlist/00575957aeeaab5ed491e1e8beb8d331/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'active', '2026-09-29 22:25:21', '2026-09-29 22:25:21'),
(144, 43, 24, 'Episode 24', 'https://stream.playcdn.de/playlist/e34cff2f085be705a2e1b192c47cf185/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'active', '2026-09-29 22:26:23', '2026-09-29 22:26:23'),
(145, 43, 25, 'Episode 25', 'https://stream.playcdn.de/playlist/207791e34002a64b8a4bb0f6a4052b5a/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'active', '2026-09-29 22:27:06', '2026-09-29 22:27:06'),
(146, 43, 26, 'Episode 26', 'https://stream.playcdn.de/playlist/5c185ba5fe185dd353b840092c6f67b0/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'active', '2026-09-29 22:27:44', '2026-09-29 22:27:44'),
(147, 43, 27, 'Episode 27', 'https://stream.playcdn.de/playlist/714fbc0da448fd769713052ab8b32d44/1/0.m3u8?x=1', 'hls', 'https://playcdn.de/', 'https://playcdn.de', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'active', '2026-09-29 22:28:20', '2026-09-29 22:28:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `films`
--

CREATE TABLE `films` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `type` enum('movie','series') DEFAULT 'movie',
  `poster_url` text,
  `backdrop_url` text,
  `description` text,
  `genre` varchar(255) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `rating` varchar(20) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `films`
--

INSERT INTO `films` (`id`, `category_id`, `title`, `slug`, `type`, `poster_url`, `backdrop_url`, `description`, `genre`, `year`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(37, 3, 'Penerbangan Terakhir 2026', 'penerbangan-terakhir-2026-37', 'movie', 'uploads/films/poster_1790423675_1879.jpg', 'uploads/films/backdrop_1790423675_9463.jpg', 'Film Penerbangan Terakhir menceritakan kisah kelam dan manipulatif di balik dunia aviasi yang berpusat pada Kapten Deva Angkasa (Jerome Kurnia), seorang pilot tampan dan karismatik', 'Drama, Indo', '2026', '', 'active', '2026-06-26 12:40:06', '2026-09-26 18:54:35'),
(38, 3, 'Dilan ITB 2026', 'dilan-itb-2026-38', 'movie', 'uploads/films/poster_1790423243_5229.jpg', 'uploads/films/backdrop_1790423243_6603.webp', 'Sinopsis dan Latar WaktuBerlatar belakang tahun 1997 dan masa transisi reformasi 1998.Mengisahkan Dilan sebagai mahasiswa Fakultas Seni Rupa dan Desain (FSRD) ITB yang sudah lebih dewasa dan tenang.Hubungan Dilan dan Cika (Anchika) diuji saat Dilan kembali dari Kuba dan menghadapi dinamika politik Indonesia', 'Drama,Romance,Indo', '2026', '7.8', 'active', '2026-09-26 18:47:23', '2026-09-26 21:29:29'),
(39, 1, 'The End of Oak Street (2026)', 'the-end-of-oak-street-2026-39', 'movie', 'uploads/films/poster_1790432682_6130.jpg', 'uploads/films/backdrop_1790432682_6873.jpg', 'The End of Oak Street - Keluarga Platt harus saling bahu-membahu untuk beradaptasi dengan lingkungan baru mereka setelah sebuah peristiwa kosmik misterius secara mendadak memindahkan seluruh area pemukiman pinggiran kota mereka ke tempat tak dikenal yang penuh ancaman mematikan', 'Mysteri, SCI-FI', '2026', '7.0', 'active', '2026-09-26 21:24:42', '2026-09-26 21:24:42'),
(40, 1, 'Ghost in the Cell 2026', 'ghost-in-the-cell-2026-40', 'movie', 'uploads/films/poster_1790433202_4713.jpg', 'uploads/films/backdrop_1790433202_4957.jpeg', 'Ghost in the Cell adalah film horor komedi gelap Indonesia tahun 2026 karya sutradara Joko Anwar yang menceritakan teror makhluk gaib dari hutan Kalimantan di sebuah lembaga pemasyarakatan yang kejam', 'Horror,Mystery,Indo', '2026', '9.0', 'active', '2026-09-26 21:33:22', '2026-09-26 21:33:22'),
(41, 1, 'Spider-Man: Brand New Day (2026)', 'spider-man-brand-new-day-2026-41', 'movie', 'uploads/films/poster_1790433627_5805.jpg', 'uploads/films/backdrop_1790433627_7725.jpg', 'Film Spider-Man: Brand New Day menceritakan kisah Peter Parker yang hidup sebatang kara dan berjuang sebagai pahlawan penuh waktu di New York setelah dunia melupakan identitas aslinya', 'Action,Adventure', '2026', '9.9', 'active', '2026-09-26 21:40:27', '2026-09-26 21:40:27'),
(42, 1, 'Legend of Qingqiu (2026)', 'legend-of-qingqiu-2026-42', 'movie', 'uploads/films/poster_1790434015_6246.jpg', 'uploads/films/backdrop_1790434015_2168.jpg', 'Film Legend of Qingqiu (2026) menceritakan kisah Luo Rong\'er, makhluk ilusi berbentuk murid rubah berekor sembilan yang diciptakan oleh Nine-Tailed Master untuk menangkap orang jahat', 'Drama,Action,Cina', '2026', '8.0', 'active', '2026-09-26 21:46:55', '2026-09-26 21:46:55'),
(43, 3, 'Sword God 2026', 'sword-god-2026-43', 'series', 'uploads/films/poster_1790435659_4847.jpg', 'uploads/films/backdrop_1790435659_4649.jpg', 'Cerita berpusat pada Zhao Feiyang, murid utama dari Sekte Pedang Surgawi (Heavenly Sword Sect) yang memiliki kitab legendaris Nine Heavens Codex (Kitab Sembilan Langit)', 'Action,Drama,Cina', '2026', '8.5', 'active', '2026-09-26 22:14:19', '2026-09-26 22:14:19'),
(44, 1, 'Wardriver (2026)', 'wardriver-2026-44', 'movie', 'uploads/films/poster_1790436970_2937.jpg', '', 'Film Wardriver (2026) menceritakan kisah Cole (Dane DeHaan), seorang hacker kelas bawah yang menjalani hidup sebagai wardriver—ia berkeliling kota dengan mobilnya untuk meretas jaringan Wi-Fi rentan dan mencuri data atau dana dari jarak jauh', 'Thriller,Hacker', '2026', '7.8', 'active', '2026-09-26 22:36:10', '2026-09-26 22:36:10'),
(45, 2, 'Love in the Moonlight: Redrawn - Season 1', 'love-in-the-moonlight-redrawn-season-1-45', 'movie', 'uploads/films/poster_1790437232_7685.jpg', '', 'Love in the Moonlight: Redrawn (Season 1) bukanlah serial drama fiksi atau kelanjutan cerita romantis baru, melainkan sebuah acara varietas (variety show) reuni spesial untuk merayakan ulang tahun ke-10 drama populer Love in the Moonlight', 'Drama,Korea', '2026', '9.1', 'active', '2026-09-26 22:40:32', '2026-09-26 22:40:32'),
(46, 1, 'Supergirl (2026)', 'supergirl-2026-46', 'movie', 'uploads/films/poster_1790437733_5377.webp', '', 'Dalam \"Supergirl\" (2026), Kara Zor-El bergabung dengan sekutu tak terduga untuk membalas dendam dan mencari keadilan di perjalanan antar bintang. Musuh baru muncul, mengancam keluarga dan rumahnya, memicu petualangan penuh aksi dan emosi. Siap-siap untuk menyaksikan kekuatan dan keberanian Supergirl!', 'Action', '2026', '7.0', 'active', '2026-09-26 22:48:53', '2026-09-26 22:48:53'),
(47, 1, 'The Death of Robin Hood (2026)', 'the-death-of-robin-hood-2026-47', 'movie', 'uploads/films/poster_1790437910_3728.webp', '', 'Dalam \"The Death of Robin Hood\" (2026), seorang Robin Hood yang terluka parah harus menghadapi masa lalunya yang kelam setelah bertahun-tahun melakukan kejahatan dan pembunuhan. Namun, kesempatan untuk menebus dosa datang dari seorang wanita misterius yang menawarkannya keselamatan', 'Action', '2026', '7.0', 'active', '2026-09-26 22:51:50', '2026-09-26 22:51:50'),
(48, 1, 'Murder Game (2026)', 'murder-game-2026-48', 'movie', 'uploads/films/poster_1790438025_7345.webp', '', 'Dalam \"Murder Game\" (2026), kisah berpusat pada Tide, seorang mantan pembunuh bayaran yang tiga tahun lalu mengkhianati organisasinya karena menolak melakukan perintah pembunuhan. Setelah berhasil meloloskan diri dari kematian, ia hidup dalam pengasingan di sebuah kota kecil dengan identitas baru sebagai Minghui. Bersama saudara perempuannya yang tunanetra, Mingzhu, ia mencoba menjalani kehidupan tenang dengan menjalankan sebuah kedai kopi. Namun, kedamaian mereka terancam ketika masa lalunya sebagai pembunuh mulai memburunya kembali, memaksa Tide untuk menghadapi konfrontasi yang mematikan demi melindungi satu-satunya keluarga yang ia miliki.', 'Action', '2026', '8.0', 'active', '2026-09-26 22:53:45', '2026-09-26 22:53:45'),
(49, 1, 'Mortal Kombat II (2026)', 'mortal-kombat-ii-2026-49', 'movie', 'uploads/films/poster_1790438137_4144.webp', '', 'Mortal Kombat II (2026) adalah film aksi petarungan yang seru, di mana pahlawan favorit penggemar -- kini bergabung dengan Johnny Cage -- harus bertarung satu sama lain dalam pertempuran ultimate untuk mengalahkan kekuasaan gelap Shao Kahn yang mengancam keberadaan Earthrealm dan para pendefendornya.', 'Action', '2026', '9.0', 'active', '2026-09-26 22:55:37', '2026-09-26 22:55:37'),
(50, 1, 'Ikatan Darah 2026', 'ikatan-darah-2026-50', 'movie', 'uploads/films/poster_1790494237_5267.webp', '', 'Seorang mantan atlet bela diri harus menghadapi jaringan rentenir untuk menyelamatkan adik laki-lakinya yang terjebak dalam hutang judi online dan membahayakan keselamatan keluarga mereka.', 'Action,Indo', '2026', '9.0', 'active', '2026-09-27 14:30:37', '2026-09-27 14:30:37'),
(51, 1, 'Pesugihan Sate Gagak (2025)', 'pesugihan-sate-gagak-2025-51', 'movie', 'uploads/films/poster_1790497733_4545.webp', '', 'Tiga sahabat terjebak di antara tekanan hidup dan janji kekayaan instan melalui ritual sate gagak. Tetapi ketika hantu mulai muncul tanpa henti, mereka harus memilih: terus melayani demi uang, atau berhenti sebelum semuanya menjadi di luar kendali.', 'Horror,Comedy,Indo', '2025', '8.5', 'active', '2026-09-27 15:28:53', '2026-09-27 15:28:53'),
(52, 1, 'One Last Shot (2026)', 'one-last-shot-2026-52', 'movie', 'uploads/films/poster_1790497976_5708.webp', '', 'One Last Shot - Seorang anggota Navy SEAL bernama Jake Harris harus bertindak cepat dan menghadapi bahaya besar demi menghentikan sekelompok tentara bayaran. Kelompok tersebut dipimpin oleh mantan rekan seperjuangannya yang telah kecewa dan berencana melumpuhkan seluruh jaringan pertahanan rudal Amerika Serikat', 'Action', '2026', '6.0', 'active', '2026-09-27 15:32:56', '2026-09-27 15:32:56'),
(53, 1, 'Mayday (2026)', 'mayday-2026-53', 'movie', 'uploads/films/poster_1790498123_1173.webp', '', 'Mayday - Misi pengintaian rahasia Letnan Troy Brennan di atas wilayah Uni Soviet berujung kekacauan saat pesawatnya jatuh di hutan belantara Rusia. Terjebak di belakang garis musuh demi menghindari penangkapan, kelangsungan hidupnya bergantung pada persekutuan tak terduga dengan seorang mantan agen KGB eksentrik. Soundtrack: Jump', 'Action', '2026', '9.4', 'active', '2026-09-27 15:35:23', '2026-09-27 15:35:23'),
(54, 1, 'Young Washington (2026)', 'young-washington-2026-54', 'movie', 'uploads/films/poster_1790498720_8397.webp', '', 'Dalam film \"Young Washington\" (2026), aksi petualangan seorang pemuda bernama George Washington akan memicu perang, pengkhianatan, dan pilihan mustahil yang akan membentuk seorang pemimpin hebat. Dengan balutan sejarah dan latar belakang perang, film ini akan membawa penonton ke dalam dunia penuh aksi dan petualangan yang menegangkan.', 'Action', '2026', '8.6', 'active', '2026-09-27 15:45:11', '2026-09-27 15:45:20'),
(55, 1, 'Colony (2026)', 'colony-2026-55', 'movie', 'uploads/films/poster_1790498892_3346.webp', '', 'Dalam film Colony (2026), seorang profesor bernama Se Jeong menghadiri konferensi bioteknologi yang berubah menjadi bencana ketika virus mutasi cepat dilepaskan. Ketika wabah menyebar dan orang yang terinfeksi mulai berubah, otoritas memblokir seluruh fasilitas. Se Jeong harus bertahan hidup dan mencari cara untuk menghentikan wabah tersebut sebelum terlambat', 'Action,Korea,Thriller,Adventure', '2026', '8.7', 'active', '2026-09-27 15:48:12', '2026-09-27 15:48:12'),
(56, 1, 'Blackout (2026)', 'blackout-2026-56', 'movie', 'uploads/films/poster_1790523469_6990.webp', '', 'Dalam \"Blackout\" (2026), aksi dan kejahatan berbaur ketika veteran dan penjahat terperangkap di sebuah gudang setelah serangan nuklir memporak-porandakan California. Mereka harus bertarung melawan perampok, radiasi, dan egosisme masing-masing untuk bertahan hidup di dunia yang sudah tidak memiliki batas antara baik dan jahat.', 'Action', '2026', '4.5', 'active', '2026-09-27 22:37:49', '2026-09-27 22:37:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `play_tokens`
--

CREATE TABLE `play_tokens` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `episode_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `expired_at` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `expired_at` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `token`, `device_id`, `expired_at`, `created_at`) VALUES
(51, 31, 'b94bdf4590fc8659f6bc0efb3edc2ad46ef96febb046ebc98a436bcb1445838e', '613305a9edf25e1a', '2026-10-27 00:02:31', '2026-09-27 00:02:31'),
(54, 31, '2b9e281543bdc1d131125d674403df2d2b8aafdf819dd0156148caef0b3bd4c1', 'a4e21b6559cd3d40', '2026-10-27 16:50:23', '2026-09-27 16:50:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `status` enum('pending','active','inactive','expired') DEFAULT 'pending',
  `max_devices` int DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `phone`, `expired_at`, `status`, `max_devices`, `created_at`) VALUES
(31, 'Doni212', '$2y$10$OjuLn0uYnInUOxc.GGbWzuXoNxve/sJ4gaeSWDqqGcdATUqMfJ.HG', 'Doni Damara', '087717778722', '2027-09-26 16:46:00', 'active', 10, '2026-09-26 16:46:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `watch_logs`
--

CREATE TABLE `watch_logs` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `film_id` int NOT NULL,
  `episode_id` int DEFAULT NULL,
  `progress_seconds` int DEFAULT '0',
  `duration_seconds` int DEFAULT '0',
  `watched_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `watch_logs`
--

INSERT INTO `watch_logs` (`id`, `user_id`, `film_id`, `episode_id`, `progress_seconds`, `duration_seconds`, `watched_at`) VALUES
(280, 31, 37, 101, 0, 0, '2026-09-26 18:44:28'),
(281, 31, 38, 102, 0, 0, '2026-09-26 18:48:01'),
(282, 31, 38, 102, 0, 0, '2026-09-26 18:48:20'),
(283, 31, 37, 101, 0, 0, '2026-09-26 18:54:57'),
(284, 31, 38, 102, 0, 0, '2026-09-26 20:09:49'),
(285, 31, 38, 102, 0, 0, '2026-09-26 20:13:11'),
(286, 31, 38, 102, 0, 0, '2026-09-26 21:06:06'),
(287, 31, 38, 102, 0, 0, '2026-09-26 21:06:33'),
(288, 31, 39, 103, 0, 0, '2026-09-26 21:28:28'),
(289, 31, 40, 104, 0, 0, '2026-09-26 21:35:19'),
(290, 31, 40, 104, 0, 0, '2026-09-26 21:37:26'),
(291, 31, 41, 105, 0, 0, '2026-09-26 21:43:37'),
(292, 31, 42, 106, 0, 0, '2026-09-26 21:48:42'),
(293, 31, 39, 103, 0, 0, '2026-09-26 22:57:40'),
(294, 31, 39, 103, 0, 0, '2026-09-26 23:07:43'),
(295, 31, 43, 108, 0, 0, '2026-09-27 00:02:48'),
(296, 31, 43, 109, 0, 0, '2026-09-27 00:17:11'),
(297, 31, 43, 110, 0, 0, '2026-09-27 00:27:12'),
(298, 31, 43, 111, 0, 0, '2026-09-27 00:37:11'),
(299, 31, 43, 112, 0, 0, '2026-09-27 00:49:37'),
(300, 31, 43, 113, 0, 0, '2026-09-27 01:04:56'),
(301, 31, 43, 114, 0, 0, '2026-09-27 01:16:43'),
(302, 31, 43, 115, 0, 0, '2026-09-27 01:32:07'),
(303, 31, 43, 116, 0, 0, '2026-09-27 01:44:33'),
(304, 31, 43, 117, 0, 0, '2026-09-27 01:55:35'),
(305, 31, 43, 118, 0, 0, '2026-09-27 02:06:42'),
(306, 31, 43, 119, 0, 0, '2026-09-27 02:18:42'),
(307, 31, 43, 120, 0, 0, '2026-09-27 02:29:45'),
(308, 31, 41, 105, 0, 0, '2026-09-27 14:49:49'),
(309, 31, 46, 131, 0, 0, '2026-09-27 14:52:24'),
(310, 31, 50, 135, 0, 0, '2026-09-27 15:20:01'),
(311, 31, 51, 136, 0, 0, '2026-09-27 15:36:29'),
(312, 31, 52, 137, 0, 0, '2026-09-27 15:36:47'),
(313, 31, 53, 138, 0, 0, '2026-09-27 15:36:56'),
(314, 31, 55, 140, 0, 0, '2026-09-27 15:50:22'),
(315, 31, 55, 140, 0, 0, '2026-09-27 15:50:30'),
(316, 31, 55, 140, 0, 0, '2026-09-27 16:08:02'),
(317, 31, 55, 140, 0, 0, '2026-09-27 16:11:47'),
(318, 31, 55, 140, 0, 0, '2026-09-27 16:16:41'),
(319, 31, 54, 139, 0, 0, '2026-09-27 16:17:15'),
(320, 31, 55, 140, 0, 0, '2026-09-27 16:32:00'),
(321, 31, 50, 135, 0, 0, '2026-09-27 16:34:48'),
(322, 31, 55, 140, 0, 0, '2026-09-27 16:43:43'),
(323, 31, 54, 139, 0, 0, '2026-09-27 16:43:54'),
(324, 31, 54, 139, 0, 0, '2026-09-27 16:44:08'),
(325, 31, 55, 140, 0, 0, '2026-09-27 16:44:15'),
(326, 31, 55, 140, 0, 0, '2026-09-27 16:47:59'),
(327, 31, 55, 140, 0, 0, '2026-09-27 18:55:25'),
(328, 31, 54, 139, 0, 0, '2026-09-27 18:55:31'),
(329, 31, 56, 141, 0, 0, '2026-09-27 22:40:31'),
(330, 31, 43, 120, 0, 0, '2026-09-27 22:41:12'),
(331, 31, 43, 121, 0, 0, '2026-09-27 22:51:50'),
(332, 31, 43, 122, 0, 0, '2026-09-27 23:04:28'),
(333, 31, 43, 123, 0, 0, '2026-09-27 23:20:17'),
(334, 31, 56, 141, 0, 0, '2026-09-28 15:59:08'),
(335, 31, 43, 123, 0, 0, '2026-09-28 21:46:31'),
(336, 31, 43, 123, 0, 0, '2026-09-28 23:03:45'),
(337, 31, 43, 124, 0, 0, '2026-09-28 23:09:46'),
(338, 31, 43, 125, 0, 0, '2026-09-28 23:19:16'),
(339, 31, 43, 126, 0, 0, '2026-09-28 23:28:50'),
(340, 31, 43, 126, 0, 0, '2026-09-29 21:58:15'),
(341, 31, 43, 127, 0, 0, '2026-09-29 22:09:18'),
(342, 31, 43, 142, 0, 0, '2026-09-29 22:28:33'),
(343, 31, 43, 143, 0, 0, '2026-09-29 22:42:59'),
(344, 31, 43, 144, 0, 0, '2026-09-29 22:52:42');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_device` (`user_id`,`device_id`);

--
-- Indeks untuk tabel `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_id` (`film_id`);

--
-- Indeks untuk tabel `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `play_tokens`
--
ALTER TABLE `play_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `episode_id` (`episode_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `watch_logs`
--
ALTER TABLE `watch_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `episode_id` (`episode_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `episodes`
--
ALTER TABLE `episodes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT untuk tabel `films`
--
ALTER TABLE `films`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `play_tokens`
--
ALTER TABLE `play_tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `watch_logs`
--
ALTER TABLE `watch_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `episodes`
--
ALTER TABLE `episodes`
  ADD CONSTRAINT `episodes_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `play_tokens`
--
ALTER TABLE `play_tokens`
  ADD CONSTRAINT `play_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `play_tokens_ibfk_2` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `watch_logs`
--
ALTER TABLE `watch_logs`
  ADD CONSTRAINT `watch_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `watch_logs_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `watch_logs_ibfk_3` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
