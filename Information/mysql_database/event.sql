-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2021 at 10:42 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_schedule` (IN `clientId` INT(3), IN `eventName` VARCHAR(50), IN `description` VARCHAR(100), IN `first_date` DATE, IN `stime` VARCHAR(10), IN `ltime` VARCHAR(10))  BEGIN
         
            declare max_date date ;
            declare new_week int ;
            declare cur_date date ;
        
            set max_date = adddate(first_date, INTERVAL 90 day);
            set cur_date = first_date;
            set new_week = 1;
        
          while cur_date <= max_date do
            
            insert into schedules (cliendId,name,description,startdate,starttime,endtime) 
            values (clientId,eventName,description, cur_date,stime,ltime);
            set cur_date= adddate(cur_date, INTERVAL new_week week);
            set new_week =+ 1 ; 
            
          end while;
          
          commit;
        
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliendId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startdate` date NOT NULL,
  `starttime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endtime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `cliendId`, `name`, `description`, `startdate`, `starttime`, `endtime`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sharat', 'j', '2021-06-12', '20:02', '20:02', '2021-06-12 09:14:39', '2021-06-12 09:14:39'),
(2, 1, 'Sharat', 'j', '2021-06-12', '20:02', '20:02', '2021-06-12 09:15:30', '2021-06-12 09:15:30'),
(3, 2, 'anushi', 'anu', '2021-06-10', '20:16', '20:20', '2021-06-12 09:16:10', '2021-06-12 09:16:10'),
(6, 2, 'anushi', 'aa', '2021-06-12', '20:35', '20:44', '2021-06-12 09:43:25', '2021-06-12 09:43:25'),
(7, 2, 'sha', 'rat', '2021-06-12', '20:48', '20:55', '2021-06-12 09:48:51', '2021-06-12 09:48:51'),
(8, 2, 'sha', 'rat', '2021-06-12', '20:48', '20:55', '2021-06-12 09:50:39', '2021-06-12 09:50:39'),
(9, 2, 'sha', 'rat', '2021-06-12', '20:48', '20:55', '2021-06-12 09:51:53', '2021-06-12 09:51:53'),
(10, 2, 'Abc', 'def', '2021-06-19', '22:29', '22:29', '2021-06-12 11:29:43', '2021-06-12 11:29:43'),
(11, 2, 'Abc', 'def', '2021-06-19', '22:29', '22:29', '2021-06-12 11:29:55', '2021-06-12 11:29:55'),
(12, 1, 'New Meet', 'Rookie meet', '2021-06-12', '10:00', '12:00', '2021-06-12 12:40:02', '2021-06-12 12:40:02'),
(13, 1, 'New Meeting', 'New Joinee', '2021-06-13', '01:39', '02:30', '2021-06-12 14:39:29', '2021-06-12 14:39:29');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_06_11_100657_create_signups_table', 1),
(5, '2021_06_11_132014_create_sessions_table', 2),
(8, '2021_06_12_071521_create_events_table', 3),
(11, '2021_06_12_071622_create_schedules_table', 4),
(14, '2021_06_12_192259_create_store_procedure', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliendId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startdate` date NOT NULL,
  `starttime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endtime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `cliendId`, `name`, `description`, `startdate`, `starttime`, `endtime`, `created_at`, `updated_at`) VALUES
(1, 1, 'New Meeting', 'New Joinee', '2021-06-13', '01:39', '02:30', NULL, NULL),
(2, 1, 'New Meeting', 'New Joinee', '2021-06-20', '01:39', '02:30', NULL, NULL),
(3, 1, 'New Meeting', 'New Joinee', '2021-06-27', '01:39', '02:30', NULL, NULL),
(4, 1, 'New Meeting', 'New Joinee', '2021-07-04', '01:39', '02:30', NULL, NULL),
(5, 1, 'New Meeting', 'New Joinee', '2021-07-11', '01:39', '02:30', NULL, NULL),
(6, 1, 'New Meeting', 'New Joinee', '2021-07-18', '01:39', '02:30', NULL, NULL),
(7, 1, 'New Meeting', 'New Joinee', '2021-07-25', '01:39', '02:30', NULL, NULL),
(8, 1, 'New Meeting', 'New Joinee', '2021-08-01', '01:39', '02:30', NULL, NULL),
(9, 1, 'New Meeting', 'New Joinee', '2021-08-08', '01:39', '02:30', NULL, NULL),
(10, 1, 'New Meeting', 'New Joinee', '2021-08-15', '01:39', '02:30', NULL, NULL),
(11, 1, 'New Meeting', 'New Joinee', '2021-08-22', '01:39', '02:30', NULL, NULL),
(12, 1, 'New Meeting', 'New Joinee', '2021-08-29', '01:39', '02:30', NULL, NULL),
(13, 1, 'New Meeting', 'New Joinee', '2021-09-05', '01:39', '02:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `signups`
--

CREATE TABLE `signups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `signups`
--

INSERT INTO `signups` (`id`, `firstname`, `lastname`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Sharat', 'Janageri', 'joaod@123', 'Xcvbn*&87top.', '2021-06-11 04:51:56', '2021-06-11 04:51:56'),
(2, 'Anu', 'Pa', 'anu@gm.co', 'Anushi', '2021-06-12 01:00:46', '2021-06-12 01:00:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `signups`
--
ALTER TABLE `signups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `signups`
--
ALTER TABLE `signups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
