-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 17, 2023 at 09:47 AM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u276671220_crm_company`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connect_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `logo_id` varchar(255) DEFAULT NULL,
  `contact` varchar(255) NOT NULL,
  `business_email` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `abn` varchar(255) DEFAULT NULL,
  `website` varchar(255) NOT NULL,
  `trading_name` varchar(255) DEFAULT NULL,
  `rto_code` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `admin` int(11) NOT NULL,
  `super_admin` smallint(6) DEFAULT 0,
  `app_id` varchar(255) DEFAULT NULL,
  `fb_ac_credential` text NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `form` varchar(255) DEFAULT NULL,
  `business_type` int(11) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `package_renew_code` varchar(255) DEFAULT NULL,
  `scrapped_time` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `connect_id`, `name`, `description`, `logo_id`, `contact`, `business_email`, `address`, `abn`, `website`, `trading_name`, `rto_code`, `country_name`, `admin`, `super_admin`, `app_id`, `fb_ac_credential`, `secret_key`, `form`, `business_type`, `active`, `package_renew_code`, `scrapped_time`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'acct_1MnvNBQV2uO6Z0J1', 'ITEC', 'ITECOUNSEL', '64', '121212122', 'itecounceel@gamil.com', 'address123', '3333333', 'https://itecounsel.com', 'ITECOUNSEL', '454545', 'Australia', 32, 0, '828010728641421', 'EAALxEkVZA040BO9GzjM0ZCi9o9qVBxslLZAWZB1IO3FXra1jAUcjWZCTrV9pz3oHe5K5lK1YV4idBx9qsx8Bk5Gc63IcsPmBkE95PDW7Bod5ZAT2apdnmlCsc0bju60tObrwwlHBozm8bf1DOHQZAzhfAQK81wb96qzyF123Ne3kRm6T86k64SmQUuDW6LRoUgIy7cuK58fkSXVgqnx', 'b40140b84bf834ac80b69235c8007eb7', 'Not Added Yet', 1, 1, '', NULL, NULL, '2022-10-29 22:48:52', '2023-11-27 02:46:23'),
(2, 'acct_1MnDkGQdG5wrVkEv', 'Noble Training Academy', 'Welcome to Noble Training Academy (NTA), where we believe that a quality education should be accessible to everyone. Our college offers an incredible range of courses designed to equip you with the skills and knowledge you need to thrive in today\'s competitive job market.', '41', '6454598', 's@gmail.com', 'asdasd', '6666', 'https://nta.nsw.edu.au', 'itec', '5555', 'Australia', 62, 0, '597046535433319', 'EAAIfArqorGcBAFFqpBykoJ7qzAuaT2KxM7sCadiItM4u8hGvzhCi0gQnj4SJGKBg6yPrfwv6DZAI6y2jdNBS2mUETB3bE1UedDFDdhZCLyQ4UjkAKsAm4BGil0AUAtWUVoJZCjZAyo98RtqHGUPsdqZAfvpTxycRQCzZC84TTKV0ngl0HQnCKk', '908968f0a8cd6a5729bad74a18e63c9f', 'Not Added Yet', 1, 0, NULL, NULL, NULL, '2022-10-29 22:49:00', '2023-08-16 09:06:01'),
(15, NULL, 'ATR', 'Alpha Training and Recognition', '58', '0549656983', 'Admin@atr.edu.au', 'Www.atr.edu.au', 'BN666666666', 'Www.atr.edu.au', 'ATR', '45282', 'Australia', 179, 0, '692824332889259', 'EAAJ2HrxA7KsBO7Mfzp4EDUg8gYJaV338KxHO8uau35MJgF2pwChh69TPp42YaWNPIvJPcaL4I1j1Ht14fMTWrU1gO27lpVn8iZB8bwwniF9FzwjLLPMWCmQtiZBW4xb0bG3pHzxhhEeR12rTakSdRiPtNCkTpxmTEOm6k5Xqeby7I5XvigLEu3RHNdZBHaZCukkijCrxuHIdLCrV', '25ab70a484a1d485ddf3da7a3613328b', 'Not Added Yet', 1, 1, NULL, NULL, NULL, '2023-08-13 13:10:34', '2023-08-14 11:44:26'),
(24, NULL, 'Unique College of Technology (UCT)', 'Unique College of Technology (UCT) is a Registered Training Organisation (RTO) and expert provider of nationally recognised training since 2007. Providing the unstoppable achievers with the opportunity to realise their ambitions through lifelong education and training.', '67', '1300 905 858', 'admin@uct.edu.au', 'Level 1, 7 Greenfield Pde Bankstown', '91358', 'uct.edu.au/', 'UCT', '91358', 'Australia', 194, 0, '181210391642019', 'EAACkz1UFZC6MBO8ktmmBDlm8EmbM4dH29leZC5oqjOOGJSHKABMtWtYafYs0vmWZCl408pH95aLHi09MfZALRHCxy6qYVVAscqJEFeNOdHZBNBxjkxkr34pmBoBe4lh6KswkVdxB9IdZCwgQCUvZBEbGvVHHGDudV63DbZCvwMJXqihUFudxwPzFlsUDCRcLGx3T8Hhf7NVuaOa6A9PE', '717de931fea337508bd9bfc4b9691905', 'Not Added Yet', 1, 1, NULL, NULL, NULL, '2023-08-16 09:53:39', '2023-11-27 03:00:09'),
(25, NULL, 'Quadque Technologies', 'No details added', '60', '01765276560', 'info@quadque.tech', 'Level -7, 8/C, F.R Tower, Sukrabad, PanthaPath 1207 Dhaka, D', 'Quadque Technologies', 'www.quadque.tech/', '00000', '0000', NULL, 196, 0, NULL, 'Not Added Yet', 'Not Added Yet', 'Not Added Yet', 1, 1, NULL, NULL, NULL, '2023-08-16 12:14:24', '2023-08-17 10:59:47'),
(27, NULL, 'NTA', 'RTO', '63', '0421814485', 'enquiries@nta.nsw.edu.au', 'LEVEL 1/7 Greenfield Parade, Bankstown NSW 2200', '33146254702', 'https://nta.nsw.edu.au/', 'Elite Training & Development Pty Ltd', '70201', 'Australia', 200, 0, '213956734704288', 'EAADCl68rWqABOyQEckZAZAHUktPhcLdHXJaDpH8jAmyZBkccZATZBSNsMEbooezQcBRkYg82nZAiMBYG0MdyGTi9WnEN2c5a3CUx8mHsfIP8nskUe750znCwl4z2ZCBfVXK1xp11iDl5i3cUKmXUgevFlz8OGEw0ykzaSripX9heyvnD0MVZCgZAVKonibBzjRQgI', '5b70703c138aa255fda8437f07962a47', 'Not Added Yet', 1, 1, NULL, NULL, NULL, '2023-08-22 03:48:52', '2023-11-06 05:09:37'),
(28, NULL, 'ITEC - Melbourne', NULL, '', '0434245069', 'admin.vic@itecounsel.com', 'Melbourne', '00', 'https://itecounsel.com/', 'ITEC', '00', 'Australia', 209, 0, '', 'Not Added Yet', 'Not Added Yet', NULL, 1, 1, NULL, NULL, NULL, '2023-08-22 07:19:41', '2023-08-22 07:19:41'),
(30, NULL, 'AIA', 'AIA', '69', '0421814485', 'hr@itecounsel.com', 'Level 16 9-13 Castlereagh St SYDNEY NSW 2000', '26 639 249 933', 'https://training.gov.au/Organisation/Details/45667', 'AIA', '45667', 'Australia', 247, 0, '812571527222447', 'EAALjB408FK8BO9rLOEdZB3UhiTUvjIWtzVoVkf8BWyoIfkZBzESlxU7s8mySEkzNrBzmCsZCEZC3JwBcScZC49YLhUQFl5neGRZAT0gdiFO2SKsZAi0b8rVW3daO8dTv0KYewBdwIwsx3lPTg3meZCHqOTMgJbL7v63J3as4bivv2g9g9SAbCiMEDMhk6Ui46ZBnLtYVNsjqU6sBqbB0b', 'b7a062d525f4199381384779127baa96', 'Not Added Yet', 1, 1, NULL, NULL, NULL, '2023-09-27 04:49:47', '2023-11-06 05:15:28');

-- --------------------------------------------------------

--
-- Table structure for table `company_notice`
--

CREATE TABLE `company_notice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `notice_title` varchar(255) DEFAULT NULL,
  `notice_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_notice`
--

INSERT INTO `company_notice` (`id`, `client_id`, `notice_title`, `notice_description`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'Update 1 Two', 'Content update', '2022-10-13 01:29:43', '2022-10-19 01:19:49', 0),
(2, 1, 'Update 1 Two', 'Content update', '2022-10-13 01:30:35', '2022-10-19 01:23:35', 0),
(3, 2, 'title of message', 'this is the message', '2022-12-20 22:32:22', '2023-03-12 04:38:39', 1),
(4, 2, 'notice title 2', 'notice message body 2', '2023-03-12 04:39:11', '2023-03-12 04:41:52', 0),
(5, 2, 'notice title2', 'notice body 2', '2023-03-12 04:42:08', '2023-03-12 04:42:08', 1),
(6, 2, 'hi', 'hi', '2023-03-14 14:52:23', '2023-03-14 14:52:29', 0),
(7, 1, 'Welcome', 'Welcome to CRM', '2023-03-22 09:58:40', '2023-03-22 09:58:50', 0),
(8, 1, 'Test', 'Today is off', '2023-03-28 04:26:18', '2023-05-08 07:21:56', 0),
(9, 1, 'asdasd', 'asdasd', '2023-05-02 05:35:09', '2023-05-02 05:35:13', 0),
(10, 1, 'Trade23', 'Hello....', '2023-05-08 07:22:18', '2023-05-08 07:22:40', 0),
(11, 1, 'hello hiiiiiiiiiiiii', 'hiiiiiiiiiii byeeeeeeeeee', '2023-05-08 07:34:21', '2023-05-08 07:34:49', 0),
(12, 1, 'ada', 'adasd', '2023-05-08 19:35:56', '2023-05-10 09:02:18', 0),
(13, 1, 'Edit All Courses Edit All Courses', 'Edit All Courses Edit All Courses', '2023-05-10 09:02:15', '2023-06-05 08:06:30', 0),
(14, 1, 'tomorrow is holiday', 'tomorrow is holiday  - office will be closed', '2023-06-05 08:07:00', '2023-06-05 08:07:07', 0),
(15, 1, 'tomorrow is holiday', 'tomorrow is holiday - office will be closed.', '2023-06-05 08:07:34', '2023-10-08 23:31:23', 0),
(16, 1, 'lead', 'dscc', '2023-09-11 07:06:51', '2023-09-11 07:06:56', 0);

-- --------------------------------------------------------

--
-- Table structure for table `company_sales_employee`
--

CREATE TABLE `company_sales_employee` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_sales_employee`
--

INSERT INTO `company_sales_employee` (`id`, `company_id`, `user_id`, `active`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 1, NULL, '2022-11-01 16:13:14', '2022-11-01 16:13:14'),
(2, 1, 4, 1, NULL, '2022-11-01 16:14:11', '2022-11-01 16:14:11'),
(3, 1, 31, 1, NULL, '2022-11-01 17:44:45', '2022-11-01 17:44:45'),
(4, 2, 32, 1, NULL, '2022-11-01 17:45:40', '2022-11-01 17:45:40'),
(5, 2, 33, 1, NULL, '2022-11-01 17:46:28', '2022-11-01 17:46:28'),
(6, 2, 34, 1, NULL, '2022-11-01 18:09:38', '2022-11-01 18:09:38'),
(7, 2, 35, 1, NULL, '2022-11-01 18:12:21', '2022-11-01 18:12:21'),
(8, 2, 42, 1, NULL, '2022-11-01 18:24:08', '2022-11-01 18:24:08'),
(9, 2, 43, 1, NULL, '2022-11-01 18:26:18', '2022-11-01 18:26:18'),
(10, 2, 44, 1, NULL, '2022-11-01 18:26:47', '2022-11-01 18:26:47'),
(11, 2, 45, 1, NULL, '2022-11-01 18:27:10', '2022-11-01 18:27:10'),
(12, 2, 46, 1, NULL, '2022-11-01 18:27:33', '2022-11-01 18:27:33'),
(13, 2, 47, 1, NULL, '2022-11-01 18:28:09', '2022-11-01 18:28:09'),
(14, 3, 48, 1, NULL, '2022-11-01 18:28:59', '2022-11-01 18:28:59'),
(15, 3, 49, 1, NULL, '2022-11-01 18:29:39', '2022-11-01 18:29:39'),
(16, 3, 50, 1, NULL, '2022-11-01 18:45:56', '2022-11-01 18:45:56'),
(17, 3, 51, 1, NULL, '2022-11-01 18:46:42', '2022-11-01 18:46:42'),
(18, 4, 52, 1, NULL, '2022-11-01 18:55:18', '2022-11-01 18:55:18'),
(19, 4, 53, 1, NULL, '2022-11-01 18:58:22', '2022-11-01 18:58:22'),
(20, 4, 54, 1, NULL, '2022-11-01 18:58:48', '2022-11-01 18:58:48'),
(21, 5, 55, 1, NULL, '2022-11-01 20:45:14', '2022-11-01 20:45:14'),
(22, 5, 56, 1, NULL, '2022-11-01 20:47:02', '2022-11-01 20:47:02'),
(23, 6, 58, 1, NULL, '2022-11-01 21:03:51', '2022-11-01 21:03:51'),
(24, 6, 59, 1, NULL, '2022-11-01 21:04:08', '2022-11-01 21:04:08'),
(25, 8, 19, 1, NULL, '2022-11-14 00:28:32', '2022-11-14 00:28:32'),
(26, 9, 66, 1, NULL, '2023-01-09 07:26:03', '2023-01-09 07:26:03'),
(27, 10, 68, 1, NULL, '2023-02-13 10:05:17', '2023-02-13 10:05:17'),
(28, 7, 69, 1, NULL, '2023-02-16 06:33:24', '2023-02-16 06:33:24'),
(29, 1, 71, 1, NULL, '2023-02-20 05:52:53', '2023-02-20 05:52:53'),
(30, 1, 72, 1, NULL, '2023-02-20 05:53:41', '2023-02-20 05:53:41'),
(31, 1, 74, 1, NULL, '2023-02-20 07:04:57', '2023-02-20 07:04:57'),
(32, 11, 77, 1, NULL, '2023-03-12 03:18:53', '2023-03-12 03:18:53'),
(33, 2, 78, 1, NULL, '2023-03-12 03:46:14', '2023-03-12 03:46:14'),
(34, 2, 79, 1, NULL, '2023-03-12 03:52:18', '2023-03-12 03:52:18'),
(35, 2, 80, 1, NULL, '2023-03-12 04:08:06', '2023-03-12 04:08:06'),
(36, 1, 101, 1, NULL, '2023-03-22 17:25:12', '2023-03-22 17:25:12'),
(37, 1, 103, 1, NULL, '2023-03-23 05:25:53', '2023-03-23 05:25:53'),
(38, 1, 104, 1, NULL, '2023-03-23 05:37:10', '2023-03-23 05:37:10'),
(39, 1, 106, 1, NULL, '2023-03-23 05:52:29', '2023-03-23 05:52:29'),
(40, 2, 108, 1, NULL, '2023-04-05 08:37:37', '2023-04-05 08:37:37'),
(41, 2, 109, 1, NULL, '2023-04-05 08:42:51', '2023-04-05 08:42:51'),
(42, 1, 110, 1, NULL, '2023-04-26 04:34:01', '2023-04-26 04:34:01'),
(43, 1, 111, 1, NULL, '2023-04-26 04:51:20', '2023-04-26 04:51:20'),
(44, 1, 112, 1, NULL, '2023-04-26 04:54:31', '2023-04-26 04:54:31'),
(45, 1, 113, 1, NULL, '2023-04-26 04:57:53', '2023-04-26 04:57:53'),
(46, 1, 114, 1, NULL, '2023-04-26 05:00:32', '2023-04-26 05:00:32'),
(47, 1, 115, 1, NULL, '2023-04-26 05:04:35', '2023-04-26 05:04:35'),
(48, 1, 116, 0, NULL, '2023-04-26 05:07:12', '2023-08-22 10:20:49'),
(49, 1, 117, 1, NULL, '2023-04-26 05:08:15', '2023-04-26 05:08:15'),
(50, 1, 118, 1, NULL, '2023-04-26 05:09:21', '2023-04-26 05:09:21'),
(51, 1, 119, 1, NULL, '2023-04-26 05:12:18', '2023-04-26 05:12:18'),
(52, 1, 120, 1, NULL, '2023-04-26 05:13:47', '2023-04-26 05:13:47'),
(53, 1, 121, 1, NULL, '2023-04-26 05:15:36', '2023-04-26 05:15:36'),
(54, 1, 122, 1, NULL, '2023-04-26 05:17:19', '2023-04-26 05:17:19'),
(55, 1, 123, 1, NULL, '2023-04-26 05:18:40', '2023-04-26 05:18:40'),
(56, 1, 124, 1, NULL, '2023-04-26 05:19:26', '2023-04-26 05:19:26'),
(57, 1, 125, 1, NULL, '2023-04-26 05:21:27', '2023-04-26 05:21:27'),
(58, 1, 126, 1, NULL, '2023-04-26 05:22:49', '2023-04-26 05:22:49'),
(59, 1, 142, 1, NULL, '2023-05-11 03:37:47', '2023-05-11 03:37:47'),
(60, 1, 143, 1, NULL, '2023-05-11 03:45:06', '2023-05-11 03:45:06'),
(61, 1, 144, 1, NULL, '2023-05-11 03:47:25', '2023-05-11 03:47:25'),
(62, 1, 145, 1, NULL, '2023-05-11 03:56:45', '2023-05-11 03:56:45'),
(63, 1, 146, 1, NULL, '2023-05-11 04:02:08', '2023-05-11 04:02:08'),
(64, 1, 147, 1, NULL, '2023-05-11 04:09:29', '2023-05-11 04:09:29'),
(65, 1, 148, 1, NULL, '2023-05-11 04:10:44', '2023-05-11 04:10:44'),
(66, 1, 150, 1, NULL, '2023-05-11 04:38:46', '2023-05-11 04:38:46'),
(67, 1, 151, 1, NULL, '2023-05-11 04:39:28', '2023-05-11 04:39:28'),
(68, 1, 152, 1, NULL, '2023-05-11 05:02:48', '2023-05-11 05:02:48'),
(69, 1, 153, 1, NULL, '2023-05-11 05:04:04', '2023-05-11 05:04:04'),
(70, 1, 154, 1, NULL, '2023-07-13 06:25:25', '2023-07-13 06:25:25'),
(71, 1, 155, 1, NULL, '2023-07-13 06:26:30', '2023-07-13 06:26:30'),
(72, 1, 156, 1, NULL, '2023-07-13 07:54:54', '2023-07-13 07:54:54'),
(73, 1, 157, 1, NULL, '2023-07-16 11:10:42', '2023-07-16 11:10:42'),
(74, 1, 158, 1, NULL, '2023-07-23 10:31:16', '2023-07-23 10:31:16'),
(75, 1, 159, 1, NULL, '2023-08-08 05:59:57', '2023-08-08 05:59:57'),
(76, 1, 160, 1, NULL, '2023-08-10 04:25:17', '2023-08-10 04:25:17'),
(77, 1, 161, 1, NULL, '2023-08-10 04:26:23', '2023-08-10 04:26:23'),
(78, 1, 162, 1, NULL, '2023-08-10 07:09:51', '2023-08-10 07:09:51'),
(79, 1, 163, 1, NULL, '2023-08-10 08:04:57', '2023-08-10 08:04:57'),
(80, 1, 164, 1, NULL, '2023-08-10 08:05:34', '2023-08-10 08:05:34'),
(81, 1, 165, 1, NULL, '2023-08-13 04:59:14', '2023-08-13 04:59:14'),
(82, 1, 166, 1, NULL, '2023-08-13 05:02:26', '2023-08-13 05:02:26'),
(83, 1, 167, 1, NULL, '2023-08-13 05:20:42', '2023-08-13 05:20:42'),
(84, 1, 168, 1, NULL, '2023-08-13 05:40:00', '2023-08-13 05:40:00'),
(85, 1, 169, 1, NULL, '2023-08-13 07:39:51', '2023-08-13 07:39:51'),
(86, 1, 170, 1, NULL, '2023-08-13 07:43:18', '2023-08-13 07:43:18'),
(87, 1, 171, 1, NULL, '2023-08-13 07:44:49', '2023-08-13 07:44:49'),
(88, 1, 172, 0, NULL, '2023-08-13 10:13:12', '2023-08-23 06:41:14'),
(89, 12, 173, 1, NULL, '2023-08-13 12:10:15', '2023-08-13 12:10:15'),
(90, 13, 174, 1, NULL, '2023-08-13 12:18:24', '2023-08-13 12:18:24'),
(91, 0, 175, 1, NULL, '2023-08-13 12:20:23', '2023-08-13 12:20:23'),
(92, 0, 176, 1, NULL, '2023-08-13 12:22:29', '2023-08-13 12:22:29'),
(93, 14, 177, 1, NULL, '2023-08-13 12:52:51', '2023-08-13 12:52:51'),
(94, 15, 178, 1, NULL, '2023-08-13 13:10:34', '2023-08-13 13:10:34'),
(95, 16, 180, 1, NULL, '2023-08-13 13:50:42', '2023-08-13 13:50:42'),
(96, 17, 181, 1, NULL, '2023-08-14 04:30:12', '2023-08-14 04:30:12'),
(97, 18, 182, 1, NULL, '2023-08-14 04:34:10', '2023-08-14 04:34:10'),
(98, 19, 183, 1, NULL, '2023-08-14 04:36:51', '2023-08-14 04:36:51'),
(99, 20, 184, 1, NULL, '2023-08-14 08:04:28', '2023-08-14 08:04:28'),
(100, 21, 186, 1, NULL, '2023-08-14 12:14:05', '2023-08-14 12:14:05'),
(101, 15, 187, 1, NULL, '2023-08-15 03:26:37', '2023-08-15 03:26:37'),
(102, 15, 188, 1, NULL, '2023-08-15 03:27:26', '2023-08-15 03:27:26'),
(103, 15, 189, 1, NULL, '2023-08-15 03:27:59', '2023-08-15 03:27:59'),
(104, 15, 190, 1, NULL, '2023-08-15 03:54:04', '2023-08-15 03:54:04'),
(105, 1, 191, 1, NULL, '2023-08-16 02:48:07', '2023-08-16 02:48:07'),
(106, 22, 192, 1, NULL, '2023-08-16 07:26:07', '2023-08-16 07:26:07'),
(107, 23, 193, 1, NULL, '2023-08-16 08:04:02', '2023-08-16 08:04:02'),
(108, 24, 194, 1, NULL, '2023-08-16 09:53:39', '2023-08-16 09:53:39'),
(109, 25, 196, 1, NULL, '2023-08-16 12:14:24', '2023-08-16 12:14:24'),
(110, 25, 197, 1, NULL, '2023-08-16 13:01:31', '2023-08-16 13:01:31'),
(111, 1, 198, 0, NULL, '2023-08-17 05:01:37', '2023-08-23 06:41:17'),
(112, 26, 199, 1, NULL, '2023-08-22 03:48:48', '2023-08-22 03:48:48'),
(113, 27, 200, 1, NULL, '2023-08-22 03:48:52', '2023-08-22 03:48:52'),
(114, 1, 201, 1, NULL, '2023-08-22 06:43:24', '2023-08-22 06:43:24'),
(115, 1, 202, 1, NULL, '2023-08-22 06:44:23', '2023-08-22 06:44:23'),
(116, 1, 203, 1, NULL, '2023-08-22 06:44:39', '2023-08-22 06:44:39'),
(117, 1, 204, 1, NULL, '2023-08-22 06:45:15', '2023-08-22 06:45:15'),
(118, 1, 205, 1, NULL, '2023-08-22 06:45:42', '2023-08-22 06:45:42'),
(119, 1, 206, 1, NULL, '2023-08-22 06:46:01', '2023-08-27 04:47:35'),
(120, 1, 207, 1, NULL, '2023-08-22 06:46:18', '2023-08-27 04:36:32'),
(121, 1, 208, 1, NULL, '2023-08-22 06:46:39', '2023-08-22 06:46:39'),
(122, 28, 209, 1, NULL, '2023-08-22 07:19:41', '2023-08-22 07:19:41'),
(123, 1, 210, 1, NULL, '2023-08-22 08:01:56', '2023-08-22 08:01:56'),
(124, 24, 211, 0, 32, '2023-08-23 04:22:26', '2023-08-23 04:22:26'),
(125, 1, 212, 1, NULL, '2023-08-23 08:02:37', '2023-08-27 04:35:56'),
(126, 1, 213, 1, NULL, '2023-08-24 00:15:09', '2023-08-27 07:36:55'),
(129, 27, 220, 1, NULL, '2023-08-24 05:51:39', '2023-08-24 05:51:39'),
(130, 27, 221, 1, NULL, '2023-08-24 05:52:02', '2023-08-24 05:52:02'),
(131, 27, 222, 1, NULL, '2023-08-24 05:52:36', '2023-08-24 05:52:36'),
(132, 27, 223, 1, NULL, '2023-08-24 05:52:53', '2023-08-24 05:52:53'),
(133, 27, 224, 1, NULL, '2023-08-24 05:53:08', '2023-08-24 05:53:08'),
(134, 27, 225, 1, NULL, '2023-08-24 05:53:46', '2023-08-24 05:53:46'),
(135, 27, 226, 1, NULL, '2023-08-24 06:02:03', '2023-08-24 06:02:03'),
(136, 27, 227, 1, NULL, '2023-08-24 06:02:48', '2023-08-24 06:02:48'),
(137, 24, 228, 1, NULL, '2023-08-24 06:08:27', '2023-08-24 06:08:27'),
(138, 24, 229, 1, NULL, '2023-08-24 06:08:53', '2023-08-24 06:08:53'),
(139, 24, 230, 0, NULL, '2023-08-24 06:09:06', '2023-08-27 04:22:03'),
(140, 24, 231, 0, NULL, '2023-08-24 06:09:26', '2023-08-24 06:09:26'),
(141, 24, 232, 1, NULL, '2023-08-24 06:09:39', '2023-08-24 06:09:39'),
(142, 24, 233, 1, NULL, '2023-08-24 06:10:05', '2023-08-24 06:10:05'),
(143, 1, 235, 1, NULL, '2023-08-27 04:19:01', '2023-08-27 04:19:01'),
(144, 1, 236, 1, NULL, '2023-08-27 08:05:27', '2023-08-27 08:05:27'),
(145, 1, 237, 1, NULL, '2023-08-27 09:30:22', '2023-08-27 09:30:22'),
(146, 1, 239, 1, NULL, '2023-08-28 02:59:59', '2023-08-28 02:59:59'),
(147, 1, 240, 1, NULL, '2023-08-28 07:09:11', '2023-08-28 07:09:11'),
(148, 1, 242, 1, NULL, '2023-08-29 05:57:35', '2023-08-29 05:57:35'),
(149, 1, 243, 1, NULL, '2023-09-11 07:20:22', '2023-09-11 07:20:22'),
(150, 29, 246, 1, NULL, '2023-09-27 04:18:58', '2023-09-27 04:18:58'),
(151, 30, 247, 1, NULL, '2023-09-27 04:49:47', '2023-09-27 04:49:47'),
(152, 1, 248, 1, NULL, '2023-11-21 03:07:14', '2023-11-21 03:07:14'),
(153, 1, 249, 1, NULL, '2023-11-21 03:44:13', '2023-11-21 03:44:13'),
(154, 1, 250, 1, NULL, '2023-11-21 03:45:01', '2023-11-21 03:45:01'),
(155, 1, 251, 1, NULL, '2023-11-21 03:45:39', '2023-11-21 03:45:39'),
(156, 1, 252, 1, NULL, '2023-12-04 23:47:42', '2023-12-04 23:47:42'),
(157, 1, 253, 1, NULL, '2023-12-04 23:48:33', '2023-12-04 23:48:33'),
(158, 1, 254, 1, NULL, '2023-12-06 03:56:40', '2023-12-06 03:56:40'),
(159, 1, 255, 1, NULL, '2023-12-06 06:58:33', '2023-12-06 06:58:33'),
(160, 1, 256, 1, NULL, '2023-12-11 00:19:14', '2023-12-11 00:19:14'),
(161, 1, 257, 1, NULL, '2023-12-11 05:01:02', '2023-12-11 05:01:02');

-- --------------------------------------------------------

--
-- Table structure for table `com_subscription`
--

CREATE TABLE `com_subscription` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `com_subscription`
--

INSERT INTO `com_subscription` (`id`, `company_id`, `subscription_id`, `active`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 1, NULL, '2022-11-28 18:00:00', '2022-11-13 18:00:00'),
(2, 7, 1, 1, NULL, '2022-11-29 10:29:44', '2022-12-13 18:00:00'),
(3, 5, 1, 1, NULL, '2022-11-13 18:00:00', '2022-11-13 18:00:00'),
(4, 9, 0, 1, NULL, '2023-01-09 07:26:03', '2023-01-09 07:26:03'),
(5, 10, 2, 1, NULL, '2023-02-13 10:05:17', '2023-02-13 10:05:17'),
(6, 11, 1, 1, NULL, '2023-03-12 03:18:53', '2023-03-12 03:18:53'),
(7, 12, 1, 1, NULL, '2023-08-13 12:10:15', '2023-08-13 12:10:15'),
(8, 13, 1, 1, NULL, '2023-08-13 12:18:24', '2023-08-13 12:18:24'),
(9, 14, 1, 1, NULL, '2023-08-13 12:52:51', '2023-08-13 12:52:51'),
(10, 15, 1, 1, NULL, '2023-08-13 13:10:34', '2023-08-13 13:10:34'),
(11, 16, 1, 1, NULL, '2023-08-13 13:50:42', '2023-08-13 13:50:42'),
(12, 17, 1, 1, NULL, '2023-08-14 04:30:12', '2023-08-14 04:30:12'),
(13, 18, 1, 1, NULL, '2023-08-14 04:34:10', '2023-08-14 04:34:10'),
(14, 19, 1, 1, NULL, '2023-08-14 04:36:51', '2023-08-14 04:36:51'),
(15, 20, 1, 1, NULL, '2023-08-14 08:04:28', '2023-08-14 08:04:28'),
(16, 21, 1, 1, NULL, '2023-08-14 12:14:05', '2023-08-14 12:14:05'),
(17, 22, 1, 1, NULL, '2023-08-16 07:26:07', '2023-08-16 07:26:07'),
(18, 23, 1, 1, NULL, '2023-08-16 08:04:02', '2023-08-16 08:04:02'),
(19, 24, 1, 1, NULL, '2023-08-16 09:53:39', '2023-08-16 09:53:39'),
(20, 25, 1, 1, NULL, '2023-08-16 12:14:24', '2023-08-16 12:14:24'),
(21, 26, 1, 1, NULL, '2023-08-22 03:48:48', '2023-08-22 03:48:48'),
(22, 27, 1, 1, NULL, '2023-08-22 03:48:52', '2023-08-22 03:48:52'),
(23, 28, 1, 1, NULL, '2023-08-22 07:19:41', '2023-08-22 07:19:41'),
(24, 29, 1, 1, NULL, '2023-09-27 04:18:58', '2023-09-27 04:18:58'),
(25, 30, 1, 1, NULL, '2023-09-27 04:49:47', '2023-09-27 04:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `crm_filesystem`
--

CREATE TABLE `crm_filesystem` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `document_details` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crm_filesystem`
--

INSERT INTO `crm_filesystem` (`id`, `user_id`, `client_id`, `document_name`, `document_details`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 'assets/fileSystem/1678537987.jpg', 'fbfvbfhhbdfhgrg', '2023-03-11 12:33:07', '2023-03-11 12:33:07'),
(3, 1, 2, 'assets/fileSystem/1678538411.jpg', 'fbfvbfhhbdfhgrg', '2023-03-11 12:40:11', '2023-03-11 12:40:11'),
(4, 62, 2, 'assets/fileSystem/1678538652.jpg', '01-22.jpg', '2023-03-11 12:44:12', '2023-03-11 12:44:12'),
(5, 62, 2, 'assets/fileSystem/1678539085.jpg', '01-22.jpg', '2023-03-11 12:51:25', '2023-03-11 12:51:25'),
(6, 62, 2, 'assets/fileSystem/1678539402.jpg', '01-03.jpg', '2023-03-11 12:56:42', '2023-03-11 12:56:42'),
(7, 62, 2, 'assets/fileSystem/1678539462.jpg', '01-05.jpg', '2023-03-11 12:57:42', '2023-03-11 12:57:42'),
(8, 62, 2, 'assets/fileSystem/1678539474.jpg', '01-05.jpg', '2023-03-11 12:57:54', '2023-03-11 12:57:54'),
(9, 62, 2, 'assets/fileSystem/1678539502.jpg', '01-06.jpg', '2023-03-11 12:58:22', '2023-03-11 12:58:22'),
(14, 62, 2, 'assets/fileSystem/1678589688.txt', '000webhost.txt', '2023-03-12 02:54:48', '2023-03-12 02:54:48'),
(15, 62, 2, 'assets/fileSystem/1678592314.txt', '000webhost.txt', '2023-03-12 03:38:34', '2023-03-12 03:38:34'),
(20, 62, 2, 'assets/fileSystem/1678592828.txt', '000webhost.txt', '2023-03-12 03:47:08', '2023-03-12 03:47:08'),
(23, 76, 2, 'assets/fileSystem/1678593318.jpg', 'bg1.jpg', '2023-03-12 03:55:18', '2023-03-12 03:55:18'),
(28, 62, 2, 'assets/fileSystem/1678699791.jpg', 'green-plant-pot-pen-modern-silver-laptop-dark-background-min.jpg', '2023-03-13 09:29:52', '2023-03-13 09:29:52'),
(29, 62, 2, 'assets/fileSystem/1678854051.txt', 'robots.txt', '2023-03-15 04:20:51', '2023-03-15 04:20:51'),
(30, 62, 2, 'assets/fileSystem/1678854191.txt', 'robots.txt', '2023-03-15 04:23:11', '2023-03-15 04:23:11'),
(32, 32, 1, 'assets/fileSystem/1679488127.png', 'logo512.png', '2023-03-22 12:28:47', '2023-03-22 12:28:47'),
(33, 32, 1, 'assets/fileSystem/1679488207.jpg', '01-23.jpg', '2023-03-22 12:30:07', '2023-03-22 12:30:07'),
(34, 32, 1, 'assets/fileSystem/1680584103.png', 'logo192.png', '2023-04-04 04:55:03', '2023-04-04 04:55:03'),
(35, 32, 1, 'assets/fileSystem/1681816470.png', 'itec.png', '2023-04-18 11:14:30', '2023-04-18 11:14:30'),
(36, 62, 2, 'assets/fileSystem/1681816723.png', 'nta-removebg-preview.png', '2023-04-18 11:18:43', '2023-04-18 11:18:43'),
(37, 32, 1, 'assets/fileSystem/1682483241.png', 'itec.png', '2023-04-26 04:27:21', '2023-04-26 04:27:21'),
(38, 32, 1, 'assets/fileSystem/1683005511.png', 'itec.png', '2023-05-02 05:31:51', '2023-05-02 05:31:51'),
(39, 32, 1, 'assets/fileSystem/1683467311.png', 'itec.png', '2023-05-07 13:48:31', '2023-05-07 13:48:31'),
(40, 32, 1, 'assets/fileSystem/1683468295.png', 'itec.png', '2023-05-07 14:04:55', '2023-05-07 14:04:55'),
(41, 62, 2, 'assets/fileSystem/1683517931.png', 'nta.png', '2023-05-08 03:52:11', '2023-05-08 03:52:11'),
(43, 32, 1, 'assets/fileSystem/1683533130.docx', '1683533119.docx', '2023-05-08 08:05:30', '2023-05-08 08:05:30'),
(44, 32, 1, 'assets/fileSystem/1683533169.docx', '1683533119.docx', '2023-05-08 08:06:09', '2023-05-08 08:06:09'),
(45, 32, 1, 'assets/fileSystem/1683533184.docx', '1683533119.docx', '2023-05-08 08:06:24', '2023-05-08 08:06:24'),
(46, 32, 1, 'assets/fileSystem/1683533187.docx', '1683533119.docx', '2023-05-08 08:06:27', '2023-05-08 08:06:27'),
(47, 32, 1, 'assets/fileSystem/1683533639.png', 'itec.png', '2023-05-08 08:13:59', '2023-05-08 08:13:59'),
(48, 32, 1, 'assets/fileSystem/1683542677.docx', 'CRM (4).docx', '2023-05-08 10:44:37', '2023-05-08 10:44:37'),
(49, 32, 1, 'assets/fileSystem/1683556200.rtf', 'Changelog.rtf', '2023-05-08 14:30:00', '2023-05-08 14:30:00'),
(50, 32, 1, 'assets/fileSystem/1683556253.rtf', 'Changelog.rtf', '2023-05-08 14:30:53', '2023-05-08 14:30:53'),
(51, 32, 1, 'assets/fileSystem/1683709456.png', 'logo512.png', '2023-05-10 09:04:16', '2023-05-10 09:04:16'),
(53, 116, 1, 'assets/fileSystem/1683717900.pdf', 'inbound3424720395178301505 - MD. SHAHIDUL ISLAM.pdf', '2023-05-10 11:25:00', '2023-05-10 11:25:00'),
(54, 32, 1, 'assets/fileSystem/1685952807.pdf', 'EOI.pdf', '2023-06-05 08:13:27', '2023-06-05 08:13:27'),
(55, 32, 1, 'assets/fileSystem/1686209114.png', 'Logo_01.png', '2023-06-08 07:25:14', '2023-06-08 07:25:14'),
(56, 32, 1, 'assets/fileSystem/1689227579.pdf', 'cv.pdf', '2023-07-13 05:52:59', '2023-07-13 05:52:59'),
(57, 32, 1, 'assets/fileSystem/1689242096.pdf', 'Eftakhar Jaman resume (1).pdf', '2023-07-13 09:54:56', '2023-07-13 09:54:56'),
(58, 179, 15, 'assets/fileSystem/1692013463.png', 'All clients logo-21.png', '2023-08-14 11:44:23', '2023-08-14 11:44:23'),
(59, 196, 25, 'assets/fileSystem/1692269974.png', 'QUADQUE_LOGO_SOLO_WITH_TAG_LINE.png', '2023-08-17 10:59:34', '2023-08-17 10:59:34'),
(60, 196, 25, 'assets/fileSystem/1692269984.png', 'QUADQUE_Main_logo_final-(2).png', '2023-08-17 10:59:44', '2023-08-17 10:59:44'),
(61, 194, 24, '', '', '2023-09-11 10:30:11', '2023-09-11 10:30:11'),
(62, 32, 1, 'assets/fileSystem/1694675015.pdf', 'BSB40520 - Certificate IV in Leadership and Management.pdf', '2023-09-14 07:03:35', '2023-09-14 07:03:35'),
(63, 200, 27, 'assets/fileSystem/1695708310.jpg', '1678538652.jpg', '2023-09-26 06:05:10', '2023-09-26 06:05:10'),
(64, 32, 1, 'assets/fileSystem/1695709418.png', 'ITEC.png', '2023-09-26 06:23:38', '2023-09-26 06:23:38'),
(65, 194, 24, 'assets/fileSystem/1695709457.png', 'All clients logo-20.png', '2023-09-26 06:24:17', '2023-09-26 06:24:17'),
(66, 194, 24, 'assets/fileSystem/1695709887.png', 'All clients logo-20.png', '2023-09-26 06:31:27', '2023-09-26 06:31:27'),
(67, 194, 24, 'assets/fileSystem/1695709954.png', 'All clients logo-20.png', '2023-09-26 06:32:34', '2023-09-26 06:32:34'),
(68, 247, 30, 'assets/fileSystem/1695793153.png', 'All clients logo-19.png', '2023-09-27 05:39:13', '2023-09-27 05:39:13'),
(69, 247, 30, 'assets/fileSystem/1695793282.png', 'All clients logo-19.png', '2023-09-27 05:41:22', '2023-09-27 05:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_26_025356_create_companies_table', 1),
(6, '2022_09_26_064008_create_com_sales_team_table', 1),
(7, '2022_09_26_064034_create_com_subscription_table', 1),
(8, '2022_09_27_055420_create_requisitions_table', 1),
(9, '2022_09_29_041508_create_packages_table', 1),
(10, '2022_09_29_060241_create_package_subscriptions_table', 1),
(11, '2022_10_02_090603_create_subscriptions_table', 1),
(12, '2022_10_13_035123_create_company_notice_table', 2),
(13, '2022_10_13_035731_add_attr_status_company_notice_table', 3),
(14, '2022_10_17_042550_change_com_sales_team', 4),
(15, '2022_10_17_044958_change_attr_companies_logo', 5),
(16, '2022_10_26_080459_change_fb_data_type-company', 6),
(17, '2022_10_27_034429_add_attr_pakage_requision', 7),
(18, '2022_10_27_040135_rename_attr_fb_requision', 8),
(20, '2022_10_27_040701_drop_attr_role_requision', 9),
(21, '2022_10_30_060611_change_status_requisition_data', 10),
(22, '2022_11_01_070859_add_attr_packages_price', 11),
(23, '2022_11_02_084214_add_app_id_companies', 12),
(24, '2022_11_13_053336_add_attr_companies_super_admin', 13),
(26, '2022_11_14_062231_remove_attr_companies_subscription_id', 14),
(28, '2022_11_17_075406_add_attr_comany_package_renew_code', 15);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `package_type` int(11) DEFAULT NULL,
  `package_type_limit` int(11) DEFAULT NULL,
  `business_type` int(11) NOT NULL DEFAULT 1,
  `package_details` text DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_name`, `package_type`, `package_type_limit`, `business_type`, `package_details`, `price`, `active`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Day Limit', 2, 2, 1, 'Day Limit', 0.00, 1, NULL, NULL, NULL),
(2, 'Storage Limit  Package', 1, 20, 1, 'It is storage based package', 10.00, 1, NULL, '2022-11-01 01:20:03', '2022-11-14 23:23:19'),
(3, 'Storage Packages', 3, 10, 1, 'Storage Packages', 100.00, 1, NULL, '2022-11-01 01:20:10', '2022-11-01 01:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `package_subscriptions`
--

CREATE TABLE `package_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `subscription_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requisitions`
--

CREATE TABLE `requisitions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `packages_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `contact` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `business_email` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `abn` varchar(255) DEFAULT NULL,
  `website` varchar(255) NOT NULL,
  `trading_name` varchar(255) DEFAULT NULL,
  `rto_code` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requisitions`
--

INSERT INTO `requisitions` (`id`, `name`, `email`, `packages_id`, `status`, `contact`, `description`, `logo`, `business_email`, `address`, `abn`, `website`, `trading_name`, `rto_code`, `country_name`, `company_name`, `active`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'requisitions 2', 'requisition52@gmail.com', 1, 1, '65456456', 'description', '50', 'businessemail@gmail.com', 'address', 'abn', 'website', 'laksjdfdaklf', 'adlfkjskja  aldkfj', 'COUNTRY_NAME', 'ITEC', 1, NULL, '2022-10-26 22:10:30', '2022-10-26 22:10:30'),
(2, 'requisitions 2', 'requisition-itec@gmail.com', 1, 1, '65456456', 'description', '50', 'businessemail@gmail.com', 'address', 'abn', 'website', 'laksjdfdaklf', 'adlfkjskja  aldkfj', 'COUNTRY_NAME', 'ITEC', 1, NULL, '2022-10-26 22:11:21', '2022-10-26 22:11:21'),
(3, 'requisitions 3', 'requisition3-itec@gmail.com', 1, 1, '654564560', 'description', '', 'businessemail3@gmail.com', 'address', 'abn', 'website', 'laksjdfdaklf', 'adlfkjskja  aldkfj', 'Australia', 'ITEC-3', 1, NULL, '2022-10-29 22:49:10', '2022-10-29 22:49:10'),
(4, 'Quadque Tech Admin', 'info@quadque.digital', 2, 1, '6454598', 'Quadque Technologies Limited', '', 'info@quadque.digital', 'Panthapath, Bangladesh', '6666', 'https://quadque.tech/', 'qqtech', '5555', 'Bangladesh', 'Quadque Technologies Limited', 1, NULL, '2023-02-13 10:05:02', '2023-02-13 10:05:17'),
(5, 'fahim', 'fahimfayaz18@gmail.com', 1, 1, '01770347582', 'aerjhaejhejh', '', 'fahimfayaz18@gmail.com', 'dhanmondi', 'BN6434646', 'http://localhost:3000/requisition', 'qqq', 'q23523', 'Andorra', 'BigDong', 1, NULL, '2023-03-12 03:12:48', '2023-03-12 03:18:52'),
(6, 'Nick', 'Admin@atr.edu.au', 1, 1, '0549656983', '', '', 'Admin@atr.edu.au', 'Www.atr.edu.au', '', 'Www.atr.edu.au', 'ATR', '45282', 'Australia', 'Atr', 1, NULL, '2023-08-13 09:47:19', '2023-08-13 09:48:14'),
(8, 'QuadQue Tech', 'quadquetech2020@gmail.com', 1, 1, '01765276560', '', '', 'quadquetech2020@gmail.com', 'Level -7, 8/C, F.R Tower, Sukrabad, PanthaPath 1207 Dhaka, D', 'Quadque Technologies Ltd.', 'Quadque Technologies Ltd.', 'Quadque Technologies Ltd.', '93085', 'Bangladesh', 'Quadque Technologies Ltd.', 1, NULL, '2023-08-13 09:59:25', '2023-08-13 09:59:42'),
(25, 'Quadque Technologies Limited', 'yuanhuafung2021@gmail.com', 1, 1, '5658733466', '', '', 'yuanhuafung2021@gmail.com', 'Level -7, 8/C, F.R Tower, Sukrabad, PanthaPath 1207 Dhaka, D', 'Quadque Technologies', 'Quadque Technologies', 'tfgsdf', '56332', '', 'Quadque Technologies', 1, NULL, '2023-08-14 08:03:36', '2023-08-14 08:04:21'),
(29, 'Jaman', 'jaman.ceo@microsoft.com', 1, 1, '01642167361', 'drgdfgdfgdg', '', 'jaman.ceo@microsoft.com', 'dfgdfgdfgdfg', 'dfgdfgdfg', 'dfgdfgdfgdfgdfgdf', 'dfgdfdfg', 'dfgdfgdfg', '', 'ejsoft', 1, NULL, '2023-08-16 04:24:36', '2023-08-16 07:22:35'),
(31, 'Tanjib', 'tanjib@quadque.tech', 1, 1, '01972075917', 'fdgfghtbtrhb', '', 'test@qq.com', 'dhanmondi', 'BN4444444', 'www.microsoft.com', 'demo', '1234567', 'Bangladesh', 'demo', 1, NULL, '2023-08-16 08:03:39', '2023-08-16 08:03:56'),
(32, 'Hilal Raziq', 'hilal@uct.edu.au', 1, 1, '1300 905 858', 'Unique College of Technology (UCT) is a Registered Training Organisation (RTO) and expert provider of nationally recognised training since 2007. Providing the unstoppable achievers with the opportunity to realise their ambitions through lifelong education and training.', '', 'admin@uct.edu.au', 'Level 1, 7 Greenfield Pde Bankstown', '91358', 'uct.edu.au/', 'Unique College of Technology', '91358', 'Australia', 'Unique College of Technology (UCT)', 1, NULL, '2023-08-16 09:23:04', '2023-08-16 09:24:42'),
(33, 'Hilal Raziq', 'admin@uct.edu.au', 1, 1, '1300 905 858', 'Unique College of Technology (UCT) is a Registered Training Organisation (RTO) and expert provider of nationally recognised training since 2007. Providing the unstoppable achievers with the opportunity to realise their ambitions through lifelong education and training.', '', 'admin@uct.edu.au', 'Level 1, 7 Greenfield Pde Bankstown', '91358', 'uct.edu.au/', 'UCT', '91358', 'Australia', 'Unique College of Technology (UCT)', 1, NULL, '2023-08-16 09:53:05', '2023-08-16 09:53:34'),
(35, 'Quadque Technologies Limited', 'info@quadque.tech', 1, 1, '01765276560', '', '', 'info@quadque.tech', 'Level -7, 8/C, F.R Tower, Sukrabad, PanthaPath 1207 Dhaka, D', 'Quadque Technologies', 'www.quadque.tech/', '00000', '0000', '', 'Quadque Technologies', 1, NULL, '2023-08-16 12:13:58', '2023-08-16 12:14:20'),
(37, 'Sakib Istiak', 'enquiries@nta.nsw.edu.au', 1, 1, '0421814485', 'RTO', '', 'enquiries@nta.nsw.edu.au', 'LEVEL 1/7 Greenfield Parade, Bankstown NSW 2200', '33 146 254 702', 'https://nta.nsw.edu.au/', 'Elite Training & Development Pty Ltd', '70201', 'Australia', 'NTA', 1, NULL, '2023-08-18 00:20:34', '2023-08-22 03:48:47'),
(38, 'Sakib Istiak', 'admin.vic@itecounsel.com', 1, 1, '0434245069', '', '', 'admin.vic@itecounsel.com', 'Melbourne', '00', 'https://itecounsel.com/', 'ITEC', '00', 'Australia', 'ITEC - Melbourne', 1, NULL, '2023-08-22 07:17:07', '2023-08-22 07:19:35'),
(39, 'Sakib Istiak', 'sakiib@itecounsel.com', 1, 1, '0421814485', '', '', 'sakib@itecounsel.com', 'Level 16 9-13 Castlereagh St SYDNEY NSW 2000', '26 639 249 933', 'https://www.yourcareer.gov.au/learn-and-train/training-providers/45667?tab=courses-offered&courseCode=SIT50322', 'AIA', '45667', 'Australia', 'ACHIEVEMENT INSTITUTE AUSTRALIA (AIA) PTY LTD', 1, NULL, '2023-09-27 03:54:38', '2023-09-27 03:55:26'),
(40, 'Tanjib', 'saakib@itecounsel.com', 1, 1, '01972075917', 'edu', '', 'sakib@itecounsel.com', 'dhanmondi', 'ty66666', 'www.microsoft.com', 'demolition', '12345', 'Bangladesh', 'demolition', 1, NULL, '2023-09-27 04:13:08', '2023-09-27 04:18:52'),
(42, 'Sakib Istiak', 'hr@itecounsel.com', 1, 1, '0421814485', 'AIA', '', 'hr@itecounsel.com', 'Level 16 9-13 Castlereagh St SYDNEY NSW 2000', '26 639 249 933', 'https://training.gov.au/Organisation/Details/45667', 'AIA', '45667', 'Australia', 'AIA', 1, NULL, '2023-09-27 04:23:43', '2023-09-27 04:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_name` varchar(255) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `discounted` tinyint(1) NOT NULL DEFAULT 0,
  `total` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_documents`
--

CREATE TABLE `user_documents` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `document_name` tinytext DEFAULT NULL,
  `document_details` text DEFAULT NULL,
  `file_sizes` int(11) DEFAULT NULL COMMENT 'Calculation only Kilo bytes (KB)',
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_documents`
--

INSERT INTO `user_documents` (`id`, `user_id`, `client_id`, `document_name`, `document_details`, `file_sizes`, `deleted_by`, `created_at`, `updated_at`, `status`) VALUES
(1, 2, 3, 'uploads/eccbc87e4b5ce2fe28308fd9f2a7baf3/c81e728d9d4c2f636f067f89cc14862c/logo/Afternoon-1665472501730.jpg', 'undefined', 166101, NULL, '2022-10-11 13:15:01', NULL, 1),
(2, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/APIs Details-1666065785816.txt', 'Lorem Ipsum Text', 344, NULL, '2022-10-18 10:03:05', NULL, 1),
(3, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/APIs Details-1666065977466.txt', 'Lorem Ipsum Text', 344, NULL, '2022-10-18 10:06:17', NULL, 1),
(4, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/APIs Details-1666065981314.txt', 'Lorem Ipsum Text', 344, NULL, '2022-10-18 10:06:21', NULL, 0),
(5, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/APIs Details-1666066002098.txt', 'Lorem Ipsum Text', 344, NULL, '2022-10-18 10:06:42', NULL, 0),
(6, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/APIs Details-1666066081857.txt', 'Lorem Ipsum Text', 344, NULL, '2022-10-18 10:08:01', NULL, 1),
(7, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/APIs Details-1666066089114.txt', 'Lorem Ipsum Text', 344, NULL, '2022-10-18 10:08:09', NULL, 1),
(8, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/APIsDetails-1666066195613.txt', 'Lorem Ipsum Text', 344, NULL, '2022-10-18 10:09:55', NULL, 1),
(9, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/forgot-password-1666066283964.txt', 'Lorem Ipsum Text', 487, NULL, '2022-10-18 10:11:23', NULL, 1),
(10, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/slack-1666066297195.exe', 'Lorem Ipsum Text', 309040, NULL, '2022-10-18 10:11:37', NULL, 1),
(11, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/APIsDetails-1666066498227.txt', 'Lorem Ipsum Text', 344, NULL, '2022-10-18 10:14:58', NULL, 1),
(12, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666067261116.txt', 'APIs Details.txt', 344, NULL, '2022-10-18 10:27:41', NULL, 1),
(13, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/APIsDetails-1666067771809.txt', 'Lorem Ipsum Text', 344, NULL, '2022-10-18 10:36:11', NULL, 1),
(14, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666067787669.txt', 'APIs Details.txt', 344, NULL, '2022-10-18 10:36:27', NULL, 1),
(15, 0, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/7ecfb3bf076a6a9635f975fe96ac97fd/logo/APIsDetails-1666067849453.txt', 'APIs Details.txt', 344, NULL, '2022-10-18 10:37:29', NULL, 1),
(16, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666068323886.txt', 'APIs Details.txt', 344, NULL, '2022-10-18 10:45:23', NULL, 1),
(17, 0, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/7ecfb3bf076a6a9635f975fe96ac97fd/logo/APIsDetails-1666068397872.txt', 'APIs Details.txt', 344, NULL, '2022-10-18 10:46:37', NULL, 1),
(18, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666068428212.txt', 'APIs Details.txt', 344, NULL, '2022-10-18 10:47:08', NULL, 1),
(19, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/APIsDetails-1666068492773.txt', 'Lorem Ipsum Text', 344, NULL, '2022-10-18 10:48:12', NULL, 1),
(20, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666068537358.txt', 'Sourav', 344, NULL, '2022-10-18 10:48:57', NULL, 1),
(21, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/APIsDetails-1666068682671.txt', 'Lorem Ipsum Text', 344, NULL, '2022-10-18 10:51:22', NULL, 1),
(22, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666068696273.txt', 'Sourav', 344, NULL, '2022-10-18 10:51:36', NULL, 1),
(23, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666068720531.txt', 'Sourav', 344, NULL, '2022-10-18 10:52:00', NULL, 1),
(24, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666068794428.txt', 'Sourav', 344, NULL, '2022-10-18 10:53:14', NULL, 1),
(25, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666068880548.txt', 'Sourav', 344, NULL, '2022-10-18 10:54:40', NULL, 1),
(26, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666068948784.txt', 'Sourav', 344, NULL, '2022-10-18 10:55:48', NULL, 1),
(27, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666068992543.txt', 'Sourav', 344, NULL, '2022-10-18 10:56:32', NULL, 1),
(28, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666071436530.txt', 'APIs Details.txt', 344, NULL, '2022-10-18 11:37:16', NULL, 1),
(29, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666072081370.txt', 'APIs Details.txt', 344, NULL, '2022-10-18 11:48:01', NULL, 1),
(30, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/logo/APIsDetails-1666072165586.txt', 'APIs Details.txt', 344, NULL, '2022-10-18 11:49:25', NULL, 1),
(31, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/logo/Afternoon-1665472501730-1666171436522.jpg', 'Lorem Ipsum Text', 166101, NULL, '2022-10-19 15:23:56', NULL, 1),
(36, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/Afternoon-1665472501730-1666172486242.jpg', 'Lorem Ipsum Text', 166101, NULL, '2022-10-19 15:41:26', NULL, 1),
(37, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705-1666177469951.webp', 'Lorem Ipsum Text', 117338, NULL, '2022-10-19 17:04:29', NULL, 1),
(38, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/APIsDetails-1666178745133.txt', 'undefined', 344, NULL, '2022-10-19 17:25:45', NULL, 1),
(39, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/APIsDetails-1666179402557.txt', 'undefined', 344, NULL, '2022-10-19 17:36:42', NULL, 1),
(40, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/APIsDetails-1666179416284.txt', 'undefined', 344, NULL, '2022-10-19 17:36:56', NULL, 1),
(41, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/APIsDetails-1666179520067.txt', 'undefined', 344, NULL, '2022-10-19 17:38:40', NULL, 1),
(42, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/APIsDetails-1666179524798.txt', 'undefined', 344, NULL, '2022-10-19 17:38:44', NULL, 1),
(43, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/APIsDetails-1666181456901.txt', 'APIs Details.txt', 344, NULL, '2022-10-19 18:10:56', NULL, 1),
(44, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/APIsDetails-1666181539306.txt', 'APIs Details.txt', 344, NULL, '2022-10-19 18:12:19', NULL, 1),
(45, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/APIsDetails-1666182470304.txt', 'APIs Details.txt', 344, NULL, '2022-10-19 18:27:50', NULL, 1),
(46, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/APIsDetails-1666182628272.txt', 'APIs Details.txt', 344, NULL, '2022-10-19 18:30:28', NULL, 1),
(47, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/APIsDetails-1666191730541.txt', 'APIs Details.txt', 344, NULL, '2022-10-19 21:02:10', NULL, 1),
(48, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/APIsDetails-1666191734107.txt', 'APIs Details.txt', 344, NULL, '2022-10-19 21:02:14', NULL, 1),
(49, 1, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/c4ca4238a0b923820dcc509a6f75849b/3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705-1666193370882.webp', '3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705.webp', 117338, NULL, '2022-10-19 21:29:31', NULL, 1),
(50, 0, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/5e543256c480ac577d30f76f9120eb74/APIsDetails-1666265149752.txt', 'APIs Details.txt', 344, NULL, '2022-10-20 17:25:49', NULL, 1),
(51, 0, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/5e543256c480ac577d30f76f9120eb74/3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705-1666265152996.webp', '3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705.webp', 117338, NULL, '2022-10-20 17:25:53', NULL, 1),
(52, 0, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/5e543256c480ac577d30f76f9120eb74/APIsDetails-1666265313696.txt', 'APIs Details.txt', 344, NULL, '2022-10-20 17:28:33', NULL, 1),
(53, 0, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/5e543256c480ac577d30f76f9120eb74/APIsDetails-1666265684206.txt', 'APIs Details.txt', 344, NULL, '2022-10-20 17:34:44', NULL, 1),
(54, 0, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/5e543256c480ac577d30f76f9120eb74/APIsDetails-1666265754529.txt', 'APIs Details.txt', 344, NULL, '2022-10-20 17:35:54', NULL, 1),
(55, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666266007270.txt', 'APIs Details.txt', 344, NULL, '2022-10-20 17:40:07', NULL, 1),
(56, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666266083734.txt', 'APIs Details.txt', 344, NULL, '2022-10-20 17:41:23', NULL, 1),
(57, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666266235552.txt', 'APIs Details.txt', 344, NULL, '2022-10-20 17:43:55', NULL, 1),
(58, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666266369788.txt', 'APIs Details.txt', 344, NULL, '2022-10-20 17:46:09', NULL, 1),
(59, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666494612261.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 09:10:12', NULL, 1),
(60, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666494750868.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 09:12:30', NULL, 1),
(61, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666494753339.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 09:12:33', NULL, 0),
(62, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666494779736.png', '1934318.png', 18007, NULL, '2022-10-23 09:12:59', NULL, 0),
(63, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666515498314.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 14:58:18', NULL, 1),
(64, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666515539492.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 14:58:59', NULL, 1),
(65, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666515597750.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 14:59:57', NULL, 1),
(66, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666515657359.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 15:00:57', NULL, 1),
(67, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666515773364.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 15:02:53', NULL, 1),
(68, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666515841765.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 15:04:01', NULL, 0),
(69, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/ngrok-1666518983528.txt', 'Lorem Ipsum Text', 70, NULL, '2022-10-23 15:56:23', NULL, 1),
(70, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/CICD001-1666520011477.txt', 'Lorem Ipsum Text', 4, NULL, '2022-10-23 16:13:31', NULL, 1),
(71, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/ngrok-1666520145799.txt', 'Lorem Ipsum Text', 70, NULL, '2022-10-23 16:15:45', NULL, 1),
(72, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666520962347.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 16:29:22', NULL, 1),
(73, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705-1666521476876.webp', '3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705.webp', 117338, NULL, '2022-10-23 16:37:57', NULL, 1),
(74, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666522124287.png', '1934318.png', 18007, NULL, '2022-10-23 16:48:44', NULL, 1),
(75, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/Registration-1666522754681.txt', 'Lorem Ipsum Text', 1063, NULL, '2022-10-23 16:59:14', NULL, 1),
(76, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666522763054.png', 'Lorem Ipsum Text', 18007, NULL, '2022-10-23 16:59:23', NULL, 1),
(77, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666522776895.png', '1934318.png', 18007, NULL, '2022-10-23 16:59:36', NULL, 1),
(78, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666522780901.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 16:59:40', NULL, 1),
(79, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/CRM-1666522787792.pdf', 'CRM.pdf', 23563, NULL, '2022-10-23 16:59:47', NULL, 1),
(81, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666522882556.png', '1934318.png', 18007, NULL, '2022-10-23 17:01:22', NULL, 1),
(82, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666523422971.png', '1934318.png', 18007, NULL, '2022-10-23 17:10:22', NULL, 1),
(83, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666523475345.png', '1934318.png', 18007, NULL, '2022-10-23 17:11:15', NULL, 1),
(84, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666523490657.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 17:11:30', NULL, 1),
(85, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666523496283.png', '1934318.png', 18007, NULL, '2022-10-23 17:11:36', NULL, 1),
(86, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666523501117.png', '1934318.png', 18007, NULL, '2022-10-23 17:11:41', NULL, 1),
(87, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666523504224.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 17:11:44', NULL, 1),
(88, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666523527562.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 17:12:07', NULL, 1),
(89, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666523608189.png', '1934318.png', 18007, NULL, '2022-10-23 17:13:28', NULL, 1),
(90, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666523611399.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 17:13:31', NULL, 1),
(91, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666523616307.png', '1934318.png', 18007, NULL, '2022-10-23 17:13:36', NULL, 1),
(92, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666523855705.png', '1934318.png', 18007, NULL, '2022-10-23 17:17:35', NULL, 1),
(93, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666523855781.png', '1934318.png', 18007, NULL, '2022-10-23 17:17:35', NULL, 1),
(94, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666523855789.png', '1934318.png', 18007, NULL, '2022-10-23 17:17:35', NULL, 1),
(95, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666523861451.txt', 'APIs Details.txt', 344, NULL, '2022-10-23 17:17:41', NULL, 0),
(96, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/CICD001-1666533009905.txt', 'Lorem Ipsum Text', 4, NULL, '2022-10-23 19:50:09', NULL, 1),
(97, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666671749824.png', '1934318.png', 18007, NULL, '2022-10-25 10:22:30', NULL, 1),
(98, 2, 1, 'uploads/c4ca4238a0b923820dcc509a6f75849b/c81e728d9d4c2f636f067f89cc14862c/1934318-1666671797082.png', 'Lorem Ipsum Text', 18007, NULL, '2022-10-25 10:23:17', NULL, 1),
(99, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666671803852.png', '1934318.png', 18007, NULL, '2022-10-25 10:23:23', NULL, 1),
(100, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666671910127.png', '1934318.png', 18007, NULL, '2022-10-25 10:25:10', NULL, 1),
(101, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666672005824.png', '1934318.png', 18007, NULL, '2022-10-25 10:26:45', NULL, 1),
(102, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666672098113.png', '1934318.png', 18007, NULL, '2022-10-25 10:28:18', NULL, 1),
(103, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666672203026.png', '1934318.png', 18007, NULL, '2022-10-25 10:30:03', NULL, 1),
(104, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666672338197.png', '1934318.png', 18007, NULL, '2022-10-25 10:32:18', NULL, 0),
(105, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666672343173.txt', 'APIs Details.txt', 344, NULL, '2022-10-25 10:32:23', NULL, 1),
(106, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666673116937.txt', 'APIs Details.txt', 344, NULL, '2022-10-25 10:45:16', NULL, 1),
(107, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666673174289.png', '1934318.png', 18007, NULL, '2022-10-25 10:46:14', NULL, 0),
(108, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666673178445.txt', 'APIs Details.txt', 344, NULL, '2022-10-25 10:46:18', NULL, 1),
(109, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/1934318-1666673293904.png', '1934318.png', 18007, NULL, '2022-10-25 10:48:13', NULL, 1),
(110, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666682036026.txt', 'APIs Details.txt', 344, NULL, '2022-10-25 13:13:56', NULL, 1),
(111, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705-1666682057408.webp', '3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705.webp', 117338, NULL, '2022-10-25 13:14:17', NULL, 1),
(112, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/FacebookAPI-1666682061673.txt', 'Facebook API.txt', 313, NULL, '2022-10-25 13:14:21', NULL, 1),
(113, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705-1666682399858.webp', '3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705.webp', 117338, NULL, '2022-10-25 13:19:59', NULL, 1),
(114, 26, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/4e732ced3463d06de0ca9a15b6153677/APIsDetails-1666682405294.txt', 'APIs Details.txt', 344, NULL, '2022-10-25 13:20:05', NULL, 1),
(115, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130107674.png', '1934318.png', 18007, NULL, '2022-10-30 17:41:47', NULL, 1),
(116, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130107679.png', '1934318.png', 18007, NULL, '2022-10-30 17:41:47', NULL, 1),
(117, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130107680.png', '1934318.png', 18007, NULL, '2022-10-30 17:41:47', NULL, 1),
(118, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130171448.png', '1934318.png', 18007, NULL, '2022-10-30 17:42:51', NULL, 1),
(119, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130171473.png', '1934318.png', 18007, NULL, '2022-10-30 17:42:51', NULL, 1),
(120, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130171476.png', '1934318.png', 18007, NULL, '2022-10-30 17:42:51', NULL, 1),
(121, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130193004.png', '1934318.png', 18007, NULL, '2022-10-30 17:43:13', NULL, 1),
(122, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130193041.png', '1934318.png', 18007, NULL, '2022-10-30 17:43:13', NULL, 1),
(123, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130193053.png', '1934318.png', 18007, NULL, '2022-10-30 17:43:13', NULL, 1),
(124, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130372956.png', '1934318.png', 18007, NULL, '2022-10-30 17:46:12', NULL, 1),
(125, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130373024.png', '1934318.png', 18007, NULL, '2022-10-30 17:46:13', NULL, 1),
(126, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130373029.png', '1934318.png', 18007, NULL, '2022-10-30 17:46:13', NULL, 1),
(127, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130480148.png', '1934318.png', 18007, NULL, '2022-10-30 17:48:00', NULL, 1),
(128, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130480186.png', '1934318.png', 18007, NULL, '2022-10-30 17:48:00', NULL, 1),
(129, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130480188.png', '1934318.png', 18007, NULL, '2022-10-30 17:48:00', NULL, 1),
(130, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130635403.png', '1934318.png', 18007, NULL, '2022-10-30 17:50:35', NULL, 1),
(131, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130635423.png', '1934318.png', 18007, NULL, '2022-10-30 17:50:35', NULL, 1),
(132, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130635428.png', '1934318.png', 18007, NULL, '2022-10-30 17:50:35', NULL, 1),
(133, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130734454.png', '1934318.png', 18007, NULL, '2022-10-30 17:52:14', NULL, 1),
(134, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130734501.png', '1934318.png', 18007, NULL, '2022-10-30 17:52:14', NULL, 1),
(135, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130734513.png', '1934318.png', 18007, NULL, '2022-10-30 17:52:14', NULL, 1),
(136, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667130850103.png', '1934318.png', 18007, NULL, '2022-10-30 17:54:10', NULL, 1),
(137, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705-1667130854703.webp', '3d-pile-facebook-logo-background-facebook-famous-social-media-platform_73903-705.webp', 117338, NULL, '2022-10-30 17:54:14', NULL, 1),
(138, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/APIsDetails-1667131672306.txt', 'APIs Details.txt', 344, NULL, '2022-10-30 18:07:52', NULL, 1),
(139, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667131945744.png', '1934318.png', 18007, NULL, '2022-10-30 18:12:25', NULL, 1),
(140, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667132257924.png', '1934318.png', 18007, NULL, '2022-10-30 18:17:37', NULL, 1),
(141, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/1934318-1667132309774.png', '1934318.png', 18007, NULL, '2022-10-30 18:18:29', NULL, 1),
(142, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/CRM-1667192109538.pdf', 'CRM.pdf', 23563, NULL, '2022-10-31 10:55:09', NULL, 1),
(143, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/CRM-1667192168044.pdf', 'CRM.pdf', 23563, NULL, '2022-10-31 10:56:08', NULL, 1),
(144, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/CRM-1667192590716.pdf', 'CRM.pdf', 23563, NULL, '2022-10-31 11:03:10', NULL, 1),
(145, 4, 0, 'uploads/5e543256c480ac577d30f76f9120eb74/a87ff679a2f3e71d9181a67b7542122c/CRM-1667193418761.pdf', 'CRM.pdf', 23563, NULL, '2022-10-31 11:16:58', NULL, 1),
(146, 4, 2, 'uploads/c81e728d9d4c2f636f067f89cc14862c/a87ff679a2f3e71d9181a67b7542122c/APIsDetails-1667459517776.txt', 'APIs Details.txt', 344, NULL, '2022-11-03 13:11:57', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_notice`
--
ALTER TABLE `company_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_sales_employee`
--
ALTER TABLE `company_sales_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_subscription`
--
ALTER TABLE `com_subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_filesystem`
--
ALTER TABLE `crm_filesystem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_subscriptions`
--
ALTER TABLE `package_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `requisitions`
--
ALTER TABLE `requisitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_documents`
--
ALTER TABLE `user_documents`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `company_notice`
--
ALTER TABLE `company_notice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `company_sales_employee`
--
ALTER TABLE `company_sales_employee`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `com_subscription`
--
ALTER TABLE `com_subscription`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `crm_filesystem`
--
ALTER TABLE `crm_filesystem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_subscriptions`
--
ALTER TABLE `package_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requisitions`
--
ALTER TABLE `requisitions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_documents`
--
ALTER TABLE `user_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
