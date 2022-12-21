-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 02, 2022 at 04:47 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vrent_test3`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `selected` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `currency_code`, `account`, `payment_method_id`, `selected`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'USD', 'customer@techvill.net', 1, 'No', '2020-12-03 00:35:49', '2020-12-03 00:35:49'),
(2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'USD', 'william@techvill.net', 1, 'No', '2020-12-03 00:41:20', '2020-12-03 00:41:20'),
(3, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'USD', 'john@techvill.net', 1, 'No', '2020-12-03 00:42:56', '2020-12-03 00:42:56'),
(4, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'USD', 'test@techvill.net', 1, 'No', '2020-12-03 00:59:05', '2020-12-03 00:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_username_unique` (`username`) USING HASH,
  UNIQUE KEY `admin_email_unique` (`email`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `profile_image`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@techvill.net', '$2y$10$cS3WooR/tPPQ42qvo1NqB.i8crb.30NLYF3I05JyPDr/JYR.tqwMe', NULL, 'Active', NULL, '2020-12-02 23:30:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
CREATE TABLE IF NOT EXISTS `amenities` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `title`, `description`, `symbol`, `type_id`, `status`) VALUES
(1, 'Essentials', 'Towels, bed sheets, soap and toilet paper', 'essentials', 1, 'Active'),
(2, 'TV', '', 'tv', 1, 'Active'),
(3, 'Cable TV', '', 'desktop', 1, 'Active'),
(4, 'Air Conditioning ', '', 'air-conditioning', 1, 'Active'),
(5, 'Heating', 'Heating', 'heating', 1, 'Active'),
(6, 'Kitchen', 'Kitchen', 'meal', 1, 'Active'),
(7, 'Internet', 'Internet', 'internet', 1, 'Active'),
(8, 'Gym', 'Gym', 'gym', 1, 'Active'),
(9, 'Elevator in Building', '', 'elevator', 1, 'Active'),
(10, 'Indoor Fireplace', '', 'fireplace', 1, 'Active'),
(11, 'Buzzer/Wireless Intercom', '', 'intercom', 1, 'Active'),
(12, 'Doorman', '', 'doorman', 1, 'Active'),
(13, 'Shampoo', '', 'smoking', 1, 'Active'),
(14, 'Wireless Internet', 'Wireless Internet', 'wifi', 1, 'Active'),
(15, 'Hot Tub', '', 'hot-tub', 1, 'Active'),
(16, 'Washer', 'Washer', 'washer', 1, 'Active'),
(17, 'Pool', 'Pool', 'pool', 1, 'Active'),
(18, 'Dryer', 'Dryer', 'dryer', 1, 'Active'),
(19, 'Breakfast', 'Breakfast', 'cup', 1, 'Active'),
(20, 'Free Parking on Premises', '', 'parking', 1, 'Active'),
(21, 'Family/Kid Friendly', 'Family/Kid Friendly', 'family', 1, 'Active'),
(22, 'Smoking Allowed', '', 'smoking', 1, 'Active'),
(23, 'Suitable for Events', 'Suitable for Events', 'balloons', 1, 'Active'),
(24, 'Pets Allowed', '', 'paw', 1, 'Active'),
(25, 'Pets live on this property', '', 'ok', 1, 'Active'),
(26, 'Wheelchair Accessible', 'Wheelchair Accessible', 'accessible', 1, 'Active'),
(27, 'Smoke Detector', 'Smoke Detector', 'ok', 2, 'Active'),
(28, 'Carbon Monoxide Detector', 'Carbon Monoxide Detector', 'ok', 2, 'Active'),
(29, 'First Aid Kit', '', 'ok', 2, 'Active'),
(30, 'Safety Card', 'Safety Card', 'ok', 2, 'Active'),
(31, 'Fire Extinguisher', 'Essentials', 'ok', 2, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `amenity_type`
--

DROP TABLE IF EXISTS `amenity_type`;
CREATE TABLE IF NOT EXISTS `amenity_type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenity_type`
--

INSERT INTO `amenity_type` (`id`, `name`, `description`) VALUES
(1, 'Common Amenities', ''),
(2, 'Safety Amenities', '');

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
CREATE TABLE IF NOT EXISTS `backups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
CREATE TABLE IF NOT EXISTS `banks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swift_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `account_name`, `iban`, `swift_code`, `routing_no`, `bank_name`, `branch_name`, `branch_city`, `branch_address`, `description`, `country`, `logo`, `status`, `created_at`, `updated_at`) VALUES
(12, 'John Doe', '6667 77637 32432', NULL, NULL, 'HSBC', NULL, NULL, NULL, NULL, 'Hong Kong', 'HSBC16436916881643776507.png', 'Active', '2022-02-01 22:35:07', '2022-02-01 22:35:07');

-- --------------------------------------------------------

--
-- Table structure for table `bank_dates`
--

DROP TABLE IF EXISTS `bank_dates`;
CREATE TABLE IF NOT EXISTS `bank_dates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `heading` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subheading` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `heading`, `subheading`, `image`, `status`) VALUES
(1, 'Welcome to Hotel', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'banner_1.jpg', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `bed_type`
--

DROP TABLE IF EXISTS `bed_type`;
CREATE TABLE IF NOT EXISTS `bed_type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bed_type`
--

INSERT INTO `bed_type` (`id`, `name`) VALUES
(1, 'king'),
(2, 'Queen'),
(3, 'Double'),
(4, 'Single'),
(5, 'Sofa bed'),
(6, 'Sofa'),
(7, 'Sofa bed'),
(8, 'Bunk bed'),
(9, 'Air mattress'),
(10, 'Floor mattress'),
(11, 'Toddler bed'),
(12, 'Crib'),
(13, 'Water bed'),
(14, 'Hammock');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Accepted','Pending','Cancelled','Declined','Expired','Processing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `guest` int(11) NOT NULL DEFAULT '0',
  `total_night` int(11) NOT NULL DEFAULT '0',
  `per_night` double NOT NULL DEFAULT '0',
  `custom_price_dates` text COLLATE utf8mb4_unicode_ci,
  `base_price` double NOT NULL DEFAULT '0',
  `cleaning_charge` double NOT NULL DEFAULT '0',
  `guest_charge` double NOT NULL DEFAULT '0',
  `service_charge` double NOT NULL DEFAULT '0',
  `security_money` double NOT NULL DEFAULT '0',
  `iva_tax` double NOT NULL DEFAULT '0',
  `accomodation_tax` double NOT NULL DEFAULT '0',
  `date_with_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host_fee` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `booking_type` enum('request','instant') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'request',
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancellation` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_id` int(11) NOT NULL DEFAULT '0',
  `accepted_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` int(10) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `declined_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `cancelled_by` enum('Host','Guest') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `property_id`, `code`, `host_id`, `user_id`, `start_date`, `end_date`, `status`, `guest`, `total_night`, `per_night`, `custom_price_dates`, `base_price`, `cleaning_charge`, `guest_charge`, `service_charge`, `security_money`, `iva_tax`, `accomodation_tax`, `date_with_price`, `host_fee`, `total`, `booking_type`, `currency_code`, `cancellation`, `transaction_id`, `payment_method_id`, `accepted_at`, `attachment`, `bank_id`, `note`, `expired_at`, `declined_at`, `cancelled_at`, `cancelled_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'IhrEC1', 1, 4, '2020-12-03', '2020-12-03', 'Pending', 1, 1, 5, NULL, 5, 0, 0, 0, 0, 0, 0, NULL, 0, 5, 'request', 'USD', 'Flexible', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:14:57', '2020-12-03 00:14:57'),
(3, 9, 'xtyc5T', 4, 3, '2020-12-03', '2020-12-03', 'Accepted', 1, 1, 150, NULL, 168, 5, 0, 8, 5, 0, 0, NULL, 0, 168, 'instant', 'USD', 'Flexible', 'ch_1HuB8iDpvvQP5tMRgKzxy01h', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:18:06', '2020-12-03 00:18:06'),
(4, 16, 'gZix6t', 3, 4, '2020-12-03', '2020-12-03', 'Pending', 1, 1, 80, NULL, 84, 0, 0, 4, 0, 0, 0, NULL, 0, 84, 'request', 'USD', 'Flexible', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:19:16', '2020-12-03 00:19:16'),
(6, 7, 'uef1CU', 1, 3, '2020-12-03', '2020-12-03', 'Accepted', 2, 1, 100, NULL, 105, 0, 0, 5, 0, 0, 0, NULL, 0, 105, 'instant', 'USD', 'Flexible', 'ch_1HuBBrDpvvQP5tMRGP67nSMw', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:21:22', '2020-12-03 00:21:22'),
(8, 5, 'JFb4Wo', 2, 4, '2020-12-05', '2020-12-07', 'Pending', 1, 1, 20, NULL, 21, 0, 0, 1, 0, 0, 0, NULL, 0, 21, 'request', 'USD', 'Flexible', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:23:05', '2020-12-03 00:23:05'),
(9, 3, 'gWEBQ8', 1, 4, '2020-12-04', '2020-12-04', 'Pending', 1, 1, 7, NULL, 7, 0, 0, 0, 0, 0, 0, NULL, 0, 7, 'request', 'USD', 'Flexible', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:23:48', '2020-12-03 00:23:48'),
(10, 7, 'cHId2J', 1, 2, '2020-12-03', '2020-12-03', 'Accepted', 1, 1, 100, NULL, 105, 0, 0, 5, 0, 0, 0, NULL, 0, 105, 'instant', 'USD', 'Flexible', 'ch_1HuBG9DpvvQP5tMRChQ9vpnI', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:25:47', '2020-12-03 00:25:47'),
(11, 6, 'c6xF7w', 2, 1, '2020-12-01', '2020-12-01', 'Accepted', 1, 1, 120, NULL, 126, 0, 0, 6, 0, 0, 0, NULL, 0, 126, 'instant', 'USD', 'Flexible', 'ch_1HuBGoDpvvQP5tMR2RndQbAx', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:26:28', '2020-12-03 00:26:28'),
(12, 10, '8bwLjI', 4, 1, '2020-12-07', '2020-12-08', 'Pending', 1, 1, 244, NULL, 264, 8, 0, 12, 0, 0, 0, NULL, 0, 264, 'request', 'USD', 'Flexible', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:27:20', '2020-12-03 00:27:20'),
(14, 11, 'E2r31u', 3, 1, '2020-12-06', '2020-12-06', 'Pending', 1, 1, 150, NULL, 163, 5, 0, 8, 0, 0, 0, NULL, 0, 163, 'request', 'USD', 'Flexible', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:28:08', '2020-12-03 00:28:08'),
(16, 7, 'eS5Ali', 1, 4, '2020-12-01', '2020-12-01', 'Accepted', 1, 1, 100, NULL, 105, 0, 0, 5, 0, 0, 0, NULL, 0, 105, 'instant', 'USD', 'Flexible', 'ch_1HuCTTDpvvQP5tMRITOFrAC2', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 01:43:37', '2020-12-03 01:43:37'),
(17, 15, '2VkQ7g', 3, 2, '2021-06-24', '2021-06-25', 'Accepted', 1, 1, 55, NULL, 64, 0, 0, 3, 0, 3, 3, '[{\"price\":55,\"date\":\"2021-06-24\"}]', 0, 64, 'instant', 'USD', 'Flexible', 'ch_1J5ixIDpvvQP5tMRM46Kh3VF', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-24 10:10:17', '2021-06-24 10:10:17'),
(18, 15, '2BOja5', 3, 2, '2021-06-25', '2021-06-27', 'Accepted', 1, 2, 55, NULL, 128, 0, 0, 6, 0, 6, 6, '[{\"price\":55,\"date\":\"2021-06-25\"},{\"price\":55,\"date\":\"2021-06-26\"}]', 0, 128, 'instant', 'USD', 'Flexible', 'ch_1J5izADpvvQP5tMRBOTvRQED', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-24 10:12:12', '2021-06-24 10:12:12'),
(19, 15, 'y9zCe6', 3, 2, '2021-06-28', '2021-06-29', 'Accepted', 1, 1, 55, NULL, 64, 0, 0, 3, 0, 3, 3, '[{\"price\":55,\"date\":\"2021-06-28\"}]', 0, 64, 'instant', 'USD', 'Flexible', 'ch_1J5j39DpvvQP5tMRZtcEu2bF', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-24 10:16:20', '2021-06-24 10:16:20'),
(20, 7, 'NsS5tc', 1, 2, '2021-06-28', '2021-06-30', 'Accepted', 1, 2, 100, NULL, 230, 0, 0, 10, 0, 10, 10, '[{\"price\":100,\"date\":\"2021-06-28\"},{\"price\":100,\"date\":\"2021-06-29\"}]', 0, 230, 'instant', 'USD', 'Flexible', 'ch_1J5j7KDpvvQP5tMREflBUz1r', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-24 10:20:39', '2021-06-24 10:20:39'),
(21, 1, 'e3XDAn', 1, 3, '2021-06-24', '2021-06-25', 'Accepted', 1, 1, 5, NULL, 5, 0, 0, 0, 0, 0, 0, '[{\"price\":5,\"date\":\"2021-06-24\"}]', 0, 5, 'request', 'USD', 'Flexible', 'ch_1J5kYnDpvvQP5tMRYW4SVgEU', 2, '2021-06-24 11:51:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-24 11:51:13', '2021-06-24 11:53:05'),
(26, 8, 'FGhh3y', 2, 1, '2022-02-02', '2022-02-03', 'Accepted', 1, 1, 200, NULL, 230, 0, 0, 10, 0, 10, 10, '[{\"price\":200,\"date\":\"2022-02-02\"}]', 0, 230, 'instant', 'USD', 'Flexible', ' ', 4, NULL, 'HSBC1643692374.png', 12, 'hello. paying via bank', NULL, NULL, NULL, NULL, '2022-02-01 22:43:05', '2022-02-01 22:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

DROP TABLE IF EXISTS `booking_details`;
CREATE TABLE IF NOT EXISTS `booking_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `field` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`id`, `booking_id`, `field`, `value`) VALUES
(1, 1, 'country', ''),
(2, 2, 'country', 'AF'),
(3, 3, 'country', 'US'),
(4, 4, 'country', ''),
(5, 5, 'country', 'US'),
(6, 6, 'country', 'US'),
(7, 7, 'country', 'AF'),
(8, 8, 'country', ''),
(9, 9, 'country', ''),
(10, 10, 'country', 'US'),
(11, 11, 'country', 'US'),
(12, 12, 'country', ''),
(13, 13, 'country', 'AU'),
(14, 14, 'country', ''),
(15, 15, 'country', 'GB'),
(16, 16, 'country', 'US'),
(17, 17, 'country', 'US'),
(18, 18, 'country', 'BD'),
(19, 19, 'country', 'BD'),
(20, 20, 'country', 'BD'),
(21, 21, 'country', 'BD'),
(22, 22, 'country', 'US'),
(23, 23, 'country', 'US'),
(24, 24, 'country', 'US'),
(25, 25, 'country', 'US'),
(26, 26, 'country', 'AF');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `short_name` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_short_name_unique` (`short_name`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `short_name`, `name`, `iso3`, `number_code`, `phone_code`) VALUES
(1, 'AF', 'Afghanistan', 'AFG', '4', '93'),
(2, 'AL', 'Albania', 'ALB', '8', '355'),
(3, 'DZ', 'Algeria', 'DZA', '12', '213'),
(4, 'AS', 'American Samoa', 'ASM', '16', '1684'),
(5, 'AD', 'Andorra', 'AND', '20', '376'),
(6, 'AO', 'Angola', 'AGO', '24', '244'),
(7, 'AI', 'Anguilla', 'AIA', '660', '1264'),
(8, 'AQ', 'Antarctica', NULL, NULL, '0'),
(9, 'AG', 'Antigua and Barbuda', 'ATG', '28', '1268'),
(10, 'AR', 'Argentina', 'ARG', '32', '54'),
(11, 'AM', 'Armenia', 'ARM', '51', '374'),
(12, 'AW', 'Aruba', 'ABW', '533', '297'),
(13, 'AU', 'Australia', 'AUS', '36', '61'),
(14, 'AT', 'Austria', 'AUT', '40', '43'),
(15, 'AZ', 'Azerbaijan', 'AZE', '31', '994'),
(16, 'BS', 'Bahamas', 'BHS', '44', '1242'),
(17, 'BH', 'Bahrain', 'BHR', '48', '973'),
(18, 'BD', 'Bangladesh', 'BGD', '50', '880'),
(19, 'BB', 'Barbados', 'BRB', '52', '1246'),
(20, 'BY', 'Belarus', 'BLR', '112', '375'),
(21, 'BE', 'Belgium', 'BEL', '56', '32'),
(22, 'BZ', 'Belize', 'BLZ', '84', '501'),
(23, 'BJ', 'Benin', 'BEN', '204', '229'),
(24, 'BM', 'Bermuda', 'BMU', '60', '1441'),
(25, 'BT', 'Bhutan', 'BTN', '64', '975'),
(26, 'BO', 'Bolivia', 'BOL', '68', '591'),
(27, 'BA', 'Bosnia and Herzegovina', 'BIH', '70', '387'),
(28, 'BW', 'Botswana', 'BWA', '72', '267'),
(29, 'BV', 'Bouvet Island', NULL, NULL, '0'),
(30, 'BR', 'Brazil', 'BRA', '76', '55'),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL, '246'),
(32, 'BN', 'Brunei Darussalam', 'BRN', '96', '673'),
(33, 'BG', 'Bulgaria', 'BGR', '100', '359'),
(34, 'BF', 'Burkina Faso', 'BFA', '854', '226'),
(35, 'BI', 'Burundi', 'BDI', '108', '257'),
(36, 'KH', 'Cambodia', 'KHM', '116', '855'),
(37, 'CM', 'Cameroon', 'CMR', '120', '237'),
(38, 'CA', 'Canada', 'CAN', '124', '1'),
(39, 'CV', 'Cape Verde', 'CPV', '132', '238'),
(40, 'KY', 'Cayman Islands', 'CYM', '136', '1345'),
(41, 'CF', 'Central African Republic', 'CAF', '140', '236'),
(42, 'TD', 'Chad', 'TCD', '148', '235'),
(43, 'CL', 'Chile', 'CHL', '152', '56'),
(44, 'CN', 'China', 'CHN', '156', '86'),
(45, 'CX', 'Christmas Island', NULL, NULL, '61'),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL, '672'),
(47, 'CO', 'Colombia', 'COL', '170', '57'),
(48, 'KM', 'Comoros', 'COM', '174', '269'),
(49, 'CG', 'Congo', 'COG', '178', '242'),
(50, 'CD', 'Congo, the Democratic Republic of the', 'COD', '180', '242'),
(51, 'CK', 'Cook Islands', 'COK', '184', '682'),
(52, 'CR', 'Costa Rica', 'CRI', '188', '506'),
(53, 'CI', 'Cote D\'Ivoire', 'CIV', '384', '225'),
(54, 'HR', 'Croatia', 'HRV', '191', '385'),
(55, 'CU', 'Cuba', 'CUB', '192', '53'),
(56, 'CY', 'Cyprus', 'CYP', '196', '357'),
(57, 'CZ', 'Czech Republic', 'CZE', '203', '420'),
(58, 'DK', 'Denmark', 'DNK', '208', '45'),
(59, 'DJ', 'Djibouti', 'DJI', '262', '253'),
(60, 'DM', 'Dominica', 'DMA', '212', '1767'),
(61, 'DO', 'Dominican Republic', 'DOM', '214', '1809'),
(62, 'EC', 'Ecuador', 'ECU', '218', '593'),
(63, 'EG', 'Egypt', 'EGY', '818', '20'),
(64, 'SV', 'El Salvador', 'SLV', '222', '503'),
(65, 'GQ', 'Equatorial Guinea', 'GNQ', '226', '240'),
(66, 'ER', 'Eritrea', 'ERI', '232', '291'),
(67, 'EE', 'Estonia', 'EST', '233', '372'),
(68, 'ET', 'Ethiopia', 'ETH', '231', '251'),
(69, 'FK', 'Falkland Islands (Malvinas)', 'FLK', '238', '500'),
(70, 'FO', 'Faroe Islands', 'FRO', '234', '298'),
(71, 'FJ', 'Fiji', 'FJI', '242', '679'),
(72, 'FI', 'Finland', 'FIN', '246', '358'),
(73, 'FR', 'France', 'FRA', '250', '33'),
(74, 'GF', 'French Guiana', 'GUF', '254', '594'),
(75, 'PF', 'French Polynesia', 'PYF', '258', '689'),
(76, 'TF', 'French Southern Territories', NULL, NULL, '0'),
(77, 'GA', 'Gabon', 'GAB', '266', '241'),
(78, 'GM', 'Gambia', 'GMB', '270', '220'),
(79, 'GE', 'Georgia', 'GEO', '268', '995'),
(80, 'DE', 'Germany', 'DEU', '276', '49'),
(81, 'GH', 'Ghana', 'GHA', '288', '233'),
(82, 'GI', 'Gibraltar', 'GIB', '292', '350'),
(83, 'GR', 'Greece', 'GRC', '300', '30'),
(84, 'GL', 'Greenland', 'GRL', '304', '299'),
(85, 'GD', 'Grenada', 'GRD', '308', '1473'),
(86, 'GP', 'Guadeloupe', 'GLP', '312', '590'),
(87, 'GU', 'Guam', 'GUM', '316', '1671'),
(88, 'GT', 'Guatemala', 'GTM', '320', '502'),
(89, 'GN', 'Guinea', 'GIN', '324', '224'),
(90, 'GW', 'Guinea-Bissau', 'GNB', '624', '245'),
(91, 'GY', 'Guyana', 'GUY', '328', '592'),
(92, 'HT', 'Haiti', 'HTI', '332', '509'),
(93, 'HM', 'Heard Island and Mcdonald Islands', NULL, NULL, '0'),
(94, 'VA', 'Holy See (Vatican City State)', 'VAT', '336', '39'),
(95, 'HN', 'Honduras', 'HND', '340', '504'),
(96, 'HK', 'Hong Kong', 'HKG', '344', '852'),
(97, 'HU', 'Hungary', 'HUN', '348', '36'),
(98, 'IS', 'Iceland', 'ISL', '352', '354'),
(99, 'IN', 'India', 'IND', '356', '91'),
(100, 'ID', 'Indonesia', 'IDN', '360', '62'),
(101, 'IR', 'Iran, Islamic Republic of', 'IRN', '364', '98'),
(102, 'IQ', 'Iraq', 'IRQ', '368', '964'),
(103, 'IE', 'Ireland', 'IRL', '372', '353'),
(104, 'IL', 'Israel', 'ISR', '376', '972'),
(105, 'IT', 'Italy', 'ITA', '380', '39'),
(106, 'JM', 'Jamaica', 'JAM', '388', '1876'),
(107, 'JP', 'Japan', 'JPN', '392', '81'),
(108, 'JO', 'Jordan', 'JOR', '400', '962'),
(109, 'KZ', 'Kazakhstan', 'KAZ', '398', '7'),
(110, 'KE', 'Kenya', 'KEN', '404', '254'),
(111, 'KI', 'Kiribati', 'KIR', '296', '686'),
(112, 'KP', 'Korea, Democratic People\'s Republic of', 'PRK', '408', '850'),
(113, 'KR', 'Korea, Republic of', 'KOR', '410', '82'),
(114, 'KW', 'Kuwait', 'KWT', '414', '965'),
(115, 'KG', 'Kyrgyzstan', 'KGZ', '417', '996'),
(116, 'LA', 'Lao People\'s Democratic Republic', 'LAO', '418', '856'),
(117, 'LV', 'Latvia', 'LVA', '428', '371'),
(118, 'LB', 'Lebanon', 'LBN', '422', '961'),
(119, 'LS', 'Lesotho', 'LSO', '426', '266'),
(120, 'LR', 'Liberia', 'LBR', '430', '231'),
(121, 'LY', 'Libyan Arab Jamahiriya', 'LBY', '434', '218'),
(122, 'LI', 'Liechtenstein', 'LIE', '438', '423'),
(123, 'LT', 'Lithuania', 'LTU', '440', '370'),
(124, 'LU', 'Luxembourg', 'LUX', '442', '352'),
(125, 'MO', 'Macao', 'MAC', '446', '853'),
(126, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'MKD', '807', '389'),
(127, 'MG', 'Madagascar', 'MDG', '450', '261'),
(128, 'MW', 'Malawi', 'MWI', '454', '265'),
(129, 'MY', 'Malaysia', 'MYS', '458', '60'),
(130, 'MV', 'Maldives', 'MDV', '462', '960'),
(131, 'ML', 'Mali', 'MLI', '466', '223'),
(132, 'MT', 'Malta', 'MLT', '470', '356'),
(133, 'MH', 'Marshall Islands', 'MHL', '584', '692'),
(134, 'MQ', 'Martinique', 'MTQ', '474', '596'),
(135, 'MR', 'Mauritania', 'MRT', '478', '222'),
(136, 'MU', 'Mauritius', 'MUS', '480', '230'),
(137, 'YT', 'Mayotte', NULL, NULL, '269'),
(138, 'MX', 'Mexico', 'MEX', '484', '52'),
(139, 'FM', 'Micronesia, Federated States of', 'FSM', '583', '691'),
(140, 'MD', 'Moldova, Republic of', 'MDA', '498', '373'),
(141, 'MC', 'Monaco', 'MCO', '492', '377'),
(142, 'MN', 'Mongolia', 'MNG', '496', '976'),
(143, 'MS', 'Montserrat', 'MSR', '500', '1664'),
(144, 'MA', 'Morocco', 'MAR', '504', '212'),
(145, 'MZ', 'Mozambique', 'MOZ', '508', '258'),
(146, 'MM', 'Myanmar', 'MMR', '104', '95'),
(147, 'NA', 'Namibia', 'NAM', '516', '264'),
(148, 'NR', 'Nauru', 'NRU', '520', '674'),
(149, 'NP', 'Nepal', 'NPL', '524', '977'),
(150, 'NL', 'Netherlands', 'NLD', '528', '31'),
(151, 'AN', 'Netherlands Antilles', 'ANT', '530', '599'),
(152, 'NC', 'New Caledonia', 'NCL', '540', '687'),
(153, 'NZ', 'New Zealand', 'NZL', '554', '64'),
(154, 'NI', 'Nicaragua', 'NIC', '558', '505'),
(155, 'NE', 'Niger', 'NER', '562', '227'),
(156, 'NG', 'Nigeria', 'NGA', '566', '234'),
(157, 'NU', 'Niue', 'NIU', '570', '683'),
(158, 'NF', 'Norfolk Island', 'NFK', '574', '672'),
(159, 'MP', 'Northern Mariana Islands', 'MNP', '580', '1670'),
(160, 'NO', 'Norway', 'NOR', '578', '47'),
(161, 'OM', 'Oman', 'OMN', '512', '968'),
(162, 'PK', 'Pakistan', 'PAK', '586', '92'),
(163, 'PW', 'Palau', 'PLW', '585', '680'),
(164, 'PS', 'Palestinian Territory, Occupied', NULL, NULL, '970'),
(165, 'PA', 'Panama', 'PAN', '591', '507'),
(166, 'PG', 'Papua New Guinea', 'PNG', '598', '675'),
(167, 'PY', 'Paraguay', 'PRY', '600', '595'),
(168, 'PE', 'Peru', 'PER', '604', '51'),
(169, 'PH', 'Philippines', 'PHL', '608', '63'),
(170, 'PN', 'Pitcairn', 'PCN', '612', '0'),
(171, 'PL', 'Poland', 'POL', '616', '48'),
(172, 'PT', 'Portugal', 'PRT', '620', '351'),
(173, 'PR', 'Puerto Rico', 'PRI', '630', '1787'),
(174, 'QA', 'Qatar', 'QAT', '634', '974'),
(175, 'RE', 'Reunion', 'REU', '638', '262'),
(176, 'RO', 'Romania', 'ROM', '642', '40'),
(177, 'RU', 'Russian Federation', 'RUS', '643', '70'),
(178, 'RW', 'Rwanda', 'RWA', '646', '250'),
(179, 'SH', 'Saint Helena', 'SHN', '654', '290'),
(180, 'KN', 'Saint Kitts and Nevis', 'KNA', '659', '1869'),
(181, 'LC', 'Saint Lucia', 'LCA', '662', '1758'),
(182, 'PM', 'Saint Pierre and Miquelon', 'SPM', '666', '508'),
(183, 'VC', 'Saint Vincent and the Grenadines', 'VCT', '670', '1784'),
(184, 'WS', 'Samoa', 'WSM', '882', '684'),
(185, 'SM', 'San Marino', 'SMR', '674', '378'),
(186, 'ST', 'Sao Tome and Principe', 'STP', '678', '239'),
(187, 'SA', 'Saudi Arabia', 'SAU', '682', '966'),
(188, 'SN', 'Senegal', 'SEN', '686', '221'),
(189, 'CS', 'Serbia and Montenegro', NULL, NULL, '381'),
(190, 'SC', 'Seychelles', 'SYC', '690', '248'),
(191, 'SL', 'Sierra Leone', 'SLE', '694', '232'),
(192, 'SG', 'Singapore', 'SGP', '702', '65'),
(193, 'SK', 'Slovakia', 'SVK', '703', '421'),
(194, 'SI', 'Slovenia', 'SVN', '705', '386'),
(195, 'SB', 'Solomon Islands', 'SLB', '90', '677'),
(196, 'SO', 'Somalia', 'SOM', '706', '252'),
(197, 'ZA', 'South Africa', 'ZAF', '710', '27'),
(198, 'GS', 'South Georgia and the South Sandwich Islands', NULL, NULL, '0'),
(199, 'ES', 'Spain', 'ESP', '724', '34'),
(200, 'LK', 'Sri Lanka', 'LKA', '144', '94'),
(201, 'SD', 'Sudan', 'SDN', '736', '249'),
(202, 'SR', 'Suriname', 'SUR', '740', '597'),
(203, 'SJ', 'Svalbard and Jan Mayen', 'SJM', '744', '47'),
(204, 'SZ', 'Swaziland', 'SWZ', '748', '268'),
(205, 'SE', 'Sweden', 'SWE', '752', '46'),
(206, 'CH', 'Switzerland', 'CHE', '756', '41'),
(207, 'SY', 'Syrian Arab Republic', 'SYR', '760', '963'),
(208, 'TW', 'Taiwan, Province of China', 'TWN', '158', '886'),
(209, 'TJ', 'Tajikistan', 'TJK', '762', '992'),
(210, 'TZ', 'Tanzania, United Republic of', 'TZA', '834', '255'),
(211, 'TH', 'Thailand', 'THA', '764', '66'),
(212, 'TL', 'Timor-Leste', NULL, NULL, '670'),
(213, 'TG', 'Togo', 'TGO', '768', '228'),
(214, 'TK', 'Tokelau', 'TKL', '772', '690'),
(215, 'TO', 'Tonga', 'TON', '776', '676'),
(216, 'TT', 'Trinidad and Tobago', 'TTO', '780', '1868'),
(217, 'TN', 'Tunisia', 'TUN', '788', '216'),
(218, 'TR', 'Turkey', 'TUR', '792', '90'),
(219, 'TM', 'Turkmenistan', 'TKM', '795', '7370'),
(220, 'TC', 'Turks and Caicos Islands', 'TCA', '796', '1649'),
(221, 'TV', 'Tuvalu', 'TUV', '798', '688'),
(222, 'UG', 'Uganda', 'UGA', '800', '256'),
(223, 'UA', 'Ukraine', 'UKR', '804', '380'),
(224, 'AE', 'United Arab Emirates', 'ARE', '784', '971'),
(225, 'GB', 'United Kingdom', 'GBR', '826', '44'),
(226, 'US', 'United States', 'USA', '840', '1'),
(227, 'UM', 'United States Minor Outlying Islands', NULL, NULL, '1'),
(228, 'UY', 'Uruguay', 'URY', '858', '598'),
(229, 'UZ', 'Uzbekistan', 'UZB', '860', '998'),
(230, 'VU', 'Vanuatu', 'VUT', '548', '678'),
(231, 'VE', 'Venezuela', 'VEN', '862', '58'),
(232, 'VN', 'Viet Nam', 'VNM', '704', '84'),
(233, 'VG', 'Virgin Islands, British', 'VGB', '92', '1284'),
(234, 'VI', 'Virgin Islands, U.s.', 'VIR', '850', '1340'),
(235, 'WF', 'Wallis and Futuna', 'WLF', '876', '681'),
(236, 'EH', 'Western Sahara', 'ESH', '732', '212'),
(237, 'YE', 'Yemen', 'YEM', '887', '967'),
(238, 'ZM', 'Zambia', 'ZMB', '894', '260'),
(239, 'ZW', 'Zimbabwe', 'ZWE', '716', '263');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `default` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_code_unique` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `code`, `symbol`, `rate`, `status`, `default`) VALUES
(1, 'US Dollar', 'USD', '&#36;', '1.00', 'Active', '1'),
(2, 'Pound Sterling', 'GBP', '&pound;', '0.65', 'Active', '0'),
(3, 'Europe', 'EUR', '&euro;', '0.88', 'Active', '0'),
(4, 'Australian Dollar', 'AUD', '&#36;', '1.41', 'Active', '0'),
(5, 'Singapore', 'SGD', '&#36;', '1.41', 'Active', '0'),
(6, 'Swedish Krona', 'SEK', 'kr', '8.24', 'Active', '0'),
(7, 'Danish Krone', 'DKK', 'kr', '6.58', 'Active', '0'),
(8, 'Mexican Peso', 'MXN', '$', '16.83', 'Active', '0'),
(9, 'Brazilian Real', 'BRL', 'R$', '3.88', 'Active', '0'),
(10, 'Malaysian Ringgit', 'MYR', 'RM', '4.31', 'Active', '0'),
(11, 'Philippine Peso', 'PHP', 'P', '46.73', 'Active', '0'),
(12, 'Swiss Franc', 'CHF', '&euro;', '0.97', 'Active', '0'),
(13, 'India', 'INR', '&#x20B9;', '66.24', 'Active', '0'),
(14, 'Argentine Peso', 'ARS', '&#36;', '9.35', 'Active', '0'),
(15, 'Canadian Dollar', 'CAD', '&#36;', '1.33', 'Active', '0'),
(16, 'Chinese Yuan', 'CNY', '&#165;', '6.37', 'Active', '0'),
(17, 'Czech Republic Koruna', 'CZK', 'K&#269;', '23.91', 'Active', '0'),
(18, 'Hong Kong Dollar', 'HKD', '&#36;', '7.75', 'Active', '0'),
(19, 'Hungarian Forint', 'HUF', 'Ft', '276.41', 'Active', '0'),
(20, 'Indonesian Rupiah', 'IDR', 'Rp', '14249.50', 'Active', '0'),
(21, 'Israeli New Sheqel', 'ILS', '&#8362;', '3.86', 'Active', '0'),
(22, 'Japanese Yen', 'JPY', '&#165;', '120.59', 'Active', '0'),
(23, 'South Korean Won', 'KRW', '&#8361;', '1182.69', 'Active', '0'),
(24, 'Norwegian Krone', 'NOK', 'kr', '8.15', 'Active', '0'),
(25, 'New Zealand Dollar', 'NZD', '&#36;', '1.58', 'Active', '0'),
(26, 'Polish Zloty', 'PLN', 'z&#322;', '3.71', 'Active', '0'),
(27, 'Russian Ruble', 'RUB', 'p', '67.75', 'Active', '0'),
(28, 'Thai Baht', 'THB', '&#3647;', '36.03', 'Active', '0'),
(29, 'Turkish Lira', 'TRY', '&#8378;', '3.05', 'Active', '0'),
(30, 'New Taiwan Dollar', 'TWD', '&#36;', '32.47', 'Active', '0'),
(31, 'Vietnamese Dong', 'VND', '&#8363;', '22471.00', 'Active', '0'),
(32, 'South African Rand', 'ZAR', 'R', '13.55', 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `temp_id` int(11) NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('email','sms') COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `temp_id`, `subject`, `body`, `link_text`, `lang`, `type`, `lang_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Your Payout information has been updated in {site_name}', 'Hi {first_name},\r\n                            <br><br>\r\n                            We hope this message finds you well. Your {site_name} payout account information was recently changed on {date_time}. To help keep your account secure, we wanted to reach out to confirm that you made this change. Feel free to disregard this message if you updated your payout account information on {date_time}.\r\n                            <br><br>\r\n                            If you did not make this change to your account, please contact us.<br>', NULL, 'en', 'email', 1, NULL, NULL),
(2, 2, 'Your Payout information has been updated in {site_name}', 'Hi {first_name},\r\n                            <br><br>\r\n                            Your {site_name} payout information was updated on {date_time}.<br>', NULL, 'en', 'email', 1, NULL, NULL),
(3, 3, 'Your Payout information has been deleted in {site_name}', 'Hi {first_name},\r\n                            <br><br>\r\n                            Your {site_name} payout information was deleted on {date_time}.<br>', NULL, 'en', 'email', 1, NULL, NULL),
(4, 4, 'Booking inquiry for {property_name}', 'Hi {owner_first_name},\r\n                            <br><br>\r\n                   <h1>Respond to {user_first_name}’s Inquiry</h1>\r\n                   <br>\r\n                    {total_night} {night/nights} at {property_name}\r\n                   <br>\r\n                    {messages_message}\r\n                    <br>\r\n                    Property Name:  {property_name}\r\n                   <br>\r\n                    Number of Guest: {total_guest}\r\n                    <br>\r\n                    Number of Night: {total_night}\r\n                    <br>\r\n                            Check in Time: {start_date}\r\n<br>\r\nPayment Via: {payment_method}', NULL, 'en', 'email', 1, NULL, NULL),
(5, 5, 'Please confirm your e-mail address', 'Hi {first_name},\r\n                            <br><br>\r\n                            Welcome to {site_name}! Please confirm your account.', NULL, 'en', 'email', 1, NULL, NULL),
(6, 6, 'Reset your Password', 'Hi {first_name},\r\n                            <br><br>\r\n                            Your requested password reset link is below. If you didn\'t make the request, just ignore this email.', NULL, 'en', 'email', 1, NULL, NULL),
(7, 7, 'Please set a payment account', 'Hi {first_name},\r\n                            <br><br>\r\n                            Amount {currency_symbol}{payout_amount} is waiting for you but you did not add any payout account to send the money. Please add a payout method.', NULL, 'en', 'email', 1, NULL, NULL),
(8, 8, 'Payout Sent', 'Hi {first_name},\r\n                            <br><br>\r\n                            We\'ve issued you a payout of  {currency_symbol}{payout_amount} via PayPal. This payout should arrive in your account, taking into consideration weekends and holidays.', NULL, 'en', 'email', 1, NULL, NULL),
(9, 9, 'Booking Cancelled', 'Hi {owner_first_name},\r\n                            <br><br>\r\n                            {user_first_name} cancelled booking of {property_name}.<br>', NULL, 'en', 'email', 1, NULL, NULL),
(10, 10, 'Booking {Accepted/Declined}', 'Hi {guest_first_name},\r\n                            <br><br>\r\n                            {host_first_name} {Accepted/Declined} the booking of {property_name}.<br>', NULL, 'en', 'email', 1, NULL, NULL),
(11, 11, 'Booking request send for {property_name}', 'Hi {user_first_name},\r\n                            <br><br>\r\n                            <h1>Booking request send to {owner_first_name}</h1>\r\n                            <br>\r\n                            {total_night} {night/nights} at {property_name}\r\n                            <br>\r\n                            Property Name:  {property_name}\r\n                            <br>\r\n                            Number of Guest: {total_guest}\r\n                            <br>\r\n                            Number of Night: {total_night}\r\n                            <br>\r\n                            Check in Time: {start_date}', NULL, 'en', 'email', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
CREATE TABLE IF NOT EXISTS `favourites` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `property_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(4, 7, 2, 'Active', NULL, NULL),
(5, 15, 2, 'Active', NULL, NULL),
(6, 11, 1, 'Active', NULL, NULL),
(7, 10, 1, 'Active', NULL, NULL),
(8, 6, 1, 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `default` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `name`, `short_name`, `status`, `default`) VALUES
(1, 'English', 'en', 'Active', '1'),
(2, 'عربى', 'ar', 'Active', '0'),
(3, '中文 (繁體)', 'ch', 'Active', '0'),
(4, 'Français', 'fr', 'Active', '0'),
(5, 'Português', 'pt', 'Active', '0'),
(6, 'Русский', 'ru', 'Active', '0'),
(7, 'Español', 'es', 'Active', '0'),
(8, 'Türkçe', 'tr', 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `type_id` int(11) DEFAULT NULL,
  `read` int(11) NOT NULL DEFAULT '0',
  `archive` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `property_id`, `booking_id`, `sender_id`, `receiver_id`, `message`, `type_id`, `read`, `archive`, `star`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, 1, 'Hey, I want to stay at this home.', 4, 1, 0, 0, '2020-12-03 00:14:57', '2021-06-23 17:42:01'),
(3, 9, 3, 3, 4, 'Booking for Entire home/apt in Castlereagh St, Haymarket', 4, 0, 0, 0, '2020-12-03 00:18:06', '2020-12-03 00:18:06'),
(4, 16, 4, 4, 3, 'Hey, I want to stay at this home.', 4, 1, 0, 0, '2020-12-03 00:19:16', '2020-12-03 00:21:49'),
(6, 7, 6, 3, 1, 'Hellow, Paying for Dream house duplex villa mayrouba booking', 4, 1, 0, 0, '2020-12-03 00:21:22', '2021-06-23 17:41:55'),
(8, 5, 8, 4, 2, 'I want to stay your home.', 4, 1, 0, 0, '2020-12-03 00:23:05', '2021-06-23 17:48:32'),
(9, 3, 9, 4, 1, 'I want to stay your home', 4, 1, 0, 0, '2020-12-03 00:23:48', '2021-06-23 17:41:51'),
(10, 7, 10, 2, 1, 'Booking for Dream House Duplex Villa Mayrouba', 4, 1, 0, 0, '2020-12-03 00:25:47', '2021-06-23 17:44:56'),
(11, 6, 11, 1, 2, 'Hey, I want to stay at this home.', 4, 1, 0, 0, '2020-12-03 00:26:28', '2021-06-23 17:47:58'),
(12, 10, 12, 1, 4, 'I want to book your apartment.', 4, 0, 0, 0, '2020-12-03 00:27:20', '2020-12-03 00:27:20'),
(14, 11, 14, 1, 3, 'I want to stay at your home.', 4, 0, 0, 0, '2020-12-03 00:28:08', '2020-12-03 00:28:08'),
(16, 6, 11, 2, 1, 'Ok We are ready to host you', 1, 1, 0, 0, '2020-12-03 00:30:27', '2021-06-23 17:47:33'),
(17, 6, 11, 1, 2, 'thanks', 1, 1, 0, 0, '2020-12-03 00:31:13', '2021-06-23 17:47:58'),
(18, 7, 10, 1, 2, 'Ok We are ready to host you', 1, 1, 0, 0, '2020-12-03 00:33:12', '2021-06-23 17:45:49'),
(19, 1, 1, 1, 4, 'Ok We are ready to host you', 1, 0, 0, 0, '2020-12-03 00:33:23', '2020-12-03 00:33:23'),
(20, 7, 16, 4, 1, 'Booking Dream house duplex villa mayrouba apartment', 4, 1, 0, 0, '2020-12-03 01:43:37', '2021-06-23 17:41:58'),
(21, 7, 10, 2, 1, 'When will you arrived ?', 1, 1, 0, 0, '2021-06-23 17:42:59', '2021-06-23 17:44:56'),
(22, 7, 10, 1, 2, 'We will arrive at 10 PM, what is your check in time ?', 1, 1, 0, 0, '2021-06-23 17:43:43', '2021-06-23 17:45:49'),
(23, 7, 10, 2, 1, 'You can check in here from 12 A.M', 1, 1, 0, 0, '2021-06-23 17:44:44', '2021-06-23 17:44:56'),
(24, 6, 11, 2, 1, 'When you will arrive ?', 1, 1, 0, 0, '2021-06-23 17:46:07', '2021-06-23 17:47:33'),
(25, 6, 11, 1, 2, 'We will there on 10 PM', 1, 1, 0, 0, '2021-06-23 17:46:45', '2021-06-23 17:47:58'),
(26, 6, 11, 1, 2, 'We will receive you from station', 1, 1, 0, 0, '2021-06-23 17:47:33', '2021-06-23 17:47:58'),
(27, 15, 17, 2, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.', 4, 0, 0, 0, '2021-06-24 10:10:17', '2021-06-24 10:10:17'),
(28, 15, 18, 2, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.', 4, 0, 0, 0, '2021-06-24 10:12:12', '2021-06-24 10:12:12'),
(29, 15, 19, 2, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.', 4, 1, 0, 0, '2021-06-24 10:16:20', '2021-06-24 10:28:35'),
(30, 7, 20, 2, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.', 4, 0, 0, 0, '2021-06-24 10:20:39', '2021-06-24 10:20:39'),
(31, 15, 19, 3, 2, 'Thanks for booking us', 1, 1, 0, 0, '2021-06-24 10:27:45', '2021-06-24 10:29:06'),
(32, 15, 19, 2, 3, 'You are welcome', 1, 1, 0, 0, '2021-06-24 10:28:06', '2021-06-24 10:28:35'),
(33, 15, 19, 3, 2, 'Our checking time is 12 pm', 1, 1, 0, 0, '2021-06-24 10:28:35', '2021-06-24 10:29:06'),
(34, 15, 19, 2, 3, 'We will be there before 12 pm, thanks for informing us', 1, 0, 0, 0, '2021-06-24 10:29:06', '2021-06-24 10:29:06'),
(35, 1, 21, 3, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.', 4, 0, 0, 0, '2021-06-24 11:51:13', '2021-06-24 11:51:13'),
(36, 1, 21, 1, 3, 'fsaasfd', 5, 0, 0, 0, '2021-06-24 11:51:54', '2021-06-24 11:51:54'),
(37, 1, 21, 3, 1, 'sadasdf', 4, 0, 0, 0, '2021-06-24 11:53:06', '2021-06-24 11:53:06'),
(42, 8, 26, 1, 2, 'Hi. Instant Booking', 4, 0, 0, 0, '2022-02-01 22:43:05', '2022-02-01 22:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `message_type`
--

DROP TABLE IF EXISTS `message_type`;
CREATE TABLE IF NOT EXISTS `message_type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_type`
--

INSERT INTO `message_type` (`id`, `name`, `description`) VALUES
(1, 'query', NULL),
(2, 'guest_cancellation', NULL),
(3, 'host_cancellation', NULL),
(4, 'booking_request', NULL),
(5, 'booking_accecpt', NULL),
(6, 'booking_decline', NULL),
(7, 'booking_expire', NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_09_26_161159_entrust_setup_tables', 1),
(4, '2015_10_05_153204_create_timezone_table', 1),
(5, '2017_02_08_044609_create_accounts_table', 1),
(6, '2017_02_08_045108_create_pages_table', 1),
(7, '2017_02_08_045204_create_reports_table', 1),
(8, '2017_02_08_045412_create_country_table', 1),
(9, '2017_02_08_045643_create_language_table', 1),
(10, '2017_02_08_045745_create_currency_table', 1),
(11, '2017_02_23_110333_create_backup_table', 1),
(12, '2017_02_27_124315_create_seo_metas_table', 1),
(13, '2017_03_01_130507_create_user_details_table', 1),
(14, '2017_03_29_070352_create_payment_methods_table', 1),
(15, '2017_04_02_110016_create_notification_table', 1),
(16, '2017_05_04_102846_create_admin_table', 1),
(17, '2017_05_04_103841_create_property_type_table', 1),
(18, '2017_05_04_104010_create_amenities_table', 1),
(19, '2017_05_04_104406_create_amenity_type_table', 1),
(20, '2017_05_04_104509_create_rules_table', 1),
(21, '2017_05_04_105120_create_settings_table', 1),
(22, '2017_05_04_105515_create_properties_table', 1),
(23, '2017_05_04_105605_create_property_description_table', 1),
(24, '2017_05_04_105636_create_property_price_table', 1),
(25, '2017_05_04_105726_create_property_address_table', 1),
(26, '2017_05_04_105742_create_property_photos_table', 1),
(27, '2017_05_04_105800_create_property_details_table', 1),
(28, '2017_05_04_112613_create_property_dates_table', 1),
(29, '2017_05_04_112728_create_property_rules_table', 1),
(30, '2017_05_04_112954_create_property_fees_table', 1),
(31, '2017_05_04_113049_create_bookings_table', 1),
(32, '2017_05_04_113223_create_penalty_table', 1),
(33, '2017_05_04_113243_create_payout_table', 1),
(34, '2017_05_04_113355_create_payout_penalties_table', 1),
(35, '2017_05_04_113622_create_booking_details_table', 1),
(36, '2017_05_04_114011_create_reviews_table', 1),
(37, '2017_05_04_114131_create_messages_table', 1),
(38, '2017_05_04_114152_create_bed_types_table', 1),
(39, '2017_05_04_114215_create_banners_table', 1),
(40, '2017_05_04_114238_create_starting_cities_table', 1),
(41, '2017_05_07_133954_create_message_type_table', 1),
(42, '2017_05_08_073511_create_property_beds_table', 1),
(43, '2017_05_13_055552_create_space_type_table', 1),
(44, '2017_05_18_121707_create_property_steps_table', 1),
(45, '2017_06_18_080440_create_table_user_verification', 1),
(46, '2019_02_02_111427_create_email_templates_table', 1),
(47, '2019_03_03_100404_create_property_icalimports_table', 1),
(48, '2019_08_19_000000_create_failed_jobs_table', 1),
(49, '2020_08_06_062818_create_testimonials_table', 1),
(50, '2020_11_19_082447_create_wallets_table', 1),
(51, '2020_11_19_084031_create_withdrawals_table', 1),
(52, '2020_11_19_102628_create_payout_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('read','unread') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `url`, `content`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Help', 'help', '<h2>Help</h2><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'first', 'Active', NULL, NULL),
(2, 'About', 'about', '<h2>About</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 'first', 'Active', NULL, NULL),
(3, 'Policies', 'policies', '<h2>Policies</h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'second', 'Active', NULL, NULL),
(4, 'Privacy', 'privacy', '<h2><strong>Privacy</strong></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>&nbsp;</p>', 'second', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('william@gmail.com', '9lFlkvcnpMk2dn2TOj3PaOj10ZGgg6Q223mzT60MT5R5OeLsCektr6XPqMQGJu2qIoPqFy02GqwjLaaMp3SGtZ7sMv0hGrN2XNqk', '2020-12-02 23:31:31'),
('john@techvill.net', '8tMJR90rLjEtEJxn7DFyS7uxLZYdnERGDn9TP6k3gol1UN2HmjBqdd5KRYaWqWSWUFFbiMkLsuESDbvZthVbVxfYsb0Tmu1nb6V5', '2020-12-02 23:32:45'),
('william@techvill.net', 'jEMELKpbIg9CKs0dkU6rcpjL4QkRc5MeUK8c1aJdGJgB3y34rw8nb9EomklsH6xKH1oIwR301tc1AqsEWQYJr4kCmlDTvzD46pS2', '2020-12-02 23:34:05'),
('william@gmail.com', '9lFlkvcnpMk2dn2TOj3PaOj10ZGgg6Q223mzT60MT5R5OeLsCektr6XPqMQGJu2qIoPqFy02GqwjLaaMp3SGtZ7sMv0hGrN2XNqk', '2020-12-02 23:31:31'),
('john@techvill.net', '8tMJR90rLjEtEJxn7DFyS7uxLZYdnERGDn9TP6k3gol1UN2HmjBqdd5KRYaWqWSWUFFbiMkLsuESDbvZthVbVxfYsb0Tmu1nb6V5', '2020-12-02 23:32:45'),
('william@techvill.net', 'jEMELKpbIg9CKs0dkU6rcpjL4QkRc5MeUK8c1aJdGJgB3y34rw8nb9EomklsH6xKH1oIwR301tc1AqsEWQYJr4kCmlDTvzD46pS2', '2020-12-02 23:34:05');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE IF NOT EXISTS `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `status`) VALUES
(1, 'Paypal', 'Active'),
(2, 'Stripe', 'Active'),
(3, 'Wallet', 'Active'),
(4, 'Bank', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

DROP TABLE IF EXISTS `payouts`;
CREATE TABLE IF NOT EXISTS `payouts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `user_type` enum('Host','Guest') COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `penalty_amount` double NOT NULL DEFAULT '0',
  `status` enum('Completed','Future') COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payouts`
--

INSERT INTO `payouts` (`id`, `booking_id`, `user_id`, `property_id`, `user_type`, `account`, `amount`, `penalty_amount`, `status`, `currency_code`, `created_at`, `updated_at`) VALUES
(2, 3, 4, 9, 'Host', NULL, 160, 0, 'Future', 'USD', '2020-12-01 00:00:00', '2020-12-01 00:00:00'),
(4, 6, 1, 7, 'Host', NULL, 100, 0, 'Future', 'USD', '2020-12-01 00:00:00', '2020-12-01 00:00:00'),
(6, 10, 1, 7, 'Host', NULL, 100, 0, 'Future', 'USD', '2020-12-01 00:00:00', '2020-12-01 00:00:00'),
(7, 11, 2, 6, 'Host', NULL, 120, 0, 'Future', 'USD', '2020-12-02 00:00:00', '2020-12-02 00:00:00'),
(10, 16, 1, 7, 'Host', NULL, 100, 0, 'Future', 'USD', '2020-12-01 00:00:00', '2020-12-01 00:00:00'),
(11, 17, 3, 15, 'Host', NULL, 55, 0, 'Future', 'USD', '2021-06-24 10:10:17', '2021-06-24 10:10:17'),
(12, 18, 3, 15, 'Host', NULL, 110, 0, 'Future', 'USD', '2021-06-24 10:12:12', '2021-06-24 10:12:12'),
(13, 19, 3, 15, 'Host', NULL, 55, 0, 'Future', 'USD', '2021-06-24 10:16:20', '2021-06-24 10:16:20'),
(14, 20, 1, 7, 'Host', NULL, 200, 0, 'Future', 'USD', '2021-06-24 10:20:39', '2021-06-24 10:20:39'),
(15, 21, 1, 1, 'Host', NULL, 5, 0, 'Future', 'USD', '2021-06-24 11:51:54', '2021-06-24 11:51:54'),
(16, 21, 1, 1, 'Host', NULL, 5, 0, 'Future', 'USD', '2021-06-24 11:53:06', '2021-06-24 11:53:06'),
(17, 22, 2, 8, 'Host', NULL, 200, 0, 'Future', 'USD', '2022-02-01 22:39:31', '2022-02-01 22:39:31'),
(18, 26, 2, 8, 'Host', NULL, 200, 0, 'Future', 'USD', '2022-02-01 22:47:43', '2022-02-01 22:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `payout_penalties`
--

DROP TABLE IF EXISTS `payout_penalties`;
CREATE TABLE IF NOT EXISTS `payout_penalties` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payout_id` int(11) NOT NULL,
  `penalty_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_settings`
--

DROP TABLE IF EXISTS `payout_settings`;
CREATE TABLE IF NOT EXISTS `payout_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `swift_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `selected` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payout_settings`
--

INSERT INTO `payout_settings` (`id`, `user_id`, `type`, `email`, `account_name`, `account_number`, `bank_branch_name`, `bank_branch_city`, `bank_branch_address`, `country`, `swift_code`, `bank_name`, `is_active`, `selected`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'customer@techvill.net', 'Customer User', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'No', '2020-12-03 00:35:49', '2020-12-03 00:35:49'),
(2, 3, 1, 'william@techvill.net', 'William Smith', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'No', '2020-12-03 00:41:20', '2020-12-03 00:41:20'),
(3, 4, 1, 'john@techvill.net', 'John Doe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'No', '2020-12-03 00:42:56', '2020-12-03 00:42:56'),
(4, 1, 1, 'test@techvill.net', 'Test User', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'No', '2020-12-03 00:59:05', '2020-12-03 00:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
CREATE TABLE IF NOT EXISTS `penalty` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('Host','Guest') COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `remaining_penalty` double NOT NULL DEFAULT '0',
  `reason` enum('cancelation','demurrage','violation_of_rules') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Pending','Completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'manage_admin', 'Manage Admin', 'Manage Admin Users', NULL, NULL),
(2, 'customers', 'View Customers', 'View Customer', NULL, NULL),
(3, 'add_customer', 'Add Customer', 'Add Customer', NULL, NULL),
(4, 'edit_customer', 'Edit Customer', 'Edit Customer', NULL, NULL),
(5, 'properties', 'View Properties', 'View Properties', NULL, NULL),
(6, 'add_properties', 'Add Properties', 'Add Properties', NULL, NULL),
(7, 'edit_properties', 'Edit Properties', 'Edit Properties', NULL, NULL),
(8, 'delete_property', 'Delete Property', 'Delete Property', NULL, NULL),
(9, 'manage_bookings', 'Manage Bookings', 'Manage Bookings', NULL, NULL),
(10, 'manage_email_template', 'Manage Email Template', 'Manage Email Template', NULL, NULL),
(11, 'view_payouts', 'View Payouts', 'View Payouts', NULL, NULL),
(12, 'manage_amenities', 'Manage Amenities', 'Manage Amenities', NULL, NULL),
(13, 'manage_pages', 'Manage Pages', 'Manage Pages', NULL, NULL),
(14, 'manage_reviews', 'Manage Reviews', 'Manage Reviews', NULL, NULL),
(15, 'view_reports', 'View Reports', 'View Reports', NULL, NULL),
(16, 'general_setting', 'Settings', 'Settings', NULL, NULL),
(17, 'preference', 'Preference', 'Preference', NULL, NULL),
(18, 'manage_banners', 'Manage Banners', 'Manage Banners', NULL, NULL),
(19, 'starting_cities_settings', 'Starting Cities Settings', 'Starting Cities Settings', NULL, NULL),
(20, 'manage_property_type', 'Manage Property Type', 'Manage Property Type', NULL, NULL),
(21, 'space_type_setting', 'Space Type Setting', 'Space Type Setting', NULL, NULL),
(22, 'manage_bed_type', 'Manage Bed Type', 'Manage Bed Type', NULL, NULL),
(23, 'manage_currency', 'Manage Currency', 'Manage Currency', NULL, NULL),
(24, 'manage_country', 'Manage Country', 'Manage Country', NULL, NULL),
(25, 'manage_amenities_type', 'Manage Amenities Type', 'Manage Amenities Type', NULL, NULL),
(26, 'email_settings', 'Email Settings', 'Email Settings', NULL, NULL),
(27, 'manage_fees', 'Manage Fees', 'Manage Fees', NULL, NULL),
(28, 'manage_language', 'Manage Language', 'Manage Language', NULL, NULL),
(29, 'manage_metas', 'Manage Metas', 'Manage Metas', NULL, NULL),
(30, 'api_informations', 'Api Credentials', 'Api Credentials', NULL, NULL),
(31, 'payment_settings', 'Payment Settings', 'Payment Settings', NULL, NULL),
(32, 'social_links', 'Social Links', 'Social Links', NULL, NULL),
(33, 'manage_roles', 'Manage Roles', 'Manage Roles', NULL, NULL),
(34, 'database_backup', 'Database Backup', 'Database Backup', NULL, NULL),
(35, 'manage_sms', 'Manage SMS', 'Manage SMS', NULL, NULL),
(36, 'manage_messages', 'Manage Messages', 'Manage Messages', NULL, NULL),
(37, 'edit_messages', 'Edit Messages', 'Edit Messages', NULL, NULL),
(38, 'manage_testimonial', 'Manage Testimonial', 'Manage Testimonial', NULL, NULL),
(39, 'add_testimonial', 'Add Testimonial', 'Add Testimonial', NULL, NULL),
(40, 'edit_testimonial', 'Edit Testimonial', 'Edit Testimonial', NULL, NULL),
(41, 'delete_testimonial', 'Delete Testimonial', 'Delete Testimonial', NULL, NULL),
(42, 'social_logins', 'Social Logins', 'Manage Social Logins', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1);

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host_id` int(11) NOT NULL,
  `bedrooms` tinyint(4) DEFAULT NULL,
  `beds` tinyint(4) DEFAULT NULL,
  `bed_type` int(10) UNSIGNED DEFAULT NULL,
  `bathrooms` double(8,2) DEFAULT NULL,
  `amenities` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_type` int(11) NOT NULL DEFAULT '0',
  `space_type` int(11) NOT NULL DEFAULT '0',
  `accommodates` tinyint(4) DEFAULT NULL,
  `booking_type` enum('instant','request') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'request',
  `cancellation` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Flexible',
  `status` enum('Unlisted','Listed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unlisted',
  `recomended` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `slug`, `url_name`, `host_id`, `bedrooms`, `beds`, `bed_type`, `bathrooms`, `amenities`, `property_type`, `space_type`, `accommodates`, `booking_type`, `cancellation`, `status`, `recomended`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Hampton Inn', 'hampton-inn', NULL, 1, 10, 10, 1, 8.00, '1,2,4,5,7,9,10,29,30,31', 1, 1, 16, 'request', 'Flexible', 'Listed', 1, NULL, NULL, '2021-06-21 18:47:57'),
(2, 'North Sydney Harbourview Hotel', 'north-sydney-harbourview-hotel', NULL, 1, 10, 15, 2, 8.00, '1,3,4,5,6,7,8,9,10,27,28', 2, 2, 15, 'request', 'Flexible', 'Listed', 1, NULL, NULL, '2021-06-21 18:47:57'),
(3, 'Hotel Paris Rivoli', 'hotel-paris-rivoli', NULL, 1, 10, 16, 3, 8.00, '1,2,4,5,6,11,12,13,14,17,18,19,21', 3, 3, 10, 'request', 'Flexible', 'Listed', 1, NULL, NULL, '2021-06-21 18:47:57'),
(4, 'K+K Picasso', 'k-k-picasso', NULL, 2, 10, 10, 4, 8.00, '1,3,4,5,6,7,10,11,21,22,23,24,25,26,27,28,29', 5, 1, 10, 'request', 'Flexible', 'Listed', 1, NULL, NULL, '2021-06-21 18:47:57'),
(5, 'CONTACT APEX HOTELS', 'contact-apex-hotels', NULL, 2, 5, 10, 6, 8.00, '1,3,4,9,10,11,17,18,19,20,21', 6, 2, 10, 'request', 'Flexible', 'Listed', 1, NULL, NULL, '2021-06-21 18:47:57'),
(6, 'City Center Inn & Suites', 'city-center-inn-suites', NULL, 2, 5, 8, 7, 3.00, '17,18,19,20,23,24,29', 7, 3, 8, 'instant', 'Flexible', 'Listed', 1, NULL, NULL, '2021-06-21 18:47:57'),
(7, 'Dream House Duplex Villa mayrouba', 'dream-house-duplex-villa-mayrouba', NULL, 1, 5, 8, 7, 3.00, '17,18,19,20,23,24,29', 7, 3, 8, 'instant', 'Flexible', 'Listed', 1, NULL, NULL, '2021-06-21 18:47:57'),
(8, 'Fresh & Airy Private Bushwick Bedroom', 'fresh-airy-private-bushwick-bedroom', NULL, 2, 5, 8, 7, 3.00, '17,18,19,20,23,24,29', 7, 3, 8, 'instant', 'Flexible', 'Listed', 1, NULL, NULL, '2021-06-21 18:47:57'),
(9, 'Entire home/apt in Castlereagh St, Haymarket', 'entire-homeapt-in-castlereagh-st-haymarket', NULL, 4, 5, 8, 3, 4.00, '1,2,3,4,5,6,7,9,10,17,21,27,30', 1, 1, 5, 'instant', 'Flexible', 'Listed', NULL, NULL, '2020-12-02 23:33:52', '2021-06-21 18:47:57'),
(10, 'Entire home/apt in 33 Cox Ave, Bondi Beach', 'entire-homeapt-in-33-cox-ave-bondi-beach', NULL, 4, 5, 8, 1, 4.00, '1,2,3,4,6,7,8,9,17,21,30', 1, 1, 8, 'request', 'Flexible', 'Listed', NULL, NULL, '2020-12-02 23:39:34', '2021-06-21 18:47:57'),
(11, 'Gold Room in Old American Style House, Near Subway', 'gold-room-in-old-american-style-house-near-subway', NULL, 3, 2, 2, 1, 1.00, '1,2,3,4,11,12,17,18,23,24,27,29', 1, 1, 2, 'request', 'Flexible', 'Listed', NULL, NULL, '2020-12-02 23:42:04', '2021-06-21 18:47:57'),
(12, 'Entire home/apt in Sydney Olympic Park', 'entire-homeapt-in-sydney-olympic-park', NULL, 4, 5, 5, 1, 0.50, '1,2,3,4,7,8,17,30', 1, 1, 1, 'instant', 'Flexible', 'Listed', NULL, NULL, '2020-12-02 23:45:59', '2021-06-21 18:47:57'),
(13, 'Special Junior suite in the heart of NYC', 'special-junior-suite-in-the-heart-of-nyc', NULL, 3, 3, 3, 1, 2.00, '3,4,7,8,11,12,15,16,21,22,28', 1, 1, 3, 'instant', 'Flexible', 'Listed', NULL, NULL, '2020-12-02 23:49:57', '2021-06-21 18:47:57'),
(14, 'Entire home/apt in Newtown', 'entire-homeapt-in-newtown', NULL, 4, 8, 14, 1, 5.00, '1,2,3,4,5,6,7,8,17,19,24,30', 1, 1, 12, 'request', 'Flexible', 'Listed', NULL, NULL, '2020-12-02 23:52:55', '2021-06-21 18:47:57'),
(15, 'Comfortable apartment with East River Views', 'comfortable-apartment-with-east-river-views', NULL, 3, 4, 4, 7, 4.00, '1,2,5,6,11,12,17,18,25,26,27,29,31', 8, 3, 4, 'instant', 'Flexible', 'Unlisted', NULL, NULL, '2020-12-02 23:56:30', '2021-06-24 10:32:45'),
(16, 'Nobel Experience', 'nobel-experience', NULL, 3, 1, 1, 1, 1.00, '7,8,9,10,13,14,28', 2, 3, 1, 'request', 'Flexible', 'Listed', NULL, NULL, '2020-12-03 00:03:25', '2021-06-21 18:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `property_address`
--

DROP TABLE IF EXISTS `property_address`;
CREATE TABLE IF NOT EXISTS `property_address` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `address_line_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_address`
--

INSERT INTO `property_address` (`id`, `property_id`, `address_line_1`, `address_line_2`, `latitude`, `longitude`, `city`, `state`, `country`, `postal_code`) VALUES
(1, 1, 'New York City Hall, New York, NY 10007, USA', '851 8th Ave, New York, NY, US, 10019', '40.7127461', '-74.00597399999998', 'New York', 'New York', 'US', '10007'),
(2, 2, 'MLC Centre, 108 King St, Sydney NSW 2000, Australia', NULL, '-33.8686949', '151.2092424', 'Sydney', 'New South Wales', 'AU', '2000'),
(3, 3, '19 Rue de Rivoli, 75004 Paris, France', NULL, '48.8559431', '2.3573452000000543', 'Paris', 'Île-de-France', 'FR', '75004'),
(4, 4, 'Passeig de Picasso, 26, 08003 Barcelona, Spain', NULL, '41.3866227', '2.184072199999946', 'Barcelona', 'Catalunya', 'ES', '08003'),
(5, 5, '12 Stacey St, London WC2H, UK', NULL, '51.5142805', '-0.12846539999998186', 'London', 'England', 'GB', 'WC2H'),
(6, 6, '240 7th St, San Francisco, CA 94103, USA', NULL, '37.7771788', '-122.40894029999998', 'SF', 'California', 'US', '94103'),
(7, 7, '240 7th St, San Francisco, CA 94103, USA', NULL, '37.7771788', '-122.40894029999998', 'SF', 'California', 'US', '94103'),
(8, 8, '12 Stacey St, London WC2H, UK', NULL, '51.5142805', '-0.12846539999998186', 'London', 'England', 'GB', 'WC2H'),
(9, 9, 'S477, L4, 311, 315 Castlereagh St, Haymarket NSW 2000, Australia', NULL, '-33.879402129156325', '151.2082655317383', 'Haymarket', 'New South Wales', 'AU', '2000'),
(13, 13, '216 9th St, Jersey City, NJ 07302, USA', NULL, '40.728257472677235', '-74.04262250397949', 'Jersey City', 'New Jersey', 'US', '07302'),
(10, 10, '33 Cox Ave, Bondi Beach NSW 2026, Australia', NULL, '-33.88973752585554', '151.26897126977542', 'Bondi Beach', 'New South Wales', 'AU', '2026'),
(11, 11, 'Vanderbilt Av/Plaza St E, Brooklyn, NY 11238, USA', NULL, '40.67499800825174', '-73.9695376727417', 'New York', 'New York', 'US', '11238'),
(12, 12, '11 Australia Ave, Sydney Olympic Park NSW 2127, Australia', NULL, '-33.8465088', '151.0722137', 'Sydney Olympic Park', 'New South Wales', 'AU', '2127'),
(14, 14, 'Newtown Station, Enmore Rd, Stand A, Newtown NSW 2042, Australia', NULL, '-33.8978149', '151.1785003', 'Newtown', 'New South Wales', 'AU', '2042'),
(15, 15, '302 Freeman St, Brooklyn, NY 11222, USA', NULL, '40.734789095083435', '-73.94786324140627', 'New York', 'New York', 'US', '11222'),
(16, 16, '14 St - Union Sq, New York, NY 10003, USA', NULL, '40.73524929022898', '-73.99065202210693', 'New York', 'New York', 'US', '10003');

-- --------------------------------------------------------

--
-- Table structure for table `property_beds`
--

DROP TABLE IF EXISTS `property_beds`;
CREATE TABLE IF NOT EXISTS `property_beds` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `bed_type_id` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_dates`
--

DROP TABLE IF EXISTS `property_dates`;
CREATE TABLE IF NOT EXISTS `property_dates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `status` enum('Available','Not available') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Available',
  `price` int(11) NOT NULL DEFAULT '0',
  `min_stay` tinyint(4) NOT NULL DEFAULT '0',
  `min_day` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `color` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('calendar','normal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_dates`
--

INSERT INTO `property_dates` (`id`, `property_id`, `status`, `price`, `min_stay`, `min_day`, `date`, `color`, `type`, `created_at`, `updated_at`) VALUES
(1, 15, 'Not available', 55, 0, NULL, '2020-12-03', NULL, 'normal', '2020-12-03 00:18:06', '2020-12-03 00:18:06'),
(2, 9, 'Not available', 150, 0, NULL, '2020-12-03', NULL, 'normal', '2020-12-03 00:18:06', '2020-12-03 00:18:06'),
(3, 6, 'Not available', 120, 0, NULL, '2020-12-03', NULL, 'normal', '2020-12-03 00:19:35', '2020-12-03 00:19:35'),
(4, 7, 'Not available', 100, 0, NULL, '2020-12-03', NULL, 'normal', '2020-12-03 00:21:22', '2020-12-03 00:21:22'),
(5, 13, 'Not available', 75, 0, NULL, '2020-12-03', NULL, 'normal', '2020-12-03 00:22:25', '2020-12-03 00:22:25'),
(6, 7, 'Not available', 100, 0, NULL, '2020-12-05', NULL, 'normal', '2020-12-03 00:25:47', '2020-12-03 00:25:47'),
(7, 6, 'Not available', 120, 0, NULL, '2020-12-07', NULL, 'normal', '2020-12-03 00:26:28', '2020-12-03 00:26:28'),
(8, 9, 'Not available', 150, 0, NULL, '2020-12-12', NULL, 'normal', '2020-12-03 00:27:54', '2020-12-03 00:27:54'),
(9, 15, 'Not available', 55, 0, NULL, '2021-01-05', NULL, 'normal', '2020-12-03 00:29:42', '2020-12-03 00:29:42'),
(10, 7, 'Not available', 100, 0, NULL, '2020-12-11', NULL, 'normal', '2020-12-03 01:43:37', '2020-12-03 01:43:37'),
(11, 7, 'Available', 100, 1, 3, '2021-06-25', NULL, 'normal', '2021-06-22 17:55:06', '2021-06-22 17:55:06'),
(12, 15, 'Not available', 55, 0, NULL, '2021-06-24', NULL, 'normal', '2021-06-24 10:10:17', '2021-06-24 10:10:17'),
(13, 15, 'Not available', 55, 0, NULL, '2021-06-25', NULL, 'normal', '2021-06-24 10:12:12', '2021-06-24 10:12:12'),
(14, 15, 'Not available', 55, 0, NULL, '2021-06-26', NULL, 'normal', '2021-06-24 10:12:12', '2021-06-24 10:12:12'),
(15, 15, 'Not available', 55, 0, NULL, '2021-06-28', NULL, 'normal', '2021-06-24 10:16:20', '2021-06-24 10:16:20'),
(16, 7, 'Not available', 100, 0, NULL, '2021-06-28', NULL, 'normal', '2021-06-24 10:20:39', '2021-06-24 10:20:39'),
(17, 7, 'Not available', 100, 0, NULL, '2021-06-29', NULL, 'normal', '2021-06-24 10:20:39', '2021-06-24 10:20:39'),
(18, 1, 'Not available', 5, 0, NULL, '2021-06-24', NULL, 'normal', '2021-06-24 11:53:06', '2021-06-24 11:53:06'),
(20, 8, 'Not available', 200, 0, NULL, '2022-02-02', NULL, 'normal', '2022-02-01 22:43:05', '2022-02-01 22:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `property_description`
--

DROP TABLE IF EXISTS `property_description`;
CREATE TABLE IF NOT EXISTS `property_description` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `place_is_great_for` text COLLATE utf8mb4_unicode_ci,
  `about_place` text COLLATE utf8mb4_unicode_ci,
  `guest_can_access` text COLLATE utf8mb4_unicode_ci,
  `interaction_guests` text COLLATE utf8mb4_unicode_ci,
  `other` text COLLATE utf8mb4_unicode_ci,
  `about_neighborhood` text COLLATE utf8mb4_unicode_ci,
  `get_around` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_description`
--

INSERT INTO `property_description` (`id`, `property_id`, `summary`, `place_is_great_for`, `about_place`, `guest_can_access`, `interaction_guests`, `other`, `about_neighborhood`, `get_around`) VALUES
(1, 1, 'A stay at Hampton Inn Times Square North places you in the heart of New York, walking distance from Studio 54 and Ed Sullivan Theater. This hotel is close to Broadway and Rockefeller Center.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.'),
(2, 2, 'The View Hotels comprise three hotels within Australia located in three of the most beautiful and exciting cities – Sydney, Melbourne and Brisbane.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 'Situated in the famous Marais district surrounded by boutiques, monuments and museums, the Hotel Paris Rivoli offers three-star accommodations in the most desirable part of Paris.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 'K+K Picasso offers 4-star elegance in Barcelona’s El Born district, directly opposite Parc de la Ciutadella and Barcelona Zoo on Passeig de Picasso. The hotel has avant-garde architecture, a rooftop pool with city views and is less than 15 minutes’ walk from La Rambla, Barceloneta Beach and the Gothic Quarter.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 'CONTACT APEX HOTELS', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 'Set in the SoMA neighborhood, this straightforward hotel with an annex is 1 mile from Union Square\'s shopping, 1.5 miles from Chinatown and 2.5 miles from Fisherman\'s Wharf\'s seafood restaurants.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 'Private luxury bungalow with astonishing view , cozy in winter cold covered with snow and chill in the summer with private pool .Excellent location for celebration of small and big group enjoying chimney fire as well as spacious terrace For ski lovers , it is the perfect location 10 min away from faraya where road are always open even with extreme winter condition', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 8, 'Experience the best of Brooklyn’s creative scene just steps from this renovated, furnished apartment, fully equipped with everything you need to get settled in — all you have to bring is your suitcase! Walk outside and find yourself in the heart of Bushwick, renowned for its street art and bustling community. This apartment includes access to the backyard, perfect for getting time outdoors, and is just a short walk from the neighborhood’s largest park.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 9, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 11, 'Private room in a beautiful house in Queens. located 5min walk from the metro J, Z Subway (24/7), around 40-45min to Downtown Manhattan (9/11 Memorial, Wall Street). 50min to times square and central park. Easy to get anywhere with public transport.15 min from JFK with direct J train. While staying relatively close to all touristic sites seeing\'s you get to stay in real New York, feel, smell and taste NYC by passing through off the beaten tourist tracks, eating local food & interact with locals.', NULL, 'The bedroom is pretty quiet. The bedroom has a Queen-size bed and a very comfortable arm-chair. The room is pretty big, cozy and very comfortable. The room located on the 1st floor, next to the living room, has 3 windows and a closet (luggage and clothes). The fireplace made the room very warm and romantic (please, do not try to ignite the fire). Bed is Queen size with memory mattress and it\'s really great for sleeping. Visitors can use big open spaces on the first floor. The bathroom has a shower with strong water pressure.', 'Wi-Fi, Heating, Air Conditioner, and utilities are included in price.\r\nNO pets, No smoking.\r\nThere is a free parking area around the house available on the street in the neighborhood.\r\nIn a basement are washing machine and drier - for Airbnb guests it\'s free.', NULL, NULL, NULL, NULL),
(12, 12, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 13, 'Furnished Junior Suite with private bath and fully equipped kitchen in midtown. 3 blocks from Grand Central Station. All utilities, cable, wifi, local calls, weekly linen service, toiletries, in-room coffee and tea supplies and access to gym and business center included in price. Housekeeping service is available for an extra fee. Doorman and 24 Hour Reception and Concierge Desk. Onsite laundry room. Supermarket across street. Approx 9.5% NYC taxes to be paid directly to the property.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 14, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 15, 'Only 7 minutes to NYC, Port Authority! One block to all public transportation. Amazing View of the New York City Skyline! Private bedroom, with shared living room, kitchen and bathroom with only one person. Very quiet and spacious!', NULL, 'Private professional single or two people. There is a private terrace in the back, and the living room attached to private bedroom room that shows the view is great for reading and private time, yoga, meditating!', 'Wi-Fi, Heating, Air Conditioner, and utilities are included in price.\r\nNO pets, No smoking.\r\nThere is a free parking area around the house available on the street in the neighborhood.\r\nIn a basement are washing machine and drier - for Airbnb guests it\'s free.', NULL, NULL, NULL, NULL),
(16, 16, 'Appointed with sleek furniture, our classic rooms offer the traditional comforts of home in one of the most time-honored hotels in New York City.\r\n\r\nYour room charge has been taken prior to your arrival as a deposit. The remaining balance of the taxes (NY Sales Tax: 8.875%, NY City Tax: 5.875%, Occupancy Tax: $2.00 & Javits Fee: $1.50) and facility fee ($28.68) per night will be charged upon arrival.\r\n\r\nGuests must be at least 21 yrs of age to check in. Gov. -issued photo ID is required.', NULL, 'This category has three options available, 1 King bed, 2 Double Beds or ADA accessible with a spacious bathroom. Both business and leisure travelers requiring accommodation in New York City will appreciate one of our most popular room types.', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_details`
--

DROP TABLE IF EXISTS `property_details`;
CREATE TABLE IF NOT EXISTS `property_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `field` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_fees`
--

DROP TABLE IF EXISTS `property_fees`;
CREATE TABLE IF NOT EXISTS `property_fees` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `field` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_fees`
--

INSERT INTO `property_fees` (`id`, `field`, `value`) VALUES
(1, 'more_then_seven', '0'),
(2, 'less_then_seven', '0'),
(3, 'host_service_charge', '0'),
(4, 'guest_service_charge', '5'),
(5, 'cancel_limit', '0'),
(6, 'currency', 'USD'),
(7, 'host_penalty', '0'),
(8, 'iva_tax', '5'),
(9, 'accomodation_tax', '5');

-- --------------------------------------------------------

--
-- Table structure for table `property_icalimports`
--

DROP TABLE IF EXISTS `property_icalimports`;
CREATE TABLE IF NOT EXISTS `property_icalimports` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `icalendar_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icalendar_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icalendar_last_sync` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_photos`
--

DROP TABLE IF EXISTS `property_photos`;
CREATE TABLE IF NOT EXISTS `property_photos` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(105) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` int(11) NOT NULL DEFAULT '0',
  `serial` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_photos`
--

INSERT INTO `property_photos` (`id`, `property_id`, `photo`, `message`, `cover_photo`, `serial`) VALUES
(1, 1, 'property-1.jpg', NULL, 1, 0),
(2, 1, 'property-2.jpg', NULL, 0, 0),
(3, 1, 'property-3.jpg', NULL, 0, 0),
(4, 1, 'property-4.jpg', NULL, 0, 0),
(5, 1, 'property-34.jpg', NULL, 0, 0),
(6, 2, 'property-6.jpg', NULL, 1, 0),
(7, 2, 'property-7.jpg', NULL, 0, 0),
(8, 2, 'property-8.jpg', NULL, 0, 0),
(9, 2, 'property-9.jpg', NULL, 0, 0),
(10, 2, 'property-35.jpg', NULL, 0, 0),
(11, 3, 'property-10.jpg', NULL, 0, 0),
(12, 3, 'property-11.jpg', NULL, 0, 0),
(13, 3, 'property-12.jpg', NULL, 0, 0),
(14, 3, 'property-13.jpg', NULL, 0, 0),
(15, 3, 'property-36.jpg', NULL, 0, 0),
(16, 4, 'property-14.jpg', NULL, 1, 0),
(17, 4, 'property-15.jpg', NULL, 0, 0),
(18, 4, 'property-16.jpg', NULL, 0, 0),
(19, 4, 'property-17.jpg', NULL, 0, 0),
(20, 4, 'property-37.jpg', NULL, 0, 0),
(21, 5, 'property-18.jpg', NULL, 1, 0),
(22, 5, 'property-19.jpg', NULL, 0, 0),
(23, 5, 'property-20.jpg', NULL, 0, 0),
(24, 5, 'property-21.jpg', NULL, 0, 0),
(25, 5, 'property-38.jpg', NULL, 0, 0),
(26, 6, 'property-22.jpg', NULL, 0, 0),
(27, 6, 'property-23.jpg', NULL, 1, 0),
(28, 6, 'property-24.jpg', NULL, 0, 0),
(29, 6, 'property-25.jpg', NULL, 0, 0),
(30, 6, 'property-39.jpg', NULL, 0, 0),
(31, 7, 'property-26.jpg', NULL, 0, 0),
(32, 7, 'property-27.jpg', NULL, 0, 0),
(33, 7, 'property-28.jpg', NULL, 1, 0),
(34, 7, 'property-29.jpg', NULL, 0, 0),
(35, 7, 'property-40.jpg', NULL, 0, 0),
(36, 8, 'property-30.jpg', NULL, 1, 0),
(37, 8, 'property-31.jpg', NULL, 0, 0),
(38, 8, 'property-32.jpg', NULL, 0, 0),
(39, 8, 'property-33.jpg', NULL, 0, 0),
(40, 8, 'property-41.jpg', NULL, 0, 0),
(41, 9, '1606973880_property-24.jpg', NULL, 0, 1),
(42, 9, '1606973880_property-33.jpg', NULL, 0, 2),
(43, 9, '1606973880_property-35.jpg', NULL, 0, 3),
(44, 9, '1606973880_property-38.jpg', NULL, 0, 4),
(45, 9, '1606973880_property-39.jpg', NULL, 1, 5),
(46, 9, '1606973880_property-41.jpg', NULL, 0, 6),
(47, 10, '1606974277_property-8.jpg', NULL, 1, 1),
(48, 10, '1606974277_property-9.jpg', NULL, 0, 2),
(49, 10, '1606974277_property-25.jpg', NULL, 0, 3),
(50, 10, '1606974277_property-41.jpg', NULL, 0, 4),
(51, 11, '1606974319_property-22.jpg', NULL, 1, 1),
(52, 11, '1606974327_property-11.jpg', NULL, 0, 2),
(53, 11, '1606974333_property-36.jpg', NULL, 0, 3),
(54, 11, '1606974341_property-15.jpg', NULL, 0, 4),
(55, 11, '1606974350_property-2.jpg', NULL, 0, 5),
(56, 12, '1606974428_property-6.jpg', NULL, 0, 1),
(57, 12, '1606974428_property-7.jpg', NULL, 1, 2),
(58, 12, '1606974428_property-8.jpg', NULL, 0, 3),
(59, 12, '1606974428_property-9.jpg', NULL, 0, 4),
(60, 12, '1606974428_property-35.jpg', NULL, 0, 5),
(61, 13, '1606974775_property-38.jpg', NULL, 1, 1),
(62, 13, '1606974785_property-39.jpg', NULL, 0, 2),
(63, 13, '1606974799_property-35.jpg', NULL, 0, 3),
(64, 13, '1606974806_property-11.jpg', NULL, 0, 4),
(65, 13, '1606974825_property-29.jpg', NULL, 0, 5),
(66, 14, '1606974869_property-18.jpg', NULL, 0, 1),
(67, 14, '1606974869_property-21.jpg', NULL, 0, 2),
(68, 14, '1606974869_property-29.jpg', NULL, 0, 3),
(69, 14, '1606974869_property-31.jpg', NULL, 1, 4),
(70, 15, '1606975259_property-4.jpg', NULL, 1, 1),
(71, 15, '1606975266_property-7.jpg', NULL, 0, 2),
(72, 15, '1606975273_property-37.jpg', NULL, 0, 3),
(73, 15, '1606975280_property-25.jpg', NULL, 0, 4),
(74, 15, '1606975287_property-27.jpg', NULL, 0, 5),
(75, 16, '1606975535_property-9.jpg', NULL, 1, 1),
(76, 16, '1606975544_property-28.jpg', NULL, 0, 2),
(77, 16, '1606975552_property-41.jpg', NULL, 0, 3),
(78, 16, '1606975562_property-14.jpg', NULL, 0, 4),
(79, 16, '1606975573_property-35.jpg', NULL, 0, 5),
(80, 7, 'property-7.jpg', NULL, 0, 1),
(81, 3, 'property-36.jpg', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `property_price`
--

DROP TABLE IF EXISTS `property_price`;
CREATE TABLE IF NOT EXISTS `property_price` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `cleaning_fee` int(11) NOT NULL DEFAULT '0',
  `guest_after` int(11) NOT NULL DEFAULT '0',
  `guest_fee` int(11) NOT NULL DEFAULT '0',
  `security_fee` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `weekend_price` int(11) NOT NULL DEFAULT '0',
  `weekly_discount` int(11) NOT NULL DEFAULT '0',
  `monthly_discount` int(11) NOT NULL DEFAULT '0',
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_price`
--

INSERT INTO `property_price` (`id`, `property_id`, `cleaning_fee`, `guest_after`, `guest_fee`, `security_fee`, `price`, `weekend_price`, `weekly_discount`, `monthly_discount`, `currency_code`) VALUES
(1, 1, 0, 1, 0, 0, 5, 0, 0, 0, 'USD'),
(2, 2, 0, 1, 0, 0, 6, 0, 0, 0, 'USD'),
(3, 3, 0, 1, 0, 0, 7, 0, 0, 0, 'USD'),
(4, 4, 0, 1, 0, 0, 8, 0, 0, 0, 'USD'),
(5, 5, 0, 1, 0, 0, 20, 0, 0, 0, 'USD'),
(6, 6, 0, 1, 0, 0, 120, 0, 0, 0, 'USD'),
(7, 7, 0, 1, 0, 0, 100, 0, 0, 0, 'USD'),
(8, 8, 0, 1, 0, 0, 200, 0, 0, 0, 'USD'),
(9, 9, 5, 1, 0, 5, 150, 0, 0, 0, 'USD'),
(10, 10, 8, 1, 0, 0, 244, 0, 0, 0, 'USD'),
(11, 11, 5, 1, 0, 0, 150, 0, 0, 0, 'USD'),
(12, 12, 7, 1, 0, 0, 266, 0, 0, 0, 'USD'),
(13, 13, 0, 1, 0, 0, 75, 0, 0, 0, 'USD'),
(14, 14, 15, 1, 0, 0, 275, 0, 0, 0, 'USD'),
(15, 15, 0, 1, 20, 0, 55, 0, 0, 0, 'USD'),
(16, 16, 0, 1, 0, 0, 80, 0, 0, 0, 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `property_rules`
--

DROP TABLE IF EXISTS `property_rules`;
CREATE TABLE IF NOT EXISTS `property_rules` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_steps`
--

DROP TABLE IF EXISTS `property_steps`;
CREATE TABLE IF NOT EXISTS `property_steps` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `basics` int(11) NOT NULL DEFAULT '0',
  `description` int(11) NOT NULL DEFAULT '0',
  `location` int(11) NOT NULL DEFAULT '0',
  `photos` int(11) NOT NULL DEFAULT '0',
  `pricing` int(11) NOT NULL DEFAULT '0',
  `booking` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_steps`
--

INSERT INTO `property_steps` (`id`, `property_id`, `basics`, `description`, `location`, `photos`, `pricing`, `booking`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1),
(2, 2, 1, 1, 1, 1, 1, 1),
(3, 3, 1, 1, 1, 1, 1, 1),
(4, 4, 1, 1, 1, 1, 1, 1),
(5, 5, 1, 1, 1, 1, 1, 1),
(6, 6, 1, 1, 1, 1, 1, 1),
(7, 7, 1, 1, 1, 1, 1, 1),
(8, 8, 1, 1, 1, 1, 1, 1),
(9, 9, 1, 1, 1, 1, 1, 1),
(10, 10, 1, 1, 1, 1, 1, 1),
(11, 11, 1, 1, 1, 1, 1, 1),
(12, 12, 1, 1, 1, 1, 1, 1),
(13, 13, 1, 1, 1, 1, 1, 1),
(14, 14, 1, 1, 1, 1, 1, 1),
(15, 15, 1, 1, 1, 1, 1, 1),
(16, 16, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `property_type`
--

DROP TABLE IF EXISTS `property_type`;
CREATE TABLE IF NOT EXISTS `property_type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_type`
--

INSERT INTO `property_type` (`id`, `name`, `description`, `status`) VALUES
(1, 'Apartment', 'Apartment', 'Active'),
(2, 'House', 'House', 'Active'),
(3, 'Bed & Break Fast', 'Bed & Break Fast', 'Active'),
(4, 'Loft', 'Loft', 'Active'),
(5, 'Townhouse', 'Townhouse', 'Active'),
(6, 'Condominium', 'Condominium', 'Active'),
(7, 'Bungalow', 'Bungalow', 'Active'),
(8, 'Cabin', 'Cabin', 'Active'),
(9, 'Villa', 'Villa', 'Active'),
(10, 'Castle', 'Castle', 'Active'),
(11, 'Dorm', 'Dorm', 'Active'),
(12, 'Treehouse', 'Treehouse', 'Active'),
(13, 'Boat', 'Boat', 'Active'),
(14, 'Plane', 'Plane', 'Active'),
(15, 'Camper/RV', 'Camper/RV', 'Active'),
(16, 'Lgloo', 'Lgloo', 'Active'),
(17, 'Lighthouse', 'Lighthouse', 'Active'),
(18, 'Yurt', 'Yurt', 'Active'),
(19, 'Tipi', 'Tipi', 'Active'),
(20, 'Cave', 'Cave', 'Active'),
(21, 'Island', 'Island', 'Active'),
(22, 'Chalet', 'Chalet', 'Active'),
(23, 'Earth House', 'Earth House', 'Active'),
(24, 'Hut', 'Hut', 'Active'),
(25, 'Train', 'Train', 'Active'),
(26, 'Tent', 'Tent', 'Active'),
(27, 'Other', 'Other', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` enum('unsolved','solved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unsolved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `reviewer` enum('guest','host') COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `secret_feedback` text COLLATE utf8mb4_unicode_ci,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `improve_message` text COLLATE utf8mb4_unicode_ci,
  `rating` int(11) DEFAULT NULL,
  `accuracy` int(11) DEFAULT NULL,
  `accuracy_message` text COLLATE utf8mb4_unicode_ci,
  `location` int(11) DEFAULT NULL,
  `location_message` text COLLATE utf8mb4_unicode_ci,
  `communication` int(11) DEFAULT NULL,
  `communication_message` text COLLATE utf8mb4_unicode_ci,
  `checkin` int(11) DEFAULT NULL,
  `checkin_message` text COLLATE utf8mb4_unicode_ci,
  `cleanliness` int(11) DEFAULT NULL,
  `cleanliness_message` text COLLATE utf8mb4_unicode_ci,
  `amenities` int(11) DEFAULT NULL,
  `amenities_message` text COLLATE utf8mb4_unicode_ci,
  `value` int(11) DEFAULT NULL,
  `value_message` text COLLATE utf8mb4_unicode_ci,
  `house_rules` int(11) DEFAULT NULL,
  `recommend` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `sender_id`, `receiver_id`, `booking_id`, `property_id`, `reviewer`, `message`, `secret_feedback`, `comments`, `improve_message`, `rating`, `accuracy`, `accuracy_message`, `location`, `location_message`, `communication`, `communication_message`, `checkin`, `checkin_message`, `cleanliness`, `cleanliness_message`, `amenities`, `amenities_message`, `value`, `value_message`, `house_rules`, `recommend`, `created_at`, `updated_at`) VALUES
(1, 4, 3, 2, 15, 'guest', 'Very responsive, excellent host. Clear communication!!!!! Nice and clean. Good location. Good value. Thank you.', 'A great stay in a great place! Great location, super close to the train and with a superb host who was great at communicating with me and made check-in and my stay wonderful. Will definitely be staying again when I am in the city.', NULL, 'It was an ok stay.', 5, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, NULL, NULL, '2020-12-03 00:52:34', '2020-12-03 00:52:49'),
(2, 3, 4, 2, 15, 'host', 'Very great everything. Highly recommend', 'great place to stay!', NULL, NULL, 5, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2020-12-03 00:52:53', '2020-12-03 00:52:53'),
(3, 3, 4, 3, 9, 'guest', 'The stay was amazing. the staff are amazing and always helpful. the rooms are clean and the service always on time. the location is perfect walking distance from everything you ever need. a definite return stay for me.', 'I Love the enviornment', NULL, 'Transport system should be improve', 5, 5, NULL, 5, 'Location fine', 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, 'Great value for traveller', NULL, NULL, '2020-12-03 00:54:02', '2020-12-03 00:54:43'),
(4, 4, 3, 3, 9, 'host', '10/10 Stay. Clean Room, clean living area, Neat little kitchen area. Davis was extremely helpful and hospitable; ensured Check in and Out was smooth, that the place was clean, and that guests were comfortable. Great communication.', '10/10 Stay. Clean Room, clean living area, Neat little kitchen area. Davis was extremely helpful and hospitable; ensured Check in and Out was smooth, that the place was clean, and that guests were comfortable. Great communication.', NULL, NULL, 5, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2020-12-03 00:55:42', '2020-12-03 00:55:42'),
(5, 1, 2, 10, 7, 'host', 'Great location & scenic views. Easy check in and check out process.', 'Let us check in our bags early and were very accommodating in general.', NULL, NULL, 5, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2020-12-03 01:03:01', '2020-12-03 01:03:01'),
(6, 1, 3, 6, 7, 'host', 'The view is to die for !', 'It was an amazing stay, beautiful room and great location.', NULL, NULL, 5, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2020-12-03 01:03:36', '2020-12-03 01:03:36'),
(7, 2, 1, 11, 6, 'host', 'It was an amazing stay, beautiful room and great location.', 'Was amazing', NULL, NULL, 5, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2020-12-03 01:13:29', '2020-12-03 01:13:29'),
(8, 3, 2, 5, 6, 'guest', 'An ok hotel first time at the hotel was much more enjoyable and I didn’t have to pay a deposit the first time so beware of the deposit fee upon arrival', 'Look into parking before you book. You will have to park away from the hotel and rates are expensive.', NULL, 'Great location and a gorgeous venue. Would definitely book again!', 5, 5, 'Great location and a gorgeous venue. Would definitely book again!', 5, NULL, 5, NULL, 5, NULL, 5, 'Everything great', 5, NULL, 5, NULL, NULL, NULL, '2020-12-03 01:15:25', '2020-12-03 01:15:59'),
(9, 1, 2, 11, 6, 'guest', 'Nice hotel Nice people Remember Puerto Rico it’s Usa Territory.', 'Super cool, would recommend and go again', NULL, 'It was litty', 5, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, NULL, NULL, '2020-12-03 01:18:31', '2020-12-03 01:18:54'),
(10, 4, 1, 16, 7, 'guest', 'Look into parking before you book. You will have to park away from the hotel and rates are expensive.', 'The pictures made the room seem a lot larger than it actually was', NULL, 'Everything was great', 5, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, NULL, NULL, '2020-12-03 01:45:55', '2020-12-03 01:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin User', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_admin`
--

DROP TABLE IF EXISTS `role_admin`;
CREATE TABLE IF NOT EXISTS `role_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`admin_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_admin`
--

INSERT INTO `role_admin` (`admin_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
CREATE TABLE IF NOT EXISTS `rules` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`id`, `message`, `status`) VALUES
(1, 'Suitable for children (2-12 years)', 'Active'),
(2, 'Suitable for infants (Under 2 years)', 'Active'),
(3, 'Suitable for pets', 'Active'),
(4, 'Smoking allowed', 'Active'),
(5, 'Events or parties allowed', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `seo_metas`
--

DROP TABLE IF EXISTS `seo_metas`;
CREATE TABLE IF NOT EXISTS `seo_metas` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seo_metas`
--

INSERT INTO `seo_metas` (`id`, `url`, `title`, `description`, `keywords`) VALUES
(1, '/', 'Home | Vrent Home', 'Vacation Rentals, Cabins, Beach Houses, Unique Homes & Experiences', ''),
(2, 'login', 'Log In', 'Log In', ''),
(3, 'register', 'Register', 'Register', ''),
(4, 'newest', 'Newest Photos', 'Newest Photos', ''),
(5, 'forgot_password', 'Forgot Password', 'Forgot Password', ''),
(6, 'dashboard', 'Feeds', 'Feeds', ''),
(7, 'uploads', 'Uploads', 'Uploads', ''),
(8, 'notification', 'Notification', 'Notification', ''),
(9, 'profile', 'Profile', 'Profile', ''),
(10, 'profile/{id}', 'Profile', 'Profile', ''),
(11, 'manage-photos', 'Manage Photos', 'Manage Photos', ''),
(12, 'earning', 'Earning', 'Earning', ''),
(13, 'purchase', 'Purchase', 'Purchase', ''),
(14, 'settings', 'Settings', 'Settings', ''),
(15, 'settings/account', 'Settings', 'Settings', ''),
(16, 'settings/payment', 'Settings', 'Settings', ''),
(17, 'photo/single/{id}', 'Photo Single', 'Photo Single', ''),
(18, 'payments/success', 'Payment Success', 'Payment Success', ''),
(19, 'payments/cancel', 'Payment Cancel', 'Payment Cancel', ''),
(20, 'profile-uploads/{type}', 'Profile Uploads', 'Profile Uploads', ''),
(21, 'photo-details/{id}', 'Photo Details', 'Photo Details', ''),
(22, 'withdraws', 'Withdraws', 'Withdraws', ''),
(23, 'photos/download/{id}', 'Photos Download', 'Photos Download', ''),
(24, 'users/reset_password/{secret?}', 'Reset Password', 'Reset Password', ''),
(25, 'search/{word}', 'Search Result', 'Search Result', ''),
(26, 'search/user/{word}', 'Search User Result', 'Search User Result', ''),
(27, 'signup', 'Signup', 'Signup', ''),
(28, 'property/create', 'Create New Property', 'Create New Property', ''),
(29, 'listing/{id}/{step}', 'Property Listing', 'Property Listing', ''),
(30, 'properties', 'Properties', 'Properties', ''),
(31, 'my_bookings', 'My Bookings', 'My Bookings', ''),
(32, 'trips/active', 'Your Trips', 'Your Trips', ''),
(33, 'users/profile', 'Edit Profile', 'Edit Profile', ''),
(34, 'users/account_preferences', 'Account Preferences', 'Account Preferences', ''),
(35, 'users/transaction_history', 'Transaction History', 'Transaction History', ''),
(36, 'users/security', 'Security', 'Security', ''),
(37, 'search', 'Search', 'Search', ''),
(38, 'inbox', 'Inbox', 'Inbox', ''),
(39, 'users/profile/media', 'Profile Photo', 'Profile Photo', ''),
(40, 'booking/requested', 'Payment Completed', 'Payment Completed', ''),
(41, 'user/favourite', 'Favourite List', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `type`) VALUES
(1, 'name', 'Vrent', 'general'),
(2, 'logo', 'logo.png', 'general'),
(3, 'favicon', 'favicon.png', 'general'),
(4, 'head_code', '', 'general'),
(5, 'default_currency', '1', 'general'),
(6, 'default_language', '1', 'general'),
(7, 'email_logo', 'email_logo.png', 'general'),
(8, 'username', 'techvillage_business_api1.gmail.com', 'PayPal'),
(9, 'password', '9DDYZX2JLA6QL668', 'PayPal'),
(10, 'signature', 'AFcWxV21C7fd0v3bYYYRCpSSRl31ABayz5pdk84jno7.Udj6-U8ffwbT', 'PayPal'),
(11, 'mode', 'sandbox', 'PayPal'),
(12, 'paypal_status', '1', 'PayPal'),
(13, 'publishable', 'pk_test_c2TDWXsjPkimdM8PIltO6d8H', 'Stripe'),
(14, 'secret', 'sk_test_UWTgGYIdj8igmbVMgTi0ILPm', 'Stripe'),
(15, 'stripe_status', '1', 'Stripe'),
(16, 'driver', 'smtp', 'email'),
(17, 'host', 'mail.techvill.net', 'email'),
(18, 'port', '587', 'email'),
(19, 'from_address', 'stockpile@techvill.net', 'email'),
(20, 'from_name', 'Vrent', 'email'),
(21, 'encryption', 'tls', 'email'),
(22, 'username', 'stockpile@techvill.net', 'email'),
(23, 'password', 'nT4HD2XEdRUX', 'email'),
(24, 'facebook', '#', 'join_us'),
(25, 'google_plus', '#', 'join_us'),
(26, 'twitter', '#', 'join_us'),
(27, 'linkedin', '#', 'join_us'),
(28, 'pinterest', '#', 'join_us'),
(29, 'youtube', '#', 'join_us'),
(30, 'instagram', '#', 'join_us'),
(31, 'key', 'AIzaSyDwcmdYrXzx54KAM82VcJJC-RP5P8NQN8Y', 'googleMap'),
(32, 'client_id', '277039430632-b216l60ked63oeheta4ig5erqlf1pihq.apps.googleusercontent.com', 'google'),
(33, 'client_secret', '2ZCeQ_PcvgyZ63LppsxNHwZU', 'google'),
(34, 'client_id', '166441230733266', 'facebook'),
(35, 'client_secret', '0787364d54422d8ff0bbb646c7f3231e', 'facebook'),
(36, 'email_status', '0', 'email'),
(37, 'row_per_page', '25', 'preferences'),
(38, 'date_separator', '-', 'preferences'),
(39, 'date_format', '2', 'preferences'),
(40, 'dflt_timezone', 'Asia/Dhaka', 'preferences'),
(41, 'money_format', 'before', 'preferences'),
(42, 'date_format_type', 'mm-dd-yyyy', 'preferences'),
(43, 'front_date_format_type', 'mm-dd-yy', 'preferences'),
(44, 'search_date_format_type', 'm-d-yy', 'preferences'),
(45, 'facebook_login', '1', 'social'),
(46, 'google_login', '1', 'social'),
(47, 'min_search_price', '1', 'preferences'),
(48, 'max_search_price', '5000', 'preferences'),
(49, 'email', 'stockpile@techvill.net', 'general');

-- --------------------------------------------------------

--
-- Table structure for table `space_type`
--

DROP TABLE IF EXISTS `space_type`;
CREATE TABLE IF NOT EXISTS `space_type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `space_type`
--

INSERT INTO `space_type` (`id`, `name`, `description`, `status`) VALUES
(1, 'Entire home/apt', 'Entire home/apt', 'Active'),
(2, 'Private room', 'Private room', 'Active'),
(3, 'Shared room', 'Shared room', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `starting_cities`
--

DROP TABLE IF EXISTS `starting_cities`;
CREATE TABLE IF NOT EXISTS `starting_cities` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `starting_cities`
--

INSERT INTO `starting_cities` (`id`, `name`, `image`, `status`) VALUES
(1, 'New York', 'starting_city_1.jpg', 'Active'),
(2, 'Sydney', 'starting_city_2.jpg', 'Active'),
(3, 'Paris', 'starting_city_3.jpg', 'Active'),
(4, 'Barcelona', 'starting_city_4.jpg', 'Active'),
(5, 'Berlin', 'starting_city_5.jpg', 'Active'),
(6, 'Budapest', 'starting_city_6.jpg', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` int(11) NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `designation`, `image`, `description`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'Traveller', 'testimonial_1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 5, 'Active', NULL, NULL),
(2, 'Adam Smith', 'Traveller', 'testimonial_2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 5, 'Active', NULL, NULL),
(3, 'Alysa', 'Photographer', 'testimonial_3.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 5, 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
CREATE TABLE IF NOT EXISTS `timezone` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timezone`
--

INSERT INTO `timezone` (`id`, `zone`, `value`) VALUES
(1, '(GMT-11:00) International Date Line West', 'Pacific/Kwajalein'),
(2, '(GMT-11:00) Midway Island', 'Pacific/Midway'),
(3, '(GMT-11:00) Samoa', 'Pacific/Samoa'),
(4, '(GMT-10:00) Hawaii', 'Pacific/Honolulu'),
(5, '(GMT-10:00) Pacific/Honolulu', 'Pacific/Honolulu'),
(6, '(GMT-09:00) Alaska', 'US/Alaska'),
(7, '(GMT-08:00) America/Los_Angeles', 'America/Los_Angeles'),
(8, '(GMT-08:00) Pacific Time (US &amp; Canada)', 'America/Los_Angeles'),
(9, '(GMT-08:00) Tijuana', 'America/Tijuana'),
(10, '(GMT-07:00) America/Denver', 'America/Denver'),
(11, '(GMT-07:00) America/Phoenix', 'America/Phoenix'),
(12, '(GMT-07:00) Arizona', 'US/Arizona'),
(13, '(GMT-07:00) Chihuahua', 'America/Chihuahua'),
(14, '(GMT-07:00) Mazatlan', 'America/Mazatlan'),
(15, '(GMT-07:00) Mountain Time (US &amp; Canada)', 'US/Mountain'),
(16, '(GMT-06:00) America/Chicago', 'America/Chicago'),
(17, '(GMT-06:00) America/Mexico_City', 'America/Mexico_City'),
(18, '(GMT-06:00) Central America', 'America/Managua'),
(19, '(GMT-06:00) Central Time (US &amp; Canada)', 'US/Central'),
(20, '(GMT-06:00) Guadalajara', 'America/Mexico_City'),
(21, '(GMT-06:00) Mexico City', 'America/Mexico_City'),
(22, '(GMT-06:00) Monterrey', 'America/Monterrey'),
(23, '(GMT-06:00) Saskatchewan', 'Canada/Saskatchewan'),
(24, '(GMT-05:00) America/Nassau', 'America/Nassau'),
(25, '(GMT-05:00) America/New_York', 'America/New_York'),
(26, '(GMT-05:00) America/Port-au-Prince', 'America/Port-au-Prince'),
(27, '(GMT-05:00) America/Toronto', 'America/Toronto'),
(28, '(GMT-05:00) Bogota', 'America/Bogota'),
(29, '(GMT-05:00) Eastern Time (US &amp; Canada)', 'US/Eastern'),
(30, '(GMT-05:00) Indiana (East)', 'US/East-Indiana'),
(31, '(GMT-05:00) Lima', 'America/Lima'),
(32, '(GMT-05:00) Quito', 'America/Bogota'),
(33, '(GMT-04:30) Caracas', 'America/Caracas'),
(34, '(GMT-04:00) Atlantic Time (Canada)', 'Canada/Atlantic'),
(35, '(GMT-04:00) Georgetown', 'America/Argentina/Buenos_Aires'),
(36, '(GMT-04:00) La Paz', 'America/La_Paz'),
(37, '(GMT-03:30) Newfoundland', 'Canada/Newfoundland'),
(38, '(GMT-03:00) America/Argentina/Buenos_Aires', 'America/Argentina/Buenos_Aires'),
(39, '(GMT-03:00) America/Cordoba', 'America/Cordoba'),
(40, '(GMT-03:00) America/Fortaleza', 'America/Fortaleza'),
(41, '(GMT-03:00) America/Montevideo', 'America/Montevideo'),
(42, '(GMT-03:00) America/Santiago', 'America/Santiago'),
(43, '(GMT-03:00) America/Sao_Paulo', 'America/Sao_Paulo'),
(44, '(GMT-03:00) Brasilia', 'America/Sao_Paulo'),
(45, '(GMT-03:00) Buenos Aires', 'America/Argentina/Buenos_Aires'),
(46, '(GMT-03:00) Greenland', 'America/Godthab'),
(47, '(GMT-03:00) Santiago', 'America/Santiago'),
(48, '(GMT-02:00) Mid-Atlantic', 'America/Noronha'),
(49, '(GMT-01:00) Azores', 'Atlantic/Azores'),
(50, '(GMT-01:00) Cape Verde Is.', 'Atlantic/Cape_Verde'),
(51, '(GMT+00:00) Africa/Casablanca', 'Africa/Casablanca'),
(52, '(GMT+00:00) Atlantic/Canary', 'Atlantic/Canary'),
(53, '(GMT+00:00) Atlantic/Reykjavik', 'Atlantic/Reykjavik'),
(54, '(GMT+00:00) Casablanca', 'Africa/Casablanca'),
(55, '(GMT+00:00) Dublin', 'Etc/Greenwich'),
(56, '(GMT+00:00) Edinburgh', 'Europe/London'),
(57, '(GMT+00:00) Europe/Dublin', 'Europe/Dublin'),
(58, '(GMT+00:00) Europe/Lisbon', 'Europe/Lisbon'),
(59, '(GMT+00:00) Europe/London', 'Europe/London'),
(60, '(GMT+00:00) Lisbon', 'Europe/Lisbon'),
(61, '(GMT+00:00) London', 'Europe/London'),
(62, '(GMT+00:00) Monrovia', 'Africa/Monrovia'),
(63, '(GMT+00:00) UTC', 'UTC'),
(64, '(GMT+01:00) Amsterdam', 'Europe/Amsterdam'),
(65, '(GMT+01:00) Belgrade', 'Europe/Belgrade'),
(66, '(GMT+01:00) Berlin', 'Europe/Berlin'),
(67, '(GMT+01:00) Bern', 'Europe/Berlin'),
(68, '(GMT+01:00) Bratislava', 'Europe/Bratislava'),
(69, '(GMT+01:00) Brussels', 'Europe/Brussels'),
(70, '(GMT+01:00) Budapest', 'Europe/Budapest'),
(71, '(GMT+01:00) Copenhagen', 'Europe/Copenhagen'),
(72, '(GMT+01:00) Europe/Amsterdam', 'Europe/Amsterdam'),
(73, '(GMT+01:00) Europe/Belgrade', 'Europe/Belgrade'),
(74, '(GMT+01:00) Europe/Berlin', 'Europe/Berlin'),
(75, '(GMT+01:00) Europe/Bratislava', 'Europe/Bratislava'),
(76, '(GMT+01:00) Europe/Brussels', 'Europe/Brussels'),
(77, '(GMT+01:00) Europe/Budapest', 'Europe/Budapest'),
(78, '(GMT+01:00) Europe/Copenhagen', 'Europe/Copenhagen'),
(79, '(GMT+01:00) Europe/Ljubljana', 'Europe/Ljubljana'),
(80, '(GMT+01:00) Europe/Madrid', 'Europe/Madrid'),
(81, '(GMT+01:00) Europe/Monaco', 'Europe/Monaco'),
(82, '(GMT+01:00) Europe/Oslo', 'Europe/Oslo'),
(83, '(GMT+01:00) Europe/Paris', 'Europe/Paris'),
(84, '(GMT+01:00) Europe/Podgorica', 'Europe/Podgorica'),
(85, '(GMT+01:00) Europe/Prague', 'Europe/Prague'),
(86, '(GMT+01:00) Europe/Rome', 'Europe/Rome'),
(87, '(GMT+01:00) Europe/Stockholm', 'Europe/Stockholm'),
(88, '(GMT+01:00) Europe/Tirane', 'Europe/Tirane'),
(89, '(GMT+01:00) Europe/Vienna', 'Europe/Vienna'),
(90, '(GMT+01:00) Europe/Warsaw', 'Europe/Warsaw'),
(91, '(GMT+01:00) Europe/Zagreb', 'Europe/Zagreb'),
(92, '(GMT+01:00) Europe/Zurich', 'Europe/Zurich'),
(93, '(GMT+01:00) Ljubljana', 'Europe/Ljubljana'),
(94, '(GMT+01:00) Madrid', 'Europe/Madrid'),
(95, '(GMT+01:00) Paris', 'Europe/Paris'),
(96, '(GMT+01:00) Prague', 'Europe/Prague'),
(97, '(GMT+01:00) Rome', 'Europe/Rome'),
(98, '(GMT+01:00) Sarajevo', 'Europe/Sarajevo'),
(99, '(GMT+01:00) Skopje', 'Europe/Skopje'),
(100, '(GMT+01:00) Stockholm', 'Europe/Stockholm'),
(101, '(GMT+01:00) Vienna', 'Europe/Vienna'),
(102, '(GMT+01:00) Warsaw', 'Europe/Warsaw'),
(103, '(GMT+01:00) West Central Africa', 'Africa/Lagos'),
(104, '(GMT+01:00) Zagreb', 'Europe/Zagreb'),
(105, '(GMT+02:00) Asia/Beirut', 'Asia/Beirut'),
(106, '(GMT+02:00) Asia/Jerusalem', 'Asia/Jerusalem'),
(107, '(GMT+02:00) Asia/Nicosia', 'Asia/Nicosia'),
(108, '(GMT+02:00) Athens', 'Europe/Athens'),
(109, '(GMT+02:00) Bucharest', 'Europe/Bucharest'),
(110, '(GMT+02:00) Cairo', 'Africa/Cairo'),
(111, '(GMT+02:00) Europe/Athens', 'Europe/Athens'),
(112, '(GMT+02:00) Europe/Helsinki', 'Europe/Helsinki'),
(113, '(GMT+02:00) Europe/Istanbul', 'Europe/Istanbul'),
(114, '(GMT+02:00) Europe/Riga', 'Europe/Riga'),
(115, '(GMT+02:00) Europe/Sofia', 'Europe/Sofia'),
(116, '(GMT+02:00) Harare', 'Africa/Harare'),
(117, '(GMT+02:00) Helsinki', 'Europe/Helsinki'),
(118, '(GMT+02:00) Istanbul', 'Europe/Istanbul'),
(119, '(GMT+02:00) Jerusalem', 'Asia/Jerusalem'),
(120, '(GMT+02:00) Kyiv', 'Europe/Helsinki'),
(121, '(GMT+02:00) Pretoria', 'Africa/Johannesburg'),
(122, '(GMT+02:00) Riga', 'Europe/Riga'),
(123, '(GMT+02:00) Sofia', 'Europe/Sofia'),
(124, '(GMT+02:00) Tallinn', 'Europe/Tallinn'),
(125, '(GMT+02:00) Vilnius', 'Europe/Vilnius'),
(126, '(GMT+03:00) Baghdad', 'Asia/Baghdad'),
(127, '(GMT+03:00) Europe/Minsk', 'Europe/Minsk'),
(128, '(GMT+03:00) Europe/Moscow', 'Europe/Moscow'),
(129, '(GMT+03:00) Kuwait', 'Asia/Kuwait'),
(130, '(GMT+03:00) Minsk', 'Europe/Minsk'),
(131, '(GMT+03:00) Moscow', 'Europe/Moscow'),
(132, '(GMT+03:00) Nairobi', 'Africa/Nairobi'),
(133, '(GMT+03:00) Riyadh', 'Asia/Riyadh'),
(134, '(GMT+03:00) St. Petersburg', 'Europe/Moscow'),
(135, '(GMT+03:00) Volgograd', 'Europe/Volgograd'),
(136, '(GMT+03:30) Tehran', 'Asia/Tehran'),
(137, '(GMT+04:00) Abu Dhabi', 'Asia/Muscat'),
(138, '(GMT+04:00) Asia/Dubai', 'Asia/Dubai'),
(139, '(GMT+04:00) Asia/Tbilisi', 'Asia/Tbilisi'),
(140, '(GMT+04:00) Baku', 'Asia/Baku'),
(141, '(GMT+04:00) Muscat', 'Asia/Muscat'),
(142, '(GMT+04:00) Tbilisi', 'Asia/Tbilisi'),
(143, '(GMT+04:00) Yerevan', 'Asia/Yerevan'),
(144, '(GMT+04:30) Kabul', 'Asia/Kabul'),
(145, '(GMT+05:00) Ekaterinburg', 'Asia/Yekaterinburg'),
(146, '(GMT+05:00) Indian/Maldives', 'Indian/Maldives'),
(147, '(GMT+05:00) Islamabad', 'Asia/Karachi'),
(148, '(GMT+05:00) Karachi', 'Asia/Karachi'),
(149, '(GMT+05:00) Tashkent', 'Asia/Tashkent'),
(150, '(GMT+05:30) Asia/Calcutta', 'Asia/Calcutta'),
(151, '(GMT+05:30) Asia/Colombo', 'Asia/Colombo'),
(152, '(GMT+05:30) Chennai', 'Asia/Calcutta'),
(153, '(GMT+05:30) Kolkata', 'Asia/Kolkata'),
(154, '(GMT+05:30) Mumbai', 'Asia/Calcutta'),
(155, '(GMT+05:30) New Delhi', 'Asia/Calcutta'),
(156, '(GMT+05:30) Sri Jayawardenepura', 'Asia/Calcutta'),
(157, '(GMT+05:45) Kathmandu', 'Asia/Katmandu'),
(158, '(GMT+06:00) Almaty', 'Asia/Almaty'),
(159, '(GMT+06:00) Astana', 'Asia/Dhaka'),
(160, '(GMT+06:00) Dhaka', 'Asia/Dhaka'),
(161, '(GMT+06:00) Novosibirsk', 'Asia/Novosibirsk'),
(162, '(GMT+06:00) Urumqi', 'Asia/Urumqi'),
(163, '(GMT+06:30) Rangoon', 'Asia/Rangoon'),
(164, '(GMT+07:00) Asia/Bangkok', 'Asia/Bangkok'),
(165, '(GMT+07:00) Asia/Jakarta', 'Asia/Jakarta'),
(166, '(GMT+07:00) Bangkok', 'Asia/Bangkok'),
(167, '(GMT+07:00) Hanoi', 'Asia/Bangkok'),
(168, '(GMT+07:00) Jakarta', 'Asia/Jakarta'),
(169, '(GMT+07:00) Krasnoyarsk', 'Asia/Krasnoyarsk'),
(170, '(GMT+08:00) Asia/Chongqing', 'Asia/Chongqing'),
(171, '(GMT+08:00) Asia/Hong_Kong', 'Asia/Hong_Kong'),
(172, '(GMT+08:00) Asia/Kuala_Lumpur', 'Asia/Kuala_Lumpur'),
(173, '(GMT+08:00) Asia/Macau', 'Asia/Macau'),
(174, '(GMT+08:00) Asia/Makassar', 'Asia/Makassar'),
(175, '(GMT+08:00) Asia/Shanghai', 'Asia/Shanghai'),
(176, '(GMT+08:00) Asia/Taipei', 'Asia/Taipei'),
(177, '(GMT+08:00) Beijing', 'Asia/Hong_Kong'),
(178, '(GMT+08:00) Chongqing', 'Asia/Chongqing'),
(179, '(GMT+08:00) Hong Kong', 'Asia/Hong_Kong'),
(180, '(GMT+08:00) Irkutsk', 'Asia/Irkutsk'),
(181, '(GMT+08:00) Kuala Lumpur', 'Asia/Kuala_Lumpur'),
(182, '(GMT+08:00) Perth', 'Australia/Perth'),
(183, '(GMT+08:00) Singapore', 'Asia/Singapore'),
(184, '(GMT+08:00) Taipei', 'Asia/Taipei'),
(185, '(GMT+08:00) Ulaan Bataar', 'Asia/Ulan_Bator'),
(186, '(GMT+09:00) Asia/Seoul', 'Asia/Seoul'),
(187, '(GMT+09:00) Asia/Tokyo', 'Asia/Tokyo'),
(188, '(GMT+09:00) Osaka', 'Asia/Tokyo'),
(189, '(GMT+09:00) Sapporo', 'Asia/Tokyo'),
(190, '(GMT+09:00) Seoul', 'Asia/Seoul'),
(191, '(GMT+09:00) Tokyo', 'Asia/Tokyo'),
(192, '(GMT+09:00) Yakutsk', 'Asia/Yakutsk'),
(193, '(GMT+09:30) Adelaide', 'Australia/Adelaide'),
(194, '(GMT+09:30) Darwin', 'Australia/Darwin'),
(195, '(GMT+10:00) Australia/Brisbane', 'Australia/Brisbane'),
(196, '(GMT+10:00) Australia/Hobart', 'Australia/Hobart'),
(197, '(GMT+10:00) Australia/Melbourne', 'Australia/Melbourne'),
(198, '(GMT+10:00) Australia/Sydney', 'Australia/Sydney'),
(199, '(GMT+10:00) Brisbane', 'Australia/Brisbane'),
(200, '(GMT+10:00) Canberra', 'Australia/Canberra'),
(201, '(GMT+10:00) Guam', 'Pacific/Guam'),
(202, '(GMT+10:00) Hobart', 'Australia/Hobart'),
(203, '(GMT+10:00) Magadan', 'Asia/Magadan'),
(204, '(GMT+10:00) Melbourne', 'Australia/Melbourne'),
(205, '(GMT+10:00) Port Moresby', 'Pacific/Port_Moresby'),
(206, '(GMT+10:00) Solomon Is.', 'Asia/Magadan'),
(207, '(GMT+10:00) Sydney', 'Australia/Sydney'),
(208, '(GMT+10:00) Vladivostok', 'Asia/Vladivostok'),
(209, '(GMT+11:00) New Caledonia', 'Asia/Magadan'),
(210, '(GMT+12:00) Auckland', 'Pacific/Auckland'),
(211, '(GMT+12:00) Fiji', 'Pacific/Fiji'),
(212, '(GMT+12:00) Kamchatka', 'Asia/Kamchatka'),
(213, '(GMT+12:00) Marshall Is.', 'Pacific/Fiji'),
(214, '(GMT+12:00) Pacific/Auckland', 'Pacific/Auckland'),
(215, '(GMT+12:00) Wellington', 'Pacific/Auckland'),
(216, '(GMT+13:00) Nuku&#39;alofa', 'Pacific/Tongatapu');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formatted_phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_country` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double NOT NULL DEFAULT '0',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `formatted_phone`, `carrier_code`, `default_country`, `password`, `profile_image`, `balance`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'user', 'test@techvill.net', '2015550124', '+12015550124', '1', 'us', '$2y$10$kLKUKTJo.3ErEr6T/6pz/eUY.SqA1AbH83eYwh2W5F0cwoXJelwzO', 'profile.png', 0, 'Active', NULL, '2020-12-02 23:30:09', '2020-12-02 23:36:29'),
(2, 'customer', 'user', 'customer@techvill.net', '2015550125', '+12015550125', '1', 'us', '$2y$10$.1D.yMTt3DJl2vgMNsnIPuRgJn/VHmPm.ixyHf5AJHATFSIDcY35K', 'profile.jpg', 0, 'Active', NULL, '2020-12-02 23:30:09', '2020-12-02 23:38:34'),
(3, 'William', 'Smith', 'william@techvill.net', '2015559123', '+12015559123', '1', 'us', '$2y$10$A59X3xGYont3uTIg2BMqEu/skFDSKud6cn.kFM.Wz05uTm.1oVWFO', 'profile_1606977863.png', 0, 'Active', 'xmrk9NtKWrJX48O9tIoVfNGO5PEJVC8D8MBP9Y8DihhtzOIugg662cLdgAyM', '2020-12-02 23:31:31', '2020-12-03 00:44:23'),
(4, 'John', 'Doe', 'john@techvill.net', '2017772727', '+12017772727', '1', 'us', '$2y$10$Pi4y686ZYzXZ/NyAKvAijeQrMggROT2eFoABC4l.R6iPaL2SIL0gC', 'profile_1606977391.png', 0, 'Active', NULL, '2020-12-02 23:32:45', '2020-12-03 00:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `users_verification`
--

DROP TABLE IF EXISTS `users_verification`;
CREATE TABLE IF NOT EXISTS `users_verification` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `facebook` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `google` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `linkedin` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `phone` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `fb_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_verification`
--

INSERT INTO `users_verification` (`id`, `user_id`, `email`, `facebook`, `google`, `linkedin`, `phone`, `fb_id`, `google_id`, `linkedin_id`) VALUES
(1, 1, 'yes', 'yes', 'no', 'no', 'no', NULL, NULL, NULL),
(2, 2, 'yes', 'yes', 'yes', 'no', 'no', NULL, NULL, NULL),
(3, 3, 'yes', 'yes', 'yes', 'no', 'no', NULL, NULL, NULL),
(4, 4, 'yes', 'no', 'no', 'no', 'no', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `field` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `field`, `value`) VALUES
(1, 3, 'date_of_birth', '1993-12-21'),
(2, 4, 'date_of_birth', '1982-1-18'),
(3, 3, 'live', 'New York'),
(4, 3, 'about', 'My name is William Smith, and I love to travel. My biggest passion is traveling the world and experiencing new adventures and cultures. I live for it.'),
(5, 1, 'gender', 'Male'),
(6, 1, 'live', 'Washington'),
(7, 1, 'about', 'I’m a 26 year-old entrepreneur from just outside of Washington D.C. I was born to a single mother in a lower-middle-class family. Growing up, life was hard. My mother had type-2 diabetes, high blood pressure, and bipolar disorder. That was the perfect storm for me to have an abusive upbringing. I was abused physically, emotionally, verbally…. no child should have to endure what I went through, but I really do believe that it made me stronger in a weird way.'),
(8, 1, 'date_of_birth', '1987-12-19'),
(9, 2, 'live', 'Sydney'),
(10, 2, 'about', 'I am actually from a third world country, In 2003 i came to Sydney to study for bachelors degree in Electronics engineering.\r\n\r\nI found about Sydny only from Internet and applied to the university and moved with just 1000 US dollars. Without knowing anyone in Denmark. and with knowledge that i will not get more money.'),
(11, 2, 'date_of_birth', '1958-11-18'),
(12, 4, 'live', 'Jersey City'),
(13, 4, 'about', 'I’m a world traveler who’s been traveling since I was 7 years and have been to a few destinations around this planet since then.');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
CREATE TABLE IF NOT EXISTS `wallets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `balance` decimal(8,2) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `currency_id`, `balance`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '510.00', 1, NULL, '2021-06-24 11:53:06'),
(2, 2, 1, '652.00', 1, NULL, '2022-02-01 22:47:43'),
(3, 3, 1, '384.00', 1, '2020-12-02 23:31:31', '2021-06-24 10:23:50'),
(4, 4, 1, '216.00', 1, '2020-12-02 23:32:45', '2020-12-03 01:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

DROP TABLE IF EXISTS `withdrawals`;
CREATE TABLE IF NOT EXISTS `withdrawals` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `payout_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `uuid` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `payment_method_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Success','Refund','Blocked') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `user_id`, `payout_id`, `currency_id`, `payment_method_id`, `uuid`, `subtotal`, `amount`, `payment_method_info`, `email`, `account_number`, `bank_name`, `swift_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 1, '5fc88754b59e8', '100.00', NULL, NULL, 'customer@techvill.net', NULL, NULL, NULL, 'Pending', '2020-12-02 00:00:00', '2020-12-02 00:00:00'),
(2, 2, 1, 1, 1, '5fc8875e08ac3', '0.00', '10.00', NULL, 'customer@techvill.net', NULL, NULL, NULL, 'Success', '2020-12-01 00:00:00', '2020-12-01 00:00:00'),
(3, 3, 2, 1, 1, '5fc8889bea1ba', '0.00', '11.00', NULL, 'william@techvill.net', NULL, NULL, NULL, 'Success', '2020-12-02 00:00:00', '2020-12-02 00:00:00'),
(4, 3, 2, 1, 1, '5fc888a2abf2f', '0.00', '10.00', NULL, 'william@techvill.net', NULL, NULL, NULL, 'Success', '2020-12-01 00:00:00', '2020-12-01 00:00:00'),
(5, 4, 3, 1, 1, '5fc8890b2893c', '0.00', '120.00', NULL, 'john@techvill.net', NULL, NULL, NULL, 'Success', '2020-12-02 00:00:00', '2020-12-02 00:00:00'),
(6, 4, 3, 1, 1, '5fc889239f198', '150.00', NULL, NULL, 'john@techvill.net', NULL, NULL, NULL, 'Pending', '2020-12-01 00:00:00', '2020-12-01 00:00:00'),
(7, 4, 3, 1, 1, '5fc8892f4faa6', '244.00', NULL, NULL, 'john@techvill.net', NULL, NULL, NULL, 'Pending', '2020-12-02 00:00:00', '2020-12-02 00:00:00'),
(8, 1, 4, 1, 1, '5fc88cc41ec14', '0.00', '10.00', NULL, 'test@techvill.net', NULL, NULL, NULL, 'Success', '2020-12-01 00:00:00', '2020-12-01 00:00:00'),
(9, 1, 4, 1, 1, '5fc898f1464a9', '10.00', NULL, NULL, 'test@techvill.net', NULL, NULL, NULL, 'Pending', '2020-12-02 00:00:00', '2020-12-02 00:00:00'),
(10, 3, 2, 1, 1, '60d3faaee4ff3', '0.00', '10.00', NULL, 'william@techvill.net', NULL, NULL, NULL, 'Success', '2021-06-24 10:23:26', '2021-06-24 10:23:50');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
