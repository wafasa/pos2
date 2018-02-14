-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 16, 2018 at 02:46 AM
-- Server version: 10.0.33-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `naturere_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_adjustments`
--

INSERT INTO `sma_adjustments` (`id`, `date`, `reference_no`, `warehouse_id`, `note`, `attachment`, `created_by`, `updated_by`, `updated_at`, `count_id`) VALUES
(12, '2018-01-13 09:54:00', 'ADJ/002/01/A/2018', 3, '&lt;p&gt;1 kotak isi 7 pcs &lpar;harusnya 8 pcs&rpar;&lt;&sol;p&gt;', NULL, 2, NULL, NULL, NULL),
(13, '2018-01-13 09:55:00', 'ADJ/003/01/A/2018', 3, '&lt;p&gt;1 kotak isi 39 pcs &lpar;harusnya 40 pcs&rpar;&lt;&sol;p&gt;', NULL, 2, NULL, NULL, NULL),
(10, '2018-01-13 08:33:00', 'ADJ/001/01/A/2018', 3, '&lt;p&gt;terkirim hanya 14 box dari total 15 box &lpar;&commat;box isi 40 pcs&rpar;&lt;&sol;p&gt;', NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_adjustment_items`
--

INSERT INTO `sma_adjustment_items` (`id`, `adjustment_id`, `product_id`, `option_id`, `quantity`, `warehouse_id`, `serial_no`, `type`) VALUES
(1151, 13, 2207, NULL, '6.0000', 3, '', 'subtraction'),
(1150, 13, 2156, NULL, '1.0000', 3, '', 'subtraction'),
(1133, 12, 2234, NULL, '1.0000', 3, '', 'subtraction'),
(1136, 10, 2137, NULL, '40.0000', 3, '', 'subtraction');

-- --------------------------------------------------------

--
-- Table structure for table `sma_banner`
--

CREATE TABLE `sma_banner` (
  `banner_id` int(11) NOT NULL,
  `banner_src` text NOT NULL,
  `banner_type` varchar(10) NOT NULL,
  `banner_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('active','non-active') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sma_banner`
--

INSERT INTO `sma_banner` (`banner_id`, `banner_src`, `banner_type`, `banner_date`, `status`) VALUES
(48, 'spin_wheel_crop_2.jpg', 'image/jpeg', '2018-01-09 10:24:17', 'active'),
(49, 'opening_promotion_cro.jpg', 'image/jpeg', '2018-01-09 11:29:35', 'active'),
(50, 'brand_story_crop.jpg', 'image/jpeg', '2018-01-09 11:29:51', 'active'),
(51, 'GWP_crop.jpg', 'image/jpeg', '2018-01-09 11:30:08', 'active'),
(52, 'member_crop.jpg', 'image/jpeg', '2018-01-09 11:30:19', 'active'),
(53, 'aloe_crop.jpg', 'image/jpeg', '2018-01-09 11:30:32', 'active'),
(54, 'argan_crop.jpg', 'image/jpeg', '2018-01-09 11:30:40', 'active'),
(55, 'BEST_ITEM_CROP.jpg', 'image/jpeg', '2018-01-09 11:30:53', 'active'),
(56, 'exo_crop.jpg', 'image/jpeg', '2018-01-09 11:31:11', 'active'),
(57, 'ginseng_crop.jpg', 'image/jpeg', '2018-01-09 11:31:23', 'active'),
(58, 'TOKOPEDIA.jpg', 'image/jpeg', '2018-01-09 11:31:44', 'active'),
(59, 'VITAMIN_CROP.jpg', 'image/jpeg', '2018-01-09 11:31:57', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`, `slug`) VALUES
(1, 'Brand01', 'Brand', NULL, 'brand');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`) VALUES
(9, 'Facial Makeup', 'Facial Makeup', '4e467132d0235477d455ccfe2ff5839e.jpg', 0, 'Facial-Makeup'),
(8, 'Eye Makeup', 'Eye Makeup', 'e31519837071f44415426f36f7719b0a.jpg', 0, 'Eye-Makeup'),
(7, 'Cleansing', 'Cleansing', 'bb3fbe5fab1155a000c6ebc04cb03ef5.JPG', 0, 'Cleansing'),
(6, 'Body Care', 'Body Care', '4b2d0e53c629c176b173bee2c988a97a.jpg', 0, 'Body-Care'),
(10, 'Foot Care', 'Foot Care', '2a0451cc25752fe82d96d1a5cc6a97b8.jpg', 0, 'Foot-Care'),
(11, 'For Men', 'For Men', 'c1761f484daa210e0665831628b27b24.PNG', 0, 'For-Men'),
(12, 'Fragrance', 'Fragrance', '0be24250cc00b60635a55810cad5c710.jpg', 0, 'Fragrance'),
(13, 'Hair Care', 'Hair Care', '1b0900a6dffd66d17d0360f2c6be57a4.jpg', 0, 'Hair-Care'),
(14, 'Hand Care', 'Hand Care', '02d47312a667e341044e37e8030c3137.jpg', 0, 'Hand-Care'),
(15, 'Lip Makeup', 'Lip Makeup', '710bfa294eb0baad36203f221fbc18a9.jpg', 0, 'Lip-Makeup'),
(16, 'Mask Sheet', 'Mask Sheet', '78996291b16532fbcedb67262a214509.jpg', 0, 'Mask-Sheet'),
(17, 'Massage', 'Massage', 'db103d21bfd2e5fa38095593012256fc.jpg', 0, 'Massage'),
(18, 'Mist', 'Mist', 'c417291aa17a60299802df4793d416d0.jpg', 0, 'mist'),
(19, 'Pack', 'Pack', 'b980855a2ca29d50d3104ea3b78dba35.PNG', 0, 'Pack'),
(20, 'Patch', 'Patch', '62966dca0922aef5654d4434f630f8c1.png', 0, 'Patch'),
(21, 'Peeling', 'Peeling', '23a507a1d9832457b2fa08adc014991d.jpg', 0, 'Peeling'),
(22, 'Sun Care', 'Sun Care', '54b6ae82712bb2b0d461f5af83191fa3.jpg', 0, 'Sun-Care'),
(23, 'skin care', 'skin care', 'fbb6255a01035698a29b10fcf3094495.png', 0, 'skin-care'),
(24, 'Beauty Tools', 'Beauty Tools', NULL, 0, 'Beauty-Tools');

-- --------------------------------------------------------

--
-- Table structure for table `sma_code`
--

CREATE TABLE `sma_code` (
  `id_code` int(11) NOT NULL,
  `generate_code` varchar(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sma_code`
--

INSERT INTO `sma_code` (`id_code`, `generate_code`) VALUES
(1, '12345');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`) VALUES
(1, 3, 'customer', 7, 'Tes', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Jakarta Utara', 'DKI Jakarta', '48111', 'Indonesia', '0123456789', 'customer@nri.com', '', '', '', '', '', '', NULL, 0, 'logo.png', -14945, NULL, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Supplier', 'marq', '', 'jl. Nusa Indah blok HA 10 no 60', 'Jakarta', 'DKI Jakarta', '15132', 'Indonesia', '758375837', 'supplier@yahoo.com', '-', '-', '-', '085959829092', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Biller', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'biller@erp.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo5.png', 0, NULL, NULL, NULL),
(4, 4, 'supplier', NULL, NULL, 'supp', 'abc', '', 'lorem ipsum', 'lorem', '', '', '', '65778878', 'supp@pos.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(6, 3, 'customer', 2, 'VIP', 'Stephen', 'Stephen', '', 'jakarta', 'jakarta', '', '', '', '082111838093', 'stephen@naturerepublic.id', '', '', '', '', '', '', NULL, 0, 'logo.png', 3707, NULL, 1, 'Default'),
(13, 3, 'customer', 6, 'Platinum', 'Franseda', 'Franseda', '', 'Puri Indah CBD, Jl. Puri Indah Raya Blok U 1, RT.3/RW.2, Kembangan Selatan, RT.3/RW.2, Kembangan Selatan, RT.3/RW.2, Kembangan Sel., Kembangan', 'Kota Jakarta Barat', 'Daerah Khusus Ibukota Jakarta 11610', '11610', 'Indonesia', '82111838093', 'Franseda@gmail.com', '', '', '', '082111838093', '', '', NULL, 0, 'logo.png', 4828, NULL, 1, 'Default'),
(8, NULL, 'biller', NULL, NULL, 'LIPPO PURI', 'LIPPO PURI', '', 'Lippo Mall Puri LG-89', 'Jakarta 11610', '', '', '', '082111838093', 'hr@naturerepublic.id', '', '', '', '', '', '', 'Barang yang sudah di beli, tidak dapat ditukar atau dikembalikan\r\nTerima kasih atas kunjungannya', 0, 'logo_hitam_500.png', 0, NULL, NULL, NULL),
(9, NULL, 'biller', NULL, NULL, 'KOTA KASABLANKA', 'KOTA KASABLANKA', '', 'LG Unit IU-19&22', 'Jakarta 12870', '', '', '', '082111838093', 'info@naturerepublic.id', '', '', '', '', '', '', 'Barang yang sudah di beli, tidak dapat ditukar atau dikembalikan\r\nTerima kasih atas kunjungannya\r\n', 0, 'logo_hitam_500.png', 0, NULL, NULL, NULL),
(10, NULL, 'biller', NULL, NULL, 'GANDARIA CITY', 'GANDARIA CITY', '', 'Mall Gandaria City LG-48', 'Jakarta 12240', '', '', '', '82111838093', 'info@naturerepublic.id', '', '', '', '', '', '', 'Barang yang sudah di beli, tidak dapat ditukar atau dikembalikan\r\nTerima kasih atas kunjungannya\r\n', 0, 'logo_hitam_500.png', 0, NULL, NULL, NULL),
(11, 4, 'supplier', NULL, NULL, 'NATURE REPUBLIC KOREA', 'NATURE REPUBLIC KOREA', '', 'Korea', 'Korea', '', '', '', '082111838093', 'nrkorea@naturerepublic.id', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(15, 3, 'customer', 5, 'Reguler', 'HANI', 'HANI', '', 'asdasd', 'adsada', '', '', '', '082111838093', 'Hani@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 551, NULL, 1, 'Default'),
(12, 3, 'customer', 6, 'Platinum', 'Franandes', 'Franandes', '', 'Puri Indah CBD, Jl. Puri Indah Raya Blok U 1, RT.3/RW.2, Kembangan Selatan, RT.3/RW.2, Kembangan Selatan, RT.3/RW.2, Kembangan Sel., Kembangan', 'Kota Jakarta Barat', 'Daerah Khusus Ibukota Jakarta 11610', '11610', 'Indonesia', '82111838093', 'Franandes@gmail.com', '', '', '', '082111838093', '', '', NULL, 0, 'logo.png', 3282, NULL, 1, 'Default'),
(14, 3, 'customer', 7, 'Tes', 'tes cust', 'test', '', 'tes tes', 'jakarta', '', '', '', '878371289', 'tes@cus.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 24, NULL, 1, 'Default'),
(16, 3, 'customer', 5, 'Reguler', 'hani', 'jtfrhj', '', 'rhuff', 'gtuhj', 'ina', '', '', '0878678954345', 'gdtyjgtu@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 98, NULL, 1, 'Default'),
(17, 3, 'customer', 5, 'Reguler', 'mhelati', 'nature', '', 'hasyim ashari 4e', 'ja', '', '', '', '085290008485', 'mhelati@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 51, NULL, 1, 'Default'),
(18, 3, 'customer', 5, 'Reguler', 'centhini', 'warteg indonesia', '', 'jln galau no01', 'jakarta', '', '', '', '0877777777777', 'centhini@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default'),
(19, 3, 'customer', 5, 'Reguler', 'ani', 'nr', '', 'kp.pabuaran no.27', 'jakarta', '', '', '', '098676555554455', 'ani12345@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default'),
(20, 3, 'customer', 5, 'Reguler', 'tes', 'rrr', '', 'gggg', 'yyyhh', '', '', '', '3458875', 'tes@dd.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 61, NULL, 1, 'Default'),
(21, 3, 'customer', 5, 'Reguler', 'min', 'krakatau', '', 'jsakdaskdkahdk', 'sadaad', '', '', '', '098989', 'kidse@jui.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 129, NULL, 1, 'Default'),
(22, 3, 'customer', 5, 'Reguler', 'tina', 'maju', '', 'jj', 'fafga', '', '', '', '0812456', 'tinatini@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 331, NULL, 1, 'Default'),
(23, 3, 'customer', 5, 'Reguler', 'Adyt', 'Jakarta', '', 'Jakarta', 'Jakarta', '', '', '', '0878678954345', 'adyt123@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 291, NULL, 1, 'Default'),
(24, 3, 'customer', 5, 'Reguler', 'Janah', 'Janah', '', 'jakarta', 'jakarta', '', '', '', '0585222', 'nurjanah@gmail.com', '5 Oktober 2000', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default'),
(25, 3, 'customer', 5, 'Reguler', 'novi', 'jakarta', '', 'jakarta', 'jakarta', '', '', '', '085290008485', 'novi12@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 127, NULL, 1, 'Default'),
(26, 3, 'customer', 5, 'Reguler', 'pipi', 'pi', '', 'hfgsdhfsefgjisehofj', 'gfdfehdufegui', '', '', '', '456545678645678456', 'pipi@hhjhsadjksa.cijik', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default'),
(27, 3, 'customer', 6, 'Platinum', 'stephani ay ay', 'jakarta', '', 'thamrin residence', 'central jakarta', 'mh thamrin', '', '', '628123456', 'ayaymajah@ahoo.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 85, NULL, 1, 'Default'),
(28, 3, 'customer', 5, 'Reguler', 'Nur Ratna', 'PT NRI Global Mandiri', '', 'jalan tanah abang', 'amerika', '', '', '', '083812345456', 'nurratna@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 2480, NULL, 1, 'Default'),
(29, 3, 'customer', 5, 'Reguler', 'Ratna', 'NATURE REPUBLIC', '', 'bekasi', 'tanggerang', '', '', '', '085892227415', 'ratna@yahoo.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 762, NULL, 1, 'Default'),
(30, 3, 'customer', 5, 'Reguler', 'nur ratna', 'nature republic', '', 'bekasi', 'bekasi', '', '', '', '089995642653', 'ratna123@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 381, NULL, 1, 'Default'),
(31, 3, 'customer', 5, 'Reguler', 'Ratna', 'Nature Republic', '', 'Bekasi', 'Bekasi', '', '', '', '081652546398', 'Ratnananana@yahoo.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default'),
(32, 3, 'customer', 5, 'Reguler', 'nurratna', 'nature', '', 'fgdfg', 'frrgdfgh', '', '', '', '45655654645', 'fsadg@hmaisui.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default'),
(33, 3, 'customer', 5, 'Reguler', 'PANJI', 'PANJI', '', 'matraman', 'jaktim', '', '', '', '0845425457', 'panji@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 421, NULL, 1, 'Default'),
(34, 3, 'customer', 5, 'Reguler', 'panji', 'blalla', '', 'tanah abanh', 'jakrta', '', '', '', '08876767', 'gagag@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default'),
(35, 3, 'customer', 5, 'Reguler', 'jaka', 'ghhfdf', '', 'fghfgjghui', 'ghngvjhhk', '', '', '', '5675678', 'jaka@gamil.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 535, NULL, 1, 'Default'),
(36, 3, 'customer', 5, 'Reguler', 'jaka', 'Nature Republic', '', 'bekasi', 'japan', '', '', '', '081241521452', 'jaka@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 657, NULL, 1, 'Default'),
(37, 3, 'customer', 5, 'Reguler', 'lose', 'lose', '', 'lose', 'lose park', '', '', '', '099898979979', 'lose@hihk.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 486, NULL, 1, 'Default'),
(38, 3, 'customer', 5, 'Reguler', 'dhiena', 'jakarta', '', 'jakarta', 'jakarta', '', '', '', '088211959428', 'rhadien@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 54, NULL, 1, 'Default'),
(39, 3, 'customer', 5, 'Reguler', 'inisia', 'tamasya', '', 'bsahydcgqaswjhbcx', 'jakarta', '', '', '', '0878678954345', 'ksanjasncjas@yahoo.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 67, NULL, 1, 'Default'),
(40, 3, 'customer', 5, 'Reguler', 'bella', 'pohyfghfgfcd', '1265465464565', 'lkihjikuyhij', 'ujhytghtygh', '', '', '', '032169584016', 'lkjjukhukyioh@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 123, NULL, 1, 'Default'),
(41, 3, 'customer', 5, 'Reguler', 'septia', 'wiraswasta', '', 'jl. peninggaran', 'jakarta', '', '', '', '087788863350', 'sheptia@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 538, NULL, 1, 'Default'),
(42, 3, 'customer', 5, 'Reguler', 'tini', 'nr', '1545458789', 'jakarta', 'bangka', '', '', '', '0324895654987', 'pujiantini92@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 361, NULL, 1, 'Default'),
(43, 3, 'customer', 5, 'Reguler', 'silvi', 'NR', '', 'jalan gelatik pondok betung', 'tangerang selatan', '', '', '', '082113372173', 'silvidewilestari28@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 925, NULL, 1, 'Default'),
(44, 3, 'customer', 5, 'Reguler', 'tora', 'nr', '', 'pulogebang', 'east jakarta', 'jakartta', '', '', '087884311131', 'oktoramu@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 387, NULL, 1, 'Default'),
(45, 3, 'customer', 5, 'Reguler', 'bella', 'nr', '6778333333', 'jakarta selatan', 'jakarta', '', '', '', '088555553333', 'bellatriana96@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 329, NULL, 1, 'Default'),
(46, 3, 'customer', 5, 'Reguler', 'Venda', 'nature republic', '', 'jl bdn i ujung', 'jakarta', '', '', '', '08592109004', 'novedagiri@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 241, NULL, 1, 'Default'),
(47, 3, 'customer', 5, 'Reguler', 'venda', 'nature', '', 'bdn 1', 'jakarta', '', '', '', '085921079004', 'novendagiri@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 277, NULL, 1, 'Default'),
(48, 3, 'customer', 5, 'Reguler', 'silvy', 'dunia', '', 'jakarta', 'jaktim', '', '', '', '082113372173', 'silvidewillestari@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 159, NULL, 1, 'Default'),
(49, 3, 'customer', 5, 'Reguler', 'riana', 'nr', '', 'jl.ngondek 2', 'ngondek', '', '', '', '023256456558656', 'rihana@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 352, NULL, 1, 'Default'),
(50, 3, 'customer', 5, 'Reguler', 'kiri', 'kimchi', '', 'pak', 'paki', '', '', '', '0899989898989', 'kiri@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 220, NULL, 1, 'Default'),
(51, 3, 'customer', 5, 'Reguler', 'Lucy', 'ah', '', 'jakarta selatan', 'jakarta', '', '', '', '082232270010', 'lucy@yahoo.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default'),
(52, 3, 'customer', 2, 'VIP', 'luccy', 'nr', '', 'jakarta timur', 'jakt', '', '', '', '0123594232', 'luccy@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 494, NULL, 1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0, NULL),
(2, 'ERU', 'EURO', '0.7340', 0, NULL),
(3, 'IDR', 'IDR', '1.0000', 0, 'Rp. ');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(7, 'Tes', 0),
(2, 'VIP', -25),
(5, 'Reguler', 0),
(6, 'Platinum', -50);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_gift_cards`
--

INSERT INTO `sma_gift_cards` (`id`, `date`, `card_no`, `value`, `customer_id`, `customer`, `balance`, `expiry`, `created_by`) VALUES
(18, '2017-12-22 06:32:01', '12346', '500000.0000', NULL, NULL, '500000.0000', '2019-12-22', '2'),
(19, '2017-12-22 06:32:09', '12347', '500000.0000', NULL, NULL, '500000.0000', '2019-12-22', '2'),
(20, '2017-12-22 06:32:24', '12348', '500000.0000', NULL, NULL, '500000.0000', '2019-12-22', '2'),
(21, '2017-12-22 06:32:32', '12349', '500000.0000', NULL, NULL, '500000.0000', '2019-12-22', '2'),
(16, '2017-12-20 06:06:30', '12344', '500000.0000', NULL, NULL, '0.0000', '2019-12-22', '2'),
(17, '2017-12-22 06:31:47', '12342', '500000.0000', NULL, NULL, '0.0000', '2019-12-22', '2'),
(15, '2017-12-20 06:06:21', '12343', '500000.0000', NULL, NULL, '0.0000', '2019-12-22', '2'),
(12, '2017-12-20 06:05:43', '12345', '500000.0000', NULL, NULL, '500000.0000', '2019-12-22', '2'),
(13, '2017-12-20 06:05:58', '12341', '500000.0000', NULL, NULL, '0.0000', '2019-12-21', '2');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_gift_card_topups`
--

INSERT INTO `sma_gift_card_topups` (`id`, `date`, `card_id`, `amount`, `created_by`) VALUES
(1, '2017-12-21 06:20:39', 14, '5000000.0000', 2),
(2, '2017-12-21 06:20:47', 15, '500000.0000', 2),
(3, '2017-12-21 06:20:54', 12, '500000.0000', 2),
(4, '2017-12-21 06:21:01', 13, '500000.0000', 2),
(5, '2017-12-22 06:30:21', 16, '500000.0000', 2),
(6, '2017-12-22 06:30:56', 15, '500000.0000', 2),
(7, '2017-12-22 06:31:03', 12, '500000.0000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff'),
(6, 'tess', 'tess');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_logs`
--

CREATE TABLE `sma_logs` (
  `log_id` int(11) NOT NULL,
  `log_act` text NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_table` text NOT NULL,
  `log_ip` text NOT NULL,
  `log_user` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sma_logs`
--

INSERT INTO `sma_logs` (`log_id`, `log_act`, `log_date`, `log_table`, `log_ip`, `log_user`) VALUES
(1144, 'Membuka POS Register', '2018-01-13 04:27:45', 'sma_pos_register', '103.232.33.37', 2),
(1145, 'Memperbarui produk dengan kode 8806173425464', '2018-01-13 06:49:41', 'sma_products', '182.30.66.80', 2),
(1146, 'Memperbarui produk dengan kode 8806173425471', '2018-01-13 06:55:15', 'sma_products', '182.30.66.80', 2),
(1147, 'Memperbarui produk dengan kode 8806173425488', '2018-01-13 06:57:58', 'sma_products', '182.30.66.80', 2),
(1148, 'Menambah purchase dengan nomor referensi NR17-IN003', '2018-01-13 07:50:17', 'sma_purchases', '182.30.66.80', 2),
(1149, 'Memperbarui purchase dengan nomor referensi NR17-IN002', '2018-01-13 09:22:04', 'sma_purchases', '182.30.66.80', 2),
(1150, 'Menambah purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-13 09:40:16', 'sma_purchases', '182.30.66.80', 2),
(1151, 'Memperbarui purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-13 09:40:50', 'sma_purchases', '182.30.66.80', 2),
(1152, 'Memperbarui produk dengan kode 8806173420377', '2018-01-13 09:49:33', 'sma_products', '182.30.66.80', 2),
(1153, 'Memperbarui produk dengan kode 8806173420377', '2018-01-13 09:51:14', 'sma_products', '182.30.66.80', 2),
(1154, 'Memperbarui purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-13 10:50:13', 'sma_purchases', '182.30.66.80', 2),
(1155, 'Memperbarui purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-13 10:51:32', 'sma_purchases', '182.30.66.80', 2),
(1156, 'Menghapus purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-13 10:52:00', 'sma_purchases', '182.30.66.80', 2),
(1157, 'Menambah purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-13 10:53:14', 'sma_purchases', '182.30.66.80', 2),
(1158, 'Menghapus purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-13 10:55:23', 'sma_purchases', '182.30.66.80', 2),
(1159, 'Menambah purchase dengan nomor referensi p', '2018-01-13 11:02:07', 'sma_purchases', '182.30.66.80', 2),
(1160, 'Menghapus purchase dengan nomor referensi p', '2018-01-13 11:02:38', 'sma_purchases', '182.30.66.80', 2),
(1161, 'Menambah purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-13 11:03:27', 'sma_purchases', '182.30.66.80', 2),
(1162, 'Memperbarui purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-13 11:04:07', 'sma_purchases', '182.30.66.80', 2),
(1163, 'Menghapus purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-13 11:08:08', 'sma_purchases', '182.30.66.80', 2),
(1164, 'Menambah purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-13 11:09:21', 'sma_purchases', '182.30.66.80', 2),
(1165, 'Menambah purchase dengan nomor referensi PO/2018/01/0006', '2018-01-13 11:14:47', 'sma_purchases', '180.244.95.73', 2),
(1166, 'Menghapus purchase dengan nomor referensi PO/2018/01/0005', '2018-01-13 11:15:09', 'sma_purchases', '180.244.95.73', 2),
(1167, 'Menghapus purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-14 09:07:36', 'sma_purchases', '36.82.103.84', 2),
(1168, 'Menambah purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-14 09:09:46', 'sma_purchases', '36.82.103.84', 2),
(1169, 'Memperbarui purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-14 09:10:49', 'sma_purchases', '36.82.103.84', 2),
(1170, 'Memperbarui purchase dengan nomor referensi PO/IN003/12/2017', '2018-01-14 09:14:42', 'sma_purchases', '36.82.103.84', 2),
(1171, 'Memperbarui produk dengan kode 8806173412334', '2018-01-14 18:41:49', 'sma_products', '182.30.106.98', 2),
(1172, 'Memperbarui produk dengan kode 8806173412334', '2018-01-14 18:44:41', 'sma_products', '182.30.106.98', 2),
(1173, 'Memperbarui produk dengan kode 8806173414123', '2018-01-14 18:47:53', 'sma_products', '182.30.106.98', 2),
(1174, 'Menambah purchase dengan nomor referensi PO/2018/01/0007', '2018-01-14 18:53:01', 'sma_purchases', '125.161.116.96', 2),
(1175, 'Menghapus purchase dengan nomor referensi PO/2018/01/0006', '2018-01-14 18:53:25', 'sma_purchases', '125.161.116.96', 2),
(1176, 'Menghapus purchase dengan nomor referensi ', '2018-01-14 18:53:25', 'sma_purchases', '125.161.116.96', 2),
(1177, 'Menambah purchase dengan nomor referensi PO/2018/01/0008', '2018-01-14 18:57:49', 'sma_purchases', '125.161.116.96', 2),
(1178, 'Memperbarui purchase dengan nomor referensi PO/2018/01/0007', '2018-01-14 18:58:15', 'sma_purchases', '125.161.116.96', 2),
(1179, 'Menghapus purchase dengan nomor referensi PO/2018/01/0007', '2018-01-14 18:58:27', 'sma_purchases', '125.161.116.96', 2),
(1180, 'Menambah purchase dengan nomor referensi PO/2018/01/0009', '2018-01-14 19:09:58', 'sma_purchases', '125.161.116.96', 2),
(1181, 'Menghapus purchase dengan nomor referensi PO/2018/01/0008', '2018-01-14 19:10:23', 'sma_purchases', '125.161.116.96', 2),
(1182, 'Menambah purchase dengan nomor referensi PO/2018/01/0010', '2018-01-14 19:13:57', 'sma_purchases', '125.161.116.96', 2),
(1183, 'Menghapus purchase dengan nomor referensi PO/2018/01/0009', '2018-01-14 19:15:25', 'sma_purchases', '125.161.116.96', 2),
(1184, 'Memperbarui produk dengan kode 8806173416264', '2018-01-15 04:23:35', 'sma_products', '103.232.33.37', 2),
(1185, 'Memperbarui produk dengan kode 8806173416288', '2018-01-15 04:30:38', 'sma_products', '103.232.33.37', 2),
(1186, 'Memperbarui produk dengan kode 8806173416332', '2018-01-15 06:30:33', 'sma_products', '103.232.33.37', 2),
(1187, 'Memperbarui produk dengan kode 8806173416394', '2018-01-15 06:48:58', 'sma_products', '103.232.33.37', 2),
(1188, 'Memperbarui produk dengan kode 8806173416400', '2018-01-15 06:56:59', 'sma_products', '103.232.33.37', 2),
(1189, 'Memperbarui produk dengan kode 8806173420803', '2018-01-15 10:29:51', 'sma_products', '103.232.33.37', 2),
(1190, 'Memperbarui produk dengan kode 8806173420810', '2018-01-15 10:39:29', 'sma_products', '103.232.33.37', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Prepared approved shipped received</p>', '2017-11-03 07:47:10', '2017-11-03 14:44:00', '2108-11-03 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 7, 1, 10, 10, 1074, 1, 968, 1, 1, 1, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`) VALUES
(1, 5, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(148, '2018-01-13 04:27:45', 2, '500000.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.2.2',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 23, 1, 3, '1', '', '', '', '', '2', 'chr(27)+\'p\'+chr(20)+chr(20)', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, NULL, 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.2.2', 0, 0, 0, '', 1, 2, '[\"2\"]', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default'),
(2, 'TEST'),
(3, 'Christmas');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_printers`
--

INSERT INTO `sma_printers` (`id`, `title`, `type`, `profile`, `char_per_line`, `path`, `ip_address`, `port`) VALUES
(2, 'Posiflex PP-7600', 'windows', 'default', 255, 'USB', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`) VALUES
(2553, '8806173433858', 'BEAUTY TOOL BODY SHAVER', 2, '11949.0000', '35000.0000', '20.0000', '', 24, NULL, 'NK0240', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2548, '8806173433919', 'BEAUTY TOOL CUTICLE TRIMMER', 2, '7966.0000', '22000.0000', '20.0000', '', 24, NULL, 'NK0246', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2527, '8806173437399', 'LONGLASTING SMUDGE SHADOW STICK 08 GENTLE COCOA', 2, '55761.0000', '152000.0000', '20.0000', '', 8, NULL, 'NK0596', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2528, '8806173434084', 'BEAUTY TOOL TWEEZERS', 2, '19915.0000', '55000.0000', '20.0000', '', 24, NULL, 'NK0263', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2529, '8806173433797', 'BEAUTY TOOL LIP AND CONCEALER BRUSH', 2, '23898.0000', '65000.0000', '20.0000', '', 24, NULL, 'NK0234', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2530, '8806173435166', 'BEAUTY TOOL EYE SHADOW DUAL BRUSH', 2, '35847.0000', '98000.0000', '20.0000', '', 24, NULL, 'NK0381', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2531, '8806173436132', 'HIMALAYA SALT CLEANSING BALM_PINK SALT', 2, '118691.0000', '320000.0000', '20.0000', '', 7, NULL, 'NK0471', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2532, '8806173435753', 'BYFLOWER TRIPLE MOUSSE TINT 01 RED MOUSSE', 2, '79658.0000', '215000.0000', '20.0000', '', 15, NULL, 'NK0438', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2533, '8806173435760', 'BYFLOWER TRIPLE MOUSSE TINT 02 ORANGE MOUSSE', 2, '79658.0000', '215000.0000', '20.0000', '', 15, NULL, 'NK0439', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2534, '8806173435777', 'BYFLOWER TRIPLE MOUSSE TINT 03 PINK MOUSSE', 2, '79658.0000', '215000.0000', '20.0000', '', 15, NULL, 'NK0440', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2535, '8806173433995', 'MICRO SLIM BROW PENCIL 01 PEANUT BROWN', 2, '55761.0000', '152000.0000', '20.0000', '', 8, NULL, 'NK0254', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2536, '8806173434008', 'MICRO SLIM BROW PENCIL 02 REDBEAN BROWN', 2, '55761.0000', '152000.0000', '20.0000', '', 8, NULL, 'NK0255', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2537, '8806173434015', 'MICRO SLIM BROW PENCIL 03 SOFT BROWN', 2, '55761.0000', '152000.0000', '20.0000', '', 8, NULL, 'NK0256', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2538, '8806173434022', 'MICRO SLIM BROW PENCIL 04 DARK BROWN', 2, '55761.0000', '152000.0000', '20.0000', '', 8, NULL, 'NK0257', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2539, '8806173438198', 'PURE SHINE MELTING TINT 04 NIGHT ROSE', 2, '46999.0000', '128000.0000', '20.0000', '', 15, NULL, 'NK0679', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2540, '8806173437689', 'PURE SHINE LIP ESSENCE SPF15', 2, '35050.0000', '95000.0000', '20.0000', '', 15, NULL, 'NK0626', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2541, '8806173436767', 'PURE SHINE LIPSTICK 11 BLOODY BURGUNDY', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0537', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2542, '8806173434817', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 01 LIGHT BEIGE SPF37PA++', 2, '95590.0000', '258000.0000', '20.0000', '', 9, NULL, 'NK0344', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2543, '8806173434831', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 03 DEEP BEIGE SPF37PA++', 2, '95590.0000', '258000.0000', '20.0000', '', 9, NULL, 'NK0346', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2544, '8806173434848', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 04 SHINING BEAM', 2, '95590.0000', '258000.0000', '20.0000', '', 9, NULL, 'NK0347', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2545, '8806173434855', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 05 CONTOUR BEAM', 2, '95590.0000', '258000.0000', '20.0000', '', 9, NULL, 'NK0348', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2546, '8806173434862', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 06 BABY CORAL', 2, '95590.0000', '258000.0000', '20.0000', '', 9, NULL, 'NK0349', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2547, '8806173434879', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 07 COZY PINK', 2, '95590.0000', '258000.0000', '20.0000', '', 9, NULL, 'NK0350', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2480, '8806173416363', 'BY FLOWER HARD EYELINER 01 BLACK', 2, '46999.0000', '128000.0000', '20.0000', '', 8, NULL, 'NM7695', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2481, '8806173427314', 'BATH & NATURE GREENTEA BODY LOTION', 2, '95590.0000', '258000.0000', '20.0000', '', 6, NULL, 'NL8797', '', '', '', '', '', '54.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2482, '8806173416332', 'ULTRA MASCARA 02 CURLING', 2, '46999.0000', '128000.0000', '20.0000', '7bc048c13435b2dd06ed391e8f94cd4c.jpg', 8, NULL, 'NM7692', '', '', '', '', '', '96.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'ULTRA-MASCARA-02-CURLING', NULL, '0.0000'),
(2483, '8806173420841', 'PROVENCE CREAMY GEL EYELINER 01 BLACK', 2, '63727.0000', '172000.0000', '20.0000', '', 8, NULL, 'NL8145', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2484, '8806173420858', 'PROVENCE CREAMY GEL EYELINER 02 BROWN', 2, '63727.0000', '172000.0000', '20.0000', '', 8, NULL, 'NL8146', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2477, '8806173420735', 'BOTANICAL WATER PROOF EYELINER 02 BROWN', 2, '43812.0000', '118000.0000', '20.0000', '', 8, NULL, 'NL8074', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2151, '8806173431168', 'PURE SHINE COVER CONCEALER 01 LIGHT BEIGE', 2, '43812.0000', '118000.0000', '20.0000', '', 9, NULL, 'NL9207', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2152, '8806173431175', 'PURE SHINE COVER CONCEALER 02 NATURAL BEIGE', 2, '43812.0000', '118000.0000', '20.0000', '', 9, NULL, 'NL9208', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2153, '8806173424368', 'AQUA COLLAGEN SOLUTION HYALURONIC ACID HYDRO GEL MASK', 2, '35847.0000', '98000.0000', '50.0000', '', 16, NULL, 'NL8502', '', '', '', '', '', '400.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2154, '8806173424870', 'BLACKHEAD CLEAR 3-STEP NOSE PACK', 2, '15932.0000', '42000.0000', '100.0000', '', 16, NULL, 'NL8565', '', '', '', '', '', '1000.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2155, '8806173432387', 'BEAUTY TOOL COCOON SILK BALL(10EA)', 2, '27456.0000', '72000.0000', '20.0000', '', 24, NULL, 'NK0090', '', '', '', '', '', '30.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2156, '8806173437214', 'REAL NATURE POMEGRANATE HYDROGEL MASK', 2, '15543.0000', '42000.0000', '50.0000', '', 16, NULL, 'NK0579', '', '', '', '', '', '600.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2157, '8806173425488', 'ARGAN 20º REAL SQUEEZE AMPOULE', 2, '199145.0000', '538000.0000', '20.0000', '', 23, NULL, 'NL8614', '', '', '', '', '', '60.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'argan-20o-real-squeeze-ampoule', NULL, '0.0000'),
(2158, '8806173423552', 'BAMBOO CHARCOAL MUD PACK', 2, '52575.0000', '142000.0000', '50.0000', '', 19, NULL, 'NL8421', '', '', '', '', '', '240.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2159, '8806173417094', 'REAL NATURE CUCUMBER MASK SHEET', 2, '7577.0000', '18000.0000', '100.0000', '', 16, NULL, 'NM7765', '', '', '', '', '', '2000.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2160, '8806173438914', 'SOOTHING & MOISTURE ALOE VERA CLEANSING GEL FOAM', 2, '35050.0000', '95000.0000', '50.0000', '', 7, NULL, 'NK0748', '', '', '', '', '', '360.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2161, '8806173433155', 'FRESH DEODRANT STICK - FLORAL', 2, '61337.0000', '168000.0000', '20.0000', '', 6, NULL, 'NK0169', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2162, '8806173433247', 'PURE SHINE LIPSTICK 02 CREAM ROSE', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0178', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2163, '8806173435234', 'PROVENCE AIR SKIN FIT BB CREAM 01 LIGHT BEIGE SPF35PA++', 2, '102759.0000', '278000.0000', '20.0000', '', 9, NULL, 'NK0388', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2164, '8806173437221', 'REAL NATURE CHAMOMILE HYDROGEL MASK', 2, '15543.0000', '42000.0000', '50.0000', '', 16, NULL, 'NK0580', '', '', '', '', '', '600.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2165, '8806173416264', 'INTENSE TOUCH MASCARA', 2, '95590.0000', '258000.0000', '20.0000', '52c516dfbc131b8d3a4a0c9bd829e118.jpg', 8, NULL, 'NM7685', '', '', '', '', '', '60.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'INTENSE-TOUCH-MASCARA', NULL, '0.0000'),
(2166, '8806173424436', 'SNAIL SOLUTION RED GINSENG HYDRO GEL MASK', 2, '39829.0000', '108000.0000', '50.0000', '', 16, NULL, 'NL8509', '', '', '', '', '', '400.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2167, '8806173420513', 'BATH&NATURE PROVENCE PEACH MOUSSE BODY OIL', 2, '119487.0000', '322000.0000', '20.0000', '', 6, NULL, 'NL8116', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2168, '8806173421633', 'BOTANICAL GREEN TEA PORE POWDER', 2, '63727.0000', '172000.0000', '20.0000', '', 9, NULL, 'NL8224', '', '', '', '', '', '144.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2169, '8806173438723', 'GINSENG ROYAL SILK GOLD MASSAGER', 2, '572983.0000', '1418000.0000', '20.0000', '', 24, NULL, 'NK0729', '', '', '', '', '', '18.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2170, '8806173437245', 'REAL NATURE GREEN TEE HYDROGEL MASK', 2, '15543.0000', '42000.0000', '50.0000', '', 16, NULL, 'NK0582', '', '', '', '', '', '600.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2171, '8806173435951', 'GINSENG ROYAL SILK CAPSULE ESSENCE', 2, '477947.0000', '1288000.0000', '20.0000', '', 23, NULL, 'NK0326', '', '', '', '', '', '64.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2172, '8806173423781', 'SKIN SMOOTHING BODY PEELING MIST-PHYTONCIDE', 2, '52575.0000', '185000.0000', '20.0000', '', 6, NULL, 'NL8444', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2173, '8806173424894', 'BLACKHEAD CLEAR  NOSE PACK(7EA)', 2, '27881.0000', '75000.0000', '50.0000', '', 16, NULL, 'NL8567', '', '', '', '', '', '600.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2174, '8806173435081', 'BEAUTY TOOL NATURAL MILD COTTON WIPE', 2, '7959.0000', '22000.0000', '20.0000', '', 24, NULL, 'NK0371', '', '', '', '', '', '100.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2175, '8806173435173', 'BEAUTY TOOL PERFECT COVER BRUSH', 2, '72732.0000', '215000.0000', '20.0000', '', 24, NULL, 'NK0382', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2176, '8806173431892', 'AQUA COLLAGEN SOLUTION MARINE HYDROGEL EYE CREAM MASK', 2, '23898.0000', '65000.0000', '50.0000', '', 16, NULL, 'NK0048', '', '', '', '', '', '300.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2177, '8806173438273', 'REAL FRESH BROWN SUGAR FACIAL SCRUB MASK', 2, '150554.0000', '408000.0000', '20.0000', '', 19, NULL, 'NK0687', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2178, '8806173424344', 'BAMBOO CHARCOAL BLACK MASK SHEET', 2, '23898.0000', '65000.0000', '50.0000', '', 16, NULL, 'NL8500', '', '', '', '', '', '400.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2179, '8806173425198', 'AQUA COLLAGEN SOLUTION MARINE HYDROGEL EYE PATCH(R)', 2, '19915.0000', '55000.0000', '50.0000', '', 20, NULL, 'NL8585', '', '', '', '', '', '280.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2180, '8806173422074', 'NATURAL BUTTER LIPBALM 04 MANGO', 2, '54964.0000', '150000.0000', '20.0000', '', 15, NULL, 'NL8269', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2181, '8806173424351', 'AQUA COLLAGEN SOLUTION MARINE HYDRO GEL MASK', 2, '35847.0000', '98000.0000', '50.0000', '', 16, NULL, 'NL8501', '', '', '', '', '', '400.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2182, '8806173426454', 'REAL NATURE HONEY ESSENCE', 2, '99573.0000', '270000.0000', '20.0000', '', 23, NULL, 'NL8712', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2183, '8806173422203', 'CREAMY LIPSTICK 07 IT\'S MY PINK(R)', 2, '95590.0000', '258000.0000', '20.0000', '', 15, NULL, 'NL8282', '', '', '', '', '', '54.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2184, '8806173420889', 'PROVENCE CREAMY GEL EYELINER 05 BURGUNDY', 2, '63727.0000', '172000.0000', '20.0000', '', 8, NULL, 'NL8149', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2185, '8806173435128', 'BEAUTY TOOL NATURAL WATER JET COTTON', 2, '19896.0000', '55000.0000', '20.0000', '', 24, NULL, 'NK0377', '', '', '', '', '', '100.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2186, '8806173435142', 'BEAUTY TOOL COTTON SWAB 300PCS', 2, '7959.0000', '22000.0000', '50.0000', '', 24, NULL, 'NK0379', '', '', '', '', '', '400.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2187, '8806173419036', 'BYFLOWER TRIPLE VOLUME TINT 05 CAMELLIA', 2, '79658.0000', '215000.0000', '20.0000', '', 15, NULL, 'NM7963', '', '', '', '', '', '54.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2188, '8806173426324', 'PROVENCE ALL IN ONE DUAL STRETCH MASCARA', 2, '143385.0000', '388000.0000', '20.0000', '', 8, NULL, 'NL8698', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2189, '8806173437405', 'GINSENG ROYAL SILK MASCARA & FIXER', 2, '183213.0000', '495000.0000', '20.0000', '', 8, NULL, 'NK0601', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2190, '8806173434909', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 10 ALMOND', 2, '95590.0000', '258000.0000', '20.0000', '', 9, NULL, 'NK0353', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2191, '8806173433438', 'GLITTER LINER 03 COCKTAIL PINK', 2, '55761.0000', '152000.0000', '20.0000', '', 8, NULL, 'NK0197', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2192, '8806173417018', 'REAL NATURE SHEA BUTTER MASK SHEET', 2, '7577.0000', '18000.0000', '500.0000', '', 16, NULL, 'NM7757', '', '', '', '', '', '2400.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2193, '8806173425211', 'SNAIL SOLUTION HYDROGEL EYE PATCH', 2, '23898.0000', '65000.0000', '50.0000', '', 20, NULL, 'NL8587', '', '', '', '', '', '280.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2194, '8806173424887', 'BLACKHEAD CLEAR  NOSE PACK(1EA)', 2, '3983.0000', '18000.0000', '100.0000', '', 16, NULL, 'NL8566', '', '', '', '', '', '1500.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2195, '8806173416219', 'SOOTHING & MOISTURE ALOE VERA 80% EMULSION', 2, '70099.0000', '190000.0000', '20.0000', '', 23, NULL, 'NM7677', '', '', '', '', '', '180.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2196, '8806173430673', 'BEAUTY TOOL PORE CLEASING BRUSH', 2, '181828.0000', '538000.0000', '20.0000', '', 24, NULL, 'NL9135', '', '', '', '', '', '20.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2197, '8806173432370', 'BEAUTY TOOL COCOON SILK BALL(20EA)', 2, '43770.0000', '118000.0000', '20.0000', '', 24, NULL, 'NK0089', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2198, '8806173432615', 'CREAMY LIPSTICK 11 DRY ROSE', 2, '95590.0000', '258000.0000', '20.0000', '', 15, NULL, 'NK0114', '', '', '', '', '', '45.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2199, '8806173437061', 'BYFLOWER TRIPLE MOUSSE TINT 05 BRICK RED MOUSSE', 2, '79658.0000', '215000.0000', '20.0000', '', 15, NULL, 'NK0567', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2200, '8806173433445', 'BOTANICAL CAKE EYEBROW 01 KHAKI GRAY/DARK BROWN', 2, '61337.0000', '168000.0000', '20.0000', '', 8, NULL, 'NK0198', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2201, '8806173441990', 'SOOTHING & MOISTURE ALOE VERA 92% SOOTHING GEL(TUBE)', 2, '39033.0000', '102000.0000', '50.0000', '', 6, NULL, 'NJ1062', '', '', '', '', '', '640.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2202, '8806173436026', 'GINSENG ROYAL SILK POWDER 01PURE BEIGE SPF26,PA+', 2, '262871.0000', '708000.0000', '20.0000', '', 9, NULL, 'NK0461', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2203, '8806173420193', 'PROVENCE MARBLE HIGHLIGHTER 01 BLOOM PEACH', 2, '134622.0000', '365000.0000', '20.0000', '', 9, NULL, 'NL8069', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2204, '8806173439652', 'SOOTHING & MOISTURE CACTUS 92% SOOTHING GEL', 2, '61337.0000', '160000.0000', '50.0000', '', 6, NULL, 'NK0822', '', '', '', '', '', '600.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2205, '8806173425815', 'COCONUT BIO SKIN MASK [REVITAL]', 2, '23898.0000', '65000.0000', '50.0000', '', 16, NULL, 'NL8647', '', '', '', '', '', '400.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2206, '8806173428434', 'BEAUTY TOOL POWDER BRUSH', 2, '87278.0000', '258000.0000', '20.0000', '', 24, NULL, 'NL8909', '', '', '', '', '', '20.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2207, '8806173420377', 'SOOTHING & MOISTURE ALOE VERA 92% SOOTHING GEL', 2, '35050.0000', '98000.0000', '2000.0000', '', 6, NULL, 'NL8084', '', '', '', '', '', '20394.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'SOOTHING-MOISTURE-ALOE-VERA-92-SOOTHING-GEL', NULL, '0.0000'),
(2208, '8806173416929', 'REAL NATURE ROYAL JELLY MASK SHEET', 2, '7577.0000', '18000.0000', '500.0000', '', 16, NULL, 'NM7748', '', '', '', '', '', '2000.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2209, '8806173416974', 'REAL NATURE TOMATO MASK SHEET', 2, '7577.0000', '18000.0000', '500.0000', '', 16, NULL, 'NM7753', '', '', '', '', '', '2000.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2210, '8806173417025', 'REAL NATURE OLIVE MASK SHEET', 2, '7577.0000', '18000.0000', '500.0000', '', 16, NULL, 'NM7758', '', '', '', '', '', '2400.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2211, '8806173417049', 'REAL NATURE ORANGE MASK SHEET', 2, '7577.0000', '18000.0000', '500.0000', '', 16, NULL, 'NM7760', '', '', '', '', '', '2000.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2212, '8806173417063', 'REAL NATURE ROSE MASK SHEET', 2, '7577.0000', '18000.0000', '500.0000', '', 16, NULL, 'NM7762', '', '', '', '', '', '2000.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2213, '8806173417100', 'REAL NATURE TEA TREE MASK SHEET', 2, '7577.0000', '18000.0000', '500.0000', '', 16, NULL, 'NM7766', '', '', '', '', '', '2000.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2214, '8806173424160', 'REAL SQUEEZE ALOE VERA EMULSION', 2, '118691.0000', '320000.0000', '20.0000', '', 23, NULL, 'NL8484', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2215, '8806173419739', 'ECO LIPGLOSS 01LATTE', 2, '61337.0000', '168000.0000', '20.0000', '', 15, NULL, 'NL8033', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2216, '8806173432776', 'BEAUTY TOOL SPRAY TYPE CONTAINER', 2, '15932.0000', '45000.0000', '20.0000', '', 24, NULL, 'NK0131', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2217, '8806173432912', 'PURE SHINE JELLY FIT TINT 01 THE HOT PINK', 2, '46999.0000', '128000.0000', '20.0000', '', 15, NULL, 'NK0146', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2218, '8806173432936', 'PURE SHINE JELLY FIT TINT 03 PLUMPING BERRY', 2, '46999.0000', '128000.0000', '20.0000', '', 15, NULL, 'NK0148', '', '', '', '', '', '84.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2219, '8806173420308', 'ARGAN ESSENTIAL DEEP CARE HAIR ESSENCE', 2, '59744.0000', '162000.0000', '20.0000', '', 13, NULL, 'NL8077', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2220, '8806173422371', 'SUPER AQUA MAX WATERY TONER (RR)', 2, '110725.0000', '300000.0000', '20.0000', '', 23, NULL, 'NL8298', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2221, '8806173422395', 'SUPER AQUA MAX WATERY ESSENCE(RR)', 2, '126656.0000', '342000.0000', '20.0000', '', 23, NULL, 'NL8300', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2222, '8806173420803', 'BOTANICAL SIMPLE MAKING GEL EYELINER 1 BLACK', 2, '67710.0000', '185000.0000', '20.0000', '2c6b21e4db0bfd3d2d170bea26698660.jpg', 8, NULL, 'NL8141', '', '', '', '', '', '60.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'BOTANICAL-SIMPLE-MAKING-GEL-EYELINER-1-BLACK', NULL, '0.0000'),
(2223, '8806173426430', 'REAL NATURE OLIVE ESSENCE', 2, '99573.0000', '270000.0000', '20.0000', '', 23, NULL, 'NL8710', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2224, '8806173426447', 'REAL NATURE ROSE ESSENCE', 2, '99573.0000', '270000.0000', '20.0000', '', 23, NULL, 'NL8711', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2225, '8806173427260', 'BATH & NATURE APPLE MANGO BODY LOTION', 2, '95590.0000', '258000.0000', '20.0000', '', 6, NULL, 'NL8793', '', '', '', '', '', '54.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2226, '8806173421596', 'NATURE ORIGIN CC TINTED SPF30 PA++', 2, '111521.0000', '302000.0000', '20.0000', '', 9, NULL, 'NL8220', '', '', '', '', '', '84.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2227, '8806173434282', 'SNAIL SOLUTION EYE CREAM(C)', 2, '262871.0000', '708000.0000', '20.0000', '', 23, NULL, 'NK0291', '', '', '', '', '', '84.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2228, '8806173436903', 'HAND & NATURE ACACIA HAND CREAM', 2, '52575.0000', '142000.0000', '20.0000', '', 14, NULL, 'NK0551', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2229, '8806173433308', 'PURE SHINE LIPSTICK 06 CANDY POP PINK', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0184', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2230, '8806173433315', 'PURE SHINE LIPSTICK 07 CORAL GELATO', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0185', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2231, '8806173433322', 'PURE SHINE LIPSTICK 08 ORANGE BONGBONG', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0186', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2232, '8806173434114', 'BEAUTY TOOL PENCIL SHARPENER', 2, '7966.0000', '22000.0000', '20.0000', '', 24, NULL, 'NK0266', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2233, '8806173435197', 'PROVENCE INTENSIVE AMPOULE MAKE UP BASE 01 MINT SPF30 PA++', 2, '150554.0000', '408000.0000', '20.0000', '', 9, NULL, 'NK0384', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2234, '8806173434367', 'HAWAIIAN DEEP SEA MILD SCRUB FOAM CLEANSER', 2, '70099.0000', '190000.0000', '20.0000', '', 7, NULL, 'NK0303', '', '', '', '', '', '39.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2235, '8806173434930', 'SNAIL SOLUTION WRINKLE UP SPOT', 2, '238974.0000', '645000.0000', '20.0000', '', 23, NULL, 'NK0356', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2236, '8806173440894', 'CALIFORNIA ALOE DAILY SUN BLOCK SPF50+PA++++', 2, '126656.0000', '342000.0000', '20.0000', '', 22, NULL, 'NJ0946', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2237, '8806173440917', 'CALIFORNIA ALOE WATERPROOF SUN BLOCK SPF50+PA++++', 2, '122674.0000', '472000.0000', '20.0000', '', 22, NULL, 'NJ0948', '', '', '', '', '', '80.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2238, '8806173440979', 'CALIFORNIA ALOE SUN LIQUID SPF50+PA++++', 2, '122674.0000', '472000.0000', '20.0000', '', 22, NULL, 'NJ0954', '', '', '', '', '', '80.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2239, '8806173437863', 'VITAMIN B5 TONER', 2, '150554.0000', '408000.0000', '20.0000', '', 23, NULL, 'NK0646', '', '', '', '', '', '64.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2240, '8806173437870', 'VITAMIN B5 EMULSION', 2, '150554.0000', '408000.0000', '20.0000', '', 23, NULL, 'NK0647', '', '', '', '', '', '64.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2241, '8806173437504', 'HAND&NATURE GREENTEA HAND CREAM', 2, '78862.0000', '205000.0000', '20.0000', '', 14, NULL, 'NK0611', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2242, '8806173439607', 'BOTANICAL CREAM CONCEALER 23 NATURAL BEIGE', 2, '61337.0000', '168000.0000', '20.0000', '', 9, NULL, 'NK0821', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2243, '8806173433742', 'SNAIL SOLUTION ESSENCE', 2, '262871.0000', '708000.0000', '20.0000', '', 23, NULL, 'NK0229', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2244, '8806173434404', 'HAWAIIAN DEEP SEA LIP&EYE REMOVER', 2, '62930.0000', '170000.0000', '20.0000', '', 7, NULL, 'NK0307', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2245, '8806173436149', 'HIMALAYA SALT CLEANSING BALM_WHITE SALT', 2, '118691.0000', '320000.0000', '20.0000', '', 7, NULL, 'NK0472', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2246, '8806173433605', 'SMUDGE PROOF EYELINER 02 DEEP BROWN', 2, '75433.0000', '215000.0000', '20.0000', '', 8, NULL, 'NK0214', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2247, '8806173436774', 'PURE SHINE LIPSTICK 12 ORCHID BLOSSOM', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0538', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2248, '8806173433278', 'PURE SHINE LIPSTICK 05 MILKY PINK', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0181', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2249, '8806173440085', 'CITY CARE MARINE WATER CREAM', 2, '134622.0000', '365000.0000', '20.0000', '', 23, NULL, 'NJ0847', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2250, '8806173433520', 'BEAUTY TOOL BLOCK SHADOW TIP', 2, '19915.0000', '55000.0000', '20.0000', '', 24, NULL, 'NK0208', '', '', '', '', '', '30.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2251, '8806173436668', 'HERB BLENDING TONER', 2, '182417.0000', '492000.0000', '20.0000', '', 23, NULL, 'NK0526', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2252, '8806173436675', 'HERB BLENDING EMULSION', 2, '182417.0000', '492000.0000', '20.0000', '', 23, NULL, 'NK0527', '', '', '', '', '', '80.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2253, '8806173436705', 'HERB BLENDING EYE CREAM', 2, '198348.0000', '535000.0000', '20.0000', '', 23, NULL, 'NK0530', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2254, '8806173436064', 'GINSENG ROYAL SILK BOOSTING AMPOULE', 2, '398290.0000', '1075000.0000', '20.0000', '', 23, NULL, 'NK0464', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2255, '8806173441204', 'AFRICA BIRD HOMME ALL IN ONE BRIGHTENING ESSENCE SPF28PA+++', 2, '199145.0000', '538000.0000', '20.0000', '', 11, NULL, 'NJ0978', '', '', '', '', '', '30.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2256, '8806173416981', 'REAL NATURE GREEN TEA MASK SHEET', 2, '7577.0000', '18000.0000', '500.0000', '', 16, NULL, 'NM7754', '', '', '', '', '', '2400.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`) VALUES
(2257, '8806173416998', 'REAL NATURE ALOE MASK SHEET', 2, '7577.0000', '18000.0000', '500.0000', '', 16, NULL, 'NM7755', '', '', '', '', '', '4800.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2258, '8806173417032', 'REAL NATURE BAMBOO MASK SHEET', 2, '7577.0000', '18000.0000', '500.0000', '', 16, NULL, 'NM7759', '', '', '', '', '', '2400.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2259, '8806173422845', 'ARGAN ESSENTIAL HYDRO HAIR ESSENCE', 2, '55761.0000', '152000.0000', '20.0000', '', 13, NULL, 'NL8350', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2260, '8806173419609', 'REAL NATURE CRANBERRY PEELING GEL', 2, '54964.0000', '150000.0000', '20.0000', '', 21, NULL, 'NL8021', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2261, '8806173424450', 'REAL SQUEEZE ALOE VERA MOISTURE FOOT MASK', 2, '27881.0000', '78000.0000', '50.0000', '', 10, NULL, 'NL8511', '', '', '', '', '', '250.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2262, '8806173424665', 'FRESH GREEN TEA 70 TONER', 2, '78862.0000', '215000.0000', '20.0000', '', 23, NULL, 'NL8544', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2263, '8806173425464', 'ARGAN 20º ESSENTIAL TONER', 2, '118691.0000', '320000.0000', '20.0000', '', 23, NULL, 'NL8612', '', '', '', '', '', '72.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'argan-20o-essential-toner', NULL, '0.0000'),
(2264, '8806173427307', 'BATH & NATURE GRAPEFRUIT BODY LOTION', 2, '95590.0000', '258000.0000', '20.0000', '', 6, NULL, 'NL8796', '', '', '', '', '', '54.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2265, '8806173427390', 'WHITE VITA FLORAL EYE BRIGHTNER', 2, '190383.0000', '515000.0000', '20.0000', '', 23, NULL, 'NL8805', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2266, '8806173429196', 'GREEK YOGURT PACK_BLUE BERRY (ANTI-WRINKLE)', 2, '78862.0000', '215000.0000', '20.0000', '', 19, NULL, 'NL8985', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2267, '8806173432530', 'NATURE ORIGIN C.C. CREAM SPF30 PA++ COLOR CHANGE', 2, '111521.0000', '302000.0000', '20.0000', '', 9, NULL, 'NK0106', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2268, '8806173425532', 'COLLAGEN DREAM 70 EMULSION', 2, '166485.0000', '450000.0000', '20.0000', '', 23, NULL, 'NL8619', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2269, '8806173424672', 'FRESH GREEN TEA 70 EMULSION', 2, '78862.0000', '215000.0000', '20.0000', '', 23, NULL, 'NL8545', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2270, '8806173422081', 'NATURAL BUTTER LIPBALM 05 LIME MINT', 2, '54964.0000', '150000.0000', '20.0000', '', 15, NULL, 'NL8270', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2271, '8806173418978', 'ECO CRAYON LIP ROUGE 04 SCARLET ORANGE', 2, '47795.0000', '130000.0000', '20.0000', '', 15, NULL, 'NM7957', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2272, '8806173425600', 'FRESH GREEN TEA FOAM CLEANSER', 2, '61337.0000', '168000.0000', '20.0000', '', 7, NULL, 'NL8626', '', '', '', '', '', '144.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2273, '8806173424979', 'FOREST GARDEN LIP&EYE REMOVER WATERPROOF', 2, '62930.0000', '170000.0000', '20.0000', '', 7, NULL, 'NL8575', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2274, '8806173429202', 'GREEK YOGURT PACK_ORANGE (WHITENING)', 2, '78862.0000', '215000.0000', '20.0000', '', 19, NULL, 'NL8986', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2275, '8806173425358', 'REAL NATURE ARGAN FOAM CLEANSER(R)', 2, '43812.0000', '168000.0000', '20.0000', '', 7, NULL, 'NL8601', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2276, '8806173425372', 'REAL NATURE ROSE FOAM CLEANSER(R)', 2, '43812.0000', '168000.0000', '20.0000', '', 7, NULL, 'NL8603', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2277, '8806173423231', 'GREEN DERMA MILD LOTION', 2, '119487.0000', '322000.0000', '20.0000', '', 23, NULL, 'NL8389', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2278, '8806173419203', 'HONEY&HERB SLEEPING PACK', 2, '61337.0000', '215000.0000', '20.0000', '', 19, NULL, 'NL7980', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2279, '8806173437573', 'YULI FOAM CLEANSER', 2, '159316.0000', '430000.0000', '20.0000', '', 7, NULL, 'NK0618', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2280, '8806173438303', 'FRESH HERB SNAIIL CLEANSING FOAM', 2, '26288.0000', '138000.0000', '20.0000', '', 7, NULL, 'NK0689', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2281, '8806173438327', 'FRESH HERB ACEROLA CLEANSING FOAM', 2, '26288.0000', '138000.0000', '20.0000', '', 7, NULL, 'NK0691', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2282, '8806173436811', 'HAND&NATURE WHITE MUSK HAND CREAM', 2, '52575.0000', '138000.0000', '20.0000', '', 14, NULL, 'NK0542', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2283, '8806173436859', 'HAND&NATURE CHERRY BLOSSOM HAND CREAM', 2, '52575.0000', '138000.0000', '20.0000', '', 14, NULL, 'NK0546', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2284, '8806173436941', 'HAND&NATURE MORINGA HAND CREAM', 2, '52575.0000', '138000.0000', '20.0000', '', 14, NULL, 'NK0556', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2285, '8806173436965', 'HAND&NATURE  ROSE HAND CREAM', 2, '52575.0000', '138000.0000', '20.0000', '', 14, NULL, 'NK0558', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2286, '8806173439041', 'SOOTHING & MOISTURE ALOE VERA FOAM CLEANSER', 2, '35050.0000', '95000.0000', '50.0000', '', 7, NULL, 'NK0761', '', '', '', '', '', '180.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2287, '8806173441211', 'AFRICA BIRD HOMME ALL IN ONE PERFECT FOAM', 2, '95590.0000', '258000.0000', '20.0000', '', 11, NULL, 'NJ0979', '', '', '', '', '', '42.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2288, '8806173435203', 'PROVENCE INTENSIVE AMPOULE MAKE UP BASE 02 LAVENDER SPF30 PA++', 2, '150554.0000', '408000.0000', '20.0000', '', 9, NULL, 'NK0385', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2289, '8806173440955', 'CALIFORNIA ALOE PERFECT SUN BLOCK SPF50+PA++++', 2, '122674.0000', '472000.0000', '20.0000', '', 22, NULL, 'NJ0952', '', '', '', '', '', '80.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2290, '8806173440962', 'CALIFORNIA ALOE AQUA SUN GEL SPF50+PA++++', 2, '100369.0000', '275000.0000', '20.0000', '', 22, NULL, 'NJ0953', '', '', '', '', '', '80.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2291, '8806173437894', 'VITAMIN B5 CREAM', 2, '198348.0000', '535000.0000', '20.0000', '', 23, NULL, 'NK0649', '', '', '', '', '', '64.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2292, '8806173437498', 'HAND&NATURE ROSE HAND CREAM', 2, '78862.0000', '205000.0000', '20.0000', '', 14, NULL, 'NK0610', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2293, '8806173439591', 'BOTANICAL CREAM CONCEALER 21 LIGHT BEIGE', 2, '61337.0000', '168000.0000', '20.0000', '', 9, NULL, 'NK0820', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2294, '8806173436583', 'LOVE ME BUBBLE BODY LOTION-COTTON BABY', 2, '118691.0000', '308000.0000', '20.0000', '', 6, NULL, 'NK0518', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2295, '8806173434824', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 02 NATURAL BEIGE SPF37PA++', 2, '95590.0000', '258000.0000', '20.0000', '', 9, NULL, 'NK0345', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2296, '8806173435180', 'BEAUTY TOOL EYELASH CURLER', 2, '27881.0000', '78000.0000', '20.0000', '', 24, NULL, 'NK0383', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2297, '8806173435227', 'PROVENCE INTENSIVE AMPOULE FOUNDATION 02 NATURAL BEIGE SPF30 PA++', 2, '150554.0000', '408000.0000', '20.0000', '', 9, NULL, 'NK0387', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2298, '8806173436682', 'HERB BLENDING ESSENCE', 2, '198348.0000', '535000.0000', '20.0000', '', 23, NULL, 'NK0528', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2299, '8806173438815', 'ARGAN ESSENTIAL DEEP CARE CONDITIONER', 2, '78862.0000', '215000.0000', '20.0000', '', 13, NULL, 'NK0738', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2300, '8806173433261', 'PURE SHINE LIPSTICK 04 PINK CHOUX CREAM', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0180', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2301, '8806173416967', 'REAL NATURE CHAMOMILE MASK SHEET', 2, '7577.0000', '18000.0000', '500.0000', '', 16, NULL, 'NM7752', '', '', '', '', '', '2000.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2302, '8806173424146', 'REAL SQUEEZE ALOE VERA TONER', 2, '118691.0000', '320000.0000', '20.0000', '', 23, NULL, 'NL8482', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2303, '8806173424153', 'REAL SQUEEZE ALOE VERA ESSENCE', 2, '134622.0000', '365000.0000', '20.0000', '', 23, NULL, 'NL8483', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2304, '8806173419685', 'ECO LIPGLOSS 06RED', 2, '61337.0000', '168000.0000', '20.0000', '', 15, NULL, 'NL8028', '', '', '', '', '', '63.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2305, '8806173419722', 'ECO LIPGLOSS 02PEACH', 2, '61337.0000', '168000.0000', '20.0000', '', 15, NULL, 'NL8032', '', '', '', '', '', '63.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2306, '8806173420162', 'BYFLOWER JEJU JJAMBALM 02 KIWI HONEY BALM', 2, '39033.0000', '108000.0000', '20.0000', '', 15, NULL, 'NL8051', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2307, '8806173425686', 'CALIFORNIA ALOE VERA 74 COOLING EYE SERUM', 2, '86828.0000', '235000.0000', '50.0000', '', 23, NULL, 'NL8643', '', '', '', '', '', '180.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2308, '8806173423576', 'REAL SQUEEZE ALOE VERA SLEEPING PACK', 2, '78862.0000', '215000.0000', '20.0000', '', 19, NULL, 'NL8423', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2309, '8806173424443', 'SNAIL SOLUTION PEARL HYDRO GEL MASK', 2, '39829.0000', '108000.0000', '20.0000', '', 16, NULL, 'NL8510', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2310, '8806173425174', 'BEAUTY TOOL EYELASH 05 FULL VOLUME & WING', 2, '31864.0000', '88000.0000', '20.0000', '', 24, NULL, 'NL8532', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2311, '8806173426591', 'NATURAL OLIVE SCALP COOLING HAIR ESSENCE', 2, '78862.0000', '215000.0000', '20.0000', '', 13, NULL, 'NL8701', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2312, '8806173426379', 'JEJU SPARKLING FOAM CLEANSER', 2, '119487.0000', '322000.0000', '20.0000', '', 7, NULL, 'NL8704', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2313, '8806173427451', 'FOOT & NATURE COCONUT MOISTURE FOOT CREM', 2, '55761.0000', '152000.0000', '20.0000', '', 10, NULL, 'NL8812', '', '', '', '', '', '36.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2314, '8806173430734', 'BEAUTY TOOL NOSE HAIR TRIMMER', 2, '19915.0000', '55000.0000', '20.0000', '', 24, NULL, 'NL9141', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2315, '8806173423354', 'BY FLOWER BLUSHER 04 CANDY ROSE', 2, '55761.0000', '152000.0000', '20.0000', '', 9, NULL, 'NL8405', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2316, '8806173423361', 'BY FLOWER BLUSHER 05 SHY LILAC', 2, '55761.0000', '152000.0000', '20.0000', '', 9, NULL, 'NL8406', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2317, '8806173423385', 'BY FLOWER BLUSHER 07  VANILLA LATTE', 2, '55761.0000', '152000.0000', '20.0000', '', 9, NULL, 'NL8408', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2318, '8806173423392', 'BY FLOWER BLUSHER 08 CINNAMON MOCHA', 2, '55761.0000', '152000.0000', '20.0000', '', 9, NULL, 'NL8409', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2319, '8806173432301', 'BEAUTY TOOL EYE BROW RAZOR(2P)', 2, '15932.0000', '45000.0000', '20.0000', '', 24, NULL, 'NK0082', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2320, '8806173432318', 'BEAUTY TOOL SOFT-TOUCH FLOCKED PUFF (2P)', 2, '15932.0000', '45000.0000', '20.0000', '', 24, NULL, 'NK0083', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2321, '8806173432356', 'BEAUTY TOOL 20 PACKS MAKE UP PUFF (20P)', 2, '27881.0000', '78000.0000', '20.0000', '', 24, NULL, 'NK0087', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2322, '8806173419623', 'BOTANICAL EYEBROW COATING CARA 04 WINE BROWN', 2, '49527.0000', '140000.0000', '20.0000', '', 8, NULL, 'NL8015', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2323, '8806173422067', 'NATURAL BUTTER LIPBALM 03 GRAPEFRUIT', 2, '54964.0000', '150000.0000', '20.0000', '', 15, NULL, 'NL8268', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2324, '8806173418954', 'ECO CRAYON LIP ROUGE 02 BERRY PINK', 2, '47795.0000', '130000.0000', '20.0000', '', 15, NULL, 'NM7955', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2325, '8806173426386', 'REAL NATURE ARGAN OIL', 2, '99573.0000', '270000.0000', '20.0000', '', 23, NULL, 'NL8705', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2326, '8806173426409', 'REAL NATURE OLIVE AMPOULE', 2, '99573.0000', '270000.0000', '20.0000', '', 23, NULL, 'NL8707', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2327, '8806173426416', 'REAL NATURE ROSE AMPOULE', 2, '99573.0000', '270000.0000', '20.0000', '', 23, NULL, 'NL8708', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2328, '8806173426423', 'REAL NATURE HONEY AMPOULE', 2, '99573.0000', '270000.0000', '20.0000', '', 23, NULL, 'NL8709', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2329, '8806173420018', 'GINSENG ROYAL SILK WATERY CREAM', 2, '525742.0000', '1418000.0000', '20.0000', '', 23, NULL, 'NL8088', '', '', '', '', '', '64.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2330, '8806173424924', 'FOREST GARDEN CHAMOMILE CLEANSING OIL', 2, '111521.0000', '302000.0000', '20.0000', '', 7, NULL, 'NL8570', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2331, '8806173424986', 'FOREST GARDEN LIP&EYE REMOVER MILD', 2, '54964.0000', '150000.0000', '20.0000', '', 7, NULL, 'NL8576', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2332, '8806173425617', 'FRESH GREEN TEA BUBBLE DEEP CLEANSER', 2, '70099.0000', '190000.0000', '20.0000', '', 7, NULL, 'NL8627', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2333, '8806173425853', 'GINSENG ROYAL SILK TONER', 2, '302700.0000', '818000.0000', '20.0000', '', 23, NULL, 'NL8651', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2334, '8806173425860', 'GINSENG ROYAL SILK EMULSION', 2, '302700.0000', '818000.0000', '20.0000', '', 23, NULL, 'NL8652', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2335, '8806173421626', 'BOTANICAL GREEN TEA PORE PACT', 2, '79658.0000', '215000.0000', '20.0000', '', 9, NULL, 'NL8223', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2336, '8806173428656', 'BEAUTY TOOL OIL-CONTROL FILM(50 PCS)', 2, '19915.0000', '55000.0000', '20.0000', '', 24, NULL, 'NL8931', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2337, '8806173421572', 'NATURE ORIGIN CC BRIGHTENING SPF30 PA++', 2, '111521.0000', '302000.0000', '20.0000', '', 9, NULL, 'NL8218', '', '', '', '', '', '84.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2338, '8806173436835', 'HAND&NATURE FREESIA HAND CREAM', 2, '52575.0000', '138000.0000', '20.0000', '', 14, NULL, 'NK0544', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2339, '8806173436934', 'HAND&NATURE PEACH HAND CREAM', 2, '52575.0000', '138000.0000', '20.0000', '', 14, NULL, 'NK0555', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2340, '8806173437368', 'CRYSTAL EYE TINT 07 LOVE MAPLE', 2, '71693.0000', '195000.0000', '20.0000', '', 8, NULL, 'NK0599', '', '', '', '', '', '63.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2341, '8806173433339', 'PURE SHINE LIPSTICK 09 SCARLET RED', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0187', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2342, '8806173437641', 'HAND&NATURE PEACH HAND CREAM', 2, '78862.0000', '205000.0000', '20.0000', '', 14, NULL, 'NK0609', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2343, '8806173434145', 'LONGLASTING SMUDGE SHADOW STICK 02 LILAC TOUCH', 2, '53337.0000', '152000.0000', '20.0000', '', 8, NULL, 'NK0269', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2344, '8806173433902', 'BEAUTY TOOL WATERPROOF HAIR CAP', 2, '19915.0000', '55000.0000', '20.0000', '', 24, NULL, 'NK0245', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2345, '8806173441631', 'REAL MATTE LIPSTICK 02 BRICK ORANGE', 2, '119487.0000', '322000.0000', '20.0000', '', 15, NULL, 'NJ1020', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2346, '8806173433803', 'BEAUTY TOOL PACK BRUSH-SOFT TYPE', 2, '14339.0000', '40000.0000', '20.0000', '', 24, NULL, 'NK0235', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2347, '8806173437887', 'VITAMIN B5 ESSENCE', 2, '198348.0000', '535000.0000', '20.0000', '', 23, NULL, 'NK0648', '', '', '', '', '', '64.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2348, '8806173435159', 'BEAUTY TOOL EYEBROW DUAL BRUSH', 2, '31864.0000', '88000.0000', '20.0000', '', 24, NULL, 'NK0380', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2349, '8806173435302', 'BEAUTY TOOL HAIR BRUSH', 2, '71693.0000', '195000.0000', '20.0000', '', 24, NULL, 'NK0401', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2350, '8806173433827', 'BEAUTY TOOL NAIL REMOVER BOTTLE', 2, '23898.0000', '65000.0000', '20.0000', '', 24, NULL, 'NK0237', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2351, '8806173436590', 'LOVE ME BUBBLE BATH & SHOWER GEL-FLORAL BOUQUET', 2, '118691.0000', '308000.0000', '20.0000', '', 6, NULL, 'NK0519', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2352, '8806173436606', 'LOVE ME BUBBLE BODY LOTION-FLORAL BOUQUET', 2, '118691.0000', '308000.0000', '20.0000', '', 6, NULL, 'NK0520', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2353, '8806173436613', 'LOVE ME BUBBLE BATH & SHOWER GEL-BERGAMOT CITRUS', 2, '118691.0000', '308000.0000', '20.0000', '', 6, NULL, 'NK0521', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2354, '8806173434633', 'BOTANICAL CUSHION BLUSHER 02 APRICOT', 2, '86828.0000', '235000.0000', '20.0000', '', 9, NULL, 'NK0205', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2355, '8806173433230', 'PURE SHINE LIPSTICK 01 SHY BEIGE', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0177', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2356, '8806173433759', 'BEAUTY TOOL SCREW BRUSH', 2, '14339.0000', '40000.0000', '20.0000', '', 24, NULL, 'NK0230', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2357, '8806173433957', 'BEAUTY TOOL SOFT-TOUCH POWDER PUFF', 2, '14339.0000', '40000.0000', '20.0000', '', 24, NULL, 'NK0250', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2358, '8806173433964', 'BEAUTY TOOL ELASTIC CARRON PUFF', 2, '11949.0000', '35000.0000', '20.0000', '', 24, NULL, 'NK0251', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2359, '8806173435982', 'NATURE ORIGIN PRIMER 01 STROBING SPF30,PA++', 2, '126656.0000', '342000.0000', '20.0000', '', 9, NULL, 'NK0283', '', '', '', '', '', '42.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2360, '8806173435999', 'NATURE ORIGIN PRIMER 02 TONE-UP SPF30,PA++', 2, '126656.0000', '342000.0000', '20.0000', '', 9, NULL, 'NK0284', '', '', '', '', '', '42.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2361, '8806173434107', 'BEAUTY TOOL PRECISION ELLIPSE PUFF 2P', 2, '11949.0000', '35000.0000', '20.0000', '', 24, NULL, 'NK0265', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2362, '8806173435616', 'PROVENCE INTENSIVE AMPOULE BB CREAM 02 NATURAL BEIGE SPF30 PA++', 2, '150554.0000', '408000.0000', '20.0000', '', 9, NULL, 'NK0287', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2363, '8806173436002', 'NATURE ORIGIN PRIMER 03 HYDRATING', 2, '126656.0000', '342000.0000', '20.0000', '', 9, NULL, 'NK0285', '', '', '', '', '', '42.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2364, '8806173434091', 'BEAUTY TOOL PRECISION DIAMOND PUFF 4P', 2, '14339.0000', '40000.0000', '20.0000', '', 24, NULL, 'NK0264', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2365, '8806173436477', 'PURE SHINE NATURAL CUSHION 01 LIGHT BEIGE SPF50+ PA+++', 2, '78862.0000', '215000.0000', '20.0000', '', 9, NULL, 'NK0507', '', '', '', '', '', '80.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2366, '8806173436484', 'PURE SHINE NATURAL CUSHION 02 NATURAL BEIGE SPF50+ PA+++', 2, '78862.0000', '215000.0000', '20.0000', '', 9, NULL, 'NK0508', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2367, '8806173438822', 'ARGAN ESSENTIAL DEEP CARE HAIR PACK', 2, '70099.0000', '182000.0000', '20.0000', '', 13, NULL, 'NK0739', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2368, '8806173435241', 'PROVENCE AIR SKIN FIT BB CREAM 02 NATURAL BEIGE SPF35PA++', 2, '102759.0000', '278000.0000', '20.0000', '', 9, NULL, 'NK0389', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2369, '8806173439119', 'JEJU SPARKLING CLEANSING WATER', 2, '119487.0000', '322000.0000', '20.0000', '', 7, NULL, 'NK0768', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2370, '8806173434886', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 08 PASTEL PINK', 2, '95590.0000', '258000.0000', '20.0000', '', 9, NULL, 'NK0351', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2371, '8806173434893', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 09 LADY TANGERINE', 2, '95590.0000', '258000.0000', '20.0000', '', 9, NULL, 'NK0352', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2372, '8806173433674', 'BEAUTY TOOL EMERY BOARD (R)', 2, '7966.0000', '22000.0000', '20.0000', '', 24, NULL, 'NK0221', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2373, '8806173437818', 'REAL SQUEEZE ALOE VERA PEEL OFF PACK', 2, '78862.0000', '215000.0000', '50.0000', '', 19, NULL, 'NK0639', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2374, '8806173435210', 'PROVENCE INTENSIVE AMPOULE FOUNDATION 01 LIGHT BEIGE SPF30 PA++', 2, '150554.0000', '408000.0000', '20.0000', '', 9, NULL, 'NK0386', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2375, '8806173433698', 'BEAUTY TOOL BUBBLE FACE', 2, '15932.0000', '45000.0000', '20.0000', '', 24, NULL, 'NK0223', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2376, '8806173433926', 'BEAUTY TOOL BLEMISH EXTRACTOR', 2, '23898.0000', '65000.0000', '20.0000', '', 24, NULL, 'NK0247', '', '', '', '', '', '45.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2377, '8806173434213', 'REAL NATURE GREEN TEA CLEANSING CREAM', 2, '78862.0000', '215000.0000', '20.0000', '', 7, NULL, 'NK0281', '', '', '', '', '', '84.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2378, '8806173434220', 'REAL NATURE OLIVE CLEANSING CREAM', 2, '78862.0000', '215000.0000', '20.0000', '', 7, NULL, 'NK0282', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2379, '8806173436699', 'HERB BLENDING CREAM', 2, '214280.0000', '578000.0000', '20.0000', '', 23, NULL, 'NK0529', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2380, '8806173434381', 'HAWAIIAN DEEP SEA CLEANSING OIL TO FOAM', 2, '86828.0000', '235000.0000', '20.0000', '', 7, NULL, 'NK0305', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2381, '8806173436033', 'GINSENG ROYAL SILK PRIMER', 2, '238974.0000', '645000.0000', '20.0000', '', 9, NULL, 'NK0276', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2382, '8806173419395', 'GREEN DERMA MILD FOAM CLEANSER', 2, '79658.0000', '215000.0000', '20.0000', '', 7, NULL, 'NL7999', '', '', '', '', '', '84.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2383, '8806173424412', 'SNAIL SOLUTION HYDROGEL MASK', 2, '39829.0000', '108000.0000', '20.0000', '', 16, NULL, 'NL8507', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2384, '8806173412334', 'JEJU SPARKLING FOAM CLEANSER', 2, '78862.0000', '215000.0000', '20.0000', '1c9cb5bd06905e5bb6d87a2313a7b1ab.jpg', 7, NULL, 'NM7287', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'JEJU-SPARKLING-FOAM-CLEANSER', NULL, '0.0000'),
(2385, '8806173427321', 'BATH & NATURE PEACH BODY LOTION', 2, '95590.0000', '258000.0000', '20.0000', '', 6, NULL, 'NL8798', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2386, '8806173429424', 'BEAUTY TOOL NATURAL JELLY CLEANSING PUFF-CHARCOAL', 2, '27881.0000', '78000.0000', '20.0000', '', 24, NULL, 'NL9008', '', '', '', '', '', '100.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2387, '8806173432059', 'GINSENG ROYAL SILK FOAM CLEANSER', 2, '159316.0000', '430000.0000', '20.0000', '', 7, NULL, 'NK0065', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2388, '8806173423798', 'SKIN SMOOTHING BODY PEELING MIST-COTTON', 2, '52575.0000', '142000.0000', '20.0000', '', 6, NULL, 'NL8445', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2389, '8806173425976', 'SNAIL SOLUTION FOAM CLEANSER(RRR)', 2, '102759.0000', '278000.0000', '20.0000', '', 7, NULL, 'NL8663', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2390, '8806173420315', 'ARGAN ESSENTIAL MOIST HAIR MIST', 2, '61337.0000', '168000.0000', '20.0000', '', 13, NULL, 'NL8083', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2391, '8806173423804', 'SKIN SMOOTHING BODY PEELING MIST-PEACH', 2, '52575.0000', '142000.0000', '20.0000', '', 6, NULL, 'NL8446', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2392, '8806173422715', 'SNAIL SOLUTION BB CREAM SPF30 PA++ 02', 2, '199145.0000', '538000.0000', '20.0000', '', 9, NULL, 'NL8333', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2393, '8806173419678', 'JEJU SPARKLING MUD FOAM CLEANSER', 2, '61337.0000', '215000.0000', '20.0000', '', 7, NULL, 'NL8027', '', '', '', '', '', '84.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`) VALUES
(2394, '8806173424900', 'FOREST GARDEN ARGAN CLEANSING OIL', 2, '111521.0000', '302000.0000', '20.0000', '', 7, NULL, 'NL8568', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2395, '8806173424917', 'FOREST GARDEN OLIVE CLEANSING OIL', 2, '111521.0000', '302000.0000', '20.0000', '', 7, NULL, 'NL8569', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2396, '8806173419562', 'HONEY&HERB CLEANSING CREAM', 2, '52575.0000', '215000.0000', '20.0000', '', 7, NULL, 'NL8017', '', '', '', '', '', '84.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2397, '8806173425365', 'REAL NATURE OLIVE FOAM CLEANSER(R)', 2, '43812.0000', '168000.0000', '20.0000', '', 7, NULL, 'NL8602', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2398, '8806173420032', 'JEJU SPARKLING MUD CLEANSING CREAM', 2, '78862.0000', '258000.0000', '20.0000', '', 7, NULL, 'NL8090', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2399, '8806173424252', 'REAL SQUEEZE ALOE VERA MOISTURE HAND MASK', 2, '23898.0000', '62000.0000', '50.0000', '', 14, NULL, 'NL8491', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2400, '8806173438297', 'FRESH HERB ALOE CLEANSING FOAM', 2, '26288.0000', '138000.0000', '50.0000', '', 7, NULL, 'NK0688', '', '', '', '', '', '180.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2401, '8806173438310', 'FRESH HERB PEACH CLEANSING FOAM', 2, '26288.0000', '138000.0000', '20.0000', '', 7, NULL, 'NK0690', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2402, '8806173436866', 'HAND&NATURE JASMINE HAND CREAM', 2, '52575.0000', '138000.0000', '20.0000', '', 14, NULL, 'NK0547', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2403, '8806173436972', 'HAND&NATURE LIME HAND CREAM', 2, '52575.0000', '138000.0000', '20.0000', '', 14, NULL, 'NK0559', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2404, '8806173438457', 'BEAUTY TOOL AIR PUFF (2P)', 2, '33280.0000', '88000.0000', '20.0000', '', 24, NULL, 'NK0702', '', '', '', '', '', '30.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2405, '8806173440665', 'PURE BUD RELIEF FOAM CLEANSER(FOR DRY SKIN)', 2, '54964.0000', '150000.0000', '20.0000', '', 7, NULL, 'NJ0924', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2406, '8806173434947', 'PROVENCE AIR SKIN FIT MAKEUP BASE 01 PINK SPF30PA++', 2, '102759.0000', '278000.0000', '20.0000', '', 9, NULL, 'NK0357', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2407, '8806173439072', 'SOOTHING & MOISTURE ALOE VERA CLEANSING GEL CREAM', 2, '35050.0000', '95000.0000', '20.0000', '', 7, NULL, 'NK0764', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2408, '8806173440931', 'CALIFORNIA ALOE MILD SUN BLOCK SPF35PA++', 2, '67320.0000', '365000.0000', '20.0000', '', 22, NULL, 'NJ0950', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2409, '8806173433360', 'REAL SQUEEZE ALOE VERA AIR MIST', 2, '95590.0000', '258000.0000', '20.0000', '', 23, NULL, 'NK0190', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2410, '8806173439669', 'PRO TOUCH FLOWER BRUSH', 2, '87278.0000', '258000.0000', '20.0000', '', 24, NULL, 'NK0823', '', '', '', '', '', '30.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2411, '8806173434206', 'REAL NATURE ALOE CLEANSING CREAM', 2, '78862.0000', '215000.0000', '20.0000', '', 7, NULL, 'NK0275', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2412, '8806173436620', 'LOVE ME BUBBLE BODY LOTION-BERGAMOT CITRUS', 2, '118691.0000', '308000.0000', '20.0000', '', 6, NULL, 'NK0522', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2413, '8806173440078', 'CITY CARE MARINE WATER TONER', 2, '118691.0000', '320000.0000', '20.0000', '', 23, NULL, 'NJ0846', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2414, '8806173437795', 'SNAIL SOLUTION CREAM(C)(R)', 2, '262871.0000', '708000.0000', '20.0000', '', 23, NULL, 'NK0637', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2415, '8806173440689', 'PURE BUD RELIEF FOAM CLEANSER(FOR ALL SKIN TYPES)', 2, '54964.0000', '150000.0000', '20.0000', '', 7, NULL, 'NJ0925', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2416, '8806173440696', 'PURE BUD RELIEF FOAM CLEANSER(FOR OILY SKIN)', 2, '54964.0000', '150000.0000', '20.0000', '', 7, NULL, 'NJ0926', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2417, '8806173434299', 'SNAIL SOLUTION AMPOULE(RR)(C)', 2, '238974.0000', '645000.0000', '20.0000', '', 23, NULL, 'NK0292', '', '', '', '', '', '80.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2418, '8806173433421', 'GLITTER LINER 02 GOLDEN FANTASY', 2, '53337.0000', '152000.0000', '20.0000', '', 8, NULL, 'NK0196', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2419, '8806173433735', 'SNAIL SOLUTION EMULSION(C)', 2, '199145.0000', '538000.0000', '20.0000', '', 23, NULL, 'NK0228', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2420, '8806173438808', 'ARGAN ESSENTIAL DEEP CARE SHAMPOO', 2, '78862.0000', '215000.0000', '20.0000', '', 13, NULL, 'NK0737', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2421, '8806173416288', 'WATERPROOF MIRACLE MASCARA', 2, '91434.0000', '258000.0000', '20.0000', 'ec9917e94039a1540869ddcf387f861e.jpg', 8, NULL, 'NM7687', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'WATERPROOF-MIRACLE-MASCARA', NULL, '0.0000'),
(2422, '8806173419524', 'BOTANICAL EYEBROW COATING CARA 01 BROWN', 2, '49527.0000', '140000.0000', '20.0000', '', 8, NULL, 'NL8012', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2423, '8806173419531', 'BOTANICAL EYEBROW COATING CARA 02 LIGHT BROWN', 2, '49527.0000', '140000.0000', '20.0000', '', 8, NULL, 'NL8013', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2424, '8806173419548', 'BOTANICAL EYEBROW COATING CARA 03 GOLD BROWN', 2, '49527.0000', '140000.0000', '20.0000', '', 8, NULL, 'NL8014', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2425, '8806173419692', 'ECO LIPGLOSS 05ROSE', 2, '61337.0000', '168000.0000', '20.0000', '', 15, NULL, 'NL8029', '', '', '', '', '', '63.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2426, '8806173419708', 'ECO LIPGLOSS 04PINK', 2, '61337.0000', '168000.0000', '20.0000', '', 15, NULL, 'NL8030', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2427, '8806173419715', 'ECO LIPGLOSS 03CHERRY', 2, '61337.0000', '168000.0000', '20.0000', '', 15, NULL, 'NL8031', '', '', '', '', '', '45.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2428, '8806173416370', 'BY FLOWER HARD EYELINER 02 BROWN', 2, '44955.0000', '128000.0000', '20.0000', '', 8, NULL, 'NM7696', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2429, '8806173416400', 'BOTANICAL SKINNY AUTO EYELINER 02 BROWN', 2, '60194.0000', '170000.0000', '20.0000', 'a2b9cf472ef0756d3299e1642766245f.jpg', 8, NULL, 'NM7699', '', '', '', '', '', '60.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'BOTANICAL-SKINNY-AUTO-EYELINER-02-BROWN', NULL, '0.0000'),
(2430, '8806173422838', 'ARGAN ESSENTIAL OIL HAIR MIST', 2, '61337.0000', '168000.0000', '20.0000', '', 13, NULL, 'NL8349', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2431, '8806173424627', 'BEAUTY TOOL EYELASH 01 NATURAL & STRAIGHT', 2, '19915.0000', '55000.0000', '20.0000', '', 24, NULL, 'NL8528', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2432, '8806173425143', 'BEAUTY TOOL EYELASH 02 NATURAL & BROWN', 2, '23898.0000', '65000.0000', '20.0000', '', 24, NULL, 'NL8529', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2433, '8806173425150', 'BEAUTY TOOL EYELASH 03 FULL VOLUME & X-CURL', 2, '19915.0000', '55000.0000', '20.0000', '', 24, NULL, 'NL8530', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2434, '8806173425167', 'BEAUTY TOOL EYELASH 04 INDIVIDUAL EYELASHES (8mm)', 2, '19915.0000', '55000.0000', '20.0000', '', 24, NULL, 'NL8531', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2435, '8806173425181', 'BEAUTY TOOL EYELASH 06 UNDER LASH', 2, '31864.0000', '88000.0000', '20.0000', '', 24, NULL, 'NL8533', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2436, '8806173425471', 'ARGAN 20º STEAM EMULSION', 2, '118691.0000', '320000.0000', '20.0000', '', 23, NULL, 'NL8613', '', '', '', '', '', '60.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'argan-20o-steam-emulsion', NULL, '0.0000'),
(2437, '8806173428397', 'BEATY TOOL DOUBLE EYELID LIQUID GLUE(2)', 2, '15932.0000', '45000.0000', '20.0000', '', 24, NULL, 'NL8905', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2438, '8806173428427', 'BEAUTY TOOL CHEEK BRUSH', 2, '71693.0000', '195000.0000', '20.0000', '', 24, NULL, 'NL8908', '', '', '', '', '', '30.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2439, '8806173430642', 'BEAUTY TOOL BLENDING BRUSH', 2, '39829.0000', '108000.0000', '20.0000', '', 24, NULL, 'NL9132', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2440, '8806173430741', 'BEAUTY TOOL NAIL BUFFER', 2, '15932.0000', '45000.0000', '20.0000', '', 24, NULL, 'NL9142', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2441, '8806173430789', 'BEAUTY TOOL NATURAL JELLY BODY SPONGE', 2, '55761.0000', '152000.0000', '20.0000', '', 24, NULL, 'NL9146', '', '', '', '', '', '36.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2442, '8806173430826', 'BEAUTY TOOL NAIL CLIPPER (BIG)', 2, '23898.0000', '65000.0000', '20.0000', '', 24, NULL, 'NL9166', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2443, '8806173430260', 'KISS MY LIP OIL 01 SWEET HONEY', 2, '78862.0000', '215000.0000', '20.0000', '', 15, NULL, 'NL9093', '', '', '', '', '', '45.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2444, '8806173430277', 'KISS MY LIP OIL 02 RASPBERRY', 2, '78862.0000', '215000.0000', '20.0000', '', 15, NULL, 'NL9094', '', '', '', '', '', '54.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2445, '8806173430314', 'BEAUTY TOOL NATURAL JELLY CLEANSING PUFF-GREEN CLAY', 2, '27881.0000', '78000.0000', '20.0000', '', 24, NULL, 'NL9098', '', '', '', '', '', '100.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2446, '8806173423323', 'BY FLOWER BLUSHER 01 PINK BLOSSOM', 2, '55761.0000', '152000.0000', '20.0000', '', 9, NULL, 'NL8402', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2447, '8806173423330', 'BY FLOWER BLUSHER 02 CORAL BLOSSOM', 2, '55761.0000', '152000.0000', '20.0000', '', 9, NULL, 'NL8403', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2448, '8806173423347', 'BY FLOWER BLUSHER 03 GRAPEFRUIT COTTON CANDY', 2, '55761.0000', '152000.0000', '20.0000', '', 9, NULL, 'NL8404', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2449, '8806173423378', 'BY FLOWER BLUSHER 06 STARLIGHT', 2, '55761.0000', '152000.0000', '20.0000', '', 9, NULL, 'NL8407', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2450, '8806173432288', 'BEAUTY TOOL EYELID LIQUID GLUE', 2, '23898.0000', '65000.0000', '20.0000', '', 24, NULL, 'NK0080', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2451, '8806173432349', 'BEAUTY TOOL FOUNTAIN PEN TYPE LIP BRUSH', 2, '23898.0000', '65000.0000', '20.0000', '', 24, NULL, 'NK0086', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2452, '8806173430659', 'BEAUTY TOOL MINI BLUSHER BRUSH', 2, '35847.0000', '98000.0000', '20.0000', '', 24, NULL, 'NL9133', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2453, '8806173430680', 'BEAUTY TOOL MULTI 4WAY BRUSH', 2, '71693.0000', '195000.0000', '20.0000', '', 24, NULL, 'NL9136', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2454, '8806173430758', 'BEAUTY TOOL NAIL FILE', 2, '11949.0000', '35000.0000', '20.0000', '', 24, NULL, 'NL9143', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2455, '8806173432486', 'SWEET JELLY GLOSS 06 CHUING BERRY', 2, '26288.0000', '72000.0000', '20.0000', '', 15, NULL, 'NK0104', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2456, '8806173432295', 'BEAUTY TOOL EYE BROW RAZOR(FOLDABLE)(2P)', 2, '18626.0000', '55000.0000', '20.0000', '', 24, NULL, 'NK0081', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2457, '8806173432332', 'BEAUTY TOOL EYE SHADOW MEDIUM BRUSH', 2, '31864.0000', '88000.0000', '20.0000', '', 24, NULL, 'NK0085', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2458, '8806173432752', 'BEAUTY TOOL CREAM CONTAINER(2P)', 2, '11949.0000', '35000.0000', '20.0000', '', 24, NULL, 'NK0129', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2459, '8806173432769', 'BEAUTY TOOL SKIN & LOTION CONTAINER(2P)', 2, '14339.0000', '40000.0000', '20.0000', '', 24, NULL, 'NK0130', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2460, '8806173432783', 'BEAUTY TOOL PUMP BOTTLE', 2, '15932.0000', '45000.0000', '20.0000', '', 24, NULL, 'NK0132', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2461, '8806173422289', 'REAL GEL TINT 01 RED', 2, '35050.0000', '95000.0000', '20.0000', '', 15, NULL, 'NL8290', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2462, '8806173422296', 'REAL GEL TINT 02 PINK', 2, '35050.0000', '95000.0000', '20.0000', '', 15, NULL, 'NL8291', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2463, '8806173422302', 'REAL GEL TINT 03 ORANGE', 2, '35050.0000', '95000.0000', '20.0000', '', 15, NULL, 'NL8292', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2464, '8806173422043', 'NATURAL BUTTER LIPBALM 01 CHERRY', 2, '54964.0000', '150000.0000', '20.0000', '', 15, NULL, 'NL8266', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2465, '8806173422050', 'NATURAL BUTTER LIPBALM 02 STRAWBERRY', 2, '54964.0000', '150000.0000', '20.0000', '', 15, NULL, 'NL8267', '', '', '', '', '', '72.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2466, '8806173418947', 'ECO CRAYON LIP ROUGE 01 CANDY PINK', 2, '47795.0000', '130000.0000', '20.0000', '', 15, NULL, 'NM7954', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2467, '8806173418961', 'ECO CRAYON LIP ROUGE 03 PEACH CORAL', 2, '47795.0000', '130000.0000', '20.0000', '', 15, NULL, 'NM7956', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2468, '8806173418985', 'ECO CRAYON LIP ROUGE 05 BURGUNDY RED', 2, '47795.0000', '130000.0000', '20.0000', '', 15, NULL, 'NM7958', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2469, '8806173419043', 'BYFLOWER TRIPLE VOLUME TINT 06 ROSE', 2, '79658.0000', '215000.0000', '20.0000', '', 15, NULL, 'NM7964', '', '', '', '', '', '54.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2470, '8806173420810', 'BOTANICAL SIMPLE MAKING GEL EYELINER 2 DARK BROWN', 2, '67710.0000', '185000.0000', '20.0000', '14231b7aad4245e8874840ffd693a1a5.jpg', 8, NULL, 'NL8142', '', '', '', '', '', '60.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'BOTANICAL-SIMPLE-MAKING-GEL-EYELINER-2-DARK-BROWN', NULL, '0.0000'),
(2471, '8806173424382', 'AQUA COLLAGEN SOLUTION COENZYME Q10 HYDRO GEL MASK', 2, '35847.0000', '98000.0000', '20.0000', '', 16, NULL, 'NL8504', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2472, '8806173422708', 'SNAIL SOLUTION BB CREAM SPF30 PA++ 01', 2, '199145.0000', '538000.0000', '20.0000', '', 9, NULL, 'NL8332', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2473, '8806173416394', 'BOTANICAL SKINNY AUTO EYELINER 01 BLACK', 2, '62930.0000', '170000.0000', '20.0000', '25cb1a7b65a6b02292ac7957b631401c.jpg', 8, NULL, 'NM7698', '', '', '', '', '', '60.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'BOTANICAL-SKINNY-AUTO-EYELINER-01-BLACK', NULL, '0.0000'),
(2474, '8806173424658', 'FRESH GREEN TEA SEED SERUM', 2, '86828.0000', '235000.0000', '20.0000', '', 23, NULL, 'NL8543', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2475, '8806173416745', 'ARGAN ESSENTIAL DEEP CARE HAIR MASK', 2, '27881.0000', '78000.0000', '50.0000', '', 13, NULL, 'NM7730', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2476, '8806173420322', 'ARGAN ESSENTIAL CURLING ESSENCE', 2, '55761.0000', '152000.0000', '20.0000', '', 13, NULL, 'NL8078', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2127, '8806173433162', 'FRESH DEODRANT STICK - COTTON', 2, '61337.0000', '170000.0000', '20.0000', '', 6, NULL, 'NK0170', '', '', '', '', '', '80.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2128, '8806173433254', 'PURE SHINE LIPSTICK 03 JULIET ROSE', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0179', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2129, '8806173433728', 'SNAIL SOLUTION SKIN BOOSTER (C)', 2, '199145.0000', '538000.0000', '20.0000', '', 23, NULL, 'NK0227', '', '', '', '', '', '96.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2130, '8806173436538', 'COLLAGEN DREAM 50 ALL IN ONE RADIANCE TONE UP CREAM SPF35PA++', 2, '214280.0000', '555000.0000', '20.0000', '', 23, NULL, 'NK0513', '', '', '', '', '', '64.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2131, '8806173440306', 'BOTANICAL GREEN TEA PORE STICK', 2, '62930.0000', '170000.0000', '20.0000', '', 9, NULL, 'NJ0886', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2132, '8806173418015', 'BAMBOO CHARCOAL NOSE & T-ZONE PACK', 2, '78862.0000', '215000.0000', '100.0000', '', 19, NULL, 'NM7859', '', '', '', '', '', '900.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2133, '8806173414123', 'SOOTHING & MOISTURE ALOE VERA 92% SOOTHING GEL MIST', 2, '43812.0000', '118000.0000', '20.0000', '', 23, NULL, 'NM7468', '', '', '', '', '', '180.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 0, 'ALOE-VERA-92-SOOTHING-GEL-MIST', NULL, '0.0000'),
(2134, '8806173439065', 'HERB BLENDING MIST', 2, '86828.0000', '235000.0000', '20.0000', '', 18, NULL, 'NK0763', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2135, '8806173431441', 'GINSENG ROYAL SILK AMPOULE', 2, '955894.0000', '2575000.0000', '20.0000', '', 23, NULL, 'NK0011', '', '', '', '', '', '20.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2136, '8806173437153', 'REAL NATURE ALOE HYDROGEL MASK', 2, '15543.0000', '42000.0000', '100.0000', '', 16, NULL, 'NK0573', '', '', '', '', '', '1000.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2137, '8806173437191', 'REAL NATURE GRAPEFRUIT HYDROGEL MASK', 2, '15543.0000', '42000.0000', '50.0000', '', 16, NULL, 'NK0577', '', '', '', '', '', '560.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2138, '8806173437238', 'REAL NATURE MANUKA HONEY HYDROGEL MASK', 2, '15543.0000', '42000.0000', '50.0000', '', 16, NULL, 'NK0581', '', '', '', '', '', '600.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2139, '8806173425808', 'COCONUT BIO SKIN MASK [PORE CARE]', 2, '23898.0000', '65000.0000', '50.0000', '', 16, NULL, 'NL8646', '', '', '', '', '', '400.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2140, '8806173420025', 'GINSENG ROYAL SILK ESSENCE', 2, '438118.0000', '1180000.0000', '20.0000', '', 23, NULL, 'NL8089', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2141, '8806173428823', 'GREEN DERMA MILD PEELING GEL', 2, '102759.0000', '278000.0000', '20.0000', '', 21, NULL, 'NL8949', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2142, '8806173430765', 'BEAUTY TOOL BATH TOWEL', 2, '26045.0000', '65000.0000', '20.0000', '', 24, NULL, 'NL9144', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2143, '8806173431458', 'COCONUT BIO SKIN MULTI PATCH', 2, '7170.0000', '18000.0000', '50.0000', '', 20, NULL, 'NK0012', '', '', '', '', '', '500.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2144, '8806173434398', 'HAWAIIAN DEEP SEA AHA CLEANSING LOTION', 2, '86828.0000', '235000.0000', '20.0000', '', 7, NULL, 'NK0306', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2145, '8806173435005', 'PROVENCE AIR SKIN FIT BLUR PACT SPF30 PA+++', 2, '102759.0000', '278000.0000', '20.0000', '', 9, NULL, 'NK0363', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2146, '8806173438259', 'REAL FRESH BLACK TEA NOURISHING MASK', 2, '118691.0000', '320000.0000', '20.0000', '', 19, NULL, 'NK0685', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2147, '8806173437207', 'REAL NATURE GREEN GRAPE HYDROGEL MASK', 2, '15543.0000', '42000.0000', '50.0000', '', 16, NULL, 'NK0578', '', '', '', '', '', '600.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2148, '8806173433599', 'SMUDGE PROOF EYELINER 01 DEEP BLACK', 2, '78862.0000', '215000.0000', '20.0000', '', 8, NULL, 'NK0213', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2149, '8806173424177', 'REAL SQUEEZE ALOE VERA CREAM', 2, '134622.0000', '365000.0000', '20.0000', '', 23, NULL, 'NL8485', '', '', '', '', '', '120.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2150, '8806173425204', 'AQUA COLLAGEN SOLUTION MARINE HYDROGEL LIP PATCH(R)', 2, '19915.0000', '55000.0000', '50.0000', '', 20, NULL, 'NL8586', '', '', '', '', '', '350.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2517, '8806173439133', 'MULTIPLE 3D ALL IN ONE BROW 01 PEANUT LATTE', 2, '78862.0000', '215000.0000', '20.0000', '', 8, NULL, 'NK0770', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2518, '8806173439140', 'MULTIPLE 3D ALL IN ONE BROW 02 CHOCO BROWNIE', 2, '78862.0000', '215000.0000', '20.0000', '', 8, NULL, 'NK0771', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2519, '8806173439157', 'MULTIPLE 3D ALL IN ONE BROW 03 ASH MOCHA', 2, '78862.0000', '215000.0000', '20.0000', '', 8, NULL, 'NK0772', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2520, '8806173436507', 'BATH AND NATURE CHAMOMILE FEMININE WASH', 2, '62930.0000', '170000.0000', '20.0000', '', 6, NULL, 'NK0510', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2521, '8806173435135', 'BEAUTY TOOL NATURAL 5-LAYER COTTON WIPE', 2, '27881.0000', '78000.0000', '20.0000', '', 24, NULL, 'NK0378', '', '', '', '', '', '100.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2522, '8806173434626', 'BOTANICAL CUSHION BLUSHER 01 PINK', 2, '86828.0000', '235000.0000', '20.0000', '', 9, NULL, 'NK0204', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2523, '8806173433711', 'BEAUTY TOOL GEL EYE LINER BRUSH', 2, '23898.0000', '65000.0000', '20.0000', '', 24, NULL, 'NK0226', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2524, '8806173434916', 'PURE SHINE POWDER PACT 21 NUDE BEIGE', 2, '46999.0000', '128000.0000', '20.0000', '', 9, NULL, 'NK0354', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2525, '8806173433940', 'BEAUTY TOOL FLAWLESS NBR PUFF 2P', 2, '14339.0000', '40000.0000', '20.0000', '', 24, NULL, 'NK0249', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2526, '8806173437382', 'LONGLASTING SMUDGE SHADOW STICK 07 CITY LIGHT', 2, '55761.0000', '152000.0000', '20.0000', '', 8, NULL, 'NK0595', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2515, '8806173433681', 'BEAUTY TOOL RUBYCELL SPONGE TIP 4PCS', 2, '11949.0000', '35000.0000', '20.0000', '', 24, NULL, 'NK0222', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2516, '8806173433841', 'BEAUTY TOOL NAIL CLIPPERS (SMALL)', 2, '23898.0000', '65000.0000', '20.0000', '', 24, NULL, 'NK0239', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2549, '8806173435296', 'BEAUTY TOOL SOFT 1/2 COTTON WIPE', 2, '23898.0000', '65000.0000', '20.0000', '', 24, NULL, 'NK0400', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2550, '8806173433896', 'BEAUTY TOOL MASK SHEET (6P)', 2, '7966.0000', '18000.0000', '20.0000', '', 24, NULL, 'NK0244', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2551, '8806173433704', 'BEAUTY TOOL EYE BROW ANGLE BRUSH', 2, '27881.0000', '78000.0000', '20.0000', '', 24, NULL, 'NK0224', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2552, '8806173433834', 'BEAUTY TOOL NAIL NIPPER', 2, '78862.0000', '215000.0000', '20.0000', '', 24, NULL, 'NK0238', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2488, '8806173427093', 'SWEET JELLY GLOSS 01 CITRUS LEMON', 2, '26288.0000', '72000.0000', '20.0000', '', 15, NULL, 'NL8775', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2489, '8806173427109', 'SWEET JELLY GLOSS 02 SWEET PEACH', 2, '26288.0000', '72000.0000', '20.0000', '', 15, NULL, 'NL8776', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2490, '8806173427116', 'SWEET JELLY GLOSS 03 LOLLY GRAPEFRUIT', 2, '26288.0000', '72000.0000', '20.0000', '', 15, NULL, 'NL8777', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2491, '8806173427123', 'SWEET JELLY GLOSS 04 POPPING STRAWBERRY', 2, '26288.0000', '72000.0000', '20.0000', '', 15, NULL, 'NL8778', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2492, '8806173427130', 'SWEET JELLY GLOSS 05 CANDY WATERMELON', 2, '26288.0000', '72000.0000', '20.0000', '', 15, NULL, 'NL8779', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2493, '8806173434039', 'BEAUTY TOOL FOOT BUFFER', 2, '23898.0000', '65000.0000', '20.0000', '', 24, NULL, 'NK0258', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2494, '8806173434046', 'BEAUTY TOOL CUTICLE PUSHER', 2, '39829.0000', '108000.0000', '20.0000', '', 24, NULL, 'NK0259', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2495, '8806173437375', 'CRYSTAL EYE TINT 08 VINTAGE GOLD', 2, '71693.0000', '195000.0000', '20.0000', '', 8, NULL, 'NK0600', '', '', '', '', '', '63.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2496, '8806173437054', 'BYFLOWER TRIPLE MOUSSE TINT 04 CHIC RED MOUSSE', 2, '79658.0000', '215000.0000', '20.0000', '', 15, NULL, 'NK0566', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2497, '8806173437771', 'BY FLOWER AUTO EYELINER 01 BLACK', 2, '27881.0000', '78000.0000', '20.0000', '', 8, NULL, 'NK0635', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2498, '8806173437788', 'BY FLOWER AUTO EYELINER 02 DARK BROWN', 2, '27881.0000', '78000.0000', '20.0000', '', 8, NULL, 'NK0636', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2499, '8806173433346', 'PURE SHINE LIPSTICK 10 CHERRY RED', 2, '70099.0000', '190000.0000', '20.0000', '', 15, NULL, 'NK0188', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2500, '8806173433933', 'BEAUTY TOOL SHOWER BALL', 2, '15932.0000', '45000.0000', '20.0000', '', 24, NULL, 'NK0248', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`) VALUES
(2501, '8806173440047', 'REAL SUPER GRAIN CLEANSING WATER SPECIAL SET', 2, '78862.0000', '215000.0000', '20.0000', '', 7, NULL, 'NJ0862', '', '', '', '', '', '64.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2502, '8806173433452', 'BOTANICAL CAKE EYEBROW 02 MOCHA BROWN/BROWN', 2, '61337.0000', '168000.0000', '20.0000', '', 8, NULL, 'NK0199', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2503, '8806173433476', 'BOTANICAL STICK HIGHLIGHTER 02 SHINE GOLD', 2, '61337.0000', '168000.0000', '20.0000', '', 9, NULL, 'NK0201', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2504, '8806173434954', 'PROVENCE AIR SKIN FIT MAKEUP BASE 02 GREEN SPF30PA++', 2, '102759.0000', '278000.0000', '20.0000', '', 9, NULL, 'NK0358', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2505, '8806173440276', 'BYFLOWER TRIPLE MOUSSE TINT 06 FUCHSIA PINK MOUSSE', 2, '79658.0000', '215000.0000', '20.0000', '', 15, NULL, 'NJ0883', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2506, '8806173440283', 'BYFLOWER TRIPLE MOUSSE TINT 07 MILKY PINK MOUSSE', 2, '79658.0000', '215000.0000', '20.0000', '', 15, NULL, 'NJ0884', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2507, '8806173441624', 'REAL MATTE LIPSTICK 01 REAL RED', 2, '119487.0000', '322000.0000', '20.0000', '', 15, NULL, 'NJ1019', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2508, '8806173441648', 'REAL MATTE LIPSTICK 03 CORAL SUNSHINE', 2, '119487.0000', '322000.0000', '20.0000', '', 15, NULL, 'NJ1021', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2509, '8806173441655', 'REAL MATTE LIPSTICK 04 PINK MACAROON', 2, '119487.0000', '322000.0000', '20.0000', '', 15, NULL, 'NJ1022', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2510, '8806173441662', 'REAL MATTE LIPSTICK 05 SPARKLING PINK', 2, '119487.0000', '322000.0000', '20.0000', '', 15, NULL, 'NJ1023', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2511, '8806173441679', 'REAL MATTE LIPSTICK 06 FUCHSIA CRUSH', 2, '119487.0000', '322000.0000', '20.0000', '', 15, NULL, 'NJ1024', '', '', '', '', '', '48.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2512, '8806173441686', 'REAL MATTE LIPSTICK 07 CHIFFON CORAL', 2, '119487.0000', '322000.0000', '20.0000', '', 15, NULL, 'NJ1025', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2513, '8806173441693', 'REAL MATTE LIPSTICK 08 BRICK VELVET', 2, '119487.0000', '322000.0000', '20.0000', '', 15, NULL, 'NJ1026', '', '', '', '', '', '56.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2514, '8806173440948', 'CALIFORNIA ALOE AQUA SUN STICK SPF50+PA++++', 2, '159316.0000', '430000.0000', '20.0000', '', 22, NULL, 'NJ0951', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2485, '8806173420865', 'PROVENCE CREAMY GEL EYELINER 03 CHOCO BROWN', 2, '63727.0000', '172000.0000', '20.0000', '', 8, NULL, 'NL8147', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2486, '8806173420872', 'PROVENCE CREAMY GEL EYELINER 04 GOLDEN KHAKI', 2, '63727.0000', '172000.0000', '20.0000', '', 8, NULL, 'NL8148', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2487, '8806173420896', 'PROVENCE CREAMY GEL EYELINER 06 PINK SHIMMER', 2, '63727.0000', '172000.0000', '20.0000', '', 8, NULL, 'NL8150', '', '', '', '', '', '60.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2478, '8806173430383', 'BY FLOWER AUTO EYEBROW 01 DARK GRAY', 2, '27881.0000', '78000.0000', '20.0000', '', 8, NULL, 'NL9103', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2479, '8806173430369', 'BY FLOWER AUTO EYEBROW 03 BROWN', 2, '27881.0000', '78000.0000', '20.0000', '', 8, NULL, 'NL9105', '', '', '', '', '', '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL),
(2554, '8806173435074', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 11 COCONUT', 2, '95590.0000', '258000.0000', '20.0000', '', 9, NULL, 'NK0370', '', '', '', '', '', '40.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_discounts`
--

CREATE TABLE `sma_product_discounts` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `free_item_id` int(11) DEFAULT NULL,
  `min_trx` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`) VALUES
(21, 'PO/IN003/12/2017', '2018-01-14 09:08:00', 11, 'NATURE REPUBLIC KOREA', 3, '', '701000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '701000.0000', '0.0000', 'received', 'pending', 2, 2, '2018-01-14 09:14:41', NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(14, 'PO/IN002/12/2017', '2018-01-13 09:34:00', 11, 'NATURE REPUBLIC KOREA', 3, '', '2266344962.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '2266344962.0000', '0.0000', 'received', 'pending', 0, NULL, NULL, '181aac9578c08aa2830a331ec4e86962.xls', NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`) VALUES
(6245, 14, NULL, 2401, '8806173438310', 'FRESH HERB PEACH CLEANSING FOAM', NULL, '26288.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2523648.0000', '96.0000', '2018-01-13', 'received', '26288.0000', '26288.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6246, 14, NULL, 2170, '8806173437245', 'REAL NATURE GREEN TEE HYDROGEL MASK', NULL, '15543.0000', '600.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9325800.0000', '600.0000', '2018-01-13', 'received', '15543.0000', '15543.0000', NULL, NULL, NULL, 2, 'pcs', '600.0000'),
(6247, 14, NULL, 2171, '8806173435951', 'GINSENG ROYAL SILK CAPSULE ESSENCE', NULL, '477947.0000', '64.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '30588608.0000', '64.0000', '2018-01-13', 'received', '477947.0000', '477947.0000', NULL, NULL, NULL, 2, 'pcs', '64.0000'),
(6248, 14, NULL, 2411, '8806173434206', 'REAL NATURE ALOE CLEANSING CREAM', NULL, '78862.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9463440.0000', '120.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6249, 14, NULL, 2412, '8806173436620', 'LOVE ME BUBBLE BODY LOTION-BERGAMOT CITRUS', NULL, '118691.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4747640.0000', '40.0000', '2018-01-13', 'received', '118691.0000', '118691.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6250, 14, NULL, 2382, '8806173419395', 'GREEN DERMA MILD FOAM CLEANSER', NULL, '79658.0000', '84.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6691272.0000', '84.0000', '2018-01-13', 'received', '79658.0000', '79658.0000', NULL, NULL, NULL, 2, 'pcs', '84.0000'),
(6251, 14, NULL, 2266, '8806173429196', 'GREEK YOGURT PACK_BLUE BERRY (ANTI-WRINKLE)', NULL, '78862.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7570752.0000', '96.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6252, 14, NULL, 2172, '8806173423781', 'SKIN SMOOTHING BODY PEELING MIST-PHYTONCIDE', NULL, '52575.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3785400.0000', '72.0000', '2018-01-13', 'received', '52575.0000', '52575.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6253, 14, NULL, 2388, '8806173423798', 'SKIN SMOOTHING BODY PEELING MIST-COTTON', NULL, '52575.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3785400.0000', '72.0000', '2018-01-13', 'received', '52575.0000', '52575.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6254, 14, NULL, 2391, '8806173423804', 'SKIN SMOOTHING BODY PEELING MIST-PEACH', NULL, '52575.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3785400.0000', '72.0000', '2018-01-13', 'received', '52575.0000', '52575.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6255, 14, NULL, 2173, '8806173424894', 'BLACKHEAD CLEAR  NOSE PACK(7EA)', NULL, '27881.0000', '600.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '16728600.0000', '600.0000', '2018-01-13', 'received', '27881.0000', '27881.0000', NULL, NULL, NULL, 2, 'pcs', '600.0000'),
(6256, 14, NULL, 2394, '8806173424900', 'FOREST GARDEN ARGAN CLEANSING OIL', NULL, '111521.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6691260.0000', '60.0000', '2018-01-13', 'received', '111521.0000', '111521.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6257, 14, NULL, 2396, '8806173419562', 'HONEY&HERB CLEANSING CREAM', NULL, '52575.0000', '84.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4416300.0000', '84.0000', '2018-01-13', 'received', '52575.0000', '52575.0000', NULL, NULL, NULL, 2, 'pcs', '84.0000'),
(6258, 14, NULL, 2395, '8806173424917', 'FOREST GARDEN OLIVE CLEANSING OIL', NULL, '111521.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6691260.0000', '60.0000', '2018-01-13', 'received', '111521.0000', '111521.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6259, 14, NULL, 2386, '8806173429424', 'BEAUTY TOOL NATURAL JELLY CLEANSING PUFF-CHARCOAL', NULL, '27881.0000', '100.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2788100.0000', '100.0000', '2018-01-13', 'received', '27881.0000', '27881.0000', NULL, NULL, NULL, 2, 'pcs', '100.0000'),
(6260, 14, NULL, 2445, '8806173430314', 'BEAUTY TOOL NATURAL JELLY CLEANSING PUFF-GREEN CLAY', NULL, '27881.0000', '100.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2788100.0000', '100.0000', '2018-01-13', 'received', '27881.0000', '27881.0000', NULL, NULL, NULL, 2, 'pcs', '100.0000'),
(6261, 14, NULL, 2174, '8806173435081', 'BEAUTY TOOL NATURAL MILD COTTON WIPE', NULL, '7959.0000', '100.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '795900.0000', '100.0000', '2018-01-13', 'received', '7959.0000', '7959.0000', NULL, NULL, NULL, 2, 'pcs', '100.0000'),
(6262, 14, NULL, 2175, '8806173435173', 'BEAUTY TOOL PERFECT COVER BRUSH', NULL, '72732.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2909280.0000', '40.0000', '2018-01-13', 'received', '72732.0000', '72732.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6263, 14, NULL, 2521, '8806173435135', 'BEAUTY TOOL NATURAL 5-LAYER COTTON WIPE', NULL, '27881.0000', '100.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2788100.0000', '100.0000', '2018-01-13', 'received', '27881.0000', '27881.0000', NULL, NULL, NULL, 2, 'pcs', '100.0000'),
(6264, 14, NULL, 2549, '8806173435296', 'BEAUTY TOOL SOFT 1/2 COTTON WIPE', NULL, '23898.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1433880.0000', '60.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6457, 21, NULL, 2207, '8806173420377', 'SOOTHING & MOISTURE ALOE VERA 92% SOOTHING GEL', NULL, '35050.0000', '20400.0000', 3, '0.0000', 0, '', '0', '0.0000', '2019-12-31', '701000.0000', '20394.0000', '2018-01-14', 'received', '35050.0000', '35050.0000', '20400.0000', NULL, NULL, 2, 'pcs', '20.0000'),
(6444, 14, NULL, 2553, '8806173433858', 'BEAUTY TOOL BODY SHAVER', NULL, '11949.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '716940.0000', '60.0000', '2018-01-13', 'received', '11949.0000', '11949.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6443, 14, NULL, 2552, '8806173433834', 'BEAUTY TOOL NAIL NIPPER', NULL, '78862.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4731720.0000', '60.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6442, 14, NULL, 2530, '8806173435166', 'BEAUTY TOOL EYE SHADOW DUAL BRUSH', NULL, '35847.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2150820.0000', '60.0000', '2018-01-13', 'received', '35847.0000', '35847.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6441, 14, NULL, 2528, '8806173434084', 'BEAUTY TOOL TWEEZERS', NULL, '19915.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1194900.0000', '60.0000', '2018-01-13', 'received', '19915.0000', '19915.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6439, 14, NULL, 2516, '8806173433841', 'BEAUTY TOOL NAIL CLIPPERS (SMALL)', NULL, '23898.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1433880.0000', '60.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6440, 14, NULL, 2523, '8806173433711', 'BEAUTY TOOL GEL EYE LINER BRUSH', NULL, '23898.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1433880.0000', '60.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6438, 14, NULL, 2494, '8806173434046', 'BEAUTY TOOL CUTICLE PUSHER', NULL, '39829.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2389740.0000', '60.0000', '2018-01-13', 'received', '39829.0000', '39829.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6437, 14, NULL, 2493, '8806173434039', 'BEAUTY TOOL FOOT BUFFER', NULL, '23898.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1433880.0000', '60.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6436, 14, NULL, 2459, '8806173432769', 'BEAUTY TOOL SKIN & LOTION CONTAINER(2P)', NULL, '14339.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '860340.0000', '60.0000', '2018-01-13', 'received', '14339.0000', '14339.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6435, 14, NULL, 2453, '8806173430680', 'BEAUTY TOOL MULTI 4WAY BRUSH', NULL, '71693.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2867720.0000', '40.0000', '2018-01-13', 'received', '71693.0000', '71693.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6434, 14, NULL, 2452, '8806173430659', 'BEAUTY TOOL MINI BLUSHER BRUSH', NULL, '35847.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2150820.0000', '60.0000', '2018-01-13', 'received', '35847.0000', '35847.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6433, 14, NULL, 2206, '8806173428434', 'BEAUTY TOOL POWDER BRUSH', NULL, '87278.0000', '20.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1745560.0000', '20.0000', '2018-01-13', 'received', '87278.0000', '87278.0000', NULL, NULL, NULL, 2, 'pcs', '20.0000'),
(6431, 14, NULL, 2437, '8806173428397', 'BEATY TOOL DOUBLE EYELID LIQUID GLUE(2)', NULL, '15932.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '637280.0000', '40.0000', '2018-01-13', 'received', '15932.0000', '15932.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6432, 14, NULL, 2438, '8806173428427', 'BEAUTY TOOL CHEEK BRUSH', NULL, '71693.0000', '30.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2150790.0000', '30.0000', '2018-01-13', 'received', '71693.0000', '71693.0000', NULL, NULL, NULL, 2, 'pcs', '30.0000'),
(6430, 14, NULL, 2432, '8806173425143', 'BEAUTY TOOL EYELASH 02 NATURAL & BROWN', NULL, '23898.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1433880.0000', '60.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6429, 14, NULL, 2205, '8806173425815', 'COCONUT BIO SKIN MASK [REVITAL]', NULL, '23898.0000', '400.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9559200.0000', '400.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '400.0000'),
(6428, 14, NULL, 2204, '8806173439652', 'SOOTHING & MOISTURE CACTUS 92% SOOTHING GEL', NULL, '61337.0000', '600.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '36802200.0000', '600.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '600.0000'),
(6427, 14, NULL, 2480, '8806173416363', 'BY FLOWER HARD EYELINER 01 BLACK', NULL, '46999.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2819940.0000', '60.0000', '2018-01-13', 'received', '46999.0000', '46999.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6426, 14, NULL, 2476, '8806173420322', 'ARGAN ESSENTIAL CURLING ESSENCE', NULL, '55761.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5353056.0000', '96.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6425, 14, NULL, 2465, '8806173422050', 'NATURAL BUTTER LIPBALM 02 STRAWBERRY', NULL, '54964.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3957408.0000', '72.0000', '2018-01-13', 'received', '54964.0000', '54964.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6424, 14, NULL, 2448, '8806173423347', 'BY FLOWER BLUSHER 03 GRAPEFRUIT COTTON CANDY', NULL, '55761.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3345660.0000', '60.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6423, 14, NULL, 2447, '8806173423330', 'BY FLOWER BLUSHER 02 CORAL BLOSSOM', NULL, '55761.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3345660.0000', '60.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6422, 14, NULL, 2429, '8806173416400', 'BOTANICAL SKINNY AUTO EYELINER 02 BROWN', NULL, '60194.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3611640.0000', '60.0000', '2018-01-13', 'received', '60194.0000', '60194.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6421, 14, NULL, 2428, '8806173416370', 'BY FLOWER HARD EYELINER 02 BROWN', NULL, '44955.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2697300.0000', '60.0000', '2018-01-13', 'received', '44955.0000', '44955.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6420, 14, NULL, 2203, '8806173420193', 'PROVENCE MARBLE HIGHLIGHTER 01 BLOOM PEACH', NULL, '134622.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '8077320.0000', '60.0000', '2018-01-13', 'received', '134622.0000', '134622.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6419, 14, NULL, 2305, '8806173419722', 'ECO LIPGLOSS 02PEACH', NULL, '61337.0000', '63.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3864231.0000', '63.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '63.0000'),
(6418, 14, NULL, 2554, '8806173435074', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 11 COCONUT', NULL, '95590.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823600.0000', '40.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6417, 14, NULL, 2202, '8806173436026', 'GINSENG ROYAL SILK POWDER 01PURE BEIGE SPF26,PA+', NULL, '262871.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '12617808.0000', '48.0000', '2018-01-13', 'received', '262871.0000', '262871.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6416, 14, NULL, 2546, '8806173434862', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 06 BABY CORAL', NULL, '95590.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823600.0000', '40.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6414, 14, NULL, 2544, '8806173434848', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 04 SHINING BEAM', NULL, '95590.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823600.0000', '40.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6415, 14, NULL, 2545, '8806173434855', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 05 CONTOUR BEAM', NULL, '95590.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5353040.0000', '56.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6413, 14, NULL, 2543, '8806173434831', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 03 DEEP BEIGE SPF37PA++', NULL, '95590.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4588320.0000', '48.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6412, 14, NULL, 2201, '8806173441990', 'SOOTHING & MOISTURE ALOE VERA 92% SOOTHING GEL(TUBE)', NULL, '39033.0000', '640.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '24981120.0000', '640.0000', '2018-01-13', 'received', '39033.0000', '39033.0000', NULL, NULL, NULL, 2, 'pcs', '640.0000'),
(6411, 14, NULL, 2539, '8806173438198', 'PURE SHINE MELTING TINT 04 NIGHT ROSE', NULL, '46999.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3383928.0000', '72.0000', '2018-01-13', 'received', '46999.0000', '46999.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6410, 14, NULL, 2538, '8806173434022', 'MICRO SLIM BROW PENCIL 04 DARK BROWN', NULL, '55761.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3122616.0000', '56.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6408, 14, NULL, 2353, '8806173436613', 'LOVE ME BUBBLE BATH & SHOWER GEL-BERGAMOT CITRUS', NULL, '118691.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4747640.0000', '40.0000', '2018-01-13', 'received', '118691.0000', '118691.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6409, 14, NULL, 2536, '8806173434008', 'MICRO SLIM BROW PENCIL 02 REDBEAN BROWN', NULL, '55761.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3122616.0000', '56.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6407, 14, NULL, 2351, '8806173436590', 'LOVE ME BUBBLE BATH & SHOWER GEL-FLORAL BOUQUET', NULL, '118691.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4747640.0000', '40.0000', '2018-01-13', 'received', '118691.0000', '118691.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6406, 14, NULL, 2520, '8806173436507', 'BATH AND NATURE CHAMOMILE FEMININE WASH', NULL, '62930.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3020640.0000', '48.0000', '2018-01-13', 'received', '62930.0000', '62930.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6405, 14, NULL, 2513, '8806173441693', 'REAL MATTE LIPSTICK 08 BRICK VELVET', NULL, '119487.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6691272.0000', '56.0000', '2018-01-13', 'received', '119487.0000', '119487.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6404, 14, NULL, 2512, '8806173441686', 'REAL MATTE LIPSTICK 07 CHIFFON CORAL', NULL, '119487.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6691272.0000', '56.0000', '2018-01-13', 'received', '119487.0000', '119487.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6403, 14, NULL, 2510, '8806173441662', 'REAL MATTE LIPSTICK 05 SPARKLING PINK', NULL, '119487.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4779480.0000', '40.0000', '2018-01-13', 'received', '119487.0000', '119487.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6402, 14, NULL, 2509, '8806173441655', 'REAL MATTE LIPSTICK 04 PINK MACAROON', NULL, '119487.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6691272.0000', '56.0000', '2018-01-13', 'received', '119487.0000', '119487.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6401, 14, NULL, 2508, '8806173441648', 'REAL MATTE LIPSTICK 03 CORAL SUNSHINE', NULL, '119487.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4779480.0000', '40.0000', '2018-01-13', 'received', '119487.0000', '119487.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6400, 14, NULL, 2507, '8806173441624', 'REAL MATTE LIPSTICK 01 REAL RED', NULL, '119487.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4779480.0000', '40.0000', '2018-01-13', 'received', '119487.0000', '119487.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6399, 14, NULL, 2200, '8806173433445', 'BOTANICAL CAKE EYEBROW 01 KHAKI GRAY/DARK BROWN', NULL, '61337.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3680220.0000', '60.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6398, 14, NULL, 2199, '8806173437061', 'BYFLOWER TRIPLE MOUSSE TINT 05 BRICK RED MOUSSE', NULL, '79658.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823584.0000', '48.0000', '2018-01-13', 'received', '79658.0000', '79658.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6396, 14, NULL, 2198, '8806173432615', 'CREAMY LIPSTICK 11 DRY ROSE', NULL, '95590.0000', '45.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4301550.0000', '45.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '45.0000'),
(6397, 14, NULL, 2495, '8806173437375', 'CRYSTAL EYE TINT 08 VINTAGE GOLD', NULL, '71693.0000', '63.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4516659.0000', '63.0000', '2018-01-13', 'received', '71693.0000', '71693.0000', NULL, NULL, NULL, 2, 'pcs', '63.0000'),
(6395, 14, NULL, 2343, '8806173434145', 'LONGLASTING SMUDGE SHADOW STICK 02 LILAC TOUCH', NULL, '53337.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2986872.0000', '56.0000', '2018-01-13', 'received', '53337.0000', '53337.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6394, 14, NULL, 2503, '8806173433476', 'BOTANICAL STICK HIGHLIGHTER 02 SHINE GOLD', NULL, '61337.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2453480.0000', '40.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6393, 14, NULL, 2502, '8806173433452', 'BOTANICAL CAKE EYEBROW 02 MOCHA BROWN/BROWN', NULL, '61337.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3680220.0000', '60.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6392, 14, NULL, 2550, '8806173433896', 'BEAUTY TOOL MASK SHEET (6P)', NULL, '7966.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '477960.0000', '60.0000', '2018-01-13', 'received', '7966.0000', '7966.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6391, 14, NULL, 2375, '8806173433698', 'BEAUTY TOOL BUBBLE FACE', NULL, '15932.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '955920.0000', '60.0000', '2018-01-13', 'received', '15932.0000', '15932.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6390, 14, NULL, 2548, '8806173433919', 'BEAUTY TOOL CUTICLE TRIMMER', NULL, '7966.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '477960.0000', '60.0000', '2018-01-13', 'received', '7966.0000', '7966.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6388, 14, NULL, 2346, '8806173433803', 'BEAUTY TOOL PACK BRUSH-SOFT TYPE', NULL, '14339.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '860340.0000', '60.0000', '2018-01-13', 'received', '14339.0000', '14339.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6389, 14, NULL, 2364, '8806173434091', 'BEAUTY TOOL PRECISION DIAMOND PUFF 4P', NULL, '14339.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '860340.0000', '60.0000', '2018-01-13', 'received', '14339.0000', '14339.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6387, 14, NULL, 2515, '8806173433681', 'BEAUTY TOOL RUBYCELL SPONGE TIP 4PCS', NULL, '11949.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '716940.0000', '60.0000', '2018-01-13', 'received', '11949.0000', '11949.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6386, 14, NULL, 2344, '8806173433902', 'BEAUTY TOOL WATERPROOF HAIR CAP', NULL, '19915.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1194900.0000', '60.0000', '2018-01-13', 'received', '19915.0000', '19915.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6385, 14, NULL, 2336, '8806173428656', 'BEAUTY TOOL OIL-CONTROL FILM(50 PCS)', NULL, '19915.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1194900.0000', '60.0000', '2018-01-13', 'received', '19915.0000', '19915.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6384, 14, NULL, 2460, '8806173432783', 'BEAUTY TOOL PUMP BOTTLE', NULL, '15932.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '955920.0000', '60.0000', '2018-01-13', 'received', '15932.0000', '15932.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6383, 14, NULL, 2458, '8806173432752', 'BEAUTY TOOL CREAM CONTAINER(2P)', NULL, '11949.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '716940.0000', '60.0000', '2018-01-13', 'received', '11949.0000', '11949.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6382, 14, NULL, 2197, '8806173432370', 'BEAUTY TOOL COCOON SILK BALL(20EA)', NULL, '43770.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2626200.0000', '60.0000', '2018-01-13', 'received', '43770.0000', '43770.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6381, 14, NULL, 2457, '8806173432332', 'BEAUTY TOOL EYE SHADOW MEDIUM BRUSH', NULL, '31864.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1911840.0000', '60.0000', '2018-01-13', 'received', '31864.0000', '31864.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6380, 14, NULL, 2320, '8806173432318', 'BEAUTY TOOL SOFT-TOUCH FLOCKED PUFF (2P)', NULL, '15932.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '955920.0000', '60.0000', '2018-01-13', 'received', '15932.0000', '15932.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6379, 14, NULL, 2319, '8806173432301', 'BEAUTY TOOL EYE BROW RAZOR(2P)', NULL, '15932.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '955920.0000', '60.0000', '2018-01-13', 'received', '15932.0000', '15932.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6377, 14, NULL, 2442, '8806173430826', 'BEAUTY TOOL NAIL CLIPPER (BIG)', NULL, '23898.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1433880.0000', '60.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6378, 14, NULL, 2450, '8806173432288', 'BEAUTY TOOL EYELID LIQUID GLUE', NULL, '23898.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1433880.0000', '60.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6376, 14, NULL, 2440, '8806173430741', 'BEAUTY TOOL NAIL BUFFER', NULL, '15932.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '955920.0000', '60.0000', '2018-01-13', 'received', '15932.0000', '15932.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6375, 14, NULL, 2314, '8806173430734', 'BEAUTY TOOL NOSE HAIR TRIMMER', NULL, '19915.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1194900.0000', '60.0000', '2018-01-13', 'received', '19915.0000', '19915.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6374, 14, NULL, 2196, '8806173430673', 'BEAUTY TOOL PORE CLEASING BRUSH', NULL, '181828.0000', '20.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3636560.0000', '20.0000', '2018-01-13', 'received', '181828.0000', '181828.0000', NULL, NULL, NULL, 2, 'pcs', '20.0000'),
(6373, 14, NULL, 2439, '8806173430642', 'BEAUTY TOOL BLENDING BRUSH', NULL, '39829.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2389740.0000', '60.0000', '2018-01-13', 'received', '39829.0000', '39829.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6371, 14, NULL, 2310, '8806173425174', 'BEAUTY TOOL EYELASH 05 FULL VOLUME & WING', NULL, '31864.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1911840.0000', '60.0000', '2018-01-13', 'received', '31864.0000', '31864.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6372, 14, NULL, 2435, '8806173425181', 'BEAUTY TOOL EYELASH 06 UNDER LASH', NULL, '31864.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1911840.0000', '60.0000', '2018-01-13', 'received', '31864.0000', '31864.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6370, 14, NULL, 2433, '8806173425150', 'BEAUTY TOOL EYELASH 03 FULL VOLUME & X-CURL', NULL, '19915.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1194900.0000', '60.0000', '2018-01-13', 'received', '19915.0000', '19915.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6369, 14, NULL, 2431, '8806173424627', 'BEAUTY TOOL EYELASH 01 NATURAL & STRAIGHT', NULL, '19915.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1194900.0000', '60.0000', '2018-01-13', 'received', '19915.0000', '19915.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6368, 14, NULL, 2470, '8806173420810', 'BOTANICAL SIMPLE MAKING GEL EYELINER 2 DARK BROWN', NULL, '67710.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4062600.0000', '60.0000', '2018-01-13', 'received', '67710.0000', '67710.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6367, 14, NULL, 2195, '8806173416219', 'SOOTHING & MOISTURE ALOE VERA 80% EMULSION', NULL, '70099.0000', '180.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '12617820.0000', '180.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '180.0000'),
(6366, 14, NULL, 2487, '8806173420896', 'PROVENCE CREAMY GEL EYELINER 06 PINK SHIMMER', NULL, '63727.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823620.0000', '60.0000', '2018-01-13', 'received', '63727.0000', '63727.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6365, 14, NULL, 2486, '8806173420872', 'PROVENCE CREAMY GEL EYELINER 04 GOLDEN KHAKI', NULL, '63727.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823620.0000', '60.0000', '2018-01-13', 'received', '63727.0000', '63727.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6364, 14, NULL, 2485, '8806173420865', 'PROVENCE CREAMY GEL EYELINER 03 CHOCO BROWN', NULL, '63727.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823620.0000', '60.0000', '2018-01-13', 'received', '63727.0000', '63727.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6363, 14, NULL, 2483, '8806173420841', 'PROVENCE CREAMY GEL EYELINER 01 BLACK', NULL, '63727.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823620.0000', '60.0000', '2018-01-13', 'received', '63727.0000', '63727.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6362, 14, NULL, 2482, '8806173416332', 'ULTRA MASCARA 02 CURLING', NULL, '46999.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4511904.0000', '96.0000', '2018-01-13', 'received', '46999.0000', '46999.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6361, 14, NULL, 2481, '8806173427314', 'BATH & NATURE GREENTEA BODY LOTION', NULL, '95590.0000', '54.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5161860.0000', '54.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '54.0000'),
(6359, 14, NULL, 2324, '8806173418954', 'ECO CRAYON LIP ROUGE 02 BERRY PINK', NULL, '47795.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5735400.0000', '120.0000', '2018-01-13', 'received', '47795.0000', '47795.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6360, 14, NULL, 2194, '8806173424887', 'BLACKHEAD CLEAR  NOSE PACK(1EA)', NULL, '3983.0000', '1500.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5974500.0000', '1500.0000', '2018-01-13', 'received', '3983.0000', '3983.0000', NULL, NULL, NULL, 2, 'pcs', '1500.0000'),
(6358, 14, NULL, 2466, '8806173418947', 'ECO CRAYON LIP ROUGE 01 CANDY PINK', NULL, '47795.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5735400.0000', '120.0000', '2018-01-13', 'received', '47795.0000', '47795.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6357, 14, NULL, 2464, '8806173422043', 'NATURAL BUTTER LIPBALM 01 CHERRY', NULL, '54964.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3957408.0000', '72.0000', '2018-01-13', 'received', '54964.0000', '54964.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6356, 14, NULL, 2449, '8806173423378', 'BY FLOWER BLUSHER 06 STARLIGHT', NULL, '55761.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3345660.0000', '60.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6355, 14, NULL, 2316, '8806173423361', 'BY FLOWER BLUSHER 05 SHY LILAC', NULL, '55761.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3345660.0000', '60.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6354, 14, NULL, 2446, '8806173423323', 'BY FLOWER BLUSHER 01 PINK BLOSSOM', NULL, '55761.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3345660.0000', '60.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6353, 14, NULL, 2193, '8806173425211', 'SNAIL SOLUTION HYDROGEL EYE PATCH', NULL, '23898.0000', '280.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6691440.0000', '280.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '280.0000'),
(6351, 14, NULL, 2427, '8806173419715', 'ECO LIPGLOSS 03CHERRY', NULL, '61337.0000', '45.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2760165.0000', '45.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '45.0000'),
(6352, 14, NULL, 2430, '8806173422838', 'ARGAN ESSENTIAL OIL HAIR MIST', NULL, '61337.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5888352.0000', '96.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6350, 14, NULL, 2304, '8806173419685', 'ECO LIPGLOSS 06RED', NULL, '61337.0000', '63.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3864231.0000', '63.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '63.0000'),
(6349, 14, NULL, 2192, '8806173417018', 'REAL NATURE SHEA BUTTER MASK SHEET', NULL, '7577.0000', '2400.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '18184800.0000', '2400.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '2400.0000'),
(6348, 14, NULL, 2191, '8806173433438', 'GLITTER LINER 03 COCKTAIL PINK', NULL, '55761.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2230440.0000', '40.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6347, 14, NULL, 2190, '8806173434909', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 10 ALMOND', NULL, '95590.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4588320.0000', '48.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6346, 14, NULL, 2547, '8806173434879', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 07 COZY PINK', NULL, '95590.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823600.0000', '40.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6345, 14, NULL, 2542, '8806173434817', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 01 LIGHT BEIGE SPF37PA++', NULL, '95590.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4588320.0000', '48.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6344, 14, NULL, 2415, '8806173440689', 'PURE BUD RELIEF FOAM CLEANSER(FOR ALL SKIN TYPES)', NULL, '54964.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3077984.0000', '56.0000', '2018-01-13', 'received', '54964.0000', '54964.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6343, 14, NULL, 2368, '8806173435241', 'PROVENCE AIR SKIN FIT BB CREAM 02 NATURAL BEIGE SPF35PA++', NULL, '102759.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4110360.0000', '40.0000', '2018-01-13', 'received', '102759.0000', '102759.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6342, 14, NULL, 2537, '8806173434015', 'MICRO SLIM BROW PENCIL 03 SOFT BROWN', NULL, '55761.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3122616.0000', '56.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6340, 14, NULL, 2363, '8806173436002', 'NATURE ORIGIN PRIMER 03 HYDRATING', NULL, '126656.0000', '42.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5319552.0000', '42.0000', '2018-01-13', 'received', '126656.0000', '126656.0000', NULL, NULL, NULL, 2, 'pcs', '42.0000'),
(6341, 14, NULL, 2535, '8806173433995', 'MICRO SLIM BROW PENCIL 01 PEANUT BROWN', NULL, '55761.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3122616.0000', '56.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6339, 14, NULL, 2526, '8806173437382', 'LONGLASTING SMUDGE SHADOW STICK 07 CITY LIGHT', NULL, '55761.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3122616.0000', '56.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6338, 14, NULL, 2522, '8806173434626', 'BOTANICAL CUSHION BLUSHER 01 PINK', NULL, '86828.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4167744.0000', '48.0000', '2018-01-13', 'received', '86828.0000', '86828.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6337, 14, NULL, 2519, '8806173439157', 'MULTIPLE 3D ALL IN ONE BROW 03 ASH MOCHA', NULL, '78862.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4731720.0000', '60.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6336, 14, NULL, 2518, '8806173439140', 'MULTIPLE 3D ALL IN ONE BROW 02 CHOCO BROWNIE', NULL, '78862.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4731720.0000', '60.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6335, 14, NULL, 2517, '8806173439133', 'MULTIPLE 3D ALL IN ONE BROW 01 PEANUT LATTE', NULL, '78862.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4731720.0000', '60.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6334, 14, NULL, 2347, '8806173437887', 'VITAMIN B5 ESSENCE', NULL, '198348.0000', '64.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '12694272.0000', '64.0000', '2018-01-13', 'received', '198348.0000', '198348.0000', NULL, NULL, NULL, 2, 'pcs', '64.0000'),
(6333, 14, NULL, 2189, '8806173437405', 'GINSENG ROYAL SILK MASCARA & FIXER', NULL, '183213.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7328520.0000', '40.0000', '2018-01-13', 'received', '183213.0000', '183213.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6332, 14, NULL, 2505, '8806173440276', 'BYFLOWER TRIPLE MOUSSE TINT 06 FUCHSIA PINK MOUSSE', NULL, '79658.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823584.0000', '48.0000', '2018-01-13', 'received', '79658.0000', '79658.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6331, 14, NULL, 2504, '8806173434954', 'PROVENCE AIR SKIN FIT MAKEUP BASE 02 GREEN SPF30PA++', NULL, '102759.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4110360.0000', '40.0000', '2018-01-13', 'received', '102759.0000', '102759.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6329, 14, NULL, 2496, '8806173437054', 'BYFLOWER TRIPLE MOUSSE TINT 04 CHIC RED MOUSSE', NULL, '79658.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823584.0000', '48.0000', '2018-01-13', 'received', '79658.0000', '79658.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6330, 14, NULL, 2405, '8806173440665', 'PURE BUD RELIEF FOAM CLEANSER(FOR DRY SKIN)', NULL, '54964.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3077984.0000', '56.0000', '2018-01-13', 'received', '54964.0000', '54964.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6328, 14, NULL, 2340, '8806173437368', 'CRYSTAL EYE TINT 07 LOVE MAPLE', NULL, '71693.0000', '63.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4516659.0000', '63.0000', '2018-01-13', 'received', '71693.0000', '71693.0000', NULL, NULL, NULL, 2, 'pcs', '63.0000'),
(6327, 14, NULL, 2188, '8806173426324', 'PROVENCE ALL IN ONE DUAL STRETCH MASCARA', NULL, '143385.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '8603100.0000', '60.0000', '2018-01-13', 'received', '143385.0000', '143385.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6326, 14, NULL, 2469, '8806173419043', 'BYFLOWER TRIPLE VOLUME TINT 06 ROSE', NULL, '79658.0000', '54.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4301532.0000', '54.0000', '2018-01-13', 'received', '79658.0000', '79658.0000', NULL, NULL, NULL, 2, 'pcs', '54.0000'),
(6325, 14, NULL, 2187, '8806173419036', 'BYFLOWER TRIPLE VOLUME TINT 05 CAMELLIA', NULL, '79658.0000', '54.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4301532.0000', '54.0000', '2018-01-13', 'received', '79658.0000', '79658.0000', NULL, NULL, NULL, 2, 'pcs', '54.0000'),
(6324, 14, NULL, 2468, '8806173418985', 'ECO CRAYON LIP ROUGE 05 BURGUNDY RED', NULL, '47795.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5735400.0000', '120.0000', '2018-01-13', 'received', '47795.0000', '47795.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6323, 14, NULL, 2467, '8806173418961', 'ECO CRAYON LIP ROUGE 03 PEACH CORAL', NULL, '47795.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5735400.0000', '120.0000', '2018-01-13', 'received', '47795.0000', '47795.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6322, 14, NULL, 2551, '8806173433704', 'BEAUTY TOOL EYE BROW ANGLE BRUSH', NULL, '27881.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1672860.0000', '60.0000', '2018-01-13', 'received', '27881.0000', '27881.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6320, 14, NULL, 2376, '8806173433926', 'BEAUTY TOOL BLEMISH EXTRACTOR', NULL, '23898.0000', '45.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1075410.0000', '45.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '45.0000'),
(6321, 14, NULL, 2186, '8806173435142', 'BEAUTY TOOL COTTON SWAB 300PCS', NULL, '7959.0000', '400.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3183600.0000', '400.0000', '2018-01-13', 'received', '7959.0000', '7959.0000', NULL, NULL, NULL, 2, 'pcs', '400.0000'),
(6319, 14, NULL, 2529, '8806173433797', 'BEAUTY TOOL LIP AND CONCEALER BRUSH', NULL, '23898.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1433880.0000', '60.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6318, 14, NULL, 2525, '8806173433940', 'BEAUTY TOOL FLAWLESS NBR PUFF 2P', NULL, '14339.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '860340.0000', '60.0000', '2018-01-13', 'received', '14339.0000', '14339.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6317, 14, NULL, 2185, '8806173435128', 'BEAUTY TOOL NATURAL WATER JET COTTON', NULL, '19896.0000', '100.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1989600.0000', '100.0000', '2018-01-13', 'received', '19896.0000', '19896.0000', NULL, NULL, NULL, 2, 'pcs', '100.0000'),
(6316, 14, NULL, 2500, '8806173433933', 'BEAUTY TOOL SHOWER BALL', NULL, '15932.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '955920.0000', '60.0000', '2018-01-13', 'received', '15932.0000', '15932.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6315, 14, NULL, 2456, '8806173432295', 'BEAUTY TOOL EYE BROW RAZOR(FOLDABLE)(2P)', NULL, '18626.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1117560.0000', '60.0000', '2018-01-13', 'received', '18626.0000', '18626.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6314, 14, NULL, 2451, '8806173432349', 'BEAUTY TOOL FOUNTAIN PEN TYPE LIP BRUSH', NULL, '23898.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1433880.0000', '60.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6313, 14, NULL, 2434, '8806173425167', 'BEAUTY TOOL EYELASH 04 INDIVIDUAL EYELASHES (8mm)', NULL, '19915.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1194900.0000', '60.0000', '2018-01-13', 'received', '19915.0000', '19915.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6312, 14, NULL, 2184, '8806173420889', 'PROVENCE CREAMY GEL EYELINER 05 BURGUNDY', NULL, '63727.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823620.0000', '60.0000', '2018-01-13', 'received', '63727.0000', '63727.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6311, 14, NULL, 2484, '8806173420858', 'PROVENCE CREAMY GEL EYELINER 02 BROWN', NULL, '63727.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823620.0000', '60.0000', '2018-01-13', 'received', '63727.0000', '63727.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6310, 14, NULL, 2183, '8806173422203', 'CREAMY LIPSTICK 07 IT\'S MY PINK(R)', NULL, '95590.0000', '54.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5161860.0000', '54.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '54.0000'),
(6309, 14, NULL, 2182, '8806173426454', 'REAL NATURE HONEY ESSENCE', NULL, '99573.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7169256.0000', '72.0000', '2018-01-13', 'received', '99573.0000', '99573.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6308, 14, NULL, 2224, '8806173426447', 'REAL NATURE ROSE ESSENCE', NULL, '99573.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9559008.0000', '96.0000', '2018-01-13', 'received', '99573.0000', '99573.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6307, 14, NULL, 2223, '8806173426430', 'REAL NATURE OLIVE ESSENCE', NULL, '99573.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '11948760.0000', '120.0000', '2018-01-13', 'received', '99573.0000', '99573.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6306, 14, NULL, 2473, '8806173416394', 'BOTANICAL SKINNY AUTO EYELINER 01 BLACK', NULL, '62930.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3775800.0000', '60.0000', '2018-01-13', 'received', '62930.0000', '62930.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6265, 14, NULL, 2280, '8806173438303', 'FRESH HERB SNAIIL CLEANSING FOAM', NULL, '26288.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3154560.0000', '120.0000', '2018-01-13', 'received', '26288.0000', '26288.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6266, 14, NULL, 2286, '8806173439041', 'SOOTHING & MOISTURE ALOE VERA FOAM CLEANSER', NULL, '35050.0000', '180.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6309000.0000', '180.0000', '2018-01-13', 'received', '35050.0000', '35050.0000', NULL, NULL, NULL, 2, 'pcs', '180.0000'),
(6305, 14, NULL, 2181, '8806173424351', 'AQUA COLLAGEN SOLUTION MARINE HYDRO GEL MASK', NULL, '35847.0000', '400.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '14338800.0000', '400.0000', '2018-01-13', 'received', '35847.0000', '35847.0000', NULL, NULL, NULL, 2, 'pcs', '400.0000'),
(6304, 14, NULL, 2180, '8806173422074', 'NATURAL BUTTER LIPBALM 04 MANGO', NULL, '54964.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3957408.0000', '72.0000', '2018-01-13', 'received', '54964.0000', '54964.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6303, 14, NULL, 2318, '8806173423392', 'BY FLOWER BLUSHER 08 CINNAMON MOCHA', NULL, '55761.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3345660.0000', '60.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6302, 14, NULL, 2315, '8806173423354', 'BY FLOWER BLUSHER 04 CANDY ROSE', NULL, '55761.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3345660.0000', '60.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6301, 14, NULL, 2444, '8806173430277', 'KISS MY LIP OIL 02 RASPBERRY', NULL, '78862.0000', '54.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4258548.0000', '54.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '54.0000'),
(6300, 14, NULL, 2443, '8806173430260', 'KISS MY LIP OIL 01 SWEET HONEY', NULL, '78862.0000', '45.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3548790.0000', '45.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '45.0000'),
(6299, 14, NULL, 2179, '8806173425198', 'AQUA COLLAGEN SOLUTION MARINE HYDROGEL EYE PATCH(R)', NULL, '19915.0000', '280.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5576200.0000', '280.0000', '2018-01-13', 'received', '19915.0000', '19915.0000', NULL, NULL, NULL, 2, 'pcs', '280.0000'),
(6298, 14, NULL, 2178, '8806173424344', 'BAMBOO CHARCOAL BLACK MASK SHEET', NULL, '23898.0000', '400.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9559200.0000', '400.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '400.0000'),
(6297, 14, NULL, 2425, '8806173419692', 'ECO LIPGLOSS 05ROSE', NULL, '61337.0000', '63.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3864231.0000', '63.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '63.0000'),
(6296, 14, NULL, 2534, '8806173435777', 'BYFLOWER TRIPLE MOUSSE TINT 03 PINK MOUSSE', NULL, '79658.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823584.0000', '48.0000', '2018-01-13', 'received', '79658.0000', '79658.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6295, 14, NULL, 2533, '8806173435760', 'BYFLOWER TRIPLE MOUSSE TINT 02 ORANGE MOUSSE', NULL, '79658.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823584.0000', '48.0000', '2018-01-13', 'received', '79658.0000', '79658.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6294, 14, NULL, 2532, '8806173435753', 'BYFLOWER TRIPLE MOUSSE TINT 01 RED MOUSSE', NULL, '79658.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823584.0000', '48.0000', '2018-01-13', 'received', '79658.0000', '79658.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6293, 14, NULL, 2527, '8806173437399', 'LONGLASTING SMUDGE SHADOW STICK 08 GENTLE COCOA', NULL, '55761.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3122616.0000', '56.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6292, 14, NULL, 2237, '8806173440917', 'CALIFORNIA ALOE WATERPROOF SUN BLOCK SPF50+PA++++', NULL, '122674.0000', '80.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9813920.0000', '80.0000', '2018-01-13', 'received', '122674.0000', '122674.0000', NULL, NULL, NULL, 2, 'pcs', '80.0000'),
(6291, 14, NULL, 2511, '8806173441679', 'REAL MATTE LIPSTICK 06 FUCHSIA CRUSH', NULL, '119487.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5735376.0000', '48.0000', '2018-01-13', 'received', '119487.0000', '119487.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000');
INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`) VALUES
(6290, 14, NULL, 2345, '8806173441631', 'REAL MATTE LIPSTICK 02 BRICK ORANGE', NULL, '119487.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4779480.0000', '40.0000', '2018-01-13', 'received', '119487.0000', '119487.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6289, 14, NULL, 2506, '8806173440283', 'BYFLOWER TRIPLE MOUSSE TINT 07 MILKY PINK MOUSSE', NULL, '79658.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823584.0000', '48.0000', '2018-01-13', 'received', '79658.0000', '79658.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6288, 14, NULL, 2177, '8806173438273', 'REAL FRESH BROWN SUGAR FACIAL SCRUB MASK', NULL, '150554.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '8431024.0000', '56.0000', '2018-01-13', 'received', '150554.0000', '150554.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6287, 14, NULL, 2233, '8806173435197', 'PROVENCE INTENSIVE AMPOULE MAKE UP BASE 01 MINT SPF30 PA++', NULL, '150554.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6022160.0000', '40.0000', '2018-01-13', 'received', '150554.0000', '150554.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6286, 14, NULL, 2227, '8806173434282', 'SNAIL SOLUTION EYE CREAM(C)', NULL, '262871.0000', '84.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '22081164.0000', '84.0000', '2018-01-13', 'received', '262871.0000', '262871.0000', NULL, NULL, NULL, 2, 'pcs', '84.0000'),
(6268, 14, NULL, 2288, '8806173435203', 'PROVENCE INTENSIVE AMPOULE MAKE UP BASE 02 LAVENDER SPF30 PA++', NULL, '150554.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6022160.0000', '40.0000', '2018-01-13', 'received', '150554.0000', '150554.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6269, 14, NULL, 2297, '8806173435227', 'PROVENCE INTENSIVE AMPOULE FOUNDATION 02 NATURAL BEIGE SPF30 PA++', NULL, '150554.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6022160.0000', '40.0000', '2018-01-13', 'received', '150554.0000', '150554.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6270, 14, NULL, 2381, '8806173436033', 'GINSENG ROYAL SILK PRIMER', NULL, '238974.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9558960.0000', '40.0000', '2018-01-13', 'received', '238974.0000', '238974.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6271, 14, NULL, 2210, '8806173417025', 'REAL NATURE OLIVE MASK SHEET', NULL, '7577.0000', '2400.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '18184800.0000', '2400.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '2400.0000'),
(6272, 14, NULL, 2258, '8806173417032', 'REAL NATURE BAMBOO MASK SHEET', NULL, '7577.0000', '2400.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '18184800.0000', '2400.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '2400.0000'),
(6273, 14, NULL, 2212, '8806173417063', 'REAL NATURE ROSE MASK SHEET', NULL, '7577.0000', '2000.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '15154000.0000', '2000.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '2000.0000'),
(6274, 14, NULL, 2213, '8806173417100', 'REAL NATURE TEA TREE MASK SHEET', NULL, '7577.0000', '2000.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '15154000.0000', '2000.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '2000.0000'),
(6275, 14, NULL, 2303, '8806173424153', 'REAL SQUEEZE ALOE VERA ESSENCE', NULL, '134622.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '16154640.0000', '120.0000', '2018-01-13', 'received', '134622.0000', '134622.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6276, 14, NULL, 2307, '8806173425686', 'CALIFORNIA ALOE VERA 74 COOLING EYE SERUM', NULL, '86828.0000', '180.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '15629040.0000', '180.0000', '2018-01-13', 'received', '86828.0000', '86828.0000', NULL, NULL, NULL, 2, 'pcs', '180.0000'),
(6277, 14, NULL, 2269, '8806173424672', 'FRESH GREEN TEA 70 EMULSION', NULL, '78862.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9463440.0000', '120.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6278, 14, NULL, 2277, '8806173423231', 'GREEN DERMA MILD LOTION', NULL, '119487.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5735376.0000', '48.0000', '2018-01-13', 'received', '119487.0000', '119487.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6279, 14, NULL, 2335, '8806173421626', 'BOTANICAL GREEN TEA PORE PACT', NULL, '79658.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4779480.0000', '60.0000', '2018-01-13', 'received', '79658.0000', '79658.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6280, 14, NULL, 2337, '8806173421572', 'NATURE ORIGIN CC BRIGHTENING SPF30 PA++', NULL, '111521.0000', '84.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9367764.0000', '84.0000', '2018-01-13', 'received', '111521.0000', '111521.0000', NULL, NULL, NULL, 2, 'pcs', '84.0000'),
(6281, 14, NULL, 2301, '8806173416967', 'REAL NATURE CHAMOMILE MASK SHEET', NULL, '7577.0000', '2000.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '15154000.0000', '2000.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '2000.0000'),
(6282, 14, NULL, 2256, '8806173416981', 'REAL NATURE GREEN TEA MASK SHEET', NULL, '7577.0000', '2400.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '18184800.0000', '2400.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '2400.0000'),
(6283, 14, NULL, 2454, '8806173430758', 'BEAUTY TOOL NAIL FILE', NULL, '11949.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '716940.0000', '60.0000', '2018-01-13', 'received', '11949.0000', '11949.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6284, 14, NULL, 2296, '8806173435180', 'BEAUTY TOOL EYELASH CURLER', NULL, '27881.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1672860.0000', '60.0000', '2018-01-13', 'received', '27881.0000', '27881.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6285, 14, NULL, 2176, '8806173431892', 'AQUA COLLAGEN SOLUTION MARINE HYDROGEL EYE CREAM MASK', NULL, '23898.0000', '300.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7169400.0000', '300.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '300.0000'),
(6267, 14, NULL, 2287, '8806173441211', 'AFRICA BIRD HOMME ALL IN ONE PERFECT FOAM', NULL, '95590.0000', '42.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4014780.0000', '42.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '42.0000'),
(6116, 14, NULL, 2257, '8806173416998', 'REAL NATURE ALOE MASK SHEET', NULL, '7577.0000', '4800.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '36369600.0000', '4800.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '4800.0000'),
(6117, 14, NULL, 2132, '8806173418015', 'BAMBOO CHARCOAL NOSE & T-ZONE PACK', NULL, '78862.0000', '900.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '70975800.0000', '900.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '900.0000'),
(6118, 14, NULL, 2261, '8806173424450', 'REAL SQUEEZE ALOE VERA MOISTURE FOOT MASK', NULL, '27881.0000', '250.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6970250.0000', '250.0000', '2018-01-13', 'received', '27881.0000', '27881.0000', NULL, NULL, NULL, 2, 'pcs', '250.0000'),
(6119, 14, NULL, 2264, '8806173427307', 'BATH & NATURE GRAPEFRUIT BODY LOTION', NULL, '95590.0000', '54.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5161860.0000', '54.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '54.0000'),
(6120, 14, NULL, 2313, '8806173427451', 'FOOT & NATURE COCONUT MOISTURE FOOT CREM', NULL, '55761.0000', '36.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2007396.0000', '36.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '36.0000'),
(6121, 14, NULL, 2323, '8806173422067', 'NATURAL BUTTER LIPBALM 03 GRAPEFRUIT', NULL, '54964.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3957408.0000', '72.0000', '2018-01-13', 'received', '54964.0000', '54964.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6122, 14, NULL, 2271, '8806173418978', 'ECO CRAYON LIP ROUGE 04 SCARLET ORANGE', NULL, '47795.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5735400.0000', '120.0000', '2018-01-13', 'received', '47795.0000', '47795.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6123, 14, NULL, 2326, '8806173426409', 'REAL NATURE OLIVE AMPOULE', NULL, '99573.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7169256.0000', '72.0000', '2018-01-13', 'received', '99573.0000', '99573.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6124, 14, NULL, 2328, '8806173426423', 'REAL NATURE HONEY AMPOULE', NULL, '99573.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '11948760.0000', '120.0000', '2018-01-13', 'received', '99573.0000', '99573.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6125, 14, NULL, 2133, '8806173414123', 'SOOTHING & MOISTURE ALOE VERA 92% SOOTHING GEL MIST', NULL, '43812.0000', '180.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7886160.0000', '180.0000', '2018-01-13', 'received', '43812.0000', '43812.0000', NULL, NULL, NULL, 2, 'pcs', '180.0000'),
(6126, 14, NULL, 2263, '8806173425464', 'ARGAN 20º ESSENTIAL TONER', NULL, '118691.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '8545752.0000', '72.0000', '2018-01-13', 'received', '118691.0000', '118691.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6127, 14, NULL, 2245, '8806173436149', 'HIMALAYA SALT CLEANSING BALM_WHITE SALT', NULL, '118691.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4747640.0000', '40.0000', '2018-01-13', 'received', '118691.0000', '118691.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6128, 14, NULL, 2134, '8806173439065', 'HERB BLENDING MIST', NULL, '86828.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4167744.0000', '48.0000', '2018-01-13', 'received', '86828.0000', '86828.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6129, 14, NULL, 2232, '8806173434114', 'BEAUTY TOOL PENCIL SHARPENER', NULL, '7966.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '477960.0000', '60.0000', '2018-01-13', 'received', '7966.0000', '7966.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6130, 14, NULL, 2348, '8806173435159', 'BEAUTY TOOL EYEBROW DUAL BRUSH', NULL, '31864.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1911840.0000', '60.0000', '2018-01-13', 'received', '31864.0000', '31864.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6131, 14, NULL, 2372, '8806173433674', 'BEAUTY TOOL EMERY BOARD (R)', NULL, '7966.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '477960.0000', '60.0000', '2018-01-13', 'received', '7966.0000', '7966.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6132, 14, NULL, 2250, '8806173433520', 'BEAUTY TOOL BLOCK SHADOW TIP', NULL, '19915.0000', '30.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '597450.0000', '30.0000', '2018-01-13', 'received', '19915.0000', '19915.0000', NULL, NULL, NULL, 2, 'pcs', '30.0000'),
(6133, 14, NULL, 2135, '8806173431441', 'GINSENG ROYAL SILK AMPOULE', NULL, '955894.0000', '20.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '19117880.0000', '20.0000', '2018-01-13', 'received', '955894.0000', '955894.0000', NULL, NULL, NULL, 2, 'pcs', '20.0000'),
(6134, 14, NULL, 2136, '8806173437153', 'REAL NATURE ALOE HYDROGEL MASK', NULL, '15543.0000', '1000.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '15543000.0000', '1000.0000', '2018-01-13', 'received', '15543.0000', '15543.0000', NULL, NULL, NULL, 2, 'pcs', '1000.0000'),
(6135, 14, NULL, 2137, '8806173437191', 'REAL NATURE GRAPEFRUIT HYDROGEL MASK', NULL, '15543.0000', '600.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9325800.0000', '600.0000', '2018-01-13', 'received', '15543.0000', '15543.0000', NULL, NULL, NULL, 2, 'pcs', '600.0000'),
(6136, 14, NULL, 2234, '8806173434367', 'HAWAIIAN DEEP SEA MILD SCRUB FOAM CLEANSER', NULL, '70099.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2803960.0000', '40.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6137, 14, NULL, 2239, '8806173437863', 'VITAMIN B5 TONER', NULL, '150554.0000', '64.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9635456.0000', '64.0000', '2018-01-13', 'received', '150554.0000', '150554.0000', NULL, NULL, NULL, 2, 'pcs', '64.0000'),
(6138, 14, NULL, 2138, '8806173437238', 'REAL NATURE MANUKA HONEY HYDROGEL MASK', NULL, '15543.0000', '600.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9325800.0000', '600.0000', '2018-01-13', 'received', '15543.0000', '15543.0000', NULL, NULL, NULL, 2, 'pcs', '600.0000'),
(6139, 14, NULL, 2379, '8806173436699', 'HERB BLENDING CREAM', NULL, '214280.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '11999680.0000', '56.0000', '2018-01-13', 'received', '214280.0000', '214280.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6140, 14, NULL, 2139, '8806173425808', 'COCONUT BIO SKIN MASK [PORE CARE]', NULL, '23898.0000', '400.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9559200.0000', '400.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '400.0000'),
(6141, 14, NULL, 2329, '8806173420018', 'GINSENG ROYAL SILK WATERY CREAM', NULL, '525742.0000', '64.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '33647488.0000', '64.0000', '2018-01-13', 'received', '525742.0000', '525742.0000', NULL, NULL, NULL, 2, 'pcs', '64.0000'),
(6142, 14, NULL, 2274, '8806173429202', 'GREEK YOGURT PACK_ORANGE (WHITENING)', NULL, '78862.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7570752.0000', '96.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6143, 14, NULL, 2333, '8806173425853', 'GINSENG ROYAL SILK TONER', NULL, '302700.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '18162000.0000', '60.0000', '2018-01-13', 'received', '302700.0000', '302700.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6144, 14, NULL, 2334, '8806173425860', 'GINSENG ROYAL SILK EMULSION', NULL, '302700.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '18162000.0000', '60.0000', '2018-01-13', 'received', '302700.0000', '302700.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6145, 14, NULL, 2140, '8806173420025', 'GINSENG ROYAL SILK ESSENCE', NULL, '438118.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '26287080.0000', '60.0000', '2018-01-13', 'received', '438118.0000', '438118.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6146, 14, NULL, 2141, '8806173428823', 'GREEN DERMA MILD PEELING GEL', NULL, '102759.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4932432.0000', '48.0000', '2018-01-13', 'received', '102759.0000', '102759.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6147, 14, NULL, 2251, '8806173436668', 'HERB BLENDING TONER', NULL, '182417.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '10215352.0000', '56.0000', '2018-01-13', 'received', '182417.0000', '182417.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6148, 14, NULL, 2142, '8806173430765', 'BEAUTY TOOL BATH TOWEL', NULL, '26045.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1562700.0000', '60.0000', '2018-01-13', 'received', '26045.0000', '26045.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6149, 14, NULL, 2441, '8806173430789', 'BEAUTY TOOL NATURAL JELLY BODY SPONGE', NULL, '55761.0000', '36.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2007396.0000', '36.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '36.0000'),
(6150, 14, NULL, 2321, '8806173432356', 'BEAUTY TOOL 20 PACKS MAKE UP PUFF (20P)', NULL, '27881.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1672860.0000', '60.0000', '2018-01-13', 'received', '27881.0000', '27881.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6151, 14, NULL, 2350, '8806173433827', 'BEAUTY TOOL NAIL REMOVER BOTTLE', NULL, '23898.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '1433880.0000', '60.0000', '2018-01-13', 'received', '23898.0000', '23898.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6152, 14, NULL, 2357, '8806173433957', 'BEAUTY TOOL SOFT-TOUCH POWDER PUFF', NULL, '14339.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '860340.0000', '60.0000', '2018-01-13', 'received', '14339.0000', '14339.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6153, 14, NULL, 2358, '8806173433964', 'BEAUTY TOOL ELASTIC CARRON PUFF', NULL, '11949.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '716940.0000', '60.0000', '2018-01-13', 'received', '11949.0000', '11949.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6154, 14, NULL, 2361, '8806173434107', 'BEAUTY TOOL PRECISION ELLIPSE PUFF 2P', NULL, '11949.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '716940.0000', '60.0000', '2018-01-13', 'received', '11949.0000', '11949.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6155, 14, NULL, 2143, '8806173431458', 'COCONUT BIO SKIN MULTI PATCH', NULL, '7170.0000', '500.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3585000.0000', '500.0000', '2018-01-13', 'received', '7170.0000', '7170.0000', NULL, NULL, NULL, 2, 'pcs', '500.0000'),
(6156, 14, NULL, 2218, '8806173432936', 'PURE SHINE JELLY FIT TINT 03 PLUMPING BERRY', NULL, '46999.0000', '84.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3947916.0000', '84.0000', '2018-01-13', 'received', '46999.0000', '46999.0000', NULL, NULL, NULL, 2, 'pcs', '84.0000'),
(6157, 14, NULL, 2279, '8806173437573', 'YULI FOAM CLEANSER', NULL, '159316.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6372640.0000', '40.0000', '2018-01-13', 'received', '159316.0000', '159316.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6158, 14, NULL, 2144, '8806173434398', 'HAWAIIAN DEEP SEA AHA CLEANSING LOTION', NULL, '86828.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3473120.0000', '40.0000', '2018-01-13', 'received', '86828.0000', '86828.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6159, 14, NULL, 2145, '8806173435005', 'PROVENCE AIR SKIN FIT BLUR PACT SPF30 PA+++', NULL, '102759.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4110360.0000', '40.0000', '2018-01-13', 'received', '102759.0000', '102759.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6160, 14, NULL, 2501, '8806173440047', 'REAL SUPER GRAIN CLEANSING WATER SPECIAL SET', NULL, '78862.0000', '64.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5047168.0000', '64.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '64.0000'),
(6161, 14, NULL, 2146, '8806173438259', 'REAL FRESH BLACK TEA NOURISHING MASK', NULL, '118691.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6646696.0000', '56.0000', '2018-01-13', 'received', '118691.0000', '118691.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6162, 14, NULL, 2406, '8806173434947', 'PROVENCE AIR SKIN FIT MAKEUP BASE 01 PINK SPF30PA++', NULL, '102759.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4110360.0000', '40.0000', '2018-01-13', 'received', '102759.0000', '102759.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6163, 14, NULL, 2236, '8806173440894', 'CALIFORNIA ALOE DAILY SUN BLOCK SPF50+PA++++', NULL, '126656.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '12158976.0000', '96.0000', '2018-01-13', 'received', '126656.0000', '126656.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6164, 14, NULL, 2290, '8806173440962', 'CALIFORNIA ALOE AQUA SUN GEL SPF50+PA++++', NULL, '100369.0000', '80.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '8029520.0000', '80.0000', '2018-01-13', 'received', '100369.0000', '100369.0000', NULL, NULL, NULL, 2, 'pcs', '80.0000'),
(6165, 14, NULL, 2291, '8806173437894', 'VITAMIN B5 CREAM', NULL, '198348.0000', '64.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '12694272.0000', '64.0000', '2018-01-13', 'received', '198348.0000', '198348.0000', NULL, NULL, NULL, 2, 'pcs', '64.0000'),
(6166, 14, NULL, 2409, '8806173433360', 'REAL SQUEEZE ALOE VERA AIR MIST', NULL, '95590.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9176640.0000', '96.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6167, 14, NULL, 2147, '8806173437207', 'REAL NATURE GREEN GRAPE HYDROGEL MASK', NULL, '15543.0000', '600.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9325800.0000', '600.0000', '2018-01-13', 'received', '15543.0000', '15543.0000', NULL, NULL, NULL, 2, 'pcs', '600.0000'),
(6168, 14, NULL, 2148, '8806173433599', 'SMUDGE PROOF EYELINER 01 DEEP BLACK', NULL, '78862.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4416272.0000', '56.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6169, 14, NULL, 2246, '8806173433605', 'SMUDGE PROOF EYELINER 02 DEEP BROWN', NULL, '75433.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4224248.0000', '56.0000', '2018-01-13', 'received', '75433.0000', '75433.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6170, 14, NULL, 2414, '8806173437795', 'SNAIL SOLUTION CREAM(C)(R)', NULL, '262871.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '14720776.0000', '56.0000', '2018-01-13', 'received', '262871.0000', '262871.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6171, 14, NULL, 2247, '8806173436774', 'PURE SHINE LIPSTICK 12 ORCHID BLOSSOM', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6172, 14, NULL, 2417, '8806173434299', 'SNAIL SOLUTION AMPOULE(RR)(C)', NULL, '238974.0000', '80.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '19117920.0000', '80.0000', '2018-01-13', 'received', '238974.0000', '238974.0000', NULL, NULL, NULL, 2, 'pcs', '80.0000'),
(6173, 14, NULL, 2419, '8806173433735', 'SNAIL SOLUTION EMULSION(C)', NULL, '199145.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '19117920.0000', '96.0000', '2018-01-13', 'received', '199145.0000', '199145.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6174, 14, NULL, 2252, '8806173436675', 'HERB BLENDING EMULSION', NULL, '182417.0000', '80.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '14593360.0000', '80.0000', '2018-01-13', 'received', '182417.0000', '182417.0000', NULL, NULL, NULL, 2, 'pcs', '80.0000'),
(6175, 14, NULL, 2298, '8806173436682', 'HERB BLENDING ESSENCE', NULL, '198348.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '11107488.0000', '56.0000', '2018-01-13', 'received', '198348.0000', '198348.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6176, 14, NULL, 2420, '8806173438808', 'ARGAN ESSENTIAL DEEP CARE SHAMPOO', NULL, '78862.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7570752.0000', '96.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6177, 14, NULL, 2300, '8806173433261', 'PURE SHINE LIPSTICK 04 PINK CHOUX CREAM', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6178, 14, NULL, 2259, '8806173422845', 'ARGAN ESSENTIAL HYDRO HAIR ESSENCE', NULL, '55761.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5353056.0000', '96.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6179, 14, NULL, 2149, '8806173424177', 'REAL SQUEEZE ALOE VERA CREAM', NULL, '134622.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '16154640.0000', '120.0000', '2018-01-13', 'received', '134622.0000', '134622.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6180, 14, NULL, 2150, '8806173425204', 'AQUA COLLAGEN SOLUTION MARINE HYDROGEL LIP PATCH(R)', NULL, '19915.0000', '350.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6970250.0000', '350.0000', '2018-01-13', 'received', '19915.0000', '19915.0000', NULL, NULL, NULL, 2, 'pcs', '350.0000'),
(6181, 14, NULL, 2151, '8806173431168', 'PURE SHINE COVER CONCEALER 01 LIGHT BEIGE', NULL, '43812.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2628720.0000', '60.0000', '2018-01-13', 'received', '43812.0000', '43812.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6182, 14, NULL, 2152, '8806173431175', 'PURE SHINE COVER CONCEALER 02 NATURAL BEIGE', NULL, '43812.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2628720.0000', '60.0000', '2018-01-13', 'received', '43812.0000', '43812.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6183, 14, NULL, 2219, '8806173420308', 'ARGAN ESSENTIAL DEEP CARE HAIR ESSENCE', NULL, '59744.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5735424.0000', '96.0000', '2018-01-13', 'received', '59744.0000', '59744.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6184, 14, NULL, 2390, '8806173420315', 'ARGAN ESSENTIAL MOIST HAIR MIST', NULL, '61337.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5888352.0000', '96.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6185, 14, NULL, 2153, '8806173424368', 'AQUA COLLAGEN SOLUTION HYALURONIC ACID HYDRO GEL MASK', NULL, '35847.0000', '400.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '14338800.0000', '400.0000', '2018-01-13', 'received', '35847.0000', '35847.0000', NULL, NULL, NULL, 2, 'pcs', '400.0000'),
(6186, 14, NULL, 2393, '8806173419678', 'JEJU SPARKLING MUD FOAM CLEANSER', NULL, '61337.0000', '84.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5152308.0000', '84.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '84.0000'),
(6187, 14, NULL, 2154, '8806173424870', 'BLACKHEAD CLEAR 3-STEP NOSE PACK', NULL, '15932.0000', '1000.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '15932000.0000', '1000.0000', '2018-01-13', 'received', '15932.0000', '15932.0000', NULL, NULL, NULL, 2, 'pcs', '1000.0000'),
(6188, 14, NULL, 2330, '8806173424924', 'FOREST GARDEN CHAMOMILE CLEANSING OIL', NULL, '111521.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6691260.0000', '60.0000', '2018-01-13', 'received', '111521.0000', '111521.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6189, 14, NULL, 2225, '8806173427260', 'BATH & NATURE APPLE MANGO BODY LOTION', NULL, '95590.0000', '54.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5161860.0000', '54.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '54.0000'),
(6190, 14, NULL, 2400, '8806173438297', 'FRESH HERB ALOE CLEANSING FOAM', NULL, '26288.0000', '180.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4731840.0000', '180.0000', '2018-01-13', 'received', '26288.0000', '26288.0000', NULL, NULL, NULL, 2, 'pcs', '180.0000'),
(6191, 14, NULL, 2367, '8806173438822', 'ARGAN ESSENTIAL DEEP CARE HAIR PACK', NULL, '70099.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6729504.0000', '96.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6192, 14, NULL, 2155, '8806173432387', 'BEAUTY TOOL COCOON SILK BALL(10EA)', NULL, '27456.0000', '30.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '823680.0000', '30.0000', '2018-01-13', 'received', '27456.0000', '27456.0000', NULL, NULL, NULL, 2, 'pcs', '30.0000'),
(6193, 14, NULL, 2404, '8806173438457', 'BEAUTY TOOL AIR PUFF (2P)', NULL, '33280.0000', '30.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '998400.0000', '30.0000', '2018-01-13', 'received', '33280.0000', '33280.0000', NULL, NULL, NULL, 2, 'pcs', '30.0000'),
(6194, 14, NULL, 2410, '8806173439669', 'PRO TOUCH FLOWER BRUSH', NULL, '87278.0000', '30.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2618340.0000', '30.0000', '2018-01-13', 'received', '87278.0000', '87278.0000', NULL, NULL, NULL, 2, 'pcs', '30.0000'),
(6195, 14, NULL, 2156, '8806173437214', 'REAL NATURE POMEGRANATE HYDROGEL MASK', NULL, '15543.0000', '600.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9325800.0000', '600.0000', '2018-01-13', 'received', '15543.0000', '15543.0000', NULL, NULL, NULL, 2, 'pcs', '600.0000'),
(6196, 14, NULL, 2229, '8806173433308', 'PURE SHINE LIPSTICK 06 CANDY POP PINK', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6197, 14, NULL, 2231, '8806173433322', 'PURE SHINE LIPSTICK 08 ORANGE BONGBONG', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6198, 14, NULL, 2499, '8806173433346', 'PURE SHINE LIPSTICK 10 CHERRY RED', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6199, 14, NULL, 2240, '8806173437870', 'VITAMIN B5 EMULSION', NULL, '150554.0000', '64.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9635456.0000', '64.0000', '2018-01-13', 'received', '150554.0000', '150554.0000', NULL, NULL, NULL, 2, 'pcs', '64.0000'),
(6200, 14, NULL, 2416, '8806173440696', 'PURE BUD RELIEF FOAM CLEANSER(FOR OILY SKIN)', NULL, '54964.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3077984.0000', '56.0000', '2018-01-13', 'received', '54964.0000', '54964.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6201, 14, NULL, 2541, '8806173436767', 'PURE SHINE LIPSTICK 11 BLOODY BURGUNDY', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6202, 14, NULL, 2418, '8806173433421', 'GLITTER LINER 02 GOLDEN FANTASY', NULL, '53337.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2133480.0000', '40.0000', '2018-01-13', 'received', '53337.0000', '53337.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6203, 14, NULL, 2299, '8806173438815', 'ARGAN ESSENTIAL DEEP CARE CONDITIONER', NULL, '78862.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7570752.0000', '96.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6204, 14, NULL, 2209, '8806173416974', 'REAL NATURE TOMATO MASK SHEET', NULL, '7577.0000', '2000.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '15154000.0000', '2000.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '2000.0000'),
(6205, 14, NULL, 2157, '8806173425488', 'ARGAN 20º REAL SQUEEZE AMPOULE', NULL, '199145.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '11948700.0000', '60.0000', '2018-01-13', 'received', '199145.0000', '199145.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6206, 14, NULL, 2158, '8806173423552', 'BAMBOO CHARCOAL MUD PACK', NULL, '52575.0000', '240.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '12618000.0000', '240.0000', '2018-01-13', 'received', '52575.0000', '52575.0000', NULL, NULL, NULL, 2, 'pcs', '240.0000'),
(6207, 14, NULL, 2270, '8806173422081', 'NATURAL BUTTER LIPBALM 05 LIME MINT', NULL, '54964.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3957408.0000', '72.0000', '2018-01-13', 'received', '54964.0000', '54964.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6208, 14, NULL, 2272, '8806173425600', 'FRESH GREEN TEA FOAM CLEANSER', NULL, '61337.0000', '144.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '8832528.0000', '144.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '144.0000'),
(6209, 14, NULL, 2159, '8806173417094', 'REAL NATURE CUCUMBER MASK SHEET', NULL, '7577.0000', '2000.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '15154000.0000', '2000.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '2000.0000'),
(6210, 14, NULL, 2262, '8806173424665', 'FRESH GREEN TEA 70 TONER', NULL, '78862.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9463440.0000', '120.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6211, 14, NULL, 2160, '8806173438914', 'SOOTHING & MOISTURE ALOE VERA CLEANSING GEL FOAM', NULL, '35050.0000', '360.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '12618000.0000', '360.0000', '2018-01-13', 'received', '35050.0000', '35050.0000', NULL, NULL, NULL, 2, 'pcs', '360.0000'),
(6212, 14, NULL, 2161, '8806173433155', 'FRESH DEODRANT STICK - FLORAL', NULL, '61337.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2944176.0000', '48.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6213, 14, NULL, 2341, '8806173433339', 'PURE SHINE LIPSTICK 09 SCARLET RED', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6214, 14, NULL, 2238, '8806173440979', 'CALIFORNIA ALOE SUN LIQUID SPF50+PA++++', NULL, '122674.0000', '80.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9813920.0000', '80.0000', '2018-01-13', 'received', '122674.0000', '122674.0000', NULL, NULL, NULL, 2, 'pcs', '80.0000'),
(6215, 14, NULL, 2162, '8806173433247', 'PURE SHINE LIPSTICK 02 CREAM ROSE', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6216, 14, NULL, 2354, '8806173434633', 'BOTANICAL CUSHION BLUSHER 02 APRICOT', NULL, '86828.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4862368.0000', '56.0000', '2018-01-13', 'received', '86828.0000', '86828.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6217, 14, NULL, 2163, '8806173435234', 'PROVENCE AIR SKIN FIT BB CREAM 01 LIGHT BEIGE SPF35PA++', NULL, '102759.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4110360.0000', '40.0000', '2018-01-13', 'received', '102759.0000', '102759.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6218, 14, NULL, 2355, '8806173433230', 'PURE SHINE LIPSTICK 01 SHY BEIGE', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6219, 14, NULL, 2359, '8806173435982', 'NATURE ORIGIN PRIMER 01 STROBING SPF30,PA++', NULL, '126656.0000', '42.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5319552.0000', '42.0000', '2018-01-13', 'received', '126656.0000', '126656.0000', NULL, NULL, NULL, 2, 'pcs', '42.0000'),
(6220, 14, NULL, 2244, '8806173434404', 'HAWAIIAN DEEP SEA LIP&EYE REMOVER', NULL, '62930.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '2517200.0000', '40.0000', '2018-01-13', 'received', '62930.0000', '62930.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6221, 14, NULL, 2164, '8806173437221', 'REAL NATURE CHAMOMILE HYDROGEL MASK', NULL, '15543.0000', '600.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9325800.0000', '600.0000', '2018-01-13', 'received', '15543.0000', '15543.0000', NULL, NULL, NULL, 2, 'pcs', '600.0000'),
(6222, 14, NULL, 2365, '8806173436477', 'PURE SHINE NATURAL CUSHION 01 LIGHT BEIGE SPF50+ PA+++', NULL, '78862.0000', '80.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6308960.0000', '80.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '80.0000'),
(6223, 14, NULL, 2370, '8806173434886', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 08 PASTEL PINK', NULL, '95590.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823600.0000', '40.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6224, 14, NULL, 2371, '8806173434893', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 09 LADY TANGERINE', NULL, '95590.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3823600.0000', '40.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6225, 14, NULL, 2377, '8806173434213', 'REAL NATURE GREEN TEA CLEANSING CREAM', NULL, '78862.0000', '84.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6624408.0000', '84.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '84.0000'),
(6226, 14, NULL, 2254, '8806173436064', 'GINSENG ROYAL SILK BOOSTING AMPOULE', NULL, '398290.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '22304240.0000', '56.0000', '2018-01-13', 'received', '398290.0000', '398290.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6227, 14, NULL, 2255, '8806173441204', 'AFRICA BIRD HOMME ALL IN ONE BRIGHTENING ESSENCE SPF28PA+++', NULL, '199145.0000', '30.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5974350.0000', '30.0000', '2018-01-13', 'received', '199145.0000', '199145.0000', NULL, NULL, NULL, 2, 'pcs', '30.0000'),
(6228, 14, NULL, 2211, '8806173417049', 'REAL NATURE ORANGE MASK SHEET', NULL, '7577.0000', '2000.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '15154000.0000', '2000.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '2000.0000'),
(6229, 14, NULL, 2302, '8806173424146', 'REAL SQUEEZE ALOE VERA TONER', NULL, '118691.0000', '72.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '8545752.0000', '72.0000', '2018-01-13', 'received', '118691.0000', '118691.0000', NULL, NULL, NULL, 2, 'pcs', '72.0000'),
(6230, 14, NULL, 2214, '8806173424160', 'REAL SQUEEZE ALOE VERA EMULSION', NULL, '118691.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '14242920.0000', '120.0000', '2018-01-13', 'received', '118691.0000', '118691.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6231, 14, NULL, 2165, '8806173416264', 'INTENSE TOUCH MASCARA', NULL, '95590.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5735400.0000', '60.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6232, 14, NULL, 2308, '8806173423576', 'REAL SQUEEZE ALOE VERA SLEEPING PACK', NULL, '78862.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9463440.0000', '120.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6233, 14, NULL, 2166, '8806173424436', 'SNAIL SOLUTION RED GINSENG HYDRO GEL MASK', NULL, '39829.0000', '400.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '15931600.0000', '400.0000', '2018-01-13', 'received', '39829.0000', '39829.0000', NULL, NULL, NULL, 2, 'pcs', '400.0000'),
(6234, 14, NULL, 2436, '8806173425471', 'ARGAN 20º STEAM EMULSION', NULL, '118691.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7121460.0000', '60.0000', '2018-01-13', 'received', '118691.0000', '118691.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6235, 14, NULL, 2317, '8806173423385', 'BY FLOWER BLUSHER 07  VANILLA LATTE', NULL, '55761.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3345660.0000', '60.0000', '2018-01-13', 'received', '55761.0000', '55761.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6236, 14, NULL, 2325, '8806173426386', 'REAL NATURE ARGAN OIL', NULL, '99573.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '11948760.0000', '120.0000', '2018-01-13', 'received', '99573.0000', '99573.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6237, 14, NULL, 2327, '8806173426416', 'REAL NATURE ROSE AMPOULE', NULL, '99573.0000', '120.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '11948760.0000', '120.0000', '2018-01-13', 'received', '99573.0000', '99573.0000', NULL, NULL, NULL, 2, 'pcs', '120.0000'),
(6238, 14, NULL, 2222, '8806173420803', 'BOTANICAL SIMPLE MAKING GEL EYELINER 1 BLACK', NULL, '67710.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4062600.0000', '60.0000', '2018-01-13', 'received', '67710.0000', '67710.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6239, 14, NULL, 2167, '8806173420513', 'BATH&NATURE PROVENCE PEACH MOUSSE BODY OIL', NULL, '119487.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7169220.0000', '60.0000', '2018-01-13', 'received', '119487.0000', '119487.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6240, 14, NULL, 2168, '8806173421633', 'BOTANICAL GREEN TEA PORE POWDER', NULL, '63727.0000', '144.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9176688.0000', '144.0000', '2018-01-13', 'received', '63727.0000', '63727.0000', NULL, NULL, NULL, 2, 'pcs', '144.0000'),
(6241, 14, NULL, 2226, '8806173421596', 'NATURE ORIGIN CC TINTED SPF30 PA++', NULL, '111521.0000', '84.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9367764.0000', '84.0000', '2018-01-13', 'received', '111521.0000', '111521.0000', NULL, NULL, NULL, 2, 'pcs', '84.0000'),
(6242, 14, NULL, 2216, '8806173432776', 'BEAUTY TOOL SPRAY TYPE CONTAINER', NULL, '15932.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '955920.0000', '60.0000', '2018-01-13', 'received', '15932.0000', '15932.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6243, 14, NULL, 2169, '8806173438723', 'GINSENG ROYAL SILK GOLD MASSAGER', NULL, '572983.0000', '18.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '10313694.0000', '18.0000', '2018-01-13', 'received', '572983.0000', '572983.0000', NULL, NULL, NULL, 2, 'pcs', '18.0000'),
(6244, 14, NULL, 2356, '8806173433759', 'BEAUTY TOOL SCREW BRUSH', NULL, '14339.0000', '60.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '860340.0000', '60.0000', '2018-01-13', 'received', '14339.0000', '14339.0000', NULL, NULL, NULL, 2, 'pcs', '60.0000'),
(6115, 14, NULL, 2208, '8806173416929', 'REAL NATURE ROYAL JELLY MASK SHEET', NULL, '7577.0000', '2000.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '15154000.0000', '2000.0000', '2018-01-13', 'received', '7577.0000', '7577.0000', NULL, NULL, NULL, 2, 'pcs', '2000.0000'),
(6114, 14, NULL, 2380, '8806173434381', 'HAWAIIAN DEEP SEA CLEANSING OIL TO FOAM', NULL, '86828.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3473120.0000', '40.0000', '2018-01-13', 'received', '86828.0000', '86828.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6113, 14, NULL, 2253, '8806173436705', 'HERB BLENDING EYE CREAM', NULL, '198348.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '11107488.0000', '56.0000', '2018-01-13', 'received', '198348.0000', '198348.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6112, 14, NULL, 2374, '8806173435210', 'PROVENCE INTENSIVE AMPOULE FOUNDATION 01 LIGHT BEIGE SPF30 PA++', NULL, '150554.0000', '40.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '6022160.0000', '40.0000', '2018-01-13', 'received', '150554.0000', '150554.0000', NULL, NULL, NULL, 2, 'pcs', '40.0000'),
(6111, 14, NULL, 2295, '8806173434824', 'NATUREREPUBLIC MULTIPLE TOUCH STICK 02 NATURAL BEIGE SPF37PA++', NULL, '95590.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5353040.0000', '56.0000', '2018-01-13', 'received', '95590.0000', '95590.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6110, 14, NULL, 2248, '8806173433278', 'PURE SHINE LIPSTICK 05 MILKY PINK', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6108, 14, NULL, 2131, '8806173440306', 'BOTANICAL GREEN TEA PORE STICK', NULL, '62930.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3524080.0000', '56.0000', '2018-01-13', 'received', '62930.0000', '62930.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6109, 14, NULL, 2366, '8806173436484', 'PURE SHINE NATURAL CUSHION 02 NATURAL BEIGE SPF50+ PA+++', NULL, '78862.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '7570752.0000', '96.0000', '2018-01-13', 'received', '78862.0000', '78862.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6107, 14, NULL, 2130, '8806173436538', 'COLLAGEN DREAM 50 ALL IN ONE RADIANCE TONE UP CREAM SPF35PA++', NULL, '214280.0000', '64.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '13713920.0000', '64.0000', '2018-01-13', 'received', '214280.0000', '214280.0000', NULL, NULL, NULL, 2, 'pcs', '64.0000'),
(6106, 14, NULL, 2360, '8806173435999', 'NATURE ORIGIN PRIMER 02 TONE-UP SPF30,PA++', NULL, '126656.0000', '42.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '5319552.0000', '42.0000', '2018-01-13', 'received', '126656.0000', '126656.0000', NULL, NULL, NULL, 2, 'pcs', '42.0000'),
(6105, 14, NULL, 2243, '8806173433742', 'SNAIL SOLUTION ESSENCE', NULL, '262871.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '25235616.0000', '96.0000', '2018-01-13', 'received', '262871.0000', '262871.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6104, 14, NULL, 2129, '8806173433728', 'SNAIL SOLUTION SKIN BOOSTER (C)', NULL, '199145.0000', '96.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '19117920.0000', '96.0000', '2018-01-13', 'received', '199145.0000', '199145.0000', NULL, NULL, NULL, 2, 'pcs', '96.0000'),
(6103, 14, NULL, 2128, '8806173433254', 'PURE SHINE LIPSTICK 03 JULIET ROSE', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6102, 14, NULL, 2289, '8806173440955', 'CALIFORNIA ALOE PERFECT SUN BLOCK SPF50+PA++++', NULL, '122674.0000', '80.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '9813920.0000', '80.0000', '2018-01-13', 'received', '122674.0000', '122674.0000', NULL, NULL, NULL, 2, 'pcs', '80.0000'),
(6101, 14, NULL, 2235, '8806173434930', 'SNAIL SOLUTION WRINKLE UP SPOT', NULL, '238974.0000', '56.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '13382544.0000', '56.0000', '2018-01-13', 'received', '238974.0000', '238974.0000', NULL, NULL, NULL, 2, 'pcs', '56.0000'),
(6100, 14, NULL, 2230, '8806173433315', 'PURE SHINE LIPSTICK 07 CORAL GELATO', NULL, '70099.0000', '48.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '3364752.0000', '48.0000', '2018-01-13', 'received', '70099.0000', '70099.0000', NULL, NULL, NULL, 2, 'pcs', '48.0000'),
(6097, NULL, NULL, 2137, '8806173437191', 'REAL NATURE GRAPEFRUIT HYDROGEL MASK', NULL, '0.0000', '0.0000', 3, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '-40.0000', '2018-01-13', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(6098, NULL, NULL, 2234, '8806173434367', 'HAWAIIAN DEEP SEA MILD SCRUB FOAM CLEANSER', NULL, '0.0000', '0.0000', 3, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '-1.0000', '2018-01-13', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(6099, 14, NULL, 2127, '8806173433162', 'FRESH DEODRANT STICK - COTTON', NULL, '61337.0000', '80.0000', 3, '0.0000', 0, '', '', '0.0000', '0000-00-00', '4906960.0000', '80.0000', '2018-01-13', 'received', '61337.0000', '61337.0000', NULL, NULL, NULL, 2, 'pcs', '80.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('t8o70ndkmqrire2faui5j3serioko1qq', '182.30.66.80', 1515826346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353832363034383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('m104ge8gipeiaeqk9it84ie5tr7h3so6', '182.30.66.80', 1515826710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353832363339333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('q5kh09gilh88qdai0mg4d6t5ugk4h7vg', '182.30.66.80', 1515826027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353832353430373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('hksdasmcqq0729rhoomv3op2c8eqb496', '36.82.103.84', 1515921112, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932303831383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383431373131223b6c6173745f69707c733a31333a223138302e3234342e39352e3733223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22326d314b6b59424f574c6c644372504a39656f33223b72656d6f76655f706f6c737c733a313a2231223b),
('o7ms6j791f9i37ftl1u25pd5shnmpg90', '36.82.103.84', 1515920815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932303439353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383431373131223b6c6173745f69707c733a31333a223138302e3234342e39352e3733223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2266765a4e34426173646956316f554b7448687730223b72656d6f76655f706f6c737c733a313a2231223b),
('8m3o0hdjoi0gq037d5t25d9ht3802p4b', '180.244.95.73', 1515848886, 0x7265717565737465645f706167657c733a32313a2261646d696e2f73797374656d5f73657474696e6773223b5f5f63695f6c6173745f726567656e65726174657c693a313531353834383836373b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383430303930223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b757365725f637372667c733a32303a22334c43546f785a37494e6d446250754230743152223b),
('cp451orshkbkkg38kij446p3mgal63oe', '66.249.71.131', 1515896315, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353839363330333b7265717565737465645f706167657c733a353a2261646d696e223b),
('qlneiecsjp548qeoj9u1g8c9d4as18it', '66.249.71.133', 1515896649, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353839363632393b7265717565737465645f706167657c733a353a2261646d696e223b),
('58beg7s1u3qt0gvih966064ddk6984tl', '36.82.103.84', 1515920485, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932303137343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383431373131223b6c6173745f69707c733a31333a223138302e3234342e39352e3733223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('v3mi7f65gn1d411c9c73k1h65cgkek62', '111.68.117.195', 1515848382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353834383337373b7265717565737465645f706167657c733a353a2261646d696e223b),
('7rcaok1be53l2nbmf2jkhq62t7qtnvb6', '180.244.95.73', 1515848867, 0x7265717565737465645f706167657c733a32313a2261646d696e2f73797374656d5f73657474696e6773223b5f5f63695f6c6173745f726567656e65726174657c693a313531353834383836343b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383430303930223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b757365725f637372667c733a32303a22334c43546f785a37494e6d446250754230743152223b),
('fl8hp0594ng8qiialkl3id1ult43846t', '182.30.66.80', 1515839168, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833383933373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383239323330223b6c6173745f69707c733a31333a223138302e3234342e39352e3733223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353833383332303b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b72656d6f76655f746f6c737c693a313b),
('reeap7dflrdaj0v733qdn4e6cfntpcec', '182.30.66.80', 1515840259, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353834303038363b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383338323831223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2flbb1mrasuk662lp97d4u8v052aance', '182.30.66.80', 1515840692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353834303339323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383338323831223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2242645a66744e4b4169545655386c6b5177526861223b72656d6f76655f706f6c737c693a313b6d6573736167657c733a32373a225075726368617365207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('4ft2tbp60p93ijl4ohqvgb1i3hbb7k0g', '182.30.66.80', 1515840953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353834303639383b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383338323831223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22374b386a416578693976536e756f4c4f66323652223b),
('lgtlvtgbs3simh3sb0ni0bnu8hja819b', '182.30.66.80', 1515841619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353834313332363b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383338323831223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2238747177656f536348546e5037787358566c3166223b),
('d8vrdhck9pj9gbmffc3l40k5m1bitmna', '182.30.66.80', 1515841945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353834313634303b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383338323831223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22483344627a3965366643556d717351673261546f223b),
('hvnv2i25d0gra1g0t7h6nj26ldnnfe4m', '180.244.95.73', 1515842053, 0x7265717565737465645f706167657c733a32313a2261646d696e2f73797374656d5f73657474696e6773223b5f5f63695f6c6173745f726567656e65726174657c693a313531353834313731313b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383430303930223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b757365725f637372667c733a32303a22334c43546f785a37494e6d446250754230743152223b),
('mnc4uherlf7669kceuhk0f1rprepq2am', '182.30.66.80', 1515842232, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353834313934383b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383338323831223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22483344627a3965366643556d717351673261546f223b),
('f9m21hbel3petjjjq5skqe22qkar2kqu', '180.244.95.73', 1515842209, 0x7265717565737465645f706167657c733a32313a2261646d696e2f73797374656d5f73657474696e6773223b5f5f63695f6c6173745f726567656e65726174657c693a313531353834323038373b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383430303930223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b757365725f637372667c733a32303a22334c43546f785a37494e6d446250754230743152223b),
('nahu1tcmfs6ood1vpuha1lngs4a823s3', '182.30.66.80', 1515842551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353834323235313b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383338323831223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22483344627a3965366643556d717351673261546f223b),
('f26s75jquarmurbn8s68q6kvnovul4mh', '182.30.66.80', 1515842763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353834323535363b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383338323831223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22483344627a3965366643556d717351673261546f223b72656d6f76655f746f6c737c693a313b),
('jrcf4ea0msmadicarfmgi3g9ha8hlsc4', '182.30.66.80', 1515843138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353834333133383b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383338323831223b6c6173745f69707c733a31323a223138322e33302e36362e3830223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22483344627a3965366643556d717351673261546f223b72656d6f76655f746f6c737c693a313b),
('il319fhpn1qf2c9c83t7mpfpca8rof3g', '182.30.66.80', 1515838778, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833383539393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383239323330223b6c6173745f69707c733a31333a223138302e3234342e39352e3733223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353833383332303b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('gdd80vmk11ftt9qdfsf6it2nrkb5ks3u', '182.30.66.80', 1515837992, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833373639353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353833373637343b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a2262574b6b353675487a747764704e344d68534938223b72656d6f76655f746f6c737c693a313b),
('ecrq5hg832t6m85cka8rq5de1ouobejs', '182.30.66.80', 1515838444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833383237363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383239323330223b6c6173745f69707c733a31333a223138302e3234342e39352e3733223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353833383332303b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('4s46u05rp67bh0i1lns40uhcchibh8b3', '182.30.66.80', 1515837674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833373336333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353833373637343b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a2262574b6b353675487a747764704e344d68534938223b),
('9leeiv6l6m3djqo3vtc7v4od02co4ii4', '182.30.66.80', 1515836709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833363332323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a2262574b6b353675487a747764704e344d68534938223b),
('eujhkjfjs1l9snmq1dum9uv90lq187ec', '182.30.66.80', 1515837041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833363730333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a2262574b6b353675487a747764704e344d68534938223b),
('cjdloid9s2ok041pvtlcujockiahmil3', '182.30.66.80', 1515837344, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833373034333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a2262574b6b353675487a747764704e344d68534938223b),
('1mu7kr8u94bh4p8id708gqdsi6hvc0uk', '182.30.66.80', 1515836238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833353938343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a226a54307a4d7952583472594b314a44496255665a223b),
('d10s66avln64u2hioqkoli96ohl2uu1c', '182.30.66.80', 1515834941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833343934313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a224c397734537075765450556b785a32643568476d223b),
('8lg8ne43ggd17uisgg804hk2homc0p5u', '182.30.66.80', 1515835254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833343934373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a226f796c64784f485934635a6b455730614b724631223b72656d6f76655f706f6c737c693a313b),
('khr8rccu07bah3j0aajd6lkba5t5t1ae', '182.30.66.80', 1515835649, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833353331393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a226a54307a4d7952583472594b314a44496255665a223b),
('7a7qkj421fmsaotb1caga62qibs26rl4', '182.30.66.80', 1515835953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833353637383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a226a54307a4d7952583472594b314a44496255665a223b),
('ehacm8k749ka1fmlt5hlt1pugikggrf1', '182.30.66.80', 1515834939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833343933393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a224c397734537075765450556b785a32643568476d223b),
('9ok4oelf94mimoakpv6vd8ov7ltp3vna', '182.30.66.80', 1515834816, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833343531343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a224c397734537075765450556b785a32643568476d223b),
('ln601mh60frafv4j2ariho1lv43an05p', '182.30.66.80', 1515833433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833333139363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a224c397734537075765450556b785a32643568476d223b),
('sqik4cf5t6c251prq2qmtjnqib8i6bd5', '182.30.66.80', 1515832825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833323331373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a224c397734537075765450556b785a32643568476d223b),
('qnjffj7ddfornt1o5ch85af5bcu4bjbc', '182.30.66.80', 1515833175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833323838323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a224c397734537075765450556b785a32643568476d223b),
('mgpb1lfql0k7pmtqsa3cajmohnmn077q', '182.30.66.80', 1515832306, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833323031343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a224c397734537075765450556b785a32643568476d223b),
('tndc94ac12i5u7pab99325lslpmb5avh', '182.30.66.80', 1515826756, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353832363733373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('jq2t2q65qgc1dqmj6hlb9fmrv7vuhkfj', '182.30.66.80', 1515828483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353832383139373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('u349n8re7v6mte4quga18os5s30t79t9', '182.30.66.80', 1515828794, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353832383632353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('0rcqatc7he8jfqv31i5269o6puevks7g', '182.30.66.80', 1515829463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353832393138323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('0bq04ppro02c8ncfp0p5t3i0pi2554rr', '180.244.95.73', 1515829391, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353832393231383b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383138373739223b6c6173745f69707c733a31333a223138302e3234342e39352e3733223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22556e716733574d4577414a4979566275326a4761223b72656d6f76655f706f6c737c693a313b),
('9ja7i26o2uhrsb2dafccjeobkebgfq4h', '182.30.66.80', 1515829872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353832393538343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a224c397734537075765450556b785a32643568476d223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('g4fmdvfvv13t3dk4t7ol941e0o8b4mrq', '182.30.66.80', 1515830139, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353832393938313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a224c397734537075765450556b785a32643568476d223b),
('l30dfc01hs38mdghbdos6v9d733m5rf3', '182.30.66.80', 1515831654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833313337323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a224c397734537075765450556b785a32643568476d223b),
('1hr0ru7hhiq16ddvjqcrknv0egdmt2lr', '182.30.66.80', 1515831962, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353833313637353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135373639393631223b6c6173745f69707c733a31353a223132352e3136302e3231312e323339223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353832313536383b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b757365725f637372667c733a32303a224c397734537075765450556b785a32643568476d223b),
('36tcugq7u4mnq3c6n5j80jagdd7bn783', '36.82.103.84', 1515921320, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932313132323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135383431373131223b6c6173745f69707c733a31333a223138302e3234342e39352e3733223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a226b51615573723779314a526d53754d68575a7664223b),
('rrs80gdms5sao5ub7hg69m79rg4je72a', '5.45.207.70', 1515947225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353934373232353b),
('2fa9nnjvuo74orit7s062p2807p2hg90', '182.253.62.125', 1515953486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935333438343b7265717565737465645f706167657c733a353a2261646d696e223b),
('usj6ltkmbosgirnrsl4dqq2ai7h8ru82', '182.30.106.98', 1515955331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935353033353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393230323336223b6c6173745f69707c733a31323a2233362e38322e3130332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353935353332393b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('r35k444f1ktp1m4g6tgtmot0n02rmqou', '182.30.106.98', 1515955745, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935353430393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393230323336223b6c6173745f69707c733a31323a2233362e38322e3130332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353935353332393b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('0qdk06rr2p88mdb22t2pit64i3ad81k3', '182.30.106.98', 1515956074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935353735303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393230323336223b6c6173745f69707c733a31323a2233362e38322e3130332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353935353332393b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('cttpd7qa8cgrj68aa5iasvbq8d8ajqh3', '125.161.116.96', 1515956253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935353934383b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535303833223b6c6173745f69707c733a31333a223138322e33302e3130362e3938223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b50566b694c574258356a53664744364d596264223b),
('hl5haa8u641uc3c5lp8264nc6s6epoem', '182.30.106.98', 1515956096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935363038323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393230323336223b6c6173745f69707c733a31323a2233362e38322e3130332e3834223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531353935363039333b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('d9tvlbehbmpvc781e0ht0nmd8u73uh9t', '125.161.116.96', 1515956310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935363236393b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535303833223b6c6173745f69707c733a31333a223138322e33302e3130362e3938223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2230787267534b426d635a33386b4d4a4c6c69364e223b),
('30ffjm4pbec0nfvvvff9v1r6fumc3gia', '125.161.116.96', 1515956986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935363638323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535303833223b6c6173745f69707c733a31333a223138322e33302e3130362e3938223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22366e69755752623934484342645a636547727649223b),
('6e72eq2i9c32l6nq68ele7jrt5ison91', '125.161.116.96', 1515957320, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935363939383b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535303833223b6c6173745f69707c733a31333a223138322e33302e3130362e3938223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224a79425553506d6a7a54705965645a5748453239223b),
('lb37uhqr391hpldho3ful5t00tb7fds0', '125.161.116.96', 1515957338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935373332353b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535303833223b6c6173745f69707c733a31333a223138322e33302e3130362e3938223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224a79425553506d6a7a54705965645a5748453239223b),
('k5tb6ep6dprukrvhr08pataoi8n2n4u5', '125.161.116.96', 1515958104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935383130323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535303833223b6c6173745f69707c733a31333a223138322e33302e3130362e3938223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224a79425553506d6a7a54705965645a5748453239223b6c6173745f61637469766974797c693a313531353935383130323b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('ipeqr9q8ht4be9sraiue40070p7o5e34', '103.232.33.37', 1515986528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353938363236383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('c25g2aea7l9949p02eq3ikrpvsngqvfs', '103.232.33.37', 1515988523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353938363539353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('upk1gok375073661974hp670fcfge8um', '103.232.33.37', 1515986832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353938363631373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393836353238223b6c6173745f69707c733a31333a223130332e3233322e33332e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b),
('pufvdk5u4eaif5rjri3pvnqs3hla691l', '103.232.33.37', 1515987315, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353938373238323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393836353238223b6c6173745f69707c733a31333a223130332e3233322e33332e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b6c6173745f61637469766974797c693a313531353938373238323b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('ikeqqk18j93vquai8hsiem8bttnjmd3n', '103.232.33.37', 1515988011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353938373931333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393836353238223b6c6173745f69707c733a31333a223130332e3233322e33332e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b6c6173745f61637469766974797c693a313531353938373238323b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('5r559g55dh5g8llk3g1i2jqo7lrel1p7', '103.232.33.37', 1515988936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353938383539373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('aelc754n7qki25svbv8bg4v6prf2pr5e', '103.232.33.37', 1515989696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353938393336363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('ceuhclhahqn5jd8eaqrpfauftjf0440j', '103.232.33.37', 1515990287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353938393935333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('ci5b27b58e70qncb2t7gtr8sfc8olq8t', '103.232.33.37', 1515990657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939303337323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b6d6573736167657c733a32383a2250726f64756374207375636365737366756c6c792075706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('03f0o8vjs8asaqf257l3gd0qks4fkfrn', '139.228.163.65', 1515992825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939323537333b7265717565737465645f706167657c733a353a2261646d696e223b),
('iiei6a09hb8bg1u07mu1j6gimd59kor1', '139.228.163.65', 1515993156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939333033353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393933303534223b6c6173745f69707c733a31323a2233362e37312e36372e313730223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('jr1a4bbu9f2qlf876ssllu8kgbm9elb2', '36.71.67.170', 1515993145, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939333035343b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393836363838223b6c6173745f69707c733a31333a223130332e3233322e33332e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22475877786c62347132616746685975527335654c223b),
('2uu45tgmb30vgdtv6b5el8noks9ump7i', '139.228.163.65', 1515994521, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939333537393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393933303534223b6c6173745f69707c733a31323a2233362e37312e36372e313730223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3ei4dn1nvq57v3f58ie6m7mcg71lu2bk', '103.232.33.37', 1515996159, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939363135393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('t9032ejmjrgq4ei8pc0f7n1rkror06ia', '103.232.33.37', 1515997252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939373235323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('e03k41lgb14jq5aquuq74le68pmgeb9u', '103.232.33.37', 1515997252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939373235323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('5htb0ltgcvs3shn77n9e2n1i6vs793vo', '103.232.33.37', 1515997258, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939373235383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('e87mdukevkvglkda0f5nua5ibihhsgpl', '103.232.33.37', 1515997259, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939373235393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('41ngpieuqp7eqvp00plaa2nqs8dhbult', '103.232.33.37', 1515997474, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939373236303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('3fvb5hl0gttn6kdlbftk2lq82ra909hk', '103.232.33.37', 1515998008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939373833323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('7j2a0utisih6g78ujqtp6lkf2soponso', '103.232.33.37', 1515998433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939383231343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('pd6vkuvpamp9j8b073q4uk647b73f4np', '103.232.33.37', 1515999053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939383735373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('4704gclf9v7f52e0t6ncthdlf0goem59', '103.232.33.37', 1515999448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939393231353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b6d6573736167657c733a32383a2250726f64756374207375636365737366756c6c792075706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('t8jrc4bc63jti819h446dtm0fuags2q4', '103.232.33.37', 1515999779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939393730373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('jousivegeldgs1t5mvi4cp0vlduq81s8', '139.228.163.65', 1515999895, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939393837363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393933303534223b6c6173745f69707c733a31323a2233362e37312e36372e313730223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('kku0s1obri1o7bsc97n37r4o16en69s2', '103.232.33.37', 1516001655, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363030313339383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('dgjnlfcutrsivjvipbi1ekbn7k53dbkr', '103.232.33.37', 1516002056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363030313733363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('7s2gs7k65n85ojspp7tld618cloj1e09', '103.232.33.37', 1516003291, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363030323432343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('vb6eiu0l2e446iun3c7at7igemeh0rj6', '103.232.33.37', 1516003468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363030333333323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('uof074q2nu66014oq2nkcu580p1spvdb', '103.232.33.37', 1516003663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363030333636333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('4r426u8eo4p0q7c8ko1fc1gal9qfm8ml', '103.232.33.37', 1516006828, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363030363433393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('0tc02m34cc8disbbq7vjugh82hrge3b3', '103.232.33.37', 1516007380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363030373137373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('orp575nqicedgos4b4fbn22s15401tdv', '103.232.33.37', 1516010850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031303533353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('4e0utsvjn8cd3rdmig6b248lis254838', '103.232.33.37', 1516011204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031303838363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('388i4jstjmm3564bl96bb83muobajpb4', '103.232.33.37', 1516011483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031313231363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('hiemacm14f196cfsc7a6mh2uu9od2jat', '103.232.33.37', 1516012077, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031313837363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('96chc30dafbgeiapu6j1u05nqkgocu1d', '103.232.33.37', 1516012426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031323139313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('3pvui483chc4vk52cf8k7o9oghdj0hd4', '103.232.33.37', 1516012881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031323530313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('nno0ffde612tk3rkqhl32lfvlrkk00ff', '103.232.33.37', 1516013028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031323839303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393535393438223b6c6173745f69707c733a31343a223132352e3136312e3131362e3936223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('kqla8ecvcperiomgok1j4jcg5u5s4mnc', '139.228.163.65', 1516014718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031343731383b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('4rksliehn37fa3iuf58a1nrcugsn7a9e', '139.228.163.65', 1516014723, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031343732333b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b),
('4lb90c1c75sob0umo0223jm4ov0lo67t', '139.228.163.65', 1516014739, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031343733393b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('g6ugseplpq2dehclgukgrvmcjirr0l40', '139.228.163.65', 1516014760, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031343734323b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b),
('sonof0i0gmh343s1b98k2dteglliolj2', '139.228.163.65', 1516016534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031363532383b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393933313331223b6c6173745f69707c733a31343a223133392e3232382e3136332e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('s0vuq30dpp83kd6to131q56gnhqjndpa', '139.228.163.65', 1516023445, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363032333434353b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393933313331223b6c6173745f69707c733a31343a223133392e3232382e3136332e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8pnjjvpo2a0vogbpqe2pui6g46ipp5cv', '139.228.163.65', 1516023446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363032333434353b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393933313331223b6c6173745f69707c733a31343a223133392e3232382e3136332e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('i3j97fpe78tfaulcivel9g3iagijndbp', '139.228.163.65', 1516023446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363032333434363b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393933313331223b6c6173745f69707c733a31343a223133392e3232382e3136332e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3vn9lgvm034th402r4rrtm2u5clrpeqm', '139.228.163.65', 1516023446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363032333434363b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135393933313331223b6c6173745f69707c733a31343a223133392e3232382e3136332e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5fp7ts9683matk7h66sgk3pq49h4ug66', '139.228.163.65', 1516024554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363032343535343b),
('frseg75j76ctadl0u89euiv5spbkujak', '139.228.163.65', 1516024560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363032343536303b),
('edq4n0onmjfvctcuajt63d32917flb9c', '139.228.163.65', 1516025689, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363032353433313b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353136303136353238223b6c6173745f69707c733a31343a223133392e3232382e3136332e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2tr3k4jg2l427d8m9ff1p5mp6kr09bcb', '103.232.33.37', 1516033476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363033333433313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353136303235343331223b6c6173745f69707c733a31343a223133392e3232382e3136332e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531363033333435363b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b),
('gv0t41bab01gtbjltokgnhd4sjjfq1aq', '103.232.33.37', 1516034525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363033343436333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353136303235343331223b6c6173745f69707c733a31343a223133392e3232382e3136332e3635223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531363033333435363b72656769737465725f69647c733a333a22313438223b636173685f696e5f68616e647c733a31313a223530303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031382d30312d31332031313a32373a3435223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '_',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`) VALUES
(1, 'Logo_NR_hijau.png', 'Logo_NR_hijau1.png', 'Inventory', 'english', 4, 2, 'IDR', 1, 10, '3.2.2', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'Asia/Jakarta', 800, 800, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 5, 'contact@tecdiary.com', 0, 4, 1, 0, 2, 1, 1, 1, 2, 2, '.', ',', 0, 3, 'elyinfoe', '8c3c47a1-09a1-4ce7-8f44-039cb07170ad', 0, '100000.0000', 10, '50000.0000', 10, 0, 0, 0, 0, '', 0, '_', 0, 1, 1, 'POP', 90, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_stock_counts`
--

INSERT INTO `sma_stock_counts` (`id`, `date`, `reference_no`, `warehouse_id`, `type`, `initial_file`, `final_file`, `brands`, `brand_names`, `categories`, `category_names`, `note`, `products`, `rows`, `differences`, `matches`, `missing`, `created_by`, `updated_by`, `updated_at`, `finalized`) VALUES
(1, '2017-07-20 01:41:00', '', 1, 'full', 'b43f9d783e53c41ae8214b6073f7eb45.csv', NULL, '', '', '', '', NULL, 1, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(2, '2017-07-26 01:59:00', '', 1, 'full', 'c7ff01930516fbd3f090b0691437ce71.csv', NULL, '', '', '', '', NULL, 1, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'U1', 'Unit 1', NULL, NULL, NULL, NULL),
(2, 'pcs', 'pieces', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(2, 0x3130332e3233322e33332e3337, 0x3138302e3234332e34382e323532, 'owner123', '80fc57f539e81b74afa8bbee603eb3411edcb515', NULL, 'owner@erp.com', NULL, NULL, NULL, 'ccee0460d0a17fa8447f3c55db4fc8a9ffdcfb72', 1500268731, 1516033440, 1, 'owner', 'owner', 'erp', '123378889', NULL, 'male', 1, 0, 0, NULL, 0, 0, 116538, 1, 0, 0),
(8, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'admin', '75ec39e9b2e4311820dcf8fa66bf88c54bc53201', NULL, 'stephen@naturerepublic.id', NULL, NULL, NULL, NULL, 1509948665, 1515047511, 1, 'admin', 'admin', 'NRI', '082111838093', NULL, 'male', 2, NULL, NULL, NULL, 0, 0, 858, 1, 0, 0),
(11, 0x3130332e3231372e3137322e313636, 0x3130332e3231372e3137322e313636, 'stephen', '04d724f17899ef733a99762a12de757afcfbc010', NULL, 'stephen@gmail.com', NULL, NULL, NULL, NULL, 1509969130, 1509969150, 1, 'stephen', 'tanihaha', 'Stephen', '', NULL, 'male', 3, NULL, NULL, 6, 0, 0, 0, 0, 0, 0),
(5, 0x3130332e3231372e3137322e313636, 0x3130332e3231372e3137322e313636, 'yuni', '5136a4c19eba4fc8601b01593ca79faefbd8323e', NULL, 'yuni@naturerepublic.id', NULL, NULL, NULL, NULL, 1509941154, 1509972833, 1, 'yuni', 'yasih', 'NRI', '082111838093', NULL, 'male', 5, 4, 8, NULL, NULL, NULL, 0, 1, 0, 0),
(10, 0x3130332e3231372e3137322e313636, 0x3130332e3231372e3137322e313636, 'gancit', '47c9f5df649f9aa0c319546149f39287682228b0', NULL, 'stephen.tanihaha@gmail.com', NULL, NULL, NULL, '7f082cdfd044d262f8184f9c7ccc8a2f0292ac7c', 1509950496, 1510310874, 1, 'gancit', 'store', 'NRI', '082111838093', NULL, 'male', 5, 5, 10, NULL, NULL, NULL, 11632, 1, 0, 0),
(9, 0x3130332e3231372e3137322e313636, 0x3130332e3231372e3137322e313636, 'kokas', '14f85661c9d558c4e430520c3846ed40f5d28cbd', NULL, 'stephen.tanihaha@yahoo.com', NULL, NULL, NULL, NULL, 1509950291, 1510632988, 1, 'kokas', 'kokas', 'NRI', '082111838093', NULL, 'male', 5, 6, 9, NULL, NULL, NULL, 2282, 1, 0, 0),
(12, 0x3232332e3235352e3233302e323236, 0x3130332e3231372e3137322e313636, 'tesadmin', 'd6bca5196cc18c4dd543aa85ab65e54a8687070a', NULL, 'tes@admin.com', NULL, NULL, NULL, '74df098483d32ac1eaf323c4d72a72b2f59d1114', 1510298500, 1513700948, 1, 'tes', 'admin', 'nri', '6565675675', NULL, 'male', 2, 0, 0, NULL, 0, 0, 346, 1, 0, 0),
(13, 0x3130332e3233322e33332e3337, 0x33362e37312e38312e313331, 'tessales', 'c66f103d2b06a32ae9db3772fd58dd8fc44adf36', NULL, 'test@mail.com', NULL, NULL, NULL, '7c315d98cc61036de2686b0781e002a22a0cae4f', 1510564728, 1515590005, 1, 'tes', 'sales', 'nri', '2155637488', NULL, 'male', 5, 0, 0, NULL, NULL, NULL, 6599, 1, 0, 1),
(14, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'nurratna', '5fad56c6d8d383452db13df203de438c3199c616', NULL, 'nurratna@gmail.com', NULL, NULL, NULL, '86ee5d8eb3bd978c762c6a8790450f9e7b6bb5c5', 1510628476, 1515389642, 1, 'Nur Ratna ', 'Sari ', 'NRI', '82111838093', NULL, 'male', 5, 6, 9, NULL, 0, 0, 12623, 1, 0, 0),
(15, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'bella', 'e7110ce4066c750fe53bda6792ba33ec26556212', NULL, 'triana@gmail.com', NULL, NULL, NULL, NULL, 1510628536, 1514432629, 1, 'Bella ', 'Triana', 'NRI', '82111838093', NULL, 'female', 5, 6, 9, NULL, 0, 0, 4489, 1, 0, 0),
(16, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'hani', 'f9706680d0171501b4d8387711d4c0c0467dfb00', NULL, 'hanidya@gmail.com', NULL, NULL, NULL, '66081de5ae04d3a3f61db3dd7c6ac7d47d957679', 1510628587, 1514518266, 1, 'Istifara Nur ', 'Hanidya', 'NRI', '82111838093', NULL, 'female', 5, 5, 10, NULL, 0, 0, 10562, 1, 0, 0),
(17, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'feby', 'ee4744288fec416a8bb094c1c4a6d8eac4d51a7e', NULL, 'juwita@gmail.com', NULL, NULL, NULL, NULL, 1510628705, 1513745503, 1, 'Feby ', 'Juwita', 'NRI', '82111838093', NULL, 'female', 5, 4, 8, NULL, 0, 0, 153, 1, 0, 0),
(18, 0x3133392e3139322e3235312e3730, 0x3130332e3231372e3137322e313636, 'tini', 'f8125d43ad5584a8762351f3d261481b327903aa', NULL, 'antini@gmail.com', NULL, NULL, NULL, '790083299135feb6cef1be5fbdec88a19f9a2748', 1510628791, 1515060302, 1, 'Cahyaning Puji ', 'Antini', 'NRI', '82111838093', NULL, 'female', 5, 5, 10, NULL, 0, 0, 4618, 1, 0, 0),
(19, 0x3133392e3139322e3235312e3730, 0x3130332e3231372e3137322e313636, 'janah', '275829db388952856bf2243a334ff54eaf520760', NULL, 'nurjanah@gmail.com', NULL, NULL, NULL, NULL, 1510628885, 1514965980, 1, 'Siti ', 'Nurjanah', 'NRI', '82111838093', NULL, 'female', 5, 4, 8, NULL, 0, 0, 3614, 1, 0, 0),
(20, 0x3138322e33302e36362e3830, 0x3130332e3231372e3137322e313636, 'ratna', '31ba204cb20dd74fd6349009b1b01fb15fb4dd9c', NULL, 'ratna.khaeza@gmail.com', NULL, NULL, NULL, '4e2ba7d8bf2726b898b426e84d80cdf5c4e0d306', 1511319052, 1515839974, 1, 'Ratna', 'Nurasih', 'NRI', '083808058583', NULL, 'female', 5, 4, 8, NULL, 0, 0, 2215, 1, 0, 0),
(21, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'venda', 'cc28ff3ea0edb3c84c3d909d978f0c82ca4d632d', NULL, 'novendagiri@gmail.com', NULL, NULL, NULL, NULL, 1511319161, 1514435550, 1, 'Novenda', 'Giri Utami', 'NRI', '085921079004', NULL, 'female', 5, 5, 10, NULL, 0, 0, 2263, 1, 0, 0),
(22, 0x3133392e3139322e3235312e3730, 0x3130332e3231372e3137322e313636, 'febri', 'afc70a93d60d73ce086780528892400e7a7e983d', NULL, 'febriyanti685@gmail.com', NULL, NULL, NULL, NULL, 1511319248, 1515059902, 1, 'Febriyanti ', 'Sitorus', 'NRI', '087782855756', NULL, 'female', 5, 4, 8, NULL, 0, 0, 5447, 1, 0, 0),
(23, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'rifa', '4ce46a66bca49e756b90e7063f08f7697c484b0c', NULL, 'rifahadisiya06@gmail.com', NULL, NULL, NULL, NULL, 1511319730, 1515386856, 1, 'Rifaul ', 'Hadisiya', 'NRI', '0896 9284 3585', NULL, 'male', 5, 4, 8, NULL, 0, 0, 1077, 1, 0, 0),
(24, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'oksy', '2f70017c1536fee706b65ed6a87c1407837dc9b7', NULL, 'osky@gmail.com', NULL, NULL, NULL, NULL, 1511319800, 1515485188, 1, 'Oksy ', 'Dayanti', 'NRI', '087887741161', NULL, 'female', 5, 4, 8, NULL, 0, 0, 853, 1, 0, 0),
(25, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'lucy', '496e444ced589851bab225148c80b54b371cf9c5', NULL, 'lucyana27@icloud.com', NULL, NULL, NULL, NULL, 1511319922, 1514518354, 1, 'Lucyana ', 'Nugraha', 'NRI', '0896-9433-4342', NULL, 'female', 5, 6, 9, NULL, 0, 0, 1231, 1, 0, 0),
(26, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'ani.a', '595aaae00d30bb7d0f8b0d7ffc3ede6c2f9e24da', NULL, 'aniandarwati11@gmail.com', NULL, NULL, NULL, NULL, 1511320088, 1514431846, 1, 'Ani ', 'Andarwati', 'NRI', '085691146315', NULL, 'female', 5, 5, 10, NULL, 0, 0, 4170, 1, 0, 0),
(27, 0x3130332e31302e36362e3137, 0x3130332e3231372e3137322e313636, 'indri', '065a7667d094124df0a96b18ff477c92ff2ea72f', NULL, 'mitha9195@gmail.com', NULL, NULL, NULL, NULL, 1511320200, 1514467501, 1, 'Indri ', 'Paramita', 'NRI', '089634432035', NULL, 'female', 5, 5, 10, NULL, 0, 0, 4670, 1, 0, 0),
(28, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'rifi', '7f83185756c84218df6d88ebe72467d3668d304a', NULL, 'syaqilla.fifle@gmail.com', NULL, NULL, NULL, NULL, 1511320260, 1513838089, 1, 'Varma ', 'Rifi', 'NRI', '083876875287', NULL, 'female', 5, 5, 10, NULL, 0, 0, 12243, 1, 0, 0),
(30, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'riana', '4ba215b68adf93f53b6ad3425adc24527731ee98', NULL, 'rianasuryani1@gmail.com', NULL, NULL, NULL, NULL, 1512010319, 1514432846, 1, 'Riana', 'Riana', 'NRI', '82111838093', NULL, 'female', 5, 5, 10, NULL, 0, 0, 1456, 1, 0, 0),
(29, 0x3130332e3233322e33332e3337, 0x3130332e3231372e3137322e313636, 'test', '41ca093fe8b9ad14f6fcc6ae769702ebc5b7c4f9', NULL, 'test@gmail.com', NULL, NULL, NULL, NULL, 1511335913, 1513593063, 1, 'TEST', 'TEST', 'NRI', '82111838093', NULL, 'male', 1, 0, 0, NULL, 0, 0, 2397, 1, 0, 0),
(31, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'indah', '6c450830d414cbd2b16c9e0bd86ac84029008d77', NULL, 'permatasari.indahputri@yahoo.co.id', NULL, NULL, NULL, NULL, 1512010522, 1514529653, 1, 'Indah ', 'Putri', 'NRI', '82111838093', NULL, 'female', 5, 6, 9, NULL, 0, 0, 4008, 1, 0, 0),
(32, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'shepti', '026cf74985aba50094b84e21b8d4a1f83621fc44', NULL, 'sheptiaa02@gmail.com', NULL, NULL, NULL, NULL, 1512010620, 1514431813, 1, 'Sheptia ', 'Ayu', 'NRI', '82111838093', NULL, 'female', 5, 5, 10, NULL, 0, 0, 4607, 1, 0, 0),
(33, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'rani', 'b07d5b480b4789b664cf0f22f4ecfcd5d162a881', NULL, 'raniati2112@gmail.com', NULL, NULL, NULL, NULL, 1512010698, 1513918173, 1, 'Raniati', 'Raniati', 'NRI', '82111838093', NULL, 'female', 5, 6, 9, NULL, 0, 0, 3369, 1, 0, 0),
(34, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'tora', '5e3c500a322093ee6d9fc5f32607d69a909f2d5a', NULL, 'oktoramu@gmail.com', NULL, NULL, NULL, NULL, 1512010758, 1514436179, 1, 'Oktora', 'Munandar', 'NRI', '087884311131', NULL, 'male', 5, 5, 10, NULL, 0, 0, 5158, 1, 0, 0),
(35, 0x3133392e3139322e3235312e3730, 0x3130332e3233322e33332e3337, 'sherly', '7f1444fc24fa119fd0c0bcf3d0a4c2adffd7c5ab', NULL, 'sherly.141014@gmail.com', NULL, NULL, NULL, NULL, 1512010929, 1514966051, 1, 'Sherly ', 'Septiyani', 'NRI', '82111838093', NULL, 'female', 5, 4, 8, NULL, 0, 0, 1814, 1, 0, 0),
(36, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'iril', '28a48dc905e53606e729649248b426a5bc444ff4', NULL, 'choirlabdillah12@gmail.com', NULL, NULL, NULL, NULL, 1512010978, 1513910882, 1, 'Choiril ', 'Abdillah', 'NRI', '82111838093', NULL, 'male', 5, 6, 9, NULL, 0, 0, 5025, 1, 0, 0),
(37, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'novi', 'ec893912eb4c33b7b53945312c1303afb0f37655', NULL, 'novihanifah23@yahoo.com', NULL, NULL, NULL, NULL, 1512011051, 1515386548, 1, 'Novi ', 'Hanfiah', 'NRI', '82111838093', NULL, 'female', 5, 4, 8, NULL, 0, 0, 6143, 1, 0, 0),
(38, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'daniar', '4cb77237ee5947ef2a0b19f9f7bc12949b3bac1d', NULL, 'daniarnovitasari07@gmail.com', NULL, NULL, NULL, NULL, 1512011111, 1514518224, 1, 'Daniar ', 'Novitasari', 'NRI', '82111838093', NULL, 'female', 5, 6, 9, NULL, 0, 0, 4937, 1, 0, 0),
(39, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'harry', 'bb0b0eabae5a027bd2e130e498541cd99e4c7305', NULL, 'arietama213@gmail.com', NULL, NULL, NULL, NULL, 1512011157, 1513751912, 1, 'Harry Aditya ', 'Pratama', 'NRI', '82111838093', NULL, 'male', 5, 4, 8, NULL, 0, 0, 773, 1, 0, 0),
(40, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'silvi', '2e2233eda0576e5ddb0078de19229845409123b1', NULL, 'silvidewilestari28@gmail.com', NULL, NULL, NULL, NULL, 1512011249, 1514431736, 1, 'Silvi Dewi ', 'Lestari', 'NRI', '82111838093', NULL, 'female', 5, 5, 10, NULL, 0, 0, 4832, 1, 0, 0),
(41, 0x3133392e3139322e3235312e3730, 0x3130332e3233322e33332e3337, 'dina', 'f8446ee022432bed8ce6854c6c966ad3377656f7', NULL, 'nurul.romadina@gmail.com', NULL, NULL, NULL, NULL, 1512011291, 1514973528, 1, 'Nurul ', 'Ramadina', 'NRI', '82111838093', NULL, 'female', 5, 4, 8, NULL, 0, 0, 2445, 1, 0, 0),
(42, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'gita', '230de21a104ef9417d2bb01779da53007efce63d', NULL, 'anggita.mawangi24@gmail.com', NULL, NULL, NULL, NULL, 1512011342, 1513917942, 1, 'Anggita ', 'Mawangi', 'NRI', '82111838093', NULL, 'female', 5, 6, 9, NULL, 0, 0, 296, 1, 0, 0),
(43, 0x3130332e3233322e33332e3337, 0x3130332e3233322e33332e3337, 'tes3', '24fff6da8359dd85d02ca720f649e210d5d8d431', NULL, 'asdas@adasd.com', NULL, NULL, NULL, NULL, 1513838992, 1513910859, 1, 'tes3', 'tes3', 'te', '131231', NULL, 'male', 1, 0, 0, NULL, 0, 0, 630, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(780, 2, NULL, 0x3130332e3233322e33332e3337, 'owner@erp.com', '2018-01-15 16:24:00'),
(779, 2, NULL, 0x3133392e3232382e3136332e3635, 'owner@erp.com', '2018-01-15 14:10:31'),
(778, 2, NULL, 0x3133392e3232382e3136332e3635, 'owner@erp.com', '2018-01-15 11:42:08'),
(777, 2, NULL, 0x3133392e3232382e3136332e3635, 'owner@erp.com', '2018-01-15 05:12:11'),
(776, 2, NULL, 0x3130332e3233322e33332e3337, 'owner@erp.com', '2018-01-15 03:24:48'),
(775, 2, NULL, 0x3130332e3233322e33332e3337, 'owner@erp.com', '2018-01-15 03:22:08'),
(774, 2, NULL, 0x3138322e33302e3130362e3938, 'owner@erp.com', '2018-01-14 18:38:03'),
(773, 2, NULL, 0x33362e38322e3130332e3834, 'owner@erp.com', '2018-01-14 08:57:16'),
(772, 2, NULL, 0x3138322e33302e36362e3830, 'owner@erp.com', '2018-01-13 10:41:30'),
(771, 20, NULL, 0x3138322e33302e36362e3830, 'ratna', '2018-01-13 10:39:34'),
(770, 2, NULL, 0x3138322e33302e36362e3830, 'owner@erp.com', '2018-01-13 10:11:21'),
(769, 2, NULL, 0x3130332e3233322e33332e3337, 'owner@erp.com', '2018-01-13 04:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(4, 'Lippo Store', 'Lippo Puri Store', '<p>Jl. Puri Indah Raya Blok U 1, Kembangan Selatan, RT.3/RW.2, Jakarta Barat, Daerah Khusus Ibukota Jakarta 11610</p>', 'f0fab80cba7fa85be6a85bb20a6a0d64.PNG', '', '', 1),
(3, 'HO WH', 'Head Office Warehouse', '<p>Jalan KH Hasyim Ashari no 46E</p>', NULL, '', '', 1),
(5, 'Gancit Store', 'Gandaria City Store', '<p>Jl. Sultan Iskandar Muda, Kebayoran Lama Utara, Kebayoran Lama, Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12240</p>', 'e08a3def33f0f3e0e3feb2b9af6a3afa.PNG', '', '', 1),
(6, 'Kokas Store', 'Kota Kasablanka Store', '<p>Jalan Casablanca Raya Kav. 88, RT.16/RW.5, Menteng Dalam, Tebet, RT.16/RW.5, Menteng Dalam, Tebet, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12870</p>', '8190bcc5503ac0ab608c3f11755eefb9.PNG', '', '', 1),
(7, 'Online Division', 'Online Store Warehouse', '<p>Jalan KH Hasyim Ashari no.46E</p>', '83365d118a7c434aeff96534d742a69b.PNG', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(6776, 2421, 7, '0.0000', NULL, '91434.0000'),
(6775, 2421, 6, '0.0000', NULL, '91434.0000'),
(6774, 2421, 5, '0.0000', NULL, '91434.0000'),
(6773, 2421, 3, '0.0000', NULL, '91434.0000'),
(6772, 2421, 4, '0.0000', NULL, '91434.0000'),
(6771, 2384, 7, '0.0000', NULL, '78862.0000'),
(6770, 2384, 6, '0.0000', NULL, '78862.0000'),
(6769, 2384, 5, '0.0000', NULL, '78862.0000'),
(6768, 2384, 3, '0.0000', NULL, '78862.0000'),
(6767, 2384, 4, '0.0000', NULL, '78862.0000'),
(6766, 2127, 7, '0.0000', NULL, '61337.0000'),
(6765, 2127, 6, '0.0000', NULL, '61337.0000'),
(6764, 2127, 5, '0.0000', NULL, '61337.0000'),
(6763, 2127, 4, '0.0000', NULL, '61337.0000'),
(6762, 2230, 7, '0.0000', NULL, '70099.0000'),
(6761, 2230, 6, '0.0000', NULL, '70099.0000'),
(6760, 2230, 5, '0.0000', NULL, '70099.0000'),
(6759, 2230, 4, '0.0000', NULL, '70099.0000'),
(6758, 2235, 7, '0.0000', NULL, '238974.0000'),
(6757, 2235, 6, '0.0000', NULL, '238974.0000'),
(6756, 2235, 5, '0.0000', NULL, '238974.0000'),
(6755, 2235, 4, '0.0000', NULL, '238974.0000'),
(6754, 2289, 7, '0.0000', NULL, '122674.0000'),
(6753, 2289, 6, '0.0000', NULL, '122674.0000'),
(6752, 2289, 5, '0.0000', NULL, '122674.0000'),
(6751, 2289, 4, '0.0000', NULL, '122674.0000'),
(6750, 2128, 7, '0.0000', NULL, '70099.0000'),
(6749, 2128, 6, '0.0000', NULL, '70099.0000'),
(6748, 2128, 5, '0.0000', NULL, '70099.0000'),
(6747, 2128, 4, '0.0000', NULL, '70099.0000'),
(6746, 2129, 7, '0.0000', NULL, '199145.0000'),
(6745, 2129, 6, '0.0000', NULL, '199145.0000'),
(6744, 2129, 5, '0.0000', NULL, '199145.0000'),
(6743, 2129, 4, '0.0000', NULL, '199145.0000'),
(6742, 2243, 7, '0.0000', NULL, '262871.0000'),
(6741, 2243, 6, '0.0000', NULL, '262871.0000'),
(6740, 2243, 5, '0.0000', NULL, '262871.0000'),
(6739, 2243, 4, '0.0000', NULL, '262871.0000'),
(6738, 2360, 7, '0.0000', NULL, '126656.0000'),
(6737, 2360, 6, '0.0000', NULL, '126656.0000'),
(6736, 2360, 5, '0.0000', NULL, '126656.0000'),
(6735, 2360, 4, '0.0000', NULL, '126656.0000'),
(6734, 2130, 7, '0.0000', NULL, '214280.0000'),
(6733, 2130, 6, '0.0000', NULL, '214280.0000'),
(6732, 2130, 5, '0.0000', NULL, '214280.0000'),
(6731, 2130, 4, '0.0000', NULL, '214280.0000'),
(6730, 2131, 7, '0.0000', NULL, '62930.0000'),
(6729, 2131, 6, '0.0000', NULL, '62930.0000'),
(6728, 2131, 5, '0.0000', NULL, '62930.0000'),
(6727, 2131, 4, '0.0000', NULL, '62930.0000'),
(6726, 2366, 7, '0.0000', NULL, '78862.0000'),
(6725, 2366, 6, '0.0000', NULL, '78862.0000'),
(6724, 2366, 5, '0.0000', NULL, '78862.0000'),
(6723, 2366, 4, '0.0000', NULL, '78862.0000'),
(6722, 2248, 7, '0.0000', NULL, '70099.0000'),
(6721, 2248, 6, '0.0000', NULL, '70099.0000'),
(6720, 2248, 5, '0.0000', NULL, '70099.0000'),
(6719, 2248, 4, '0.0000', NULL, '70099.0000'),
(6718, 2295, 7, '0.0000', NULL, '95590.0000'),
(6717, 2295, 6, '0.0000', NULL, '95590.0000'),
(6716, 2295, 5, '0.0000', NULL, '95590.0000'),
(6715, 2295, 4, '0.0000', NULL, '95590.0000'),
(6714, 2374, 7, '0.0000', NULL, '150554.0000'),
(6713, 2374, 6, '0.0000', NULL, '150554.0000'),
(6712, 2374, 5, '0.0000', NULL, '150554.0000'),
(6711, 2374, 4, '0.0000', NULL, '150554.0000'),
(6710, 2253, 7, '0.0000', NULL, '198348.0000'),
(6709, 2253, 6, '0.0000', NULL, '198348.0000'),
(6708, 2253, 5, '0.0000', NULL, '198348.0000'),
(6707, 2253, 4, '0.0000', NULL, '198348.0000'),
(6706, 2380, 7, '0.0000', NULL, '86828.0000'),
(6705, 2380, 6, '0.0000', NULL, '86828.0000'),
(6704, 2380, 5, '0.0000', NULL, '86828.0000'),
(6703, 2380, 4, '0.0000', NULL, '86828.0000'),
(6702, 2208, 7, '0.0000', NULL, '7577.0000'),
(6701, 2208, 6, '0.0000', NULL, '7577.0000'),
(6700, 2208, 5, '0.0000', NULL, '7577.0000'),
(6699, 2208, 4, '0.0000', NULL, '7577.0000'),
(6698, 2257, 7, '0.0000', NULL, '7577.0000'),
(6697, 2257, 6, '0.0000', NULL, '7577.0000'),
(6696, 2257, 5, '0.0000', NULL, '7577.0000'),
(6695, 2257, 4, '0.0000', NULL, '7577.0000'),
(6694, 2132, 7, '0.0000', NULL, '78862.0000'),
(6693, 2132, 6, '0.0000', NULL, '78862.0000'),
(6692, 2132, 5, '0.0000', NULL, '78862.0000'),
(6691, 2132, 4, '0.0000', NULL, '78862.0000'),
(6690, 2261, 7, '0.0000', NULL, '27881.0000'),
(6689, 2261, 6, '0.0000', NULL, '27881.0000'),
(6688, 2261, 5, '0.0000', NULL, '27881.0000'),
(6687, 2261, 4, '0.0000', NULL, '27881.0000'),
(6686, 2264, 7, '0.0000', NULL, '95590.0000'),
(6685, 2264, 6, '0.0000', NULL, '95590.0000'),
(6684, 2264, 5, '0.0000', NULL, '95590.0000'),
(6683, 2264, 4, '0.0000', NULL, '95590.0000'),
(6682, 2313, 7, '0.0000', NULL, '55761.0000'),
(6681, 2313, 6, '0.0000', NULL, '55761.0000'),
(6680, 2313, 5, '0.0000', NULL, '55761.0000'),
(6679, 2313, 4, '0.0000', NULL, '55761.0000'),
(6678, 2323, 7, '0.0000', NULL, '54964.0000'),
(6677, 2323, 6, '0.0000', NULL, '54964.0000'),
(6676, 2323, 5, '0.0000', NULL, '54964.0000'),
(6675, 2323, 4, '0.0000', NULL, '54964.0000'),
(6674, 2271, 7, '0.0000', NULL, '47795.0000'),
(6673, 2271, 6, '0.0000', NULL, '47795.0000'),
(6672, 2271, 5, '0.0000', NULL, '47795.0000'),
(6671, 2271, 4, '0.0000', NULL, '47795.0000'),
(6670, 2326, 7, '0.0000', NULL, '99573.0000'),
(6669, 2326, 6, '0.0000', NULL, '99573.0000'),
(6668, 2326, 5, '0.0000', NULL, '99573.0000'),
(6667, 2326, 4, '0.0000', NULL, '99573.0000'),
(6666, 2328, 7, '0.0000', NULL, '99573.0000'),
(6665, 2328, 6, '0.0000', NULL, '99573.0000'),
(6664, 2328, 5, '0.0000', NULL, '99573.0000'),
(6663, 2328, 4, '0.0000', NULL, '99573.0000'),
(6662, 2133, 7, '0.0000', NULL, '43812.0000'),
(6661, 2133, 6, '0.0000', NULL, '43812.0000'),
(6660, 2133, 5, '0.0000', NULL, '43812.0000'),
(6659, 2133, 4, '0.0000', NULL, '43812.0000'),
(6658, 2263, 7, '0.0000', NULL, '118691.0000'),
(6657, 2245, 7, '0.0000', NULL, '118691.0000'),
(6656, 2245, 6, '0.0000', NULL, '118691.0000'),
(6655, 2245, 5, '0.0000', NULL, '118691.0000'),
(6654, 2245, 4, '0.0000', NULL, '118691.0000'),
(6653, 2134, 7, '0.0000', NULL, '86828.0000'),
(6652, 2134, 6, '0.0000', NULL, '86828.0000'),
(6651, 2134, 5, '0.0000', NULL, '86828.0000'),
(6650, 2134, 4, '0.0000', NULL, '86828.0000'),
(6649, 2232, 7, '0.0000', NULL, '7966.0000'),
(6648, 2232, 6, '0.0000', NULL, '7966.0000'),
(6647, 2232, 5, '0.0000', NULL, '7966.0000'),
(6646, 2232, 4, '0.0000', NULL, '7966.0000'),
(6645, 2348, 7, '0.0000', NULL, '31864.0000'),
(6644, 2348, 6, '0.0000', NULL, '31864.0000'),
(6643, 2348, 5, '0.0000', NULL, '31864.0000'),
(6642, 2348, 4, '0.0000', NULL, '31864.0000'),
(6641, 2372, 7, '0.0000', NULL, '7966.0000'),
(6640, 2372, 6, '0.0000', NULL, '7966.0000'),
(6639, 2372, 5, '0.0000', NULL, '7966.0000'),
(6638, 2372, 4, '0.0000', NULL, '7966.0000'),
(6637, 2250, 7, '0.0000', NULL, '19915.0000'),
(6636, 2250, 6, '0.0000', NULL, '19915.0000'),
(6635, 2250, 5, '0.0000', NULL, '19915.0000'),
(6634, 2250, 4, '0.0000', NULL, '19915.0000'),
(6633, 2135, 7, '0.0000', NULL, '955894.0000'),
(6632, 2135, 6, '0.0000', NULL, '955894.0000'),
(6631, 2135, 5, '0.0000', NULL, '955894.0000'),
(6630, 2135, 4, '0.0000', NULL, '955894.0000'),
(6629, 2136, 7, '0.0000', NULL, '15543.0000'),
(6628, 2136, 6, '0.0000', NULL, '15543.0000'),
(6627, 2136, 5, '0.0000', NULL, '15543.0000'),
(6626, 2136, 4, '0.0000', NULL, '15543.0000'),
(6625, 2137, 7, '0.0000', NULL, '15543.0000'),
(6624, 2137, 6, '0.0000', NULL, '15543.0000'),
(6623, 2137, 5, '0.0000', NULL, '15543.0000'),
(6622, 2137, 4, '0.0000', NULL, '15543.0000'),
(6621, 2234, 7, '0.0000', NULL, '70099.0000'),
(6620, 2234, 6, '0.0000', NULL, '70099.0000'),
(6619, 2234, 5, '0.0000', NULL, '70099.0000'),
(6618, 2234, 4, '0.0000', NULL, '70099.0000'),
(6617, 2239, 7, '0.0000', NULL, '150554.0000'),
(6616, 2239, 6, '0.0000', NULL, '150554.0000'),
(6615, 2239, 5, '0.0000', NULL, '150554.0000'),
(6614, 2239, 4, '0.0000', NULL, '150554.0000'),
(6613, 2138, 7, '0.0000', NULL, '15543.0000'),
(6612, 2138, 6, '0.0000', NULL, '15543.0000'),
(6611, 2138, 5, '0.0000', NULL, '15543.0000'),
(6610, 2138, 4, '0.0000', NULL, '15543.0000'),
(6609, 2379, 7, '0.0000', NULL, '214280.0000'),
(6608, 2379, 6, '0.0000', NULL, '214280.0000'),
(6607, 2379, 5, '0.0000', NULL, '214280.0000'),
(6606, 2379, 4, '0.0000', NULL, '214280.0000'),
(6605, 2139, 7, '0.0000', NULL, '23898.0000'),
(6604, 2139, 6, '0.0000', NULL, '23898.0000'),
(6603, 2139, 5, '0.0000', NULL, '23898.0000'),
(6602, 2139, 4, '0.0000', NULL, '23898.0000'),
(6601, 2329, 7, '0.0000', NULL, '525742.0000'),
(6600, 2329, 6, '0.0000', NULL, '525742.0000'),
(6599, 2329, 5, '0.0000', NULL, '525742.0000'),
(6598, 2329, 4, '0.0000', NULL, '525742.0000'),
(6597, 2274, 7, '0.0000', NULL, '78862.0000'),
(6596, 2274, 6, '0.0000', NULL, '78862.0000'),
(6595, 2274, 5, '0.0000', NULL, '78862.0000'),
(6594, 2274, 4, '0.0000', NULL, '78862.0000'),
(6593, 2333, 7, '0.0000', NULL, '302700.0000'),
(6592, 2333, 6, '0.0000', NULL, '302700.0000'),
(6591, 2333, 5, '0.0000', NULL, '302700.0000'),
(6590, 2333, 4, '0.0000', NULL, '302700.0000'),
(6589, 2334, 7, '0.0000', NULL, '302700.0000'),
(6588, 2334, 6, '0.0000', NULL, '302700.0000'),
(6587, 2334, 5, '0.0000', NULL, '302700.0000'),
(6586, 2334, 4, '0.0000', NULL, '302700.0000'),
(6585, 2140, 7, '0.0000', NULL, '438118.0000'),
(6584, 2140, 6, '0.0000', NULL, '438118.0000'),
(6583, 2140, 5, '0.0000', NULL, '438118.0000'),
(6582, 2140, 4, '0.0000', NULL, '438118.0000'),
(6581, 2141, 7, '0.0000', NULL, '102759.0000'),
(6580, 2141, 6, '0.0000', NULL, '102759.0000'),
(6579, 2141, 5, '0.0000', NULL, '102759.0000'),
(6578, 2141, 4, '0.0000', NULL, '102759.0000'),
(6577, 2251, 7, '0.0000', NULL, '182417.0000'),
(6576, 2251, 6, '0.0000', NULL, '182417.0000'),
(6575, 2251, 5, '0.0000', NULL, '182417.0000'),
(6574, 2251, 4, '0.0000', NULL, '182417.0000'),
(6573, 2142, 7, '0.0000', NULL, '26045.0000'),
(6572, 2142, 6, '0.0000', NULL, '26045.0000'),
(6571, 2142, 5, '0.0000', NULL, '26045.0000'),
(6570, 2142, 4, '0.0000', NULL, '26045.0000'),
(6569, 2441, 7, '0.0000', NULL, '55761.0000'),
(6568, 2441, 6, '0.0000', NULL, '55761.0000'),
(6567, 2441, 5, '0.0000', NULL, '55761.0000'),
(6566, 2441, 4, '0.0000', NULL, '55761.0000'),
(6565, 2321, 7, '0.0000', NULL, '27881.0000'),
(6564, 2321, 6, '0.0000', NULL, '27881.0000'),
(6563, 2321, 5, '0.0000', NULL, '27881.0000'),
(6562, 2321, 4, '0.0000', NULL, '27881.0000'),
(6561, 2350, 7, '0.0000', NULL, '23898.0000'),
(6560, 2350, 6, '0.0000', NULL, '23898.0000'),
(6559, 2350, 5, '0.0000', NULL, '23898.0000'),
(6558, 2350, 4, '0.0000', NULL, '23898.0000'),
(6557, 2357, 7, '0.0000', NULL, '14339.0000'),
(6556, 2357, 6, '0.0000', NULL, '14339.0000'),
(6555, 2357, 5, '0.0000', NULL, '14339.0000'),
(6554, 2357, 4, '0.0000', NULL, '14339.0000'),
(6553, 2358, 7, '0.0000', NULL, '11949.0000'),
(6552, 2358, 6, '0.0000', NULL, '11949.0000'),
(6551, 2358, 5, '0.0000', NULL, '11949.0000'),
(6550, 2358, 4, '0.0000', NULL, '11949.0000'),
(6549, 2361, 7, '0.0000', NULL, '11949.0000'),
(6548, 2361, 6, '0.0000', NULL, '11949.0000'),
(6547, 2361, 5, '0.0000', NULL, '11949.0000'),
(6546, 2361, 4, '0.0000', NULL, '11949.0000'),
(6545, 2143, 7, '0.0000', NULL, '7170.0000'),
(6544, 2143, 6, '0.0000', NULL, '7170.0000'),
(6543, 2143, 5, '0.0000', NULL, '7170.0000'),
(6542, 2143, 4, '0.0000', NULL, '7170.0000'),
(6541, 2218, 7, '0.0000', NULL, '46999.0000'),
(6540, 2218, 6, '0.0000', NULL, '46999.0000'),
(6539, 2218, 5, '0.0000', NULL, '46999.0000'),
(6538, 2218, 4, '0.0000', NULL, '46999.0000'),
(6537, 2279, 7, '0.0000', NULL, '159316.0000'),
(6536, 2279, 6, '0.0000', NULL, '159316.0000'),
(6535, 2279, 5, '0.0000', NULL, '159316.0000'),
(6534, 2279, 4, '0.0000', NULL, '159316.0000'),
(6533, 2144, 7, '0.0000', NULL, '86828.0000'),
(6532, 2144, 6, '0.0000', NULL, '86828.0000'),
(6531, 2144, 5, '0.0000', NULL, '86828.0000'),
(6530, 2144, 4, '0.0000', NULL, '86828.0000'),
(6529, 2145, 7, '0.0000', NULL, '102759.0000'),
(6528, 2145, 6, '0.0000', NULL, '102759.0000'),
(6527, 2145, 5, '0.0000', NULL, '102759.0000'),
(6526, 2145, 4, '0.0000', NULL, '102759.0000'),
(6525, 2501, 7, '0.0000', NULL, '78862.0000'),
(6524, 2501, 6, '0.0000', NULL, '78862.0000'),
(6523, 2501, 5, '0.0000', NULL, '78862.0000'),
(6522, 2501, 4, '0.0000', NULL, '78862.0000'),
(6521, 2146, 7, '0.0000', NULL, '118691.0000'),
(6520, 2146, 6, '0.0000', NULL, '118691.0000'),
(6519, 2146, 5, '0.0000', NULL, '118691.0000'),
(6518, 2146, 4, '0.0000', NULL, '118691.0000'),
(6517, 2406, 7, '0.0000', NULL, '102759.0000'),
(6516, 2406, 6, '0.0000', NULL, '102759.0000'),
(6515, 2406, 5, '0.0000', NULL, '102759.0000'),
(6514, 2406, 4, '0.0000', NULL, '102759.0000'),
(6513, 2236, 7, '0.0000', NULL, '126656.0000'),
(6512, 2236, 6, '0.0000', NULL, '126656.0000'),
(6511, 2236, 5, '0.0000', NULL, '126656.0000'),
(6510, 2236, 4, '0.0000', NULL, '126656.0000'),
(6509, 2290, 7, '0.0000', NULL, '100369.0000'),
(6508, 2290, 6, '0.0000', NULL, '100369.0000'),
(6507, 2290, 5, '0.0000', NULL, '100369.0000'),
(6506, 2290, 4, '0.0000', NULL, '100369.0000'),
(6505, 2291, 7, '0.0000', NULL, '198348.0000'),
(6504, 2291, 6, '0.0000', NULL, '198348.0000'),
(6503, 2291, 5, '0.0000', NULL, '198348.0000'),
(6502, 2291, 4, '0.0000', NULL, '198348.0000'),
(6501, 2409, 7, '0.0000', NULL, '95590.0000'),
(6500, 2409, 6, '0.0000', NULL, '95590.0000'),
(6499, 2409, 5, '0.0000', NULL, '95590.0000'),
(6498, 2409, 4, '0.0000', NULL, '95590.0000'),
(6497, 2147, 7, '0.0000', NULL, '15543.0000'),
(6496, 2147, 6, '0.0000', NULL, '15543.0000'),
(6495, 2147, 5, '0.0000', NULL, '15543.0000'),
(6494, 2147, 4, '0.0000', NULL, '15543.0000'),
(6493, 2148, 7, '0.0000', NULL, '78862.0000'),
(6492, 2148, 6, '0.0000', NULL, '78862.0000'),
(6491, 2148, 5, '0.0000', NULL, '78862.0000'),
(6490, 2148, 4, '0.0000', NULL, '78862.0000'),
(6489, 2246, 7, '0.0000', NULL, '75433.0000'),
(6488, 2246, 6, '0.0000', NULL, '75433.0000'),
(6487, 2246, 5, '0.0000', NULL, '75433.0000'),
(6486, 2246, 4, '0.0000', NULL, '75433.0000'),
(6485, 2414, 7, '0.0000', NULL, '262871.0000'),
(6484, 2414, 6, '0.0000', NULL, '262871.0000'),
(6483, 2414, 5, '0.0000', NULL, '262871.0000'),
(6482, 2414, 4, '0.0000', NULL, '262871.0000'),
(6481, 2247, 7, '0.0000', NULL, '70099.0000'),
(6480, 2247, 6, '0.0000', NULL, '70099.0000'),
(6479, 2247, 5, '0.0000', NULL, '70099.0000'),
(6478, 2247, 4, '0.0000', NULL, '70099.0000'),
(6477, 2417, 7, '0.0000', NULL, '238974.0000'),
(6476, 2417, 6, '0.0000', NULL, '238974.0000'),
(6475, 2417, 5, '0.0000', NULL, '238974.0000'),
(6474, 2417, 4, '0.0000', NULL, '238974.0000'),
(6473, 2419, 7, '0.0000', NULL, '199145.0000'),
(6472, 2419, 6, '0.0000', NULL, '199145.0000'),
(6471, 2419, 5, '0.0000', NULL, '199145.0000'),
(6470, 2419, 4, '0.0000', NULL, '199145.0000'),
(6469, 2252, 7, '0.0000', NULL, '182417.0000'),
(6468, 2252, 6, '0.0000', NULL, '182417.0000'),
(6467, 2252, 5, '0.0000', NULL, '182417.0000'),
(6466, 2252, 4, '0.0000', NULL, '182417.0000'),
(6465, 2298, 7, '0.0000', NULL, '198348.0000'),
(6464, 2298, 6, '0.0000', NULL, '198348.0000'),
(6463, 2298, 5, '0.0000', NULL, '198348.0000'),
(6462, 2298, 4, '0.0000', NULL, '198348.0000'),
(6461, 2420, 7, '0.0000', NULL, '78862.0000'),
(6460, 2420, 6, '0.0000', NULL, '78862.0000'),
(6459, 2420, 5, '0.0000', NULL, '78862.0000'),
(6458, 2420, 4, '0.0000', NULL, '78862.0000'),
(6457, 2300, 7, '0.0000', NULL, '70099.0000'),
(6456, 2300, 6, '0.0000', NULL, '70099.0000'),
(6455, 2300, 5, '0.0000', NULL, '70099.0000'),
(6454, 2300, 4, '0.0000', NULL, '70099.0000'),
(6453, 2259, 7, '0.0000', NULL, '55761.0000'),
(6452, 2259, 6, '0.0000', NULL, '55761.0000'),
(6451, 2259, 5, '0.0000', NULL, '55761.0000'),
(6450, 2259, 4, '0.0000', NULL, '55761.0000'),
(6449, 2149, 7, '0.0000', NULL, '134622.0000'),
(6448, 2149, 6, '0.0000', NULL, '134622.0000'),
(6447, 2149, 5, '0.0000', NULL, '134622.0000'),
(6446, 2149, 4, '0.0000', NULL, '134622.0000'),
(6445, 2150, 7, '0.0000', NULL, '19915.0000'),
(6444, 2150, 6, '0.0000', NULL, '19915.0000'),
(6443, 2150, 5, '0.0000', NULL, '19915.0000'),
(6442, 2150, 4, '0.0000', NULL, '19915.0000'),
(6441, 2151, 7, '0.0000', NULL, '43812.0000'),
(6440, 2151, 6, '0.0000', NULL, '43812.0000'),
(6439, 2151, 5, '0.0000', NULL, '43812.0000'),
(6438, 2151, 4, '0.0000', NULL, '43812.0000'),
(6437, 2152, 7, '0.0000', NULL, '43812.0000'),
(6436, 2152, 6, '0.0000', NULL, '43812.0000'),
(6435, 2152, 5, '0.0000', NULL, '43812.0000'),
(6434, 2152, 4, '0.0000', NULL, '43812.0000'),
(6433, 2219, 7, '0.0000', NULL, '59744.0000'),
(6432, 2219, 6, '0.0000', NULL, '59744.0000'),
(6431, 2219, 5, '0.0000', NULL, '59744.0000'),
(6430, 2219, 4, '0.0000', NULL, '59744.0000'),
(6429, 2390, 7, '0.0000', NULL, '61337.0000'),
(6428, 2390, 6, '0.0000', NULL, '61337.0000'),
(6427, 2390, 5, '0.0000', NULL, '61337.0000'),
(6426, 2390, 4, '0.0000', NULL, '61337.0000'),
(6425, 2153, 7, '0.0000', NULL, '35847.0000'),
(6424, 2153, 6, '0.0000', NULL, '35847.0000'),
(6423, 2153, 5, '0.0000', NULL, '35847.0000'),
(6422, 2153, 4, '0.0000', NULL, '35847.0000'),
(6421, 2393, 7, '0.0000', NULL, '61337.0000'),
(6420, 2393, 6, '0.0000', NULL, '61337.0000'),
(6419, 2393, 5, '0.0000', NULL, '61337.0000'),
(6418, 2393, 4, '0.0000', NULL, '61337.0000'),
(6417, 2154, 7, '0.0000', NULL, '15932.0000'),
(6416, 2154, 6, '0.0000', NULL, '15932.0000'),
(6415, 2154, 5, '0.0000', NULL, '15932.0000'),
(6414, 2154, 4, '0.0000', NULL, '15932.0000'),
(6413, 2330, 7, '0.0000', NULL, '111521.0000'),
(6412, 2330, 6, '0.0000', NULL, '111521.0000'),
(6411, 2330, 5, '0.0000', NULL, '111521.0000'),
(6410, 2330, 4, '0.0000', NULL, '111521.0000'),
(6409, 2225, 7, '0.0000', NULL, '95590.0000'),
(6408, 2225, 6, '0.0000', NULL, '95590.0000'),
(6407, 2225, 5, '0.0000', NULL, '95590.0000'),
(6406, 2225, 4, '0.0000', NULL, '95590.0000'),
(6405, 2400, 7, '0.0000', NULL, '26288.0000'),
(6404, 2400, 6, '0.0000', NULL, '26288.0000'),
(6403, 2400, 5, '0.0000', NULL, '26288.0000'),
(6402, 2400, 4, '0.0000', NULL, '26288.0000'),
(6401, 2367, 7, '0.0000', NULL, '70099.0000'),
(6400, 2367, 6, '0.0000', NULL, '70099.0000'),
(6399, 2367, 5, '0.0000', NULL, '70099.0000'),
(6398, 2367, 4, '0.0000', NULL, '70099.0000'),
(6397, 2155, 7, '0.0000', NULL, '27456.0000'),
(6396, 2155, 6, '0.0000', NULL, '27456.0000'),
(6395, 2155, 5, '0.0000', NULL, '27456.0000'),
(6394, 2155, 4, '0.0000', NULL, '27456.0000'),
(6393, 2404, 7, '0.0000', NULL, '33280.0000'),
(6392, 2404, 6, '0.0000', NULL, '33280.0000'),
(6391, 2404, 5, '0.0000', NULL, '33280.0000'),
(6390, 2404, 4, '0.0000', NULL, '33280.0000'),
(6389, 2410, 7, '0.0000', NULL, '87278.0000'),
(6388, 2410, 6, '0.0000', NULL, '87278.0000'),
(6387, 2410, 5, '0.0000', NULL, '87278.0000'),
(6386, 2410, 4, '0.0000', NULL, '87278.0000'),
(6385, 2156, 7, '0.0000', NULL, '15543.0000'),
(6384, 2156, 6, '0.0000', NULL, '15543.0000'),
(6383, 2156, 5, '0.0000', NULL, '15543.0000'),
(6382, 2156, 4, '0.0000', NULL, '15543.0000'),
(6381, 2229, 7, '0.0000', NULL, '70099.0000'),
(6380, 2229, 6, '0.0000', NULL, '70099.0000'),
(6379, 2229, 5, '0.0000', NULL, '70099.0000'),
(6378, 2229, 4, '0.0000', NULL, '70099.0000'),
(6377, 2231, 7, '0.0000', NULL, '70099.0000'),
(6376, 2231, 6, '0.0000', NULL, '70099.0000'),
(6375, 2231, 5, '0.0000', NULL, '70099.0000'),
(6374, 2231, 4, '0.0000', NULL, '70099.0000'),
(6373, 2499, 7, '0.0000', NULL, '70099.0000'),
(6372, 2499, 6, '0.0000', NULL, '70099.0000'),
(6371, 2499, 5, '0.0000', NULL, '70099.0000'),
(6370, 2499, 4, '0.0000', NULL, '70099.0000'),
(6369, 2240, 7, '0.0000', NULL, '150554.0000'),
(6368, 2240, 6, '0.0000', NULL, '150554.0000'),
(6367, 2240, 5, '0.0000', NULL, '150554.0000'),
(6366, 2240, 4, '0.0000', NULL, '150554.0000'),
(6365, 2416, 7, '0.0000', NULL, '54964.0000'),
(6364, 2416, 6, '0.0000', NULL, '54964.0000'),
(6363, 2416, 5, '0.0000', NULL, '54964.0000'),
(6362, 2416, 4, '0.0000', NULL, '54964.0000'),
(6361, 2541, 7, '0.0000', NULL, '70099.0000'),
(6360, 2541, 6, '0.0000', NULL, '70099.0000'),
(6359, 2541, 5, '0.0000', NULL, '70099.0000'),
(6358, 2541, 4, '0.0000', NULL, '70099.0000'),
(6357, 2418, 7, '0.0000', NULL, '53337.0000'),
(6356, 2418, 6, '0.0000', NULL, '53337.0000'),
(6355, 2418, 5, '0.0000', NULL, '53337.0000'),
(6354, 2418, 4, '0.0000', NULL, '53337.0000'),
(6353, 2299, 7, '0.0000', NULL, '78862.0000'),
(6352, 2299, 6, '0.0000', NULL, '78862.0000'),
(6351, 2299, 5, '0.0000', NULL, '78862.0000'),
(6350, 2299, 4, '0.0000', NULL, '78862.0000'),
(6349, 2209, 7, '0.0000', NULL, '7577.0000'),
(6348, 2209, 6, '0.0000', NULL, '7577.0000'),
(6347, 2209, 5, '0.0000', NULL, '7577.0000'),
(6346, 2209, 4, '0.0000', NULL, '7577.0000'),
(6345, 2157, 7, '0.0000', NULL, '199145.0000'),
(6344, 2158, 7, '0.0000', NULL, '52575.0000'),
(6343, 2158, 6, '0.0000', NULL, '52575.0000'),
(6342, 2158, 5, '0.0000', NULL, '52575.0000'),
(6341, 2158, 4, '0.0000', NULL, '52575.0000'),
(6340, 2270, 7, '0.0000', NULL, '54964.0000'),
(6339, 2270, 6, '0.0000', NULL, '54964.0000'),
(6338, 2270, 5, '0.0000', NULL, '54964.0000'),
(6337, 2270, 4, '0.0000', NULL, '54964.0000'),
(6336, 2272, 7, '0.0000', NULL, '61337.0000'),
(6335, 2272, 6, '0.0000', NULL, '61337.0000'),
(6334, 2272, 5, '0.0000', NULL, '61337.0000'),
(6333, 2272, 4, '0.0000', NULL, '61337.0000'),
(6332, 2159, 7, '0.0000', NULL, '7577.0000'),
(6331, 2159, 6, '0.0000', NULL, '7577.0000'),
(6330, 2159, 5, '0.0000', NULL, '7577.0000'),
(6329, 2159, 4, '0.0000', NULL, '7577.0000'),
(6328, 2262, 7, '0.0000', NULL, '78862.0000'),
(6327, 2262, 6, '0.0000', NULL, '78862.0000'),
(6326, 2262, 5, '0.0000', NULL, '78862.0000'),
(6325, 2262, 4, '0.0000', NULL, '78862.0000'),
(6324, 2160, 7, '0.0000', NULL, '35050.0000'),
(6323, 2160, 6, '0.0000', NULL, '35050.0000'),
(6322, 2160, 5, '0.0000', NULL, '35050.0000'),
(6321, 2160, 4, '0.0000', NULL, '35050.0000'),
(6320, 2161, 7, '0.0000', NULL, '61337.0000'),
(6319, 2161, 6, '0.0000', NULL, '61337.0000'),
(6318, 2161, 5, '0.0000', NULL, '61337.0000'),
(6317, 2161, 4, '0.0000', NULL, '61337.0000'),
(6316, 2341, 7, '0.0000', NULL, '70099.0000'),
(6315, 2341, 6, '0.0000', NULL, '70099.0000'),
(6314, 2341, 5, '0.0000', NULL, '70099.0000'),
(6313, 2341, 4, '0.0000', NULL, '70099.0000'),
(6312, 2238, 7, '0.0000', NULL, '122674.0000'),
(6311, 2238, 6, '0.0000', NULL, '122674.0000'),
(6310, 2238, 5, '0.0000', NULL, '122674.0000'),
(6309, 2238, 4, '0.0000', NULL, '122674.0000'),
(6308, 2162, 7, '0.0000', NULL, '70099.0000'),
(6307, 2162, 6, '0.0000', NULL, '70099.0000'),
(6306, 2162, 5, '0.0000', NULL, '70099.0000'),
(6305, 2162, 4, '0.0000', NULL, '70099.0000'),
(6304, 2354, 7, '0.0000', NULL, '86828.0000'),
(6303, 2354, 6, '0.0000', NULL, '86828.0000'),
(6302, 2354, 5, '0.0000', NULL, '86828.0000'),
(6301, 2354, 4, '0.0000', NULL, '86828.0000'),
(6300, 2163, 7, '0.0000', NULL, '102759.0000'),
(6299, 2163, 6, '0.0000', NULL, '102759.0000'),
(6298, 2163, 5, '0.0000', NULL, '102759.0000'),
(6297, 2163, 4, '0.0000', NULL, '102759.0000'),
(6296, 2355, 7, '0.0000', NULL, '70099.0000'),
(6295, 2355, 6, '0.0000', NULL, '70099.0000'),
(6294, 2355, 5, '0.0000', NULL, '70099.0000'),
(6293, 2355, 4, '0.0000', NULL, '70099.0000'),
(6292, 2359, 7, '0.0000', NULL, '126656.0000'),
(6291, 2359, 6, '0.0000', NULL, '126656.0000'),
(6290, 2359, 5, '0.0000', NULL, '126656.0000'),
(6289, 2359, 4, '0.0000', NULL, '126656.0000'),
(6288, 2244, 7, '0.0000', NULL, '62930.0000'),
(6287, 2244, 6, '0.0000', NULL, '62930.0000'),
(6286, 2244, 5, '0.0000', NULL, '62930.0000'),
(6285, 2244, 4, '0.0000', NULL, '62930.0000'),
(6284, 2164, 7, '0.0000', NULL, '15543.0000'),
(6283, 2164, 6, '0.0000', NULL, '15543.0000'),
(6282, 2164, 5, '0.0000', NULL, '15543.0000'),
(6281, 2164, 4, '0.0000', NULL, '15543.0000'),
(6280, 2365, 7, '0.0000', NULL, '78862.0000'),
(6279, 2365, 6, '0.0000', NULL, '78862.0000'),
(6278, 2365, 5, '0.0000', NULL, '78862.0000'),
(6277, 2365, 4, '0.0000', NULL, '78862.0000'),
(6276, 2370, 7, '0.0000', NULL, '95590.0000'),
(6275, 2370, 6, '0.0000', NULL, '95590.0000'),
(6274, 2370, 5, '0.0000', NULL, '95590.0000'),
(6273, 2370, 4, '0.0000', NULL, '95590.0000'),
(6272, 2371, 7, '0.0000', NULL, '95590.0000'),
(6271, 2371, 6, '0.0000', NULL, '95590.0000'),
(6270, 2371, 5, '0.0000', NULL, '95590.0000'),
(6269, 2371, 4, '0.0000', NULL, '95590.0000'),
(6268, 2377, 7, '0.0000', NULL, '78862.0000'),
(6267, 2377, 6, '0.0000', NULL, '78862.0000'),
(6266, 2377, 5, '0.0000', NULL, '78862.0000'),
(6265, 2377, 4, '0.0000', NULL, '78862.0000'),
(6264, 2254, 7, '0.0000', NULL, '398290.0000'),
(6263, 2254, 6, '0.0000', NULL, '398290.0000'),
(6262, 2254, 5, '0.0000', NULL, '398290.0000'),
(6261, 2254, 4, '0.0000', NULL, '398290.0000'),
(6260, 2255, 7, '0.0000', NULL, '199145.0000'),
(6259, 2255, 6, '0.0000', NULL, '199145.0000'),
(6258, 2255, 5, '0.0000', NULL, '199145.0000'),
(6257, 2255, 4, '0.0000', NULL, '199145.0000'),
(6256, 2211, 7, '0.0000', NULL, '7577.0000'),
(6255, 2211, 6, '0.0000', NULL, '7577.0000'),
(6254, 2211, 5, '0.0000', NULL, '7577.0000'),
(6253, 2211, 4, '0.0000', NULL, '7577.0000'),
(6252, 2302, 7, '0.0000', NULL, '118691.0000'),
(6251, 2302, 6, '0.0000', NULL, '118691.0000'),
(6250, 2302, 5, '0.0000', NULL, '118691.0000'),
(6249, 2302, 4, '0.0000', NULL, '118691.0000'),
(6248, 2214, 7, '0.0000', NULL, '118691.0000'),
(6247, 2214, 6, '0.0000', NULL, '118691.0000'),
(6246, 2214, 5, '0.0000', NULL, '118691.0000'),
(6245, 2214, 4, '0.0000', NULL, '118691.0000'),
(6244, 2165, 7, '0.0000', NULL, '95590.0000'),
(6243, 2165, 6, '0.0000', NULL, '95590.0000'),
(6242, 2165, 5, '0.0000', NULL, '95590.0000'),
(6241, 2165, 4, '0.0000', NULL, '95590.0000'),
(6240, 2308, 7, '0.0000', NULL, '78862.0000'),
(6239, 2308, 6, '0.0000', NULL, '78862.0000'),
(6238, 2308, 5, '0.0000', NULL, '78862.0000'),
(6237, 2308, 4, '0.0000', NULL, '78862.0000'),
(6236, 2166, 7, '0.0000', NULL, '39829.0000'),
(6235, 2166, 6, '0.0000', NULL, '39829.0000'),
(6234, 2166, 5, '0.0000', NULL, '39829.0000'),
(6233, 2436, 7, '0.0000', NULL, '118691.0000'),
(6232, 2317, 7, '0.0000', NULL, '55761.0000'),
(6231, 2317, 6, '0.0000', NULL, '55761.0000'),
(6230, 2317, 5, '0.0000', NULL, '55761.0000'),
(6229, 2317, 4, '0.0000', NULL, '55761.0000'),
(6228, 2325, 7, '0.0000', NULL, '99573.0000'),
(6227, 2325, 6, '0.0000', NULL, '99573.0000'),
(6226, 2325, 5, '0.0000', NULL, '99573.0000'),
(6225, 2325, 4, '0.0000', NULL, '99573.0000'),
(6224, 2327, 7, '0.0000', NULL, '99573.0000'),
(6223, 2327, 6, '0.0000', NULL, '99573.0000'),
(6222, 2327, 5, '0.0000', NULL, '99573.0000'),
(6221, 2327, 4, '0.0000', NULL, '99573.0000'),
(6220, 2222, 7, '0.0000', NULL, '67710.0000'),
(6219, 2222, 6, '0.0000', NULL, '67710.0000'),
(6218, 2222, 5, '0.0000', NULL, '67710.0000'),
(6217, 2222, 4, '0.0000', NULL, '67710.0000'),
(6216, 2167, 7, '0.0000', NULL, '119487.0000'),
(6215, 2167, 6, '0.0000', NULL, '119487.0000'),
(6214, 2167, 5, '0.0000', NULL, '119487.0000'),
(6213, 2167, 4, '0.0000', NULL, '119487.0000'),
(6212, 2168, 7, '0.0000', NULL, '63727.0000'),
(6211, 2168, 6, '0.0000', NULL, '63727.0000'),
(6210, 2168, 5, '0.0000', NULL, '63727.0000'),
(6209, 2168, 4, '0.0000', NULL, '63727.0000'),
(6208, 2226, 7, '0.0000', NULL, '111521.0000'),
(6207, 2226, 6, '0.0000', NULL, '111521.0000'),
(6206, 2226, 5, '0.0000', NULL, '111521.0000'),
(6205, 2226, 4, '0.0000', NULL, '111521.0000'),
(6204, 2216, 7, '0.0000', NULL, '15932.0000'),
(6203, 2216, 6, '0.0000', NULL, '15932.0000'),
(6202, 2216, 5, '0.0000', NULL, '15932.0000'),
(6201, 2216, 4, '0.0000', NULL, '15932.0000'),
(6200, 2169, 7, '0.0000', NULL, '572983.0000'),
(6199, 2169, 6, '0.0000', NULL, '572983.0000'),
(6198, 2169, 5, '0.0000', NULL, '572983.0000'),
(6197, 2169, 4, '0.0000', NULL, '572983.0000'),
(6196, 2356, 7, '0.0000', NULL, '14339.0000'),
(6195, 2356, 6, '0.0000', NULL, '14339.0000'),
(6194, 2356, 5, '0.0000', NULL, '14339.0000'),
(6193, 2356, 4, '0.0000', NULL, '14339.0000'),
(6192, 2401, 7, '0.0000', NULL, '26288.0000'),
(6191, 2401, 6, '0.0000', NULL, '26288.0000'),
(6190, 2401, 5, '0.0000', NULL, '26288.0000'),
(6189, 2401, 4, '0.0000', NULL, '26288.0000'),
(6188, 2170, 7, '0.0000', NULL, '15543.0000'),
(6187, 2170, 6, '0.0000', NULL, '15543.0000'),
(6186, 2170, 5, '0.0000', NULL, '15543.0000'),
(6185, 2170, 4, '0.0000', NULL, '15543.0000'),
(6184, 2171, 7, '0.0000', NULL, '477947.0000'),
(6183, 2171, 6, '0.0000', NULL, '477947.0000'),
(6182, 2171, 5, '0.0000', NULL, '477947.0000'),
(6181, 2171, 4, '0.0000', NULL, '477947.0000'),
(6180, 2411, 7, '0.0000', NULL, '78862.0000'),
(6179, 2411, 6, '0.0000', NULL, '78862.0000'),
(6178, 2411, 5, '0.0000', NULL, '78862.0000'),
(6177, 2411, 4, '0.0000', NULL, '78862.0000'),
(6176, 2412, 7, '0.0000', NULL, '118691.0000'),
(6175, 2412, 6, '0.0000', NULL, '118691.0000'),
(6174, 2412, 5, '0.0000', NULL, '118691.0000'),
(6173, 2412, 4, '0.0000', NULL, '118691.0000'),
(6172, 2382, 7, '0.0000', NULL, '79658.0000'),
(6171, 2382, 6, '0.0000', NULL, '79658.0000'),
(6170, 2382, 5, '0.0000', NULL, '79658.0000'),
(6169, 2382, 4, '0.0000', NULL, '79658.0000'),
(6168, 2266, 7, '0.0000', NULL, '78862.0000'),
(6167, 2266, 6, '0.0000', NULL, '78862.0000'),
(6166, 2266, 5, '0.0000', NULL, '78862.0000'),
(6165, 2266, 4, '0.0000', NULL, '78862.0000'),
(6164, 2172, 7, '0.0000', NULL, '52575.0000'),
(6163, 2172, 6, '0.0000', NULL, '52575.0000'),
(6162, 2172, 5, '0.0000', NULL, '52575.0000'),
(6161, 2172, 4, '0.0000', NULL, '52575.0000'),
(6160, 2388, 7, '0.0000', NULL, '52575.0000'),
(6159, 2388, 6, '0.0000', NULL, '52575.0000'),
(6158, 2388, 5, '0.0000', NULL, '52575.0000'),
(6157, 2388, 4, '0.0000', NULL, '52575.0000'),
(6156, 2391, 7, '0.0000', NULL, '52575.0000'),
(6155, 2391, 6, '0.0000', NULL, '52575.0000'),
(6154, 2391, 5, '0.0000', NULL, '52575.0000'),
(6153, 2391, 4, '0.0000', NULL, '52575.0000'),
(6152, 2173, 7, '0.0000', NULL, '27881.0000'),
(6151, 2173, 6, '0.0000', NULL, '27881.0000'),
(6150, 2173, 5, '0.0000', NULL, '27881.0000'),
(6149, 2173, 4, '0.0000', NULL, '27881.0000'),
(6148, 2394, 7, '0.0000', NULL, '111521.0000'),
(6147, 2394, 6, '0.0000', NULL, '111521.0000'),
(6146, 2394, 5, '0.0000', NULL, '111521.0000'),
(6145, 2394, 4, '0.0000', NULL, '111521.0000'),
(6144, 2396, 7, '0.0000', NULL, '52575.0000'),
(6143, 2396, 6, '0.0000', NULL, '52575.0000'),
(6142, 2396, 5, '0.0000', NULL, '52575.0000'),
(6141, 2396, 4, '0.0000', NULL, '52575.0000'),
(6140, 2395, 7, '0.0000', NULL, '111521.0000'),
(6139, 2395, 6, '0.0000', NULL, '111521.0000'),
(6138, 2395, 5, '0.0000', NULL, '111521.0000'),
(6137, 2395, 4, '0.0000', NULL, '111521.0000'),
(6136, 2386, 7, '0.0000', NULL, '27881.0000'),
(6135, 2386, 6, '0.0000', NULL, '27881.0000'),
(6134, 2386, 5, '0.0000', NULL, '27881.0000'),
(6133, 2386, 4, '0.0000', NULL, '27881.0000'),
(6132, 2445, 7, '0.0000', NULL, '27881.0000'),
(6131, 2445, 6, '0.0000', NULL, '27881.0000'),
(6130, 2445, 5, '0.0000', NULL, '27881.0000'),
(6129, 2445, 4, '0.0000', NULL, '27881.0000'),
(6128, 2174, 7, '0.0000', NULL, '7959.0000'),
(6127, 2174, 6, '0.0000', NULL, '7959.0000'),
(6126, 2174, 5, '0.0000', NULL, '7959.0000'),
(6125, 2174, 4, '0.0000', NULL, '7959.0000'),
(6124, 2175, 7, '0.0000', NULL, '72732.0000'),
(6123, 2175, 6, '0.0000', NULL, '72732.0000'),
(6122, 2175, 5, '0.0000', NULL, '72732.0000'),
(6121, 2175, 4, '0.0000', NULL, '72732.0000'),
(6120, 2521, 7, '0.0000', NULL, '27881.0000'),
(6119, 2521, 6, '0.0000', NULL, '27881.0000'),
(6118, 2521, 5, '0.0000', NULL, '27881.0000'),
(6117, 2521, 4, '0.0000', NULL, '27881.0000'),
(6116, 2549, 7, '0.0000', NULL, '23898.0000'),
(6115, 2549, 6, '0.0000', NULL, '23898.0000'),
(6114, 2549, 5, '0.0000', NULL, '23898.0000'),
(6113, 2549, 4, '0.0000', NULL, '23898.0000'),
(6112, 2280, 7, '0.0000', NULL, '26288.0000'),
(6111, 2280, 6, '0.0000', NULL, '26288.0000'),
(6110, 2280, 5, '0.0000', NULL, '26288.0000'),
(6109, 2280, 4, '0.0000', NULL, '26288.0000'),
(6108, 2286, 7, '0.0000', NULL, '35050.0000'),
(6107, 2286, 6, '0.0000', NULL, '35050.0000'),
(6106, 2286, 5, '0.0000', NULL, '35050.0000'),
(6105, 2286, 4, '0.0000', NULL, '35050.0000'),
(6104, 2287, 7, '0.0000', NULL, '95590.0000'),
(6103, 2287, 6, '0.0000', NULL, '95590.0000'),
(6102, 2287, 5, '0.0000', NULL, '95590.0000'),
(6101, 2287, 4, '0.0000', NULL, '95590.0000'),
(6100, 2288, 7, '0.0000', NULL, '150554.0000'),
(6099, 2288, 6, '0.0000', NULL, '150554.0000'),
(6098, 2288, 5, '0.0000', NULL, '150554.0000'),
(6097, 2288, 4, '0.0000', NULL, '150554.0000'),
(6096, 2297, 7, '0.0000', NULL, '150554.0000'),
(6095, 2297, 6, '0.0000', NULL, '150554.0000'),
(6094, 2297, 5, '0.0000', NULL, '150554.0000'),
(6093, 2297, 4, '0.0000', NULL, '150554.0000'),
(6092, 2381, 7, '0.0000', NULL, '238974.0000'),
(6091, 2381, 6, '0.0000', NULL, '238974.0000'),
(6090, 2381, 5, '0.0000', NULL, '238974.0000'),
(6089, 2381, 4, '0.0000', NULL, '238974.0000'),
(6088, 2210, 7, '0.0000', NULL, '7577.0000'),
(6087, 2210, 6, '0.0000', NULL, '7577.0000'),
(6086, 2210, 5, '0.0000', NULL, '7577.0000'),
(6085, 2210, 4, '0.0000', NULL, '7577.0000'),
(6084, 2258, 7, '0.0000', NULL, '7577.0000'),
(6083, 2258, 6, '0.0000', NULL, '7577.0000'),
(6082, 2258, 5, '0.0000', NULL, '7577.0000'),
(6081, 2258, 4, '0.0000', NULL, '7577.0000'),
(6080, 2212, 7, '0.0000', NULL, '7577.0000'),
(6079, 2212, 6, '0.0000', NULL, '7577.0000'),
(6078, 2212, 5, '0.0000', NULL, '7577.0000'),
(6077, 2212, 4, '0.0000', NULL, '7577.0000'),
(6076, 2213, 7, '0.0000', NULL, '7577.0000'),
(6075, 2213, 6, '0.0000', NULL, '7577.0000'),
(6074, 2213, 5, '0.0000', NULL, '7577.0000'),
(6073, 2213, 4, '0.0000', NULL, '7577.0000'),
(6072, 2303, 7, '0.0000', NULL, '134622.0000'),
(6071, 2303, 6, '0.0000', NULL, '134622.0000'),
(6070, 2303, 5, '0.0000', NULL, '134622.0000'),
(6069, 2303, 4, '0.0000', NULL, '134622.0000'),
(6068, 2307, 7, '0.0000', NULL, '86828.0000'),
(6067, 2307, 6, '0.0000', NULL, '86828.0000'),
(6066, 2307, 5, '0.0000', NULL, '86828.0000'),
(6065, 2307, 4, '0.0000', NULL, '86828.0000'),
(6064, 2269, 7, '0.0000', NULL, '78862.0000'),
(6063, 2269, 6, '0.0000', NULL, '78862.0000'),
(6062, 2269, 5, '0.0000', NULL, '78862.0000'),
(6061, 2269, 4, '0.0000', NULL, '78862.0000'),
(6060, 2277, 7, '0.0000', NULL, '119487.0000'),
(6059, 2277, 6, '0.0000', NULL, '119487.0000'),
(6058, 2277, 5, '0.0000', NULL, '119487.0000'),
(6057, 2277, 4, '0.0000', NULL, '119487.0000'),
(6056, 2335, 7, '0.0000', NULL, '79658.0000'),
(6055, 2335, 6, '0.0000', NULL, '79658.0000'),
(6054, 2335, 5, '0.0000', NULL, '79658.0000'),
(6053, 2335, 4, '0.0000', NULL, '79658.0000'),
(6052, 2337, 7, '0.0000', NULL, '111521.0000'),
(6051, 2337, 6, '0.0000', NULL, '111521.0000'),
(6050, 2337, 5, '0.0000', NULL, '111521.0000'),
(6049, 2337, 4, '0.0000', NULL, '111521.0000'),
(6048, 2301, 7, '0.0000', NULL, '7577.0000'),
(6047, 2301, 6, '0.0000', NULL, '7577.0000'),
(6046, 2301, 5, '0.0000', NULL, '7577.0000'),
(6045, 2301, 4, '0.0000', NULL, '7577.0000'),
(6044, 2256, 7, '0.0000', NULL, '7577.0000'),
(6043, 2256, 6, '0.0000', NULL, '7577.0000'),
(6042, 2256, 5, '0.0000', NULL, '7577.0000'),
(6041, 2256, 4, '0.0000', NULL, '7577.0000'),
(6040, 2454, 7, '0.0000', NULL, '11949.0000'),
(6039, 2454, 6, '0.0000', NULL, '11949.0000'),
(6038, 2454, 5, '0.0000', NULL, '11949.0000'),
(6037, 2454, 4, '0.0000', NULL, '11949.0000'),
(6036, 2296, 7, '0.0000', NULL, '27881.0000'),
(6035, 2296, 6, '0.0000', NULL, '27881.0000'),
(6034, 2296, 5, '0.0000', NULL, '27881.0000'),
(6033, 2296, 4, '0.0000', NULL, '27881.0000'),
(6032, 2176, 7, '0.0000', NULL, '23898.0000'),
(6031, 2176, 6, '0.0000', NULL, '23898.0000'),
(6030, 2176, 5, '0.0000', NULL, '23898.0000'),
(6029, 2176, 4, '0.0000', NULL, '23898.0000'),
(6028, 2227, 7, '0.0000', NULL, '262871.0000'),
(6027, 2227, 6, '0.0000', NULL, '262871.0000'),
(6026, 2227, 5, '0.0000', NULL, '262871.0000'),
(6025, 2227, 4, '0.0000', NULL, '262871.0000'),
(6024, 2233, 7, '0.0000', NULL, '150554.0000'),
(6023, 2233, 6, '0.0000', NULL, '150554.0000'),
(6022, 2233, 5, '0.0000', NULL, '150554.0000'),
(6021, 2233, 4, '0.0000', NULL, '150554.0000'),
(6020, 2177, 7, '0.0000', NULL, '150554.0000'),
(6019, 2177, 6, '0.0000', NULL, '150554.0000'),
(6018, 2177, 5, '0.0000', NULL, '150554.0000'),
(6017, 2177, 4, '0.0000', NULL, '150554.0000'),
(6016, 2506, 7, '0.0000', NULL, '79658.0000'),
(6015, 2506, 6, '0.0000', NULL, '79658.0000'),
(6014, 2506, 5, '0.0000', NULL, '79658.0000'),
(6013, 2506, 4, '0.0000', NULL, '79658.0000'),
(6012, 2345, 7, '0.0000', NULL, '119487.0000'),
(6011, 2345, 6, '0.0000', NULL, '119487.0000'),
(6010, 2345, 5, '0.0000', NULL, '119487.0000'),
(6009, 2345, 4, '0.0000', NULL, '119487.0000'),
(6008, 2511, 7, '0.0000', NULL, '119487.0000'),
(6007, 2511, 6, '0.0000', NULL, '119487.0000'),
(6006, 2511, 5, '0.0000', NULL, '119487.0000'),
(6005, 2511, 4, '0.0000', NULL, '119487.0000'),
(6004, 2237, 7, '0.0000', NULL, '122674.0000'),
(6003, 2237, 6, '0.0000', NULL, '122674.0000'),
(6002, 2237, 5, '0.0000', NULL, '122674.0000'),
(6001, 2237, 4, '0.0000', NULL, '122674.0000'),
(6000, 2527, 7, '0.0000', NULL, '55761.0000'),
(5999, 2527, 6, '0.0000', NULL, '55761.0000'),
(5998, 2527, 5, '0.0000', NULL, '55761.0000'),
(5997, 2527, 4, '0.0000', NULL, '55761.0000'),
(5996, 2532, 7, '0.0000', NULL, '79658.0000'),
(5995, 2532, 6, '0.0000', NULL, '79658.0000'),
(5994, 2532, 5, '0.0000', NULL, '79658.0000'),
(5993, 2532, 4, '0.0000', NULL, '79658.0000'),
(5992, 2533, 7, '0.0000', NULL, '79658.0000'),
(5991, 2533, 6, '0.0000', NULL, '79658.0000'),
(5990, 2533, 5, '0.0000', NULL, '79658.0000'),
(5989, 2533, 4, '0.0000', NULL, '79658.0000'),
(5988, 2534, 7, '0.0000', NULL, '79658.0000'),
(5987, 2534, 6, '0.0000', NULL, '79658.0000'),
(5986, 2534, 5, '0.0000', NULL, '79658.0000'),
(5985, 2534, 4, '0.0000', NULL, '79658.0000'),
(5984, 2425, 7, '0.0000', NULL, '61337.0000'),
(5983, 2425, 6, '0.0000', NULL, '61337.0000'),
(5982, 2425, 5, '0.0000', NULL, '61337.0000'),
(5981, 2425, 4, '0.0000', NULL, '61337.0000'),
(5980, 2178, 7, '0.0000', NULL, '23898.0000'),
(5979, 2178, 6, '0.0000', NULL, '23898.0000'),
(5978, 2178, 5, '0.0000', NULL, '23898.0000'),
(5977, 2178, 4, '0.0000', NULL, '23898.0000'),
(5976, 2179, 7, '0.0000', NULL, '19915.0000'),
(5975, 2179, 6, '0.0000', NULL, '19915.0000'),
(5974, 2179, 5, '0.0000', NULL, '19915.0000'),
(5973, 2179, 4, '0.0000', NULL, '19915.0000'),
(5972, 2443, 7, '0.0000', NULL, '78862.0000'),
(5971, 2443, 6, '0.0000', NULL, '78862.0000'),
(5970, 2443, 5, '0.0000', NULL, '78862.0000'),
(5969, 2443, 4, '0.0000', NULL, '78862.0000'),
(5968, 2444, 7, '0.0000', NULL, '78862.0000'),
(5967, 2444, 6, '0.0000', NULL, '78862.0000'),
(5966, 2444, 5, '0.0000', NULL, '78862.0000'),
(5965, 2444, 4, '0.0000', NULL, '78862.0000'),
(5964, 2315, 7, '0.0000', NULL, '55761.0000'),
(5963, 2315, 6, '0.0000', NULL, '55761.0000'),
(5962, 2315, 5, '0.0000', NULL, '55761.0000'),
(5961, 2315, 4, '0.0000', NULL, '55761.0000'),
(5960, 2318, 7, '0.0000', NULL, '55761.0000'),
(5959, 2318, 6, '0.0000', NULL, '55761.0000'),
(5958, 2318, 5, '0.0000', NULL, '55761.0000'),
(5957, 2318, 4, '0.0000', NULL, '55761.0000'),
(5956, 2180, 7, '0.0000', NULL, '54964.0000'),
(5955, 2180, 6, '0.0000', NULL, '54964.0000'),
(5954, 2180, 5, '0.0000', NULL, '54964.0000'),
(5953, 2180, 4, '0.0000', NULL, '54964.0000'),
(5952, 2181, 7, '0.0000', NULL, '35847.0000'),
(5951, 2181, 6, '0.0000', NULL, '35847.0000'),
(5950, 2181, 5, '0.0000', NULL, '35847.0000'),
(5949, 2181, 4, '0.0000', NULL, '35847.0000'),
(5948, 2473, 7, '0.0000', NULL, '62930.0000'),
(5947, 2473, 6, '0.0000', NULL, '62930.0000'),
(5946, 2473, 5, '0.0000', NULL, '62930.0000'),
(5945, 2473, 4, '0.0000', NULL, '62930.0000'),
(5944, 2223, 7, '0.0000', NULL, '99573.0000'),
(5943, 2223, 6, '0.0000', NULL, '99573.0000'),
(5942, 2223, 5, '0.0000', NULL, '99573.0000'),
(5941, 2223, 4, '0.0000', NULL, '99573.0000'),
(5940, 2224, 7, '0.0000', NULL, '99573.0000'),
(5939, 2224, 6, '0.0000', NULL, '99573.0000'),
(5938, 2224, 5, '0.0000', NULL, '99573.0000'),
(5937, 2224, 4, '0.0000', NULL, '99573.0000'),
(5936, 2182, 7, '0.0000', NULL, '99573.0000'),
(5935, 2182, 6, '0.0000', NULL, '99573.0000'),
(5934, 2182, 5, '0.0000', NULL, '99573.0000'),
(5933, 2182, 4, '0.0000', NULL, '99573.0000'),
(5932, 2183, 7, '0.0000', NULL, '95590.0000'),
(5931, 2183, 6, '0.0000', NULL, '95590.0000'),
(5930, 2183, 5, '0.0000', NULL, '95590.0000'),
(5929, 2183, 4, '0.0000', NULL, '95590.0000'),
(5928, 2484, 7, '0.0000', NULL, '63727.0000'),
(5927, 2484, 6, '0.0000', NULL, '63727.0000'),
(5926, 2484, 5, '0.0000', NULL, '63727.0000'),
(5925, 2484, 4, '0.0000', NULL, '63727.0000'),
(5924, 2184, 7, '0.0000', NULL, '63727.0000'),
(5923, 2184, 6, '0.0000', NULL, '63727.0000'),
(5922, 2184, 5, '0.0000', NULL, '63727.0000'),
(5921, 2184, 4, '0.0000', NULL, '63727.0000'),
(5920, 2434, 7, '0.0000', NULL, '19915.0000'),
(5919, 2434, 6, '0.0000', NULL, '19915.0000'),
(5918, 2434, 5, '0.0000', NULL, '19915.0000'),
(5917, 2434, 4, '0.0000', NULL, '19915.0000'),
(5916, 2451, 7, '0.0000', NULL, '23898.0000'),
(5915, 2451, 6, '0.0000', NULL, '23898.0000'),
(5914, 2451, 5, '0.0000', NULL, '23898.0000'),
(5913, 2451, 4, '0.0000', NULL, '23898.0000'),
(5912, 2456, 7, '0.0000', NULL, '18626.0000'),
(5911, 2456, 6, '0.0000', NULL, '18626.0000'),
(5910, 2456, 5, '0.0000', NULL, '18626.0000'),
(5909, 2456, 4, '0.0000', NULL, '18626.0000'),
(5908, 2500, 7, '0.0000', NULL, '15932.0000'),
(5907, 2500, 6, '0.0000', NULL, '15932.0000'),
(5906, 2500, 5, '0.0000', NULL, '15932.0000'),
(5905, 2500, 4, '0.0000', NULL, '15932.0000'),
(5904, 2185, 7, '0.0000', NULL, '19896.0000'),
(5903, 2185, 6, '0.0000', NULL, '19896.0000'),
(5902, 2185, 5, '0.0000', NULL, '19896.0000'),
(5901, 2185, 4, '0.0000', NULL, '19896.0000'),
(5900, 2525, 7, '0.0000', NULL, '14339.0000'),
(5899, 2525, 6, '0.0000', NULL, '14339.0000'),
(5898, 2525, 5, '0.0000', NULL, '14339.0000'),
(5897, 2525, 4, '0.0000', NULL, '14339.0000'),
(5896, 2529, 7, '0.0000', NULL, '23898.0000'),
(5895, 2529, 6, '0.0000', NULL, '23898.0000'),
(5894, 2529, 5, '0.0000', NULL, '23898.0000'),
(5893, 2529, 4, '0.0000', NULL, '23898.0000'),
(5892, 2376, 7, '0.0000', NULL, '23898.0000'),
(5891, 2376, 6, '0.0000', NULL, '23898.0000'),
(5890, 2376, 5, '0.0000', NULL, '23898.0000'),
(5889, 2376, 4, '0.0000', NULL, '23898.0000'),
(5888, 2186, 7, '0.0000', NULL, '7959.0000'),
(5887, 2186, 6, '0.0000', NULL, '7959.0000'),
(5886, 2186, 5, '0.0000', NULL, '7959.0000'),
(5885, 2186, 4, '0.0000', NULL, '7959.0000'),
(5884, 2551, 7, '0.0000', NULL, '27881.0000'),
(5883, 2551, 6, '0.0000', NULL, '27881.0000'),
(5882, 2551, 5, '0.0000', NULL, '27881.0000'),
(5881, 2551, 4, '0.0000', NULL, '27881.0000'),
(5880, 2467, 7, '0.0000', NULL, '47795.0000'),
(5879, 2467, 6, '0.0000', NULL, '47795.0000'),
(5878, 2467, 5, '0.0000', NULL, '47795.0000'),
(5877, 2467, 4, '0.0000', NULL, '47795.0000'),
(5876, 2468, 7, '0.0000', NULL, '47795.0000'),
(5875, 2468, 6, '0.0000', NULL, '47795.0000'),
(5874, 2468, 5, '0.0000', NULL, '47795.0000'),
(5873, 2468, 4, '0.0000', NULL, '47795.0000'),
(5872, 2187, 7, '0.0000', NULL, '79658.0000'),
(5871, 2187, 6, '0.0000', NULL, '79658.0000'),
(5870, 2187, 5, '0.0000', NULL, '79658.0000'),
(5869, 2187, 4, '0.0000', NULL, '79658.0000'),
(5868, 2469, 7, '0.0000', NULL, '79658.0000'),
(5867, 2469, 6, '0.0000', NULL, '79658.0000'),
(5866, 2469, 5, '0.0000', NULL, '79658.0000'),
(5865, 2469, 4, '0.0000', NULL, '79658.0000'),
(5864, 2188, 7, '0.0000', NULL, '143385.0000'),
(5863, 2188, 6, '0.0000', NULL, '143385.0000'),
(5862, 2188, 5, '0.0000', NULL, '143385.0000'),
(5861, 2188, 4, '0.0000', NULL, '143385.0000'),
(5860, 2340, 7, '0.0000', NULL, '71693.0000'),
(5859, 2340, 6, '0.0000', NULL, '71693.0000'),
(5858, 2340, 5, '0.0000', NULL, '71693.0000'),
(5857, 2340, 4, '0.0000', NULL, '71693.0000'),
(5856, 2496, 7, '0.0000', NULL, '79658.0000'),
(5855, 2496, 6, '0.0000', NULL, '79658.0000'),
(5854, 2496, 5, '0.0000', NULL, '79658.0000'),
(5853, 2496, 4, '0.0000', NULL, '79658.0000'),
(5852, 2405, 7, '0.0000', NULL, '54964.0000'),
(5851, 2405, 6, '0.0000', NULL, '54964.0000'),
(5850, 2405, 5, '0.0000', NULL, '54964.0000'),
(5849, 2405, 4, '0.0000', NULL, '54964.0000'),
(5848, 2504, 7, '0.0000', NULL, '102759.0000'),
(5847, 2504, 6, '0.0000', NULL, '102759.0000'),
(5846, 2504, 5, '0.0000', NULL, '102759.0000'),
(5845, 2504, 4, '0.0000', NULL, '102759.0000'),
(5844, 2505, 7, '0.0000', NULL, '79658.0000'),
(5843, 2505, 6, '0.0000', NULL, '79658.0000'),
(5842, 2505, 5, '0.0000', NULL, '79658.0000'),
(5841, 2505, 4, '0.0000', NULL, '79658.0000'),
(5840, 2189, 7, '0.0000', NULL, '183213.0000'),
(5839, 2189, 6, '0.0000', NULL, '183213.0000'),
(5838, 2189, 5, '0.0000', NULL, '183213.0000'),
(5837, 2189, 4, '0.0000', NULL, '183213.0000'),
(5836, 2347, 7, '0.0000', NULL, '198348.0000'),
(5835, 2347, 6, '0.0000', NULL, '198348.0000'),
(5834, 2347, 5, '0.0000', NULL, '198348.0000'),
(5833, 2347, 4, '0.0000', NULL, '198348.0000'),
(5832, 2517, 7, '0.0000', NULL, '78862.0000'),
(5831, 2517, 6, '0.0000', NULL, '78862.0000'),
(5830, 2517, 5, '0.0000', NULL, '78862.0000'),
(5829, 2517, 4, '0.0000', NULL, '78862.0000'),
(5828, 2518, 7, '0.0000', NULL, '78862.0000'),
(5827, 2518, 6, '0.0000', NULL, '78862.0000'),
(5826, 2518, 5, '0.0000', NULL, '78862.0000'),
(5825, 2518, 4, '0.0000', NULL, '78862.0000'),
(5824, 2519, 7, '0.0000', NULL, '78862.0000'),
(5823, 2519, 6, '0.0000', NULL, '78862.0000'),
(5822, 2519, 5, '0.0000', NULL, '78862.0000'),
(5821, 2519, 4, '0.0000', NULL, '78862.0000'),
(5820, 2522, 7, '0.0000', NULL, '86828.0000'),
(5819, 2522, 6, '0.0000', NULL, '86828.0000'),
(5818, 2522, 5, '0.0000', NULL, '86828.0000'),
(5817, 2522, 4, '0.0000', NULL, '86828.0000'),
(5816, 2526, 7, '0.0000', NULL, '55761.0000'),
(5815, 2526, 6, '0.0000', NULL, '55761.0000'),
(5814, 2526, 5, '0.0000', NULL, '55761.0000'),
(5813, 2526, 4, '0.0000', NULL, '55761.0000'),
(5812, 2363, 7, '0.0000', NULL, '126656.0000'),
(5811, 2363, 6, '0.0000', NULL, '126656.0000'),
(5810, 2363, 5, '0.0000', NULL, '126656.0000'),
(5809, 2363, 4, '0.0000', NULL, '126656.0000'),
(5808, 2535, 7, '0.0000', NULL, '55761.0000'),
(5807, 2535, 6, '0.0000', NULL, '55761.0000'),
(5806, 2535, 5, '0.0000', NULL, '55761.0000'),
(5805, 2535, 4, '0.0000', NULL, '55761.0000'),
(5804, 2537, 7, '0.0000', NULL, '55761.0000'),
(5803, 2537, 6, '0.0000', NULL, '55761.0000'),
(5802, 2537, 5, '0.0000', NULL, '55761.0000'),
(5801, 2537, 4, '0.0000', NULL, '55761.0000'),
(5800, 2368, 7, '0.0000', NULL, '102759.0000'),
(5799, 2368, 6, '0.0000', NULL, '102759.0000'),
(5798, 2368, 5, '0.0000', NULL, '102759.0000'),
(5797, 2368, 4, '0.0000', NULL, '102759.0000'),
(5796, 2415, 7, '0.0000', NULL, '54964.0000'),
(5795, 2415, 6, '0.0000', NULL, '54964.0000'),
(5794, 2415, 5, '0.0000', NULL, '54964.0000'),
(5793, 2415, 4, '0.0000', NULL, '54964.0000'),
(5792, 2542, 7, '0.0000', NULL, '95590.0000'),
(5791, 2542, 6, '0.0000', NULL, '95590.0000'),
(5790, 2542, 5, '0.0000', NULL, '95590.0000'),
(5789, 2542, 4, '0.0000', NULL, '95590.0000'),
(5788, 2547, 7, '0.0000', NULL, '95590.0000'),
(5787, 2547, 6, '0.0000', NULL, '95590.0000'),
(5786, 2547, 5, '0.0000', NULL, '95590.0000'),
(5785, 2547, 4, '0.0000', NULL, '95590.0000'),
(5784, 2190, 7, '0.0000', NULL, '95590.0000'),
(5783, 2190, 6, '0.0000', NULL, '95590.0000'),
(5782, 2190, 5, '0.0000', NULL, '95590.0000'),
(5781, 2190, 4, '0.0000', NULL, '95590.0000'),
(5780, 2191, 7, '0.0000', NULL, '55761.0000'),
(5779, 2191, 6, '0.0000', NULL, '55761.0000'),
(5778, 2191, 5, '0.0000', NULL, '55761.0000'),
(5777, 2191, 4, '0.0000', NULL, '55761.0000'),
(5776, 2192, 7, '0.0000', NULL, '7577.0000'),
(5775, 2192, 6, '0.0000', NULL, '7577.0000'),
(5774, 2192, 5, '0.0000', NULL, '7577.0000'),
(5773, 2192, 4, '0.0000', NULL, '7577.0000'),
(5772, 2304, 7, '0.0000', NULL, '61337.0000'),
(5771, 2304, 6, '0.0000', NULL, '61337.0000'),
(5770, 2304, 5, '0.0000', NULL, '61337.0000'),
(5769, 2304, 4, '0.0000', NULL, '61337.0000'),
(5768, 2427, 7, '0.0000', NULL, '61337.0000'),
(5767, 2427, 6, '0.0000', NULL, '61337.0000'),
(5766, 2427, 5, '0.0000', NULL, '61337.0000'),
(5765, 2427, 4, '0.0000', NULL, '61337.0000'),
(5764, 2430, 7, '0.0000', NULL, '61337.0000'),
(5763, 2430, 6, '0.0000', NULL, '61337.0000'),
(5762, 2430, 5, '0.0000', NULL, '61337.0000'),
(5761, 2430, 4, '0.0000', NULL, '61337.0000'),
(5760, 2193, 7, '0.0000', NULL, '23898.0000'),
(5759, 2193, 6, '0.0000', NULL, '23898.0000'),
(5758, 2193, 5, '0.0000', NULL, '23898.0000'),
(5757, 2193, 4, '0.0000', NULL, '23898.0000'),
(5756, 2446, 7, '0.0000', NULL, '55761.0000'),
(5755, 2446, 6, '0.0000', NULL, '55761.0000'),
(5754, 2446, 5, '0.0000', NULL, '55761.0000'),
(5753, 2446, 4, '0.0000', NULL, '55761.0000'),
(5752, 2316, 7, '0.0000', NULL, '55761.0000'),
(5751, 2316, 6, '0.0000', NULL, '55761.0000'),
(5750, 2316, 5, '0.0000', NULL, '55761.0000'),
(5749, 2316, 4, '0.0000', NULL, '55761.0000'),
(5748, 2449, 7, '0.0000', NULL, '55761.0000'),
(5747, 2449, 6, '0.0000', NULL, '55761.0000'),
(5746, 2449, 5, '0.0000', NULL, '55761.0000'),
(5745, 2449, 4, '0.0000', NULL, '55761.0000'),
(5744, 2464, 7, '0.0000', NULL, '54964.0000'),
(5743, 2464, 6, '0.0000', NULL, '54964.0000'),
(5742, 2464, 5, '0.0000', NULL, '54964.0000'),
(5741, 2464, 4, '0.0000', NULL, '54964.0000'),
(5740, 2466, 7, '0.0000', NULL, '47795.0000'),
(5739, 2466, 6, '0.0000', NULL, '47795.0000'),
(5738, 2466, 5, '0.0000', NULL, '47795.0000'),
(5737, 2466, 4, '0.0000', NULL, '47795.0000'),
(5736, 2324, 7, '0.0000', NULL, '47795.0000'),
(5735, 2324, 6, '0.0000', NULL, '47795.0000'),
(5734, 2324, 5, '0.0000', NULL, '47795.0000'),
(5733, 2324, 4, '0.0000', NULL, '47795.0000'),
(5732, 2194, 7, '0.0000', NULL, '3983.0000'),
(5731, 2194, 6, '0.0000', NULL, '3983.0000'),
(5730, 2194, 5, '0.0000', NULL, '3983.0000'),
(5729, 2194, 4, '0.0000', NULL, '3983.0000'),
(5728, 2481, 7, '0.0000', NULL, '95590.0000'),
(5727, 2481, 6, '0.0000', NULL, '95590.0000'),
(5726, 2481, 5, '0.0000', NULL, '95590.0000'),
(5725, 2481, 4, '0.0000', NULL, '95590.0000'),
(5724, 2482, 7, '0.0000', NULL, '46999.0000'),
(5723, 2482, 6, '0.0000', NULL, '46999.0000'),
(5722, 2482, 5, '0.0000', NULL, '46999.0000'),
(5721, 2482, 4, '0.0000', NULL, '46999.0000'),
(5720, 2483, 7, '0.0000', NULL, '63727.0000'),
(5719, 2483, 6, '0.0000', NULL, '63727.0000'),
(5718, 2483, 5, '0.0000', NULL, '63727.0000'),
(5717, 2483, 4, '0.0000', NULL, '63727.0000'),
(5716, 2485, 7, '0.0000', NULL, '63727.0000'),
(5715, 2485, 6, '0.0000', NULL, '63727.0000'),
(5714, 2485, 5, '0.0000', NULL, '63727.0000'),
(5713, 2485, 4, '0.0000', NULL, '63727.0000'),
(5712, 2486, 7, '0.0000', NULL, '63727.0000'),
(5711, 2486, 6, '0.0000', NULL, '63727.0000'),
(5710, 2486, 5, '0.0000', NULL, '63727.0000'),
(5709, 2486, 4, '0.0000', NULL, '63727.0000'),
(5708, 2487, 7, '0.0000', NULL, '63727.0000'),
(5707, 2487, 6, '0.0000', NULL, '63727.0000'),
(5706, 2487, 5, '0.0000', NULL, '63727.0000'),
(5705, 2487, 4, '0.0000', NULL, '63727.0000'),
(5704, 2195, 7, '0.0000', NULL, '70099.0000'),
(5703, 2195, 6, '0.0000', NULL, '70099.0000'),
(5702, 2195, 5, '0.0000', NULL, '70099.0000'),
(5701, 2195, 4, '0.0000', NULL, '70099.0000'),
(5700, 2470, 7, '0.0000', NULL, '67710.0000'),
(5699, 2470, 6, '0.0000', NULL, '67710.0000'),
(5698, 2470, 5, '0.0000', NULL, '67710.0000'),
(5697, 2470, 4, '0.0000', NULL, '67710.0000'),
(5696, 2431, 7, '0.0000', NULL, '19915.0000'),
(5695, 2431, 6, '0.0000', NULL, '19915.0000'),
(5694, 2431, 5, '0.0000', NULL, '19915.0000'),
(5693, 2431, 4, '0.0000', NULL, '19915.0000'),
(5692, 2433, 7, '0.0000', NULL, '19915.0000'),
(5691, 2433, 6, '0.0000', NULL, '19915.0000'),
(5690, 2433, 5, '0.0000', NULL, '19915.0000'),
(5689, 2433, 4, '0.0000', NULL, '19915.0000'),
(5688, 2310, 7, '0.0000', NULL, '31864.0000'),
(5687, 2310, 6, '0.0000', NULL, '31864.0000'),
(5686, 2310, 5, '0.0000', NULL, '31864.0000'),
(5685, 2310, 4, '0.0000', NULL, '31864.0000'),
(5684, 2435, 7, '0.0000', NULL, '31864.0000'),
(5683, 2435, 6, '0.0000', NULL, '31864.0000'),
(5682, 2435, 5, '0.0000', NULL, '31864.0000'),
(5681, 2435, 4, '0.0000', NULL, '31864.0000'),
(5680, 2439, 7, '0.0000', NULL, '39829.0000'),
(5679, 2439, 6, '0.0000', NULL, '39829.0000'),
(5678, 2439, 5, '0.0000', NULL, '39829.0000'),
(5677, 2439, 4, '0.0000', NULL, '39829.0000'),
(5676, 2196, 7, '0.0000', NULL, '181828.0000'),
(5675, 2196, 6, '0.0000', NULL, '181828.0000'),
(5674, 2196, 5, '0.0000', NULL, '181828.0000'),
(5673, 2196, 4, '0.0000', NULL, '181828.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(5672, 2314, 7, '0.0000', NULL, '19915.0000'),
(5671, 2314, 6, '0.0000', NULL, '19915.0000'),
(5670, 2314, 5, '0.0000', NULL, '19915.0000'),
(5669, 2314, 4, '0.0000', NULL, '19915.0000'),
(5668, 2440, 7, '0.0000', NULL, '15932.0000'),
(5667, 2440, 6, '0.0000', NULL, '15932.0000'),
(5666, 2440, 5, '0.0000', NULL, '15932.0000'),
(5665, 2440, 4, '0.0000', NULL, '15932.0000'),
(5664, 2442, 7, '0.0000', NULL, '23898.0000'),
(5663, 2442, 6, '0.0000', NULL, '23898.0000'),
(5662, 2442, 5, '0.0000', NULL, '23898.0000'),
(5661, 2442, 4, '0.0000', NULL, '23898.0000'),
(5660, 2450, 7, '0.0000', NULL, '23898.0000'),
(5659, 2450, 6, '0.0000', NULL, '23898.0000'),
(5658, 2450, 5, '0.0000', NULL, '23898.0000'),
(5657, 2450, 4, '0.0000', NULL, '23898.0000'),
(5656, 2553, 7, '0.0000', NULL, '11949.0000'),
(5655, 2553, 6, '0.0000', NULL, '11949.0000'),
(5654, 2553, 5, '0.0000', NULL, '11949.0000'),
(5653, 2553, 4, '0.0000', NULL, '11949.0000'),
(5652, 2552, 7, '0.0000', NULL, '78862.0000'),
(5651, 2552, 6, '0.0000', NULL, '78862.0000'),
(5650, 2552, 5, '0.0000', NULL, '78862.0000'),
(5649, 2552, 4, '0.0000', NULL, '78862.0000'),
(5648, 2530, 7, '0.0000', NULL, '35847.0000'),
(5647, 2530, 6, '0.0000', NULL, '35847.0000'),
(5646, 2530, 5, '0.0000', NULL, '35847.0000'),
(5645, 2530, 4, '0.0000', NULL, '35847.0000'),
(5644, 2528, 7, '0.0000', NULL, '19915.0000'),
(5643, 2528, 6, '0.0000', NULL, '19915.0000'),
(5642, 2528, 5, '0.0000', NULL, '19915.0000'),
(5641, 2528, 4, '0.0000', NULL, '19915.0000'),
(5640, 2523, 7, '0.0000', NULL, '23898.0000'),
(5639, 2523, 6, '0.0000', NULL, '23898.0000'),
(5638, 2523, 5, '0.0000', NULL, '23898.0000'),
(5637, 2523, 4, '0.0000', NULL, '23898.0000'),
(5636, 2516, 7, '0.0000', NULL, '23898.0000'),
(5635, 2516, 6, '0.0000', NULL, '23898.0000'),
(5634, 2516, 5, '0.0000', NULL, '23898.0000'),
(5633, 2516, 4, '0.0000', NULL, '23898.0000'),
(5632, 2494, 7, '0.0000', NULL, '39829.0000'),
(5631, 2494, 6, '0.0000', NULL, '39829.0000'),
(5630, 2494, 5, '0.0000', NULL, '39829.0000'),
(5629, 2494, 4, '0.0000', NULL, '39829.0000'),
(5628, 2493, 7, '0.0000', NULL, '23898.0000'),
(5627, 2493, 6, '0.0000', NULL, '23898.0000'),
(5626, 2493, 5, '0.0000', NULL, '23898.0000'),
(5625, 2493, 4, '0.0000', NULL, '23898.0000'),
(5624, 2459, 7, '0.0000', NULL, '14339.0000'),
(5623, 2459, 6, '0.0000', NULL, '14339.0000'),
(5622, 2459, 5, '0.0000', NULL, '14339.0000'),
(5621, 2459, 4, '0.0000', NULL, '14339.0000'),
(5620, 2453, 7, '0.0000', NULL, '71693.0000'),
(5619, 2453, 6, '0.0000', NULL, '71693.0000'),
(5618, 2453, 5, '0.0000', NULL, '71693.0000'),
(5617, 2453, 4, '0.0000', NULL, '71693.0000'),
(5616, 2452, 7, '0.0000', NULL, '35847.0000'),
(5615, 2452, 6, '0.0000', NULL, '35847.0000'),
(5614, 2452, 5, '0.0000', NULL, '35847.0000'),
(5613, 2452, 4, '0.0000', NULL, '35847.0000'),
(5612, 2206, 7, '0.0000', NULL, '87278.0000'),
(5611, 2206, 6, '0.0000', NULL, '87278.0000'),
(5610, 2206, 5, '0.0000', NULL, '87278.0000'),
(5609, 2206, 4, '0.0000', NULL, '87278.0000'),
(5608, 2438, 7, '0.0000', NULL, '71693.0000'),
(5607, 2438, 6, '0.0000', NULL, '71693.0000'),
(5606, 2438, 5, '0.0000', NULL, '71693.0000'),
(5605, 2438, 4, '0.0000', NULL, '71693.0000'),
(5604, 2437, 7, '0.0000', NULL, '15932.0000'),
(5603, 2437, 6, '0.0000', NULL, '15932.0000'),
(5602, 2437, 5, '0.0000', NULL, '15932.0000'),
(5601, 2437, 4, '0.0000', NULL, '15932.0000'),
(5600, 2432, 7, '0.0000', NULL, '23898.0000'),
(5599, 2432, 6, '0.0000', NULL, '23898.0000'),
(5598, 2432, 5, '0.0000', NULL, '23898.0000'),
(5597, 2432, 4, '0.0000', NULL, '23898.0000'),
(5596, 2205, 7, '0.0000', NULL, '23898.0000'),
(5595, 2205, 6, '0.0000', NULL, '23898.0000'),
(5594, 2205, 5, '0.0000', NULL, '23898.0000'),
(5593, 2205, 4, '0.0000', NULL, '23898.0000'),
(5592, 2204, 7, '0.0000', NULL, '61337.0000'),
(5591, 2204, 6, '0.0000', NULL, '61337.0000'),
(5590, 2204, 5, '0.0000', NULL, '61337.0000'),
(5589, 2204, 4, '0.0000', NULL, '61337.0000'),
(5588, 2480, 7, '0.0000', NULL, '46999.0000'),
(5587, 2480, 6, '0.0000', NULL, '46999.0000'),
(5586, 2480, 5, '0.0000', NULL, '46999.0000'),
(5585, 2480, 4, '0.0000', NULL, '46999.0000'),
(5584, 2476, 7, '0.0000', NULL, '55761.0000'),
(5583, 2476, 6, '0.0000', NULL, '55761.0000'),
(5582, 2476, 5, '0.0000', NULL, '55761.0000'),
(5581, 2476, 4, '0.0000', NULL, '55761.0000'),
(5580, 2465, 7, '0.0000', NULL, '54964.0000'),
(5579, 2465, 6, '0.0000', NULL, '54964.0000'),
(5578, 2465, 5, '0.0000', NULL, '54964.0000'),
(5577, 2465, 4, '0.0000', NULL, '54964.0000'),
(5576, 2448, 7, '0.0000', NULL, '55761.0000'),
(5575, 2448, 6, '0.0000', NULL, '55761.0000'),
(5574, 2448, 5, '0.0000', NULL, '55761.0000'),
(5573, 2448, 4, '0.0000', NULL, '55761.0000'),
(5572, 2447, 7, '0.0000', NULL, '55761.0000'),
(5571, 2447, 6, '0.0000', NULL, '55761.0000'),
(5570, 2447, 5, '0.0000', NULL, '55761.0000'),
(5569, 2447, 4, '0.0000', NULL, '55761.0000'),
(5568, 2429, 7, '0.0000', NULL, '60194.0000'),
(5567, 2429, 6, '0.0000', NULL, '60194.0000'),
(5566, 2429, 5, '0.0000', NULL, '60194.0000'),
(5565, 2429, 4, '0.0000', NULL, '60194.0000'),
(5564, 2428, 7, '0.0000', NULL, '44955.0000'),
(5563, 2428, 6, '0.0000', NULL, '44955.0000'),
(5562, 2428, 5, '0.0000', NULL, '44955.0000'),
(5561, 2428, 4, '0.0000', NULL, '44955.0000'),
(5560, 2203, 7, '0.0000', NULL, '134622.0000'),
(5559, 2203, 6, '0.0000', NULL, '134622.0000'),
(5558, 2203, 5, '0.0000', NULL, '134622.0000'),
(5557, 2203, 4, '0.0000', NULL, '134622.0000'),
(5556, 2305, 7, '0.0000', NULL, '61337.0000'),
(5555, 2305, 6, '0.0000', NULL, '61337.0000'),
(5554, 2305, 5, '0.0000', NULL, '61337.0000'),
(5553, 2305, 4, '0.0000', NULL, '61337.0000'),
(5552, 2554, 7, '0.0000', NULL, '95590.0000'),
(5551, 2554, 6, '0.0000', NULL, '95590.0000'),
(5550, 2554, 5, '0.0000', NULL, '95590.0000'),
(5549, 2554, 4, '0.0000', NULL, '95590.0000'),
(5548, 2202, 7, '0.0000', NULL, '262871.0000'),
(5547, 2202, 6, '0.0000', NULL, '262871.0000'),
(5546, 2202, 5, '0.0000', NULL, '262871.0000'),
(5545, 2202, 4, '0.0000', NULL, '262871.0000'),
(5544, 2546, 7, '0.0000', NULL, '95590.0000'),
(5543, 2546, 6, '0.0000', NULL, '95590.0000'),
(5542, 2546, 5, '0.0000', NULL, '95590.0000'),
(5541, 2546, 4, '0.0000', NULL, '95590.0000'),
(5540, 2545, 7, '0.0000', NULL, '95590.0000'),
(5539, 2545, 6, '0.0000', NULL, '95590.0000'),
(5538, 2545, 5, '0.0000', NULL, '95590.0000'),
(5537, 2545, 4, '0.0000', NULL, '95590.0000'),
(5536, 2544, 7, '0.0000', NULL, '95590.0000'),
(5535, 2544, 6, '0.0000', NULL, '95590.0000'),
(5534, 2544, 5, '0.0000', NULL, '95590.0000'),
(5533, 2544, 4, '0.0000', NULL, '95590.0000'),
(5532, 2543, 7, '0.0000', NULL, '95590.0000'),
(5531, 2543, 6, '0.0000', NULL, '95590.0000'),
(5530, 2543, 5, '0.0000', NULL, '95590.0000'),
(5529, 2543, 4, '0.0000', NULL, '95590.0000'),
(5528, 2201, 7, '0.0000', NULL, '39033.0000'),
(5527, 2201, 6, '0.0000', NULL, '39033.0000'),
(5526, 2201, 5, '0.0000', NULL, '39033.0000'),
(5525, 2201, 4, '0.0000', NULL, '39033.0000'),
(5524, 2539, 7, '0.0000', NULL, '46999.0000'),
(5523, 2539, 6, '0.0000', NULL, '46999.0000'),
(5522, 2539, 5, '0.0000', NULL, '46999.0000'),
(5521, 2539, 4, '0.0000', NULL, '46999.0000'),
(5520, 2538, 7, '0.0000', NULL, '55761.0000'),
(5519, 2538, 6, '0.0000', NULL, '55761.0000'),
(5518, 2538, 5, '0.0000', NULL, '55761.0000'),
(5517, 2538, 4, '0.0000', NULL, '55761.0000'),
(5516, 2536, 7, '0.0000', NULL, '55761.0000'),
(5515, 2536, 6, '0.0000', NULL, '55761.0000'),
(5514, 2536, 5, '0.0000', NULL, '55761.0000'),
(5513, 2536, 4, '0.0000', NULL, '55761.0000'),
(5512, 2353, 7, '0.0000', NULL, '118691.0000'),
(5511, 2353, 6, '0.0000', NULL, '118691.0000'),
(5510, 2353, 5, '0.0000', NULL, '118691.0000'),
(5509, 2353, 4, '0.0000', NULL, '118691.0000'),
(5508, 2351, 7, '0.0000', NULL, '118691.0000'),
(5507, 2351, 6, '0.0000', NULL, '118691.0000'),
(5506, 2351, 5, '0.0000', NULL, '118691.0000'),
(5505, 2351, 4, '0.0000', NULL, '118691.0000'),
(5504, 2520, 7, '0.0000', NULL, '62930.0000'),
(5503, 2520, 6, '0.0000', NULL, '62930.0000'),
(5502, 2520, 5, '0.0000', NULL, '62930.0000'),
(5501, 2520, 4, '0.0000', NULL, '62930.0000'),
(5500, 2513, 7, '0.0000', NULL, '119487.0000'),
(5499, 2513, 6, '0.0000', NULL, '119487.0000'),
(5498, 2513, 5, '0.0000', NULL, '119487.0000'),
(5497, 2513, 4, '0.0000', NULL, '119487.0000'),
(5496, 2512, 7, '0.0000', NULL, '119487.0000'),
(5495, 2512, 6, '0.0000', NULL, '119487.0000'),
(5494, 2512, 5, '0.0000', NULL, '119487.0000'),
(5493, 2512, 4, '0.0000', NULL, '119487.0000'),
(5492, 2510, 7, '0.0000', NULL, '119487.0000'),
(5491, 2510, 6, '0.0000', NULL, '119487.0000'),
(5490, 2510, 5, '0.0000', NULL, '119487.0000'),
(5489, 2510, 4, '0.0000', NULL, '119487.0000'),
(5488, 2509, 7, '0.0000', NULL, '119487.0000'),
(5487, 2509, 6, '0.0000', NULL, '119487.0000'),
(5486, 2509, 5, '0.0000', NULL, '119487.0000'),
(5485, 2509, 4, '0.0000', NULL, '119487.0000'),
(5484, 2508, 7, '0.0000', NULL, '119487.0000'),
(5483, 2508, 6, '0.0000', NULL, '119487.0000'),
(5482, 2508, 5, '0.0000', NULL, '119487.0000'),
(5481, 2508, 4, '0.0000', NULL, '119487.0000'),
(5480, 2507, 7, '0.0000', NULL, '119487.0000'),
(5479, 2507, 6, '0.0000', NULL, '119487.0000'),
(5478, 2507, 5, '0.0000', NULL, '119487.0000'),
(5477, 2507, 4, '0.0000', NULL, '119487.0000'),
(5476, 2200, 7, '0.0000', NULL, '61337.0000'),
(5475, 2200, 6, '0.0000', NULL, '61337.0000'),
(5474, 2200, 5, '0.0000', NULL, '61337.0000'),
(5473, 2200, 4, '0.0000', NULL, '61337.0000'),
(5472, 2199, 7, '0.0000', NULL, '79658.0000'),
(5471, 2199, 6, '0.0000', NULL, '79658.0000'),
(5470, 2199, 5, '0.0000', NULL, '79658.0000'),
(5469, 2199, 4, '0.0000', NULL, '79658.0000'),
(5468, 2495, 7, '0.0000', NULL, '71693.0000'),
(5467, 2495, 6, '0.0000', NULL, '71693.0000'),
(5466, 2495, 5, '0.0000', NULL, '71693.0000'),
(5465, 2495, 4, '0.0000', NULL, '71693.0000'),
(5464, 2198, 7, '0.0000', NULL, '95590.0000'),
(5463, 2198, 6, '0.0000', NULL, '95590.0000'),
(5462, 2198, 5, '0.0000', NULL, '95590.0000'),
(5461, 2198, 4, '0.0000', NULL, '95590.0000'),
(5460, 2343, 7, '0.0000', NULL, '53337.0000'),
(5459, 2343, 6, '0.0000', NULL, '53337.0000'),
(5458, 2343, 5, '0.0000', NULL, '53337.0000'),
(5457, 2343, 4, '0.0000', NULL, '53337.0000'),
(5456, 2503, 7, '0.0000', NULL, '61337.0000'),
(5455, 2503, 6, '0.0000', NULL, '61337.0000'),
(5454, 2503, 5, '0.0000', NULL, '61337.0000'),
(5453, 2503, 4, '0.0000', NULL, '61337.0000'),
(5452, 2502, 7, '0.0000', NULL, '61337.0000'),
(5451, 2502, 6, '0.0000', NULL, '61337.0000'),
(5450, 2502, 5, '0.0000', NULL, '61337.0000'),
(5449, 2502, 4, '0.0000', NULL, '61337.0000'),
(5448, 2550, 7, '0.0000', NULL, '7966.0000'),
(5447, 2550, 6, '0.0000', NULL, '7966.0000'),
(5446, 2550, 5, '0.0000', NULL, '7966.0000'),
(5445, 2550, 4, '0.0000', NULL, '7966.0000'),
(5444, 2375, 7, '0.0000', NULL, '15932.0000'),
(5443, 2375, 6, '0.0000', NULL, '15932.0000'),
(5442, 2375, 5, '0.0000', NULL, '15932.0000'),
(5441, 2375, 4, '0.0000', NULL, '15932.0000'),
(5440, 2548, 7, '0.0000', NULL, '7966.0000'),
(5439, 2548, 6, '0.0000', NULL, '7966.0000'),
(5438, 2548, 5, '0.0000', NULL, '7966.0000'),
(5437, 2548, 4, '0.0000', NULL, '7966.0000'),
(5436, 2364, 7, '0.0000', NULL, '14339.0000'),
(5435, 2364, 6, '0.0000', NULL, '14339.0000'),
(5434, 2364, 5, '0.0000', NULL, '14339.0000'),
(5433, 2364, 4, '0.0000', NULL, '14339.0000'),
(5432, 2346, 7, '0.0000', NULL, '14339.0000'),
(5431, 2346, 6, '0.0000', NULL, '14339.0000'),
(5430, 2346, 5, '0.0000', NULL, '14339.0000'),
(5429, 2346, 4, '0.0000', NULL, '14339.0000'),
(5428, 2515, 7, '0.0000', NULL, '11949.0000'),
(5427, 2515, 6, '0.0000', NULL, '11949.0000'),
(5426, 2515, 5, '0.0000', NULL, '11949.0000'),
(5425, 2515, 4, '0.0000', NULL, '11949.0000'),
(5424, 2344, 7, '0.0000', NULL, '19915.0000'),
(5423, 2344, 6, '0.0000', NULL, '19915.0000'),
(5422, 2344, 5, '0.0000', NULL, '19915.0000'),
(5421, 2344, 4, '0.0000', NULL, '19915.0000'),
(5420, 2336, 7, '0.0000', NULL, '19915.0000'),
(5419, 2336, 6, '0.0000', NULL, '19915.0000'),
(5418, 2336, 5, '0.0000', NULL, '19915.0000'),
(5417, 2336, 4, '0.0000', NULL, '19915.0000'),
(5416, 2460, 7, '0.0000', NULL, '15932.0000'),
(5415, 2460, 6, '0.0000', NULL, '15932.0000'),
(5414, 2460, 5, '0.0000', NULL, '15932.0000'),
(5413, 2460, 4, '0.0000', NULL, '15932.0000'),
(5412, 2458, 7, '0.0000', NULL, '11949.0000'),
(5411, 2458, 6, '0.0000', NULL, '11949.0000'),
(5410, 2458, 5, '0.0000', NULL, '11949.0000'),
(5409, 2458, 4, '0.0000', NULL, '11949.0000'),
(5408, 2197, 7, '0.0000', NULL, '43770.0000'),
(5407, 2197, 6, '0.0000', NULL, '43770.0000'),
(5406, 2197, 5, '0.0000', NULL, '43770.0000'),
(5405, 2197, 4, '0.0000', NULL, '43770.0000'),
(5404, 2457, 7, '0.0000', NULL, '31864.0000'),
(5403, 2457, 6, '0.0000', NULL, '31864.0000'),
(5402, 2457, 5, '0.0000', NULL, '31864.0000'),
(5401, 2457, 4, '0.0000', NULL, '31864.0000'),
(5400, 2320, 7, '0.0000', NULL, '15932.0000'),
(5399, 2320, 6, '0.0000', NULL, '15932.0000'),
(5398, 2320, 5, '0.0000', NULL, '15932.0000'),
(5397, 2320, 4, '0.0000', NULL, '15932.0000'),
(5396, 2319, 7, '0.0000', NULL, '15932.0000'),
(5395, 2319, 6, '0.0000', NULL, '15932.0000'),
(5394, 2319, 5, '0.0000', NULL, '15932.0000'),
(5393, 2319, 4, '0.0000', NULL, '15932.0000'),
(5392, 2166, 4, '0.0000', NULL, '39829.0000'),
(5391, 2207, 7, '0.0000', NULL, '35050.0000'),
(5390, 2207, 6, '0.0000', NULL, '35050.0000'),
(5389, 2207, 5, '0.0000', NULL, '35050.0000'),
(5388, 2207, 4, '0.0000', NULL, '35050.0000'),
(5387, 2207, 3, '20394.0000', NULL, '35050.0000'),
(5386, 2553, 3, '60.0000', NULL, '11949.0000'),
(5385, 2552, 3, '60.0000', NULL, '78862.0000'),
(5384, 2530, 3, '60.0000', NULL, '35847.0000'),
(5383, 2528, 3, '60.0000', NULL, '19915.0000'),
(5382, 2523, 3, '60.0000', NULL, '23898.0000'),
(5381, 2516, 3, '60.0000', NULL, '23898.0000'),
(5380, 2494, 3, '60.0000', NULL, '39829.0000'),
(5379, 2493, 3, '60.0000', NULL, '23898.0000'),
(5378, 2459, 3, '60.0000', NULL, '14339.0000'),
(5377, 2453, 3, '40.0000', NULL, '71693.0000'),
(5376, 2452, 3, '60.0000', NULL, '35847.0000'),
(5375, 2206, 3, '20.0000', NULL, '87278.0000'),
(5374, 2438, 3, '30.0000', NULL, '71693.0000'),
(5373, 2437, 3, '40.0000', NULL, '15932.0000'),
(5372, 2432, 3, '60.0000', NULL, '23898.0000'),
(5371, 2205, 3, '400.0000', NULL, '23898.0000'),
(5370, 2204, 3, '600.0000', NULL, '61337.0000'),
(5369, 2480, 3, '60.0000', NULL, '46999.0000'),
(5368, 2476, 3, '96.0000', NULL, '55761.0000'),
(5367, 2465, 3, '72.0000', NULL, '54964.0000'),
(5366, 2448, 3, '60.0000', NULL, '55761.0000'),
(5365, 2447, 3, '60.0000', NULL, '55761.0000'),
(5364, 2429, 3, '60.0000', NULL, '60194.0000'),
(5363, 2428, 3, '60.0000', NULL, '44955.0000'),
(5362, 2203, 3, '60.0000', NULL, '134622.0000'),
(5361, 2305, 3, '63.0000', NULL, '61337.0000'),
(5360, 2554, 3, '40.0000', NULL, '95590.0000'),
(5359, 2202, 3, '48.0000', NULL, '262871.0000'),
(5358, 2546, 3, '40.0000', NULL, '95590.0000'),
(5357, 2545, 3, '56.0000', NULL, '95590.0000'),
(5356, 2544, 3, '40.0000', NULL, '95590.0000'),
(5355, 2543, 3, '48.0000', NULL, '95590.0000'),
(5354, 2201, 3, '640.0000', NULL, '39033.0000'),
(5353, 2539, 3, '72.0000', NULL, '46999.0000'),
(5352, 2538, 3, '56.0000', NULL, '55761.0000'),
(5351, 2536, 3, '56.0000', NULL, '55761.0000'),
(5350, 2353, 3, '40.0000', NULL, '118691.0000'),
(5349, 2351, 3, '40.0000', NULL, '118691.0000'),
(5348, 2520, 3, '48.0000', NULL, '62930.0000'),
(5347, 2513, 3, '56.0000', NULL, '119487.0000'),
(5346, 2512, 3, '56.0000', NULL, '119487.0000'),
(5345, 2510, 3, '40.0000', NULL, '119487.0000'),
(5344, 2509, 3, '56.0000', NULL, '119487.0000'),
(5343, 2508, 3, '40.0000', NULL, '119487.0000'),
(5342, 2507, 3, '40.0000', NULL, '119487.0000'),
(5341, 2200, 3, '60.0000', NULL, '61337.0000'),
(5340, 2199, 3, '48.0000', NULL, '79658.0000'),
(5339, 2495, 3, '63.0000', NULL, '71693.0000'),
(5338, 2198, 3, '45.0000', NULL, '95590.0000'),
(5337, 2343, 3, '56.0000', NULL, '53337.0000'),
(5336, 2503, 3, '40.0000', NULL, '61337.0000'),
(5335, 2502, 3, '60.0000', NULL, '61337.0000'),
(5334, 2550, 3, '60.0000', NULL, '7966.0000'),
(5333, 2375, 3, '60.0000', NULL, '15932.0000'),
(5332, 2548, 3, '60.0000', NULL, '7966.0000'),
(5331, 2364, 3, '60.0000', NULL, '14339.0000'),
(5330, 2346, 3, '60.0000', NULL, '14339.0000'),
(5329, 2515, 3, '60.0000', NULL, '11949.0000'),
(5328, 2344, 3, '60.0000', NULL, '19915.0000'),
(5327, 2336, 3, '60.0000', NULL, '19915.0000'),
(5326, 2460, 3, '60.0000', NULL, '15932.0000'),
(5325, 2458, 3, '60.0000', NULL, '11949.0000'),
(5324, 2197, 3, '60.0000', NULL, '43770.0000'),
(5323, 2457, 3, '60.0000', NULL, '31864.0000'),
(5322, 2320, 3, '60.0000', NULL, '15932.0000'),
(5321, 2319, 3, '60.0000', NULL, '15932.0000'),
(5320, 2450, 3, '60.0000', NULL, '23898.0000'),
(5319, 2442, 3, '60.0000', NULL, '23898.0000'),
(5318, 2440, 3, '60.0000', NULL, '15932.0000'),
(5317, 2314, 3, '60.0000', NULL, '19915.0000'),
(5316, 2196, 3, '20.0000', NULL, '181828.0000'),
(5315, 2439, 3, '60.0000', NULL, '39829.0000'),
(5314, 2435, 3, '60.0000', NULL, '31864.0000'),
(5313, 2310, 3, '60.0000', NULL, '31864.0000'),
(5312, 2433, 3, '60.0000', NULL, '19915.0000'),
(5311, 2431, 3, '60.0000', NULL, '19915.0000'),
(5310, 2470, 3, '60.0000', NULL, '67710.0000'),
(5309, 2195, 3, '180.0000', NULL, '70099.0000'),
(5308, 2487, 3, '60.0000', NULL, '63727.0000'),
(5307, 2486, 3, '60.0000', NULL, '63727.0000'),
(5306, 2485, 3, '60.0000', NULL, '63727.0000'),
(5305, 2483, 3, '60.0000', NULL, '63727.0000'),
(5304, 2482, 3, '96.0000', NULL, '46999.0000'),
(5303, 2481, 3, '54.0000', NULL, '95590.0000'),
(5302, 2194, 3, '1500.0000', NULL, '3983.0000'),
(5301, 2324, 3, '120.0000', NULL, '47795.0000'),
(5300, 2466, 3, '120.0000', NULL, '47795.0000'),
(5299, 2464, 3, '72.0000', NULL, '54964.0000'),
(5298, 2449, 3, '60.0000', NULL, '55761.0000'),
(5297, 2316, 3, '60.0000', NULL, '55761.0000'),
(5296, 2446, 3, '60.0000', NULL, '55761.0000'),
(5295, 2193, 3, '280.0000', NULL, '23898.0000'),
(5294, 2430, 3, '96.0000', NULL, '61337.0000'),
(5293, 2427, 3, '45.0000', NULL, '61337.0000'),
(5292, 2304, 3, '63.0000', NULL, '61337.0000'),
(5291, 2192, 3, '2400.0000', NULL, '7577.0000'),
(5290, 2191, 3, '40.0000', NULL, '55761.0000'),
(5289, 2190, 3, '48.0000', NULL, '95590.0000'),
(5288, 2547, 3, '40.0000', NULL, '95590.0000'),
(5287, 2542, 3, '48.0000', NULL, '95590.0000'),
(5286, 2415, 3, '56.0000', NULL, '54964.0000'),
(5285, 2368, 3, '40.0000', NULL, '102759.0000'),
(5284, 2537, 3, '56.0000', NULL, '55761.0000'),
(5283, 2535, 3, '56.0000', NULL, '55761.0000'),
(5282, 2363, 3, '42.0000', NULL, '126656.0000'),
(5281, 2526, 3, '56.0000', NULL, '55761.0000'),
(5280, 2522, 3, '48.0000', NULL, '86828.0000'),
(5279, 2519, 3, '60.0000', NULL, '78862.0000'),
(5278, 2518, 3, '60.0000', NULL, '78862.0000'),
(5277, 2517, 3, '60.0000', NULL, '78862.0000'),
(5276, 2347, 3, '64.0000', NULL, '198348.0000'),
(5275, 2189, 3, '40.0000', NULL, '183213.0000'),
(5274, 2505, 3, '48.0000', NULL, '79658.0000'),
(5273, 2504, 3, '40.0000', NULL, '102759.0000'),
(5272, 2405, 3, '56.0000', NULL, '54964.0000'),
(5271, 2496, 3, '48.0000', NULL, '79658.0000'),
(5270, 2340, 3, '63.0000', NULL, '71693.0000'),
(5269, 2188, 3, '60.0000', NULL, '143385.0000'),
(5268, 2469, 3, '54.0000', NULL, '79658.0000'),
(5267, 2187, 3, '54.0000', NULL, '79658.0000'),
(5266, 2468, 3, '120.0000', NULL, '47795.0000'),
(5265, 2467, 3, '120.0000', NULL, '47795.0000'),
(5264, 2551, 3, '60.0000', NULL, '27881.0000'),
(5263, 2186, 3, '400.0000', NULL, '7959.0000'),
(5262, 2376, 3, '45.0000', NULL, '23898.0000'),
(5261, 2529, 3, '60.0000', NULL, '23898.0000'),
(5260, 2525, 3, '60.0000', NULL, '14339.0000'),
(5259, 2185, 3, '100.0000', NULL, '19896.0000'),
(5258, 2500, 3, '60.0000', NULL, '15932.0000'),
(5257, 2456, 3, '60.0000', NULL, '18626.0000'),
(5256, 2451, 3, '60.0000', NULL, '23898.0000'),
(5255, 2434, 3, '60.0000', NULL, '19915.0000'),
(5254, 2184, 3, '60.0000', NULL, '63727.0000'),
(5253, 2484, 3, '60.0000', NULL, '63727.0000'),
(5252, 2183, 3, '54.0000', NULL, '95590.0000'),
(5251, 2182, 3, '72.0000', NULL, '99573.0000'),
(5250, 2224, 3, '96.0000', NULL, '99573.0000'),
(5249, 2223, 3, '120.0000', NULL, '99573.0000'),
(5248, 2473, 3, '60.0000', NULL, '62930.0000'),
(5247, 2181, 3, '400.0000', NULL, '35847.0000'),
(5246, 2180, 3, '72.0000', NULL, '54964.0000'),
(5245, 2318, 3, '60.0000', NULL, '55761.0000'),
(5244, 2315, 3, '60.0000', NULL, '55761.0000'),
(5243, 2444, 3, '54.0000', NULL, '78862.0000'),
(5242, 2443, 3, '45.0000', NULL, '78862.0000'),
(5241, 2179, 3, '280.0000', NULL, '19915.0000'),
(5240, 2178, 3, '400.0000', NULL, '23898.0000'),
(5239, 2425, 3, '63.0000', NULL, '61337.0000'),
(5238, 2534, 3, '48.0000', NULL, '79658.0000'),
(5237, 2533, 3, '48.0000', NULL, '79658.0000'),
(5236, 2532, 3, '48.0000', NULL, '79658.0000'),
(5235, 2527, 3, '56.0000', NULL, '55761.0000'),
(5234, 2237, 3, '80.0000', NULL, '122674.0000'),
(5233, 2511, 3, '48.0000', NULL, '119487.0000'),
(5232, 2345, 3, '40.0000', NULL, '119487.0000'),
(5231, 2506, 3, '48.0000', NULL, '79658.0000'),
(5230, 2177, 3, '56.0000', NULL, '150554.0000'),
(5229, 2233, 3, '40.0000', NULL, '150554.0000'),
(5228, 2227, 3, '84.0000', NULL, '262871.0000'),
(5227, 2176, 3, '300.0000', NULL, '23898.0000'),
(5226, 2296, 3, '60.0000', NULL, '27881.0000'),
(5225, 2454, 3, '60.0000', NULL, '11949.0000'),
(5224, 2256, 3, '2400.0000', NULL, '7577.0000'),
(5223, 2301, 3, '2000.0000', NULL, '7577.0000'),
(5222, 2337, 3, '84.0000', NULL, '111521.0000'),
(5221, 2335, 3, '60.0000', NULL, '79658.0000'),
(5220, 2277, 3, '48.0000', NULL, '119487.0000'),
(5219, 2269, 3, '120.0000', NULL, '78862.0000'),
(5218, 2307, 3, '180.0000', NULL, '86828.0000'),
(5217, 2303, 3, '120.0000', NULL, '134622.0000'),
(5216, 2213, 3, '2000.0000', NULL, '7577.0000'),
(5215, 2212, 3, '2000.0000', NULL, '7577.0000'),
(5214, 2258, 3, '2400.0000', NULL, '7577.0000'),
(5213, 2210, 3, '2400.0000', NULL, '7577.0000'),
(5212, 2381, 3, '40.0000', NULL, '238974.0000'),
(5211, 2297, 3, '40.0000', NULL, '150554.0000'),
(5210, 2288, 3, '40.0000', NULL, '150554.0000'),
(5209, 2287, 3, '42.0000', NULL, '95590.0000'),
(5208, 2286, 3, '180.0000', NULL, '35050.0000'),
(5207, 2280, 3, '120.0000', NULL, '26288.0000'),
(5206, 2549, 3, '60.0000', NULL, '23898.0000'),
(5205, 2521, 3, '100.0000', NULL, '27881.0000'),
(5204, 2175, 3, '40.0000', NULL, '72732.0000'),
(5203, 2174, 3, '100.0000', NULL, '7959.0000'),
(5202, 2445, 3, '100.0000', NULL, '27881.0000'),
(5201, 2386, 3, '100.0000', NULL, '27881.0000'),
(5200, 2395, 3, '60.0000', NULL, '111521.0000'),
(5199, 2396, 3, '84.0000', NULL, '52575.0000'),
(5198, 2394, 3, '60.0000', NULL, '111521.0000'),
(5197, 2173, 3, '600.0000', NULL, '27881.0000'),
(5196, 2391, 3, '72.0000', NULL, '52575.0000'),
(5195, 2388, 3, '72.0000', NULL, '52575.0000'),
(5194, 2172, 3, '72.0000', NULL, '52575.0000'),
(5193, 2266, 3, '96.0000', NULL, '78862.0000'),
(5192, 2382, 3, '84.0000', NULL, '79658.0000'),
(5191, 2412, 3, '40.0000', NULL, '118691.0000'),
(5190, 2411, 3, '120.0000', NULL, '78862.0000'),
(5189, 2171, 3, '64.0000', NULL, '477947.0000'),
(5188, 2170, 3, '600.0000', NULL, '15543.0000'),
(5187, 2401, 3, '96.0000', NULL, '26288.0000'),
(5186, 2356, 3, '60.0000', NULL, '14339.0000'),
(5185, 2169, 3, '18.0000', NULL, '572983.0000'),
(5184, 2216, 3, '60.0000', NULL, '15932.0000'),
(5183, 2226, 3, '84.0000', NULL, '111521.0000'),
(5182, 2168, 3, '144.0000', NULL, '63727.0000'),
(5181, 2167, 3, '60.0000', NULL, '119487.0000'),
(5180, 2222, 3, '60.0000', NULL, '67710.0000'),
(5179, 2327, 3, '120.0000', NULL, '99573.0000'),
(5178, 2325, 3, '120.0000', NULL, '99573.0000'),
(5177, 2317, 3, '60.0000', NULL, '55761.0000'),
(5176, 2166, 3, '400.0000', NULL, '39829.0000'),
(5175, 2308, 3, '120.0000', NULL, '78862.0000'),
(5174, 2165, 3, '60.0000', NULL, '95590.0000'),
(5173, 2214, 3, '120.0000', NULL, '118691.0000'),
(5172, 2302, 3, '72.0000', NULL, '118691.0000'),
(5171, 2211, 3, '2000.0000', NULL, '7577.0000'),
(5170, 2255, 3, '30.0000', NULL, '199145.0000'),
(5169, 2254, 3, '56.0000', NULL, '398290.0000'),
(5168, 2377, 3, '84.0000', NULL, '78862.0000'),
(5167, 2371, 3, '40.0000', NULL, '95590.0000'),
(5166, 2370, 3, '40.0000', NULL, '95590.0000'),
(5165, 2365, 3, '80.0000', NULL, '78862.0000'),
(5164, 2164, 3, '600.0000', NULL, '15543.0000'),
(5163, 2244, 3, '40.0000', NULL, '62930.0000'),
(5162, 2359, 3, '42.0000', NULL, '126656.0000'),
(5161, 2355, 3, '48.0000', NULL, '70099.0000'),
(5160, 2163, 3, '40.0000', NULL, '102759.0000'),
(5159, 2354, 3, '56.0000', NULL, '86828.0000'),
(5158, 2162, 3, '48.0000', NULL, '70099.0000'),
(5157, 2238, 3, '80.0000', NULL, '122674.0000'),
(5156, 2341, 3, '48.0000', NULL, '70099.0000'),
(5155, 2161, 3, '48.0000', NULL, '61337.0000'),
(5154, 2160, 3, '360.0000', NULL, '35050.0000'),
(5153, 2262, 3, '120.0000', NULL, '78862.0000'),
(5152, 2159, 3, '2000.0000', NULL, '7577.0000'),
(5151, 2272, 3, '144.0000', NULL, '61337.0000'),
(5150, 2270, 3, '72.0000', NULL, '54964.0000'),
(5149, 2158, 3, '240.0000', NULL, '52575.0000'),
(5148, 2209, 3, '2000.0000', NULL, '7577.0000'),
(5147, 2299, 3, '96.0000', NULL, '78862.0000'),
(5146, 2418, 3, '40.0000', NULL, '53337.0000'),
(5145, 2541, 3, '48.0000', NULL, '70099.0000'),
(5144, 2416, 3, '56.0000', NULL, '54964.0000'),
(5143, 2240, 3, '64.0000', NULL, '150554.0000'),
(5142, 2499, 3, '48.0000', NULL, '70099.0000'),
(5141, 2231, 3, '48.0000', NULL, '70099.0000'),
(5140, 2229, 3, '48.0000', NULL, '70099.0000'),
(5139, 2156, 3, '600.0000', NULL, '15543.0000'),
(5138, 2410, 3, '30.0000', NULL, '87278.0000'),
(5137, 2404, 3, '30.0000', NULL, '33280.0000'),
(5136, 2155, 3, '30.0000', NULL, '27456.0000'),
(5135, 2367, 3, '96.0000', NULL, '70099.0000'),
(5134, 2400, 3, '180.0000', NULL, '26288.0000'),
(5133, 2225, 3, '54.0000', NULL, '95590.0000'),
(5132, 2330, 3, '60.0000', NULL, '111521.0000'),
(5131, 2154, 3, '1000.0000', NULL, '15932.0000'),
(5130, 2393, 3, '84.0000', NULL, '61337.0000'),
(5129, 2153, 3, '400.0000', NULL, '35847.0000'),
(5128, 2390, 3, '96.0000', NULL, '61337.0000'),
(5127, 2219, 3, '96.0000', NULL, '59744.0000'),
(5126, 2152, 3, '60.0000', NULL, '43812.0000'),
(5125, 2151, 3, '60.0000', NULL, '43812.0000'),
(5124, 2150, 3, '350.0000', NULL, '19915.0000'),
(5123, 2149, 3, '120.0000', NULL, '134622.0000'),
(5122, 2259, 3, '96.0000', NULL, '55761.0000'),
(5121, 2300, 3, '48.0000', NULL, '70099.0000'),
(5120, 2420, 3, '96.0000', NULL, '78862.0000'),
(5119, 2298, 3, '56.0000', NULL, '198348.0000'),
(5118, 2252, 3, '80.0000', NULL, '182417.0000'),
(5117, 2419, 3, '96.0000', NULL, '199145.0000'),
(5116, 2417, 3, '80.0000', NULL, '238974.0000'),
(5115, 2247, 3, '48.0000', NULL, '70099.0000'),
(5114, 2414, 3, '56.0000', NULL, '262871.0000'),
(5113, 2246, 3, '56.0000', NULL, '75433.0000'),
(5112, 2148, 3, '56.0000', NULL, '78862.0000'),
(5111, 2147, 3, '600.0000', NULL, '15543.0000'),
(5110, 2409, 3, '96.0000', NULL, '95590.0000'),
(5109, 2291, 3, '64.0000', NULL, '198348.0000'),
(5108, 2290, 3, '80.0000', NULL, '100369.0000'),
(5107, 2236, 3, '96.0000', NULL, '126656.0000'),
(5106, 2406, 3, '40.0000', NULL, '102759.0000'),
(5105, 2146, 3, '56.0000', NULL, '118691.0000'),
(5104, 2501, 3, '64.0000', NULL, '78862.0000'),
(5103, 2145, 3, '40.0000', NULL, '102759.0000'),
(5102, 2144, 3, '40.0000', NULL, '86828.0000'),
(5101, 2279, 3, '40.0000', NULL, '159316.0000'),
(5100, 2218, 3, '84.0000', NULL, '46999.0000'),
(5099, 2143, 3, '500.0000', NULL, '7170.0000'),
(5098, 2361, 3, '60.0000', NULL, '11949.0000'),
(5097, 2358, 3, '60.0000', NULL, '11949.0000'),
(5096, 2357, 3, '60.0000', NULL, '14339.0000'),
(5095, 2350, 3, '60.0000', NULL, '23898.0000'),
(5094, 2321, 3, '60.0000', NULL, '27881.0000'),
(5093, 2441, 3, '36.0000', NULL, '55761.0000'),
(5092, 2142, 3, '60.0000', NULL, '26045.0000'),
(5091, 2251, 3, '56.0000', NULL, '182417.0000'),
(5090, 2141, 3, '48.0000', NULL, '102759.0000'),
(5089, 2140, 3, '60.0000', NULL, '438118.0000'),
(5088, 2334, 3, '60.0000', NULL, '302700.0000'),
(5087, 2333, 3, '60.0000', NULL, '302700.0000'),
(5086, 2274, 3, '96.0000', NULL, '78862.0000'),
(5085, 2329, 3, '64.0000', NULL, '525742.0000'),
(5084, 2139, 3, '400.0000', NULL, '23898.0000'),
(5083, 2379, 3, '56.0000', NULL, '214280.0000'),
(5082, 2138, 3, '600.0000', NULL, '15543.0000'),
(5081, 2239, 3, '64.0000', NULL, '150554.0000'),
(5080, 2234, 3, '39.0000', NULL, '70099.0000'),
(5079, 2137, 3, '560.0000', NULL, '15543.0000'),
(5078, 2136, 3, '1000.0000', NULL, '15543.0000'),
(5077, 2135, 3, '20.0000', NULL, '955894.0000'),
(5076, 2250, 3, '30.0000', NULL, '19915.0000'),
(5075, 2372, 3, '60.0000', NULL, '7966.0000'),
(5074, 2348, 3, '60.0000', NULL, '31864.0000'),
(5073, 2232, 3, '60.0000', NULL, '7966.0000'),
(5072, 2134, 3, '48.0000', NULL, '86828.0000'),
(5071, 2245, 3, '40.0000', NULL, '118691.0000'),
(5070, 2133, 3, '180.0000', NULL, '43812.0000'),
(5069, 2328, 3, '120.0000', NULL, '99573.0000'),
(5068, 2326, 3, '72.0000', NULL, '99573.0000'),
(5067, 2271, 3, '120.0000', NULL, '47795.0000'),
(5066, 2323, 3, '72.0000', NULL, '54964.0000'),
(5065, 2313, 3, '36.0000', NULL, '55761.0000'),
(5064, 2264, 3, '54.0000', NULL, '95590.0000'),
(5063, 2261, 3, '250.0000', NULL, '27881.0000'),
(5062, 2132, 3, '900.0000', NULL, '78862.0000'),
(5061, 2257, 3, '4800.0000', NULL, '7577.0000'),
(5060, 2208, 3, '2000.0000', NULL, '7577.0000'),
(5059, 2380, 3, '40.0000', NULL, '86828.0000'),
(5058, 2253, 3, '56.0000', NULL, '198348.0000'),
(5057, 2374, 3, '40.0000', NULL, '150554.0000'),
(5056, 2295, 3, '56.0000', NULL, '95590.0000'),
(5055, 2248, 3, '48.0000', NULL, '70099.0000'),
(5054, 2366, 3, '96.0000', NULL, '78862.0000'),
(5053, 2131, 3, '56.0000', NULL, '62930.0000'),
(5052, 2130, 3, '64.0000', NULL, '214280.0000'),
(5051, 2360, 3, '42.0000', NULL, '126656.0000'),
(5050, 2243, 3, '96.0000', NULL, '262871.0000'),
(5049, 2129, 3, '96.0000', NULL, '199145.0000'),
(5048, 2128, 3, '48.0000', NULL, '70099.0000'),
(5047, 2289, 3, '80.0000', NULL, '122674.0000'),
(5046, 2235, 3, '56.0000', NULL, '238974.0000'),
(5045, 2230, 3, '48.0000', NULL, '70099.0000'),
(5044, 2127, 3, '80.0000', NULL, '61337.0000'),
(5043, 2157, 6, '0.0000', NULL, '199145.0000'),
(5042, 2157, 5, '0.0000', NULL, '199145.0000'),
(5041, 2157, 3, '60.0000', NULL, '199145.0000'),
(5040, 2157, 4, '0.0000', NULL, '199145.0000'),
(5039, 2436, 6, '0.0000', NULL, '118691.0000'),
(5038, 2436, 5, '0.0000', NULL, '118691.0000'),
(5037, 2436, 3, '60.0000', NULL, '118691.0000'),
(5036, 2436, 4, '0.0000', NULL, '118691.0000'),
(5035, 2263, 6, '0.0000', NULL, '118691.0000'),
(5034, 2263, 5, '0.0000', NULL, '118691.0000'),
(5033, 2263, 3, '72.0000', NULL, '118691.0000'),
(5032, 2263, 4, '0.0000', NULL, '118691.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tamp_detail`
--

CREATE TABLE `tamp_detail` (
  `id_detail` int(11) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tamp_head`
--

CREATE TABLE `tamp_head` (
  `id_kasir` int(11) NOT NULL,
  `sess_id` varchar(50) NOT NULL,
  `tanggal` datetime NOT NULL,
  `sales_id` int(11) NOT NULL,
  `acak` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_banner`
--
ALTER TABLE `sma_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_code`
--
ALTER TABLE `sma_code`
  ADD PRIMARY KEY (`id_code`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_logs`
--
ALTER TABLE `sma_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_user` (`log_user`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_discounts`
--
ALTER TABLE `sma_product_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `tamp_detail`
--
ALTER TABLE `tamp_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `tamp_head`
--
ALTER TABLE `tamp_head`
  ADD PRIMARY KEY (`id_kasir`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1152;
--
-- AUTO_INCREMENT for table `sma_banner`
--
ALTER TABLE `sma_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `sma_code`
--
ALTER TABLE `sma_code`
  MODIFY `id_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3907;
--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;
--
-- AUTO_INCREMENT for table `sma_logs`
--
ALTER TABLE `sma_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1191;
--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=974;
--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;
--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2555;
--
-- AUTO_INCREMENT for table `sma_product_discounts`
--
ALTER TABLE `sma_product_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1700;
--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6463;
--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1242;
--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5586;
--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2439;
--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=781;
--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6777;
--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tamp_detail`
--
ALTER TABLE `tamp_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tamp_head`
--
ALTER TABLE `tamp_head`
  MODIFY `id_kasir` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
