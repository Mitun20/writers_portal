-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 10.123.0.91:3306
-- Generation Time: Oct 04, 2021 at 12:07 PM
-- Server version: 8.0.22
-- PHP Version: 7.0.33-0+deb9u11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techthoughts_wportal3`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_assistant`
--

CREATE TABLE `account_assistant` (
  `id` bigint NOT NULL,
  `senior` varchar(100) NOT NULL,
  `year` int UNSIGNED DEFAULT NULL,
  `project_id` bigint NOT NULL,
  `senior_link_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_assistant`
--

INSERT INTO `account_assistant` (`id`, `senior`, `year`, `project_id`, `senior_link_id`, `user_id`) VALUES
(1, '', 2001, 1, 5, 2),
(2, '', 2020, 1, 5, 3),
(3, 'Hari', 2015, 1, NULL, 3),
(4, '', 2017, 20, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `account_award`
--

CREATE TABLE `account_award` (
  `id` bigint NOT NULL,
  `title` varchar(300) NOT NULL,
  `year` int UNSIGNED NOT NULL,
  `banner` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `project_id` bigint NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_award`
--

INSERT INTO `account_award` (`id`, `title`, `year`, `banner`, `image`, `project_id`, `user_id`) VALUES
(5, 'Edition Award', 2017, 'Banner example goes here', 'awards/mqdefault.jpg', 20, 2),
(6, 'Edition Award', 2018, 'sample banner', 'awards/ramesh.jpg', 19, 3),
(7, 'Filmfare Award for Best Director – Tamil', 2006, 'sample banner', 'awards/Shankar_at_the_2.0_Audio_launch.jpg', 17, 5),
(8, 'Behindwoods Awards', 2013, 'Sample banner goes here', 'awards/remo.jpg', 20, 4);

-- --------------------------------------------------------

--
-- Table structure for table `account_blocked_user`
--

CREATE TABLE `account_blocked_user` (
  `id` bigint NOT NULL,
  `blocked_by_id` bigint NOT NULL,
  `blocked_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_blocked_user`
--

INSERT INTO `account_blocked_user` (`id`, `blocked_by_id`, `blocked_user_id`) VALUES
(13, 3, 2),
(15, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_chat`
--

CREATE TABLE `account_chat` (
  `id` bigint NOT NULL,
  `date` datetime(6) NOT NULL,
  `message` longtext NOT NULL,
  `unread` tinyint(1) NOT NULL,
  `m_file` varchar(100) DEFAULT NULL,
  `sender_id` bigint NOT NULL,
  `conversation_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_chat`
--

INSERT INTO `account_chat` (`id`, `date`, `message`, `unread`, `m_file`, `sender_id`, `conversation_id`) VALUES
(2, '2021-09-14 16:31:47.018124', 'Hello bakiyaraj', 1, '', 3, NULL),
(3, '2021-09-14 16:34:45.676634', 'Hello', 0, '', 3, 4),
(4, '2021-09-14 16:35:06.240667', 'Hello Hi', 0, '', 3, 4),
(5, '2021-09-14 16:37:02.545279', 'Hello Hi', 0, '', 3, 4),
(6, '2021-09-14 16:39:08.450800', 'Hello Hi', 0, '', 3, 4),
(7, '2021-09-14 16:39:49.616073', 'Hello Hi', 0, '', 3, 4),
(8, '2021-09-14 16:40:55.556513', 'sample.pdf', 0, 'message_file/sample_Z9jraZO.pdf', 2, 4),
(9, '2021-09-16 09:48:05.997678', 'hello', 0, '', 3, 4),
(10, '2021-09-16 09:55:42.506083', 'New MEssage', 1, '', 3, 5),
(11, '2021-09-16 15:47:45.787234', 'hello', 0, '', 3, 4),
(12, '2021-09-17 10:14:16.381567', 'Hi', 0, '', 2, 6),
(13, '2021-09-17 10:28:33.821089', 'Hi', 0, '', 3, 4),
(14, '2021-09-17 10:45:27.913233', 'Hi', 0, '', 2, 4),
(15, '2021-09-17 10:46:14.660345', 'hi', 0, '', 2, 4),
(16, '2021-09-17 10:51:15.314541', 'hi', 0, '', 2, 4),
(17, '2021-09-17 10:52:58.101497', 'Hi', 0, '', 2, 4),
(18, '2021-09-17 12:40:19.170026', 'Hi', 0, '', 2, 4),
(19, '2021-09-17 12:41:11.437091', 'Hello sample msg goes here', 0, '', 2, 6),
(20, '2021-09-17 12:41:18.101037', 'Hello', 0, '', 2, 6),
(21, '2021-09-17 12:41:31.098460', 'Hello sir ', 0, '', 2, 4),
(22, '2021-09-17 12:42:45.462006', 'sample.pdf', 0, 'message_file/sample_2TWjbK2.pdf', 2, 6),
(23, '2021-09-25 18:04:02.559778', 'tesr', 0, '', 2, 4),
(24, '2021-09-25 18:04:02.932740', 'tesr', 0, '', 2, 4),
(25, '2021-09-25 18:04:42.649241', 'test messgae', 0, '', 2, 4),
(26, '2021-09-28 13:19:03.025681', 'rest', 0, '', 5, 6),
(27, '2021-09-28 13:19:32.694322', '\r\ntest', 0, '', 5, 6),
(28, '2021-09-28 20:45:18.737393', 'fsff', 1, '', 3, 5),
(29, '2021-09-29 14:48:01.058303', '\r\nWhen 160 characters isn\'t enough, long messages means you can include all the information you need. Your long messages will be concatenated, ensuring that a multi-part message with more than 160 characters is received as a single SMS message', 0, '', 2, 6),
(31, '2021-09-30 10:48:04.944083', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0, '', 2, 4),
(36, '2021-09-30 11:15:41.664650', 'hiiiiiiiiii', 0, '', 2, 4),
(37, '2021-09-30 11:17:46.721106', 'madddy', 0, '', 2, 4),
(38, '2021-09-30 11:18:32.982582', 'hi sankar', 0, '', 2, 6),
(39, '2021-09-30 11:33:33.900407', 'hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', 0, '', 2, 6),
(40, '2021-09-30 12:26:43.347263', 'hi', 0, '', 2, 4),
(41, '2021-09-30 12:26:55.593613', 'inbox_count', 0, '', 2, 4),
(42, '2021-09-30 12:27:10.792985', 'inbox_count', 0, '', 2, 4),
(43, '2021-09-30 12:27:20.937564', 'inbox_count', 0, '', 2, 4),
(44, '2021-09-30 13:22:22.728365', 'hi', 0, '', 2, 4),
(45, '2021-09-30 13:48:54.695296', 'hi', 0, '', 2, 4),
(46, '2021-09-30 18:14:59.266059', 'Hello shankar sir, i am bakiyaraj', 0, '', 2, 6),
(47, '2021-09-30 18:16:49.220762', 'hi', 0, '', 2, 6),
(48, '2021-09-30 18:21:03.445196', 'When 160 characters isn\'t enough, long messages means you can include all the information you need. Your long messages will be concatenated, ensuring that a multi-part message with more than 160 characters is received as a single SMS message', 0, '', 2, 6),
(49, '2021-09-30 18:21:33.189292', 'hello', 0, '', 2, 6),
(50, '2021-10-01 13:33:49.121532', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, '', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `account_company`
--

CREATE TABLE `account_company` (
  `id` bigint NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` longtext NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `started_date` date NOT NULL,
  `logo` varchar(100) NOT NULL,
  `location_id` bigint NOT NULL,
  `owner_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_company`
--

INSERT INTO `account_company` (`id`, `name`, `address`, `mobile_no`, `started_date`, `logo`, `location_id`, `owner_id`) VALUES
(8, 'Vauhini Studios', 'Headquarters: Chennai', '944430598', '1983-05-09', 'Company Logo/download.jpg', 2, 3),
(9, 'S Musics', 'Chennai', '944430598', '2015-02-14', 'Company Logo/download_2.jpg', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `account_conversation`
--

CREATE TABLE `account_conversation` (
  `id` bigint NOT NULL,
  `date` datetime(6) NOT NULL,
  `receiver_id` bigint NOT NULL,
  `sender_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_conversation`
--

INSERT INTO `account_conversation` (`id`, `date`, `receiver_id`, `sender_id`) VALUES
(4, '2021-10-01 13:33:49.119840', 2, 3),
(5, '2021-09-28 20:45:18.735806', 4, 3),
(6, '2021-09-30 18:21:33.187791', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `account_format`
--

CREATE TABLE `account_format` (
  `id` bigint NOT NULL,
  `name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_format`
--

INSERT INTO `account_format` (`id`, `name`) VALUES
(1, 'Originals'),
(2, 'Feature'),
(3, 'Short films'),
(4, 'Web Series'),
(5, 'Documentary'),
(6, 'Television');

-- --------------------------------------------------------

--
-- Table structure for table `account_genre`
--

CREATE TABLE `account_genre` (
  `id` bigint NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_genre`
--

INSERT INTO `account_genre` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Thriller'),
(4, 'Horror'),
(5, 'Romance'),
(6, 'Real-life'),
(7, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `account_highlight`
--

CREATE TABLE `account_highlight` (
  `id` bigint NOT NULL,
  `project_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_highlight`
--

INSERT INTO `account_highlight` (`id`, `project_id`, `user_id`) VALUES
(4, 1, 2),
(5, 1, 3),
(6, 17, 5);

-- --------------------------------------------------------

--
-- Table structure for table `account_language`
--

CREATE TABLE `account_language` (
  `id` bigint NOT NULL,
  `language` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_language`
--

INSERT INTO `account_language` (`id`, `language`) VALUES
(1, 'Tamil'),
(2, 'Malayalam'),
(3, 'Telugu'),
(4, 'Kannada'),
(5, 'Hindi'),
(6, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `account_location`
--

CREATE TABLE `account_location` (
  `id` bigint NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_location`
--

INSERT INTO `account_location` (`id`, `name`) VALUES
(1, 'Coimbatore'),
(2, 'Chennai');

-- --------------------------------------------------------

--
-- Table structure for table `account_open_to`
--

CREATE TABLE `account_open_to` (
  `id` bigint NOT NULL,
  `name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_open_to`
--

INSERT INTO `account_open_to` (`id`, `name`) VALUES
(1, 'Story Writing'),
(2, 'Screen Writing'),
(3, 'Dialogue Writing'),
(4, 'Lyrics Writing'),
(5, 'Story Discussion'),
(6, 'Script Doctoring');

-- --------------------------------------------------------

--
-- Table structure for table `account_project`
--

CREATE TABLE `account_project` (
  `id` bigint NOT NULL,
  `title` varchar(300) NOT NULL,
  `year` int UNSIGNED NOT NULL,
  `budget` double NOT NULL,
  `imdb_link` varchar(200) NOT NULL,
  `created_by_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL,
  `language_id` bigint NOT NULL,
  `description` longtext,
  `image` varchar(100) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_project`
--

INSERT INTO `account_project` (`id`, `title`, `year`, `budget`, `imdb_link`, `created_by_id`, `genre_id`, `language_id`, `description`, `image`, `status`) VALUES
(1, 'Sulthan', 2021, 20000, 'http://127.0.0.1:8000/my_profile/', 2, 1, 1, NULL, 'project_image/sulthan.jpg', NULL),
(17, 'Enthiran', 2012, 76, 'http://writersportal.myboon.org/', 5, 1, 1, NULL, 'project_image/Enthiran_poster.jpg', NULL),
(19, 'Puli Murugan', 2020, 345, 'http://writersportal.myboon.org/', 3, 3, 2, NULL, 'project_image/puli.jpg', NULL),
(20, 'Remo', 2016, 34, 'https://www.imdb.com/title/tt5867800/', 2, 5, 1, NULL, 'project_image/remo.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_qualification`
--

CREATE TABLE `account_qualification` (
  `id` bigint NOT NULL,
  `degree` varchar(100) NOT NULL,
  `institute` varchar(250) NOT NULL,
  `year` int UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_qualification`
--

INSERT INTO `account_qualification` (`id`, `degree`, `institute`, `year`, `user_id`) VALUES
(1, 'Computer Science and Engineering', 'Mcet', 2019, 2),
(2, 'Computer Science and Engineering', 'KIT', 2012, 3),
(3, 'Cinemotography', 'Central Polytechnic College', 1992, 5),
(4, 'BE', 'RKR', 2008, 4);

-- --------------------------------------------------------

--
-- Table structure for table `account_rating`
--

CREATE TABLE `account_rating` (
  `id` bigint NOT NULL,
  `stars` int NOT NULL,
  `rated_by_id` bigint NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_rating`
--

INSERT INTO `account_rating` (`id`, `stars`, `rated_by_id`, `user_id`) VALUES
(2, 5, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `account_report_people`
--

CREATE TABLE `account_report_people` (
  `id` bigint NOT NULL,
  `reported_on` date NOT NULL,
  `complaint` longtext NOT NULL,
  `report_file` varchar(100) NOT NULL,
  `reported_by_id` bigint NOT NULL,
  `reported_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_report_people`
--

INSERT INTO `account_report_people` (`id`, `reported_on`, `complaint`, `report_file`, `reported_by_id`, `reported_user_id`) VALUES
(1, '2021-09-07', 'Hi', '', 3, 2),
(2, '2021-09-07', '', '', 3, 2),
(3, '2021-09-07', '', '', 3, 2),
(4, '2021-09-07', 'Hi', '', 3, 2),
(5, '2021-09-07', 'Hi', '', 3, 2),
(6, '2021-09-07', 'Fraud guy', '', 3, 2),
(7, '2021-09-07', 'Dei manda thalalaiya', '', 3, 2),
(8, '2021-09-07', 'Fraud Guy', 'report file/IMG_20190428_203629_412.jpg', 3, 2),
(9, '2021-09-08', 'Hi', 'report file/41.pdf', 3, 2),
(10, '2021-09-30', 'hai', '', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `account_testimonial`
--

CREATE TABLE `account_testimonial` (
  `id` bigint NOT NULL,
  `title` varchar(300) NOT NULL,
  `text_content` longtext NOT NULL,
  `picture_content` varchar(100) NOT NULL,
  `video_content` varchar(200) NOT NULL,
  `person_id` bigint NOT NULL,
  `project_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_testimonial`
--

INSERT INTO `account_testimonial` (`id`, `title`, `text_content`, `picture_content`, `video_content`, `person_id`, `project_id`, `user_id`) VALUES
(12, 'Sample Testimonial Title', '', '', 'https://www.youtube.com/embed/EOwSRTPEv6w?autoplay=1&mute=1', 2, NULL, 3),
(13, 'hi', '', 'testimonial_picture_content/mqdefault.jpg', '', 4, NULL, 3),
(14, 'Sample Testimonial', 'Sample text content goes her', 'testimonial_picture_content/remo.jpg', '', 3, 20, 4);

-- --------------------------------------------------------

--
-- Table structure for table `account_user`
--

CREATE TABLE `account_user` (
  `id` bigint NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `dob` date DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `profile_photo` varchar(100) DEFAULT NULL,
  `available` varchar(1) DEFAULT NULL,
  `address` longtext,
  `registered_on` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `location_id` bigint DEFAULT NULL,
  `no_of_filims_worked` int UNSIGNED NOT NULL,
  `make_address_visible` varchar(1) DEFAULT NULL,
  `make_mobile_no_visible` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_user`
--

INSERT INTO `account_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `email`, `first_name`, `last_name`, `gender`, `dob`, `mobile_no`, `profile_photo`, `available`, `address`, `registered_on`, `is_active`, `is_staff`, `location_id`, `no_of_filims_worked`, `make_address_visible`, `make_mobile_no_visible`) VALUES
(1, 'pbkdf2_sha256$150000$UiBXam4reIMy$7yjUBMIAWL1d8vs5UW41AakJuiv/tbI5INsa4VBcBfY=', '2021-10-03 06:52:38.440311', 1, 'admin', '', '', '', '', NULL, NULL, '', NULL, NULL, '2021-08-16', 1, 1, NULL, 0, '0', '0'),
(2, 'pbkdf2_sha256$150000$1xoVxqCwbjPB$oI3NU2+A/u09AWSGVGtI6RqswrMngKsawpf4tamfUFo=', '2021-10-03 07:25:03.487177', 0, 'writer@gmail.com', 'writer@gmail.com', 'Bakkiyaraj Kannan', '', 'M', '1981-04-02', '9444305984', 'profile_picture/writer.jpg', NULL, '1/84 a Vadavelli, Chennai, 600021', '2021-08-16', 1, 1, 2, 0, NULL, NULL),
(3, 'pbkdf2_sha256$150000$OWzbOgxQYJ4r$o2IxOfsfk9HWvopmHnt9vKTXuDPv3xc2PLIM22gJswM=', '2021-10-02 11:53:09.901927', 0, 'producer@gmail.com', 'producer@gmail.com', 'Ramesh Pnr', 'Producer', 'M', '2021-08-12', '944430598', 'profile_picture/ramesh.jpg', NULL, 'Coimbatore', '2021-08-16', 1, 1, 1, 0, 'I', 'C'),
(4, 'pbkdf2_sha256$260000$EWsqxApuZiaXYD9OWkKrqj$eShQfCexlJBC+BrIM3oH8S1mDqNkmU6VeX4fq2f6KlE=', NULL, 0, 'kishor@gmail.com', 'kishor@gmail.com', 'Kishor', '', 'M', '2021-06-02', NULL, 'profile_picture/zz.jpg', NULL, 'Coimbatore', '2021-08-16', 1, 0, 1, 0, '0', '0'),
(5, 'pbkdf2_sha256$150000$2DKeXWLSpNbc$1qJ2aYoXlDefi7gKz1ZWNGqZK2oR0Dri3WUGVc6TIII=', '2021-09-29 19:39:09.359699', 0, 'director@gmail.com', 'director@gmail.com', 'Shanmugam Shankar', '', 'M', '1967-06-02', '9444444444', 'profile_picture/download_1.jpg', NULL, 'Chennai', '2021-08-16', 1, 0, 2, 0, '0', '0'),
(6, 'pbkdf2_sha256$150000$A4ajDyhJbxPg$hFpt5y2qZnhpSuj/jUoBN/nIFemykarES01Be718TsI=', NULL, 0, 'madhanumk@gmail.com', 'madhanumk@gmail.com', 'Madhan', 'Umk', '', NULL, NULL, '', NULL, NULL, '2021-09-26', 0, 0, NULL, 0, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `account_userfollowing`
--

CREATE TABLE `account_userfollowing` (
  `id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `following_user_id` bigint NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_userfollowing`
--

INSERT INTO `account_userfollowing` (`id`, `created`, `following_user_id`, `user_id`) VALUES
(73, '2021-09-29 10:29:59.874694', 4, 5),
(79, '2021-09-30 16:13:16.354188', 2, 3),
(99, '2021-09-30 17:16:24.414999', 5, 2),
(100, '2021-10-01 09:37:41.442602', 3, 2),
(101, '2021-10-01 13:56:58.630461', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `account_user_groups`
--

CREATE TABLE `account_user_groups` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_user_groups`
--

INSERT INTO `account_user_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 2, 2),
(8, 3, 1),
(4, 4, 2),
(9, 4, 3),
(6, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `account_user_interested_format`
--

CREATE TABLE `account_user_interested_format` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `format_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_user_interested_format`
--

INSERT INTO `account_user_interested_format` (`id`, `user_id`, `format_id`) VALUES
(7, 2, 1),
(8, 2, 2),
(9, 2, 3),
(1, 2, 4),
(2, 2, 6),
(3, 3, 1),
(4, 3, 2),
(5, 3, 3),
(6, 3, 4),
(11, 4, 1),
(10, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_user_languages_to_work`
--

CREATE TABLE `account_user_languages_to_work` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `language_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_user_languages_to_work`
--

INSERT INTO `account_user_languages_to_work` (`id`, `user_id`, `language_id`) VALUES
(1, 2, 1),
(6, 2, 2),
(15, 2, 3),
(12, 2, 4),
(13, 2, 5),
(14, 2, 6),
(2, 3, 1),
(3, 3, 2),
(4, 3, 3),
(5, 3, 4),
(11, 4, 1),
(7, 5, 1),
(8, 5, 2),
(9, 5, 3),
(10, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `account_user_open_to`
--

CREATE TABLE `account_user_open_to` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `open_to_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_user_open_to`
--

INSERT INTO `account_user_open_to` (`id`, `user_id`, `open_to_id`) VALUES
(1, 2, 1),
(6, 2, 2),
(2, 2, 3),
(7, 2, 4),
(8, 2, 5),
(3, 3, 1),
(4, 3, 2),
(5, 3, 3),
(11, 4, 1),
(9, 5, 1),
(10, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `account_user_specialization_of_genre`
--

CREATE TABLE `account_user_specialization_of_genre` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `account_user_specialization_of_genre`
--

INSERT INTO `account_user_specialization_of_genre` (`id`, `user_id`, `genre_id`) VALUES
(1, 2, 1),
(2, 2, 3),
(3, 3, 1),
(4, 3, 2),
(5, 3, 3),
(6, 3, 4),
(9, 4, 1),
(10, 4, 2),
(7, 5, 1),
(8, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `account_user_user_permissions`
--

CREATE TABLE `account_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'Director'),
(1, 'Producer'),
(2, 'Writer');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add format', 7, 'add_format'),
(26, 'Can change format', 7, 'change_format'),
(27, 'Can delete format', 7, 'delete_format'),
(28, 'Can view format', 7, 'view_format'),
(29, 'Can add genre', 8, 'add_genre'),
(30, 'Can change genre', 8, 'change_genre'),
(31, 'Can delete genre', 8, 'delete_genre'),
(32, 'Can view genre', 8, 'view_genre'),
(33, 'Can add language', 9, 'add_language'),
(34, 'Can change language', 9, 'change_language'),
(35, 'Can delete language', 9, 'delete_language'),
(36, 'Can view language', 9, 'view_language'),
(37, 'Can add location', 10, 'add_location'),
(38, 'Can change location', 10, 'change_location'),
(39, 'Can delete location', 10, 'delete_location'),
(40, 'Can view location', 10, 'view_location'),
(41, 'Can add open_ to', 11, 'add_open_to'),
(42, 'Can change open_ to', 11, 'change_open_to'),
(43, 'Can delete open_ to', 11, 'delete_open_to'),
(44, 'Can view open_ to', 11, 'view_open_to'),
(45, 'Can add project', 12, 'add_project'),
(46, 'Can change project', 12, 'change_project'),
(47, 'Can delete project', 12, 'delete_project'),
(48, 'Can view project', 12, 'view_project'),
(49, 'Can add testimonial', 13, 'add_testimonial'),
(50, 'Can change testimonial', 13, 'change_testimonial'),
(51, 'Can delete testimonial', 13, 'delete_testimonial'),
(52, 'Can view testimonial', 13, 'view_testimonial'),
(53, 'Can add qualification', 14, 'add_qualification'),
(54, 'Can change qualification', 14, 'change_qualification'),
(55, 'Can delete qualification', 14, 'delete_qualification'),
(56, 'Can view qualification', 14, 'view_qualification'),
(57, 'Can add highlight', 15, 'add_highlight'),
(58, 'Can change highlight', 15, 'change_highlight'),
(59, 'Can delete highlight', 15, 'delete_highlight'),
(60, 'Can view highlight', 15, 'view_highlight'),
(61, 'Can add award', 16, 'add_award'),
(62, 'Can change award', 16, 'change_award'),
(63, 'Can delete award', 16, 'delete_award'),
(64, 'Can view award', 16, 'view_award'),
(65, 'Can add assistant', 17, 'add_assistant'),
(66, 'Can change assistant', 17, 'change_assistant'),
(67, 'Can delete assistant', 17, 'delete_assistant'),
(68, 'Can view assistant', 17, 'view_assistant'),
(69, 'Can add call', 18, 'add_call'),
(70, 'Can change call', 18, 'change_call'),
(71, 'Can delete call', 18, 'delete_call'),
(72, 'Can view call', 18, 'view_call'),
(73, 'Can add interest', 19, 'add_interest'),
(74, 'Can change interest', 19, 'change_interest'),
(75, 'Can delete interest', 19, 'delete_interest'),
(76, 'Can view interest', 19, 'view_interest'),
(77, 'Can add pitch', 20, 'add_pitch'),
(78, 'Can change pitch', 20, 'change_pitch'),
(79, 'Can delete pitch', 20, 'delete_pitch'),
(80, 'Can view pitch', 20, 'view_pitch'),
(81, 'Can add post', 21, 'add_post'),
(82, 'Can change post', 21, 'change_post'),
(83, 'Can delete post', 21, 'delete_post'),
(84, 'Can view post', 21, 'view_post'),
(85, 'Can add report', 22, 'add_report'),
(86, 'Can change report', 22, 'change_report'),
(87, 'Can delete report', 22, 'delete_report'),
(88, 'Can view report', 22, 'view_report'),
(89, 'Can add message', 23, 'add_message'),
(90, 'Can change message', 23, 'change_message'),
(91, 'Can delete message', 23, 'delete_message'),
(92, 'Can view message', 23, 'view_message'),
(93, 'Can add like', 24, 'add_like'),
(94, 'Can change like', 24, 'change_like'),
(95, 'Can delete like', 24, 'delete_like'),
(96, 'Can view like', 24, 'view_like'),
(97, 'Can add comment', 25, 'add_comment'),
(98, 'Can change comment', 25, 'change_comment'),
(99, 'Can delete comment', 25, 'delete_comment'),
(100, 'Can view comment', 25, 'view_comment'),
(101, 'Can add user following', 26, 'add_userfollowing'),
(102, 'Can change user following', 26, 'change_userfollowing'),
(103, 'Can delete user following', 26, 'delete_userfollowing'),
(104, 'Can view user following', 26, 'view_userfollowing'),
(105, 'Can add club_ house', 27, 'add_club_house'),
(106, 'Can change club_ house', 27, 'change_club_house'),
(107, 'Can delete club_ house', 27, 'delete_club_house'),
(108, 'Can view club_ house', 27, 'view_club_house'),
(109, 'Can add event_ registration', 28, 'add_event_registration'),
(110, 'Can change event_ registration', 28, 'change_event_registration'),
(111, 'Can delete event_ registration', 28, 'delete_event_registration'),
(112, 'Can view event_ registration', 28, 'view_event_registration'),
(113, 'Can add event', 29, 'add_event'),
(114, 'Can change event', 29, 'change_event'),
(115, 'Can delete event', 29, 'delete_event'),
(116, 'Can view event', 29, 'view_event'),
(117, 'Can add club_ house_ member', 30, 'add_club_house_member'),
(118, 'Can change club_ house_ member', 30, 'change_club_house_member'),
(119, 'Can delete club_ house_ member', 30, 'delete_club_house_member'),
(120, 'Can view club_ house_ member', 30, 'view_club_house_member'),
(121, 'Can add report_ people', 31, 'add_report_people'),
(122, 'Can change report_ people', 31, 'change_report_people'),
(123, 'Can delete report_ people', 31, 'delete_report_people'),
(124, 'Can view report_ people', 31, 'view_report_people'),
(125, 'Can add upvote', 32, 'add_upvote'),
(126, 'Can change upvote', 32, 'change_upvote'),
(127, 'Can delete upvote', 32, 'delete_upvote'),
(128, 'Can view upvote', 32, 'view_upvote'),
(129, 'Can add downvote', 33, 'add_downvote'),
(130, 'Can change downvote', 33, 'change_downvote'),
(131, 'Can delete downvote', 33, 'delete_downvote'),
(132, 'Can view downvote', 33, 'view_downvote'),
(133, 'Can add company', 34, 'add_company'),
(134, 'Can change company', 34, 'change_company'),
(135, 'Can delete company', 34, 'delete_company'),
(136, 'Can view company', 34, 'view_company'),
(137, 'Can add rating', 35, 'add_rating'),
(138, 'Can change rating', 35, 'change_rating'),
(139, 'Can delete rating', 35, 'delete_rating'),
(140, 'Can view rating', 35, 'view_rating'),
(141, 'Can add chat', 36, 'add_chat'),
(142, 'Can change chat', 36, 'change_chat'),
(143, 'Can delete chat', 36, 'delete_chat'),
(144, 'Can view chat', 36, 'view_chat'),
(145, 'Can add conversation', 37, 'add_conversation'),
(146, 'Can change conversation', 37, 'change_conversation'),
(147, 'Can delete conversation', 37, 'delete_conversation'),
(148, 'Can view conversation', 37, 'view_conversation'),
(149, 'Can add blocked_ user', 38, 'add_blocked_user'),
(150, 'Can change blocked_ user', 38, 'change_blocked_user'),
(151, 'Can delete blocked_ user', 38, 'delete_blocked_user'),
(152, 'Can view blocked_ user', 38, 'view_blocked_user');

-- --------------------------------------------------------

--
-- Table structure for table `clubhouse_club_house`
--

CREATE TABLE `clubhouse_club_house` (
  `id` bigint NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_on` date NOT NULL,
  `cover_photo` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `admin_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

-- --------------------------------------------------------

--
-- Table structure for table `clubhouse_club_house_member`
--

CREATE TABLE `clubhouse_club_house_member` (
  `id` bigint NOT NULL,
  `status` varchar(1) NOT NULL,
  `join_date` date NOT NULL,
  `club_house_id` bigint NOT NULL,
  `member_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

-- --------------------------------------------------------

--
-- Table structure for table `clubhouse_event`
--

CREATE TABLE `clubhouse_event` (
  `id` bigint NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `event_date` date NOT NULL,
  `venue` longtext NOT NULL,
  `highlight` longtext NOT NULL,
  `registration_close_date` date NOT NULL,
  `poster_image` varchar(100) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `club_house_id` bigint NOT NULL,
  `location_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

-- --------------------------------------------------------

--
-- Table structure for table `clubhouse_event_registration`
--

CREATE TABLE `clubhouse_event_registration` (
  `id` bigint NOT NULL,
  `status` varchar(1) NOT NULL,
  `registered_on` datetime(6) NOT NULL,
  `event_id` bigint NOT NULL,
  `registered_by_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-08-19 15:08:50.793903', '1', 'Producer', 1, '[{\"added\": {}}]', 3, 1),
(2, '2021-08-19 15:08:58.437249', '2', 'Writer', 1, '[{\"added\": {}}]', 3, 1),
(3, '2021-08-19 15:09:07.189778', '3', 'Director', 1, '[{\"added\": {}}]', 3, 1),
(4, '2021-08-19 15:09:12.265423', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(5, '2021-08-21 14:04:19.305189', '1', 'call for Story Writing', 1, '[{\"added\": {}}]', 18, 1),
(6, '2021-08-23 06:34:14.971185', '17', 'Read my Outline of Story aaa', 3, '', 21, 1),
(7, '2021-08-23 06:34:15.333873', '16', 'Read my Outline of Story aaa', 3, '', 21, 1),
(8, '2021-08-23 06:34:15.427400', '15', 'Read my Outline of Story aaa', 3, '', 21, 1),
(9, '2021-08-23 06:34:15.676380', '14', 'Read my Outline of Story ddd', 3, '', 21, 1),
(10, '2021-08-23 06:34:15.777211', '6', 'Ramesh Pnr\'s Call for Story Writing', 3, '', 21, 1),
(11, '2021-08-23 06:34:15.883116', '5', 'Ramesh Pnr\'s Call for Story Writing', 3, '', 21, 1),
(12, '2021-08-23 06:34:15.960159', '4', 'Ramesh Pnr\'s Call for Story Writing', 3, '', 21, 1),
(13, '2021-08-23 06:34:16.082466', '3', 'Ramesh Pnr\'s Call for Story Writing', 3, '', 21, 1),
(14, '2021-08-23 07:04:49.182762', '1', 'Like object (1)', 1, '[{\"added\": {}}]', 24, 1),
(15, '2021-08-23 09:02:11.617223', '1', 'Comment object (1)', 1, '[{\"added\": {}}]', 25, 1),
(16, '2021-08-23 09:34:32.610793', '4', 'Comment object (4)', 3, '', 25, 1),
(17, '2021-08-23 09:34:32.736418', '3', 'Comment object (3)', 3, '', 25, 1),
(18, '2021-08-23 09:34:33.056790', '2', 'Comment object (2)', 3, '', 25, 1),
(19, '2021-08-23 09:34:33.099401', '1', 'Comment object (1)', 3, '', 25, 1),
(20, '2021-08-23 10:15:36.293090', '1', 'Ramesh Pnr Producer', 1, '[{\"added\": {}}]', 26, 1),
(21, '2021-08-23 11:53:42.935419', '2', 'Madhan Umk', 2, '[{\"changed\": {\"fields\": [\"Dob\", \"Mobile no\", \"Location\", \"Address\", \"Groups\", \"Specialization of genre\", \"Interested format\", \"Open to\", \"Languages to work\"]}}]', 6, 1),
(22, '2021-08-23 12:06:35.968312', '1', 'Madhan Umk', 1, '[{\"added\": {}}]', 26, 1),
(23, '2021-08-23 12:23:57.384488', '5', 'SR Prabhu', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}, {\"added\": {\"name\": \"award\", \"object\": \"Best Producer - 2020\"}}]', 6, 1),
(24, '2021-08-23 12:24:42.005361', '2', 'Madhan Umk', 1, '[{\"added\": {}}]', 26, 1),
(25, '2021-08-23 12:25:21.689012', '3', 'Ramesh Pnr Producer', 2, '[{\"added\": {\"name\": \"assistant\", \"object\": \"Assistant object (2)\"}}]', 6, 1),
(26, '2021-08-23 12:25:25.987496', '2', 'Madhan Umk', 2, '[]', 26, 1),
(27, '2021-08-23 12:26:03.895747', '3', 'Ramesh Pnr Producer', 2, '[{\"added\": {\"name\": \"assistant\", \"object\": \"Assistant object (3)\"}}]', 6, 1),
(28, '2021-08-23 13:15:37.780538', '4', 'Kaithi', 1, '[{\"added\": {}}]', 12, 1),
(29, '2021-08-23 13:16:11.204469', '4', 'Kaithi', 2, '[]', 12, 1),
(30, '2021-08-23 16:18:43.559998', '4', 'Kishor', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(31, '2021-08-23 16:19:07.161274', '4', 'Kishor', 2, '[{\"changed\": {\"fields\": [\"Location\"]}}]', 6, 1),
(32, '2021-08-23 16:27:48.656581', '3', 'Madhan Umk', 1, '[{\"added\": {}}]', 26, 1),
(33, '2021-08-23 17:48:03.116926', '3', 'Ramesh Pnr Producer', 2, '[{\"added\": {\"name\": \"award\", \"object\": \"Best Producer of 2021 - 2021\"}}]', 6, 1),
(34, '2021-08-23 17:56:33.667598', '4', 'Kaithi', 2, '[{\"changed\": {\"fields\": [\"Imdb link\"]}}]', 12, 1),
(35, '2021-08-24 06:26:05.759717', '2', 'Madhan Umk', 2, '[{\"added\": {\"name\": \"highlight\", \"object\": \"Highlight object (1)\"}}]', 6, 1),
(36, '2021-08-24 06:55:46.464890', '2', 'Madhan Umk', 2, '[{\"deleted\": {\"name\": \"highlight\", \"object\": \"Highlight object (None)\"}}]', 6, 1),
(37, '2021-08-24 06:56:44.201717', '2', 'Madhan Umk', 2, '[{\"deleted\": {\"name\": \"highlight\", \"object\": \"Highlight object (None)\"}}]', 6, 1),
(38, '2021-08-24 09:55:39.978648', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(39, '2021-08-24 12:31:12.027058', '6', 'Interest object (6)', 1, '[{\"added\": {}}]', 19, 1),
(40, '2021-08-24 13:44:01.846423', '26', 'Message object (26)', 3, '', 23, 1),
(41, '2021-08-24 13:54:05.573808', '27', 'Message object (27)', 3, '', 23, 1),
(42, '2021-08-24 13:56:02.690503', '7', 'Interest object (7)', 3, '', 19, 1),
(43, '2021-08-25 06:30:09.880492', '5', 'Billa', 1, '[{\"added\": {}}]', 12, 1),
(44, '2021-08-25 06:55:25.210496', '9', 'hi', 3, '', 12, 1),
(45, '2021-08-25 06:55:25.261488', '8', 'Hi 1', 3, '', 12, 1),
(46, '2021-08-25 06:55:25.292829', '7', 'Hi 1', 3, '', 12, 1),
(47, '2021-08-25 06:55:25.330103', '6', 'Hi', 3, '', 12, 1),
(48, '2021-08-25 11:25:30.375984', '2', 'Testimonial object (2)', 3, '', 13, 1),
(49, '2021-08-25 11:25:30.568103', '1', 'Testimonial object (1)', 3, '', 13, 1),
(50, '2021-08-25 21:38:50.384269', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Specialization of genre\", \"Interested format\", \"Open to\", \"Languages to work\"]}}]', 6, 1),
(51, '2021-08-26 09:14:20.474773', '54', 'Message object (54)', 3, '', 23, 1),
(52, '2021-08-26 09:14:20.581551', '53', 'Message object (53)', 3, '', 23, 1),
(53, '2021-08-26 09:14:20.658801', '52', 'Message object (52)', 3, '', 23, 1),
(54, '2021-08-26 09:14:20.708139', '51', 'Message object (51)', 3, '', 23, 1),
(55, '2021-08-26 09:14:20.745742', '50', 'Message object (50)', 3, '', 23, 1),
(56, '2021-08-26 09:14:20.767047', '49', 'Message object (49)', 3, '', 23, 1),
(57, '2021-08-26 09:14:20.790290', '48', 'Message object (48)', 3, '', 23, 1),
(58, '2021-08-26 09:14:20.969727', '47', 'Message object (47)', 3, '', 23, 1),
(59, '2021-08-26 09:14:20.989870', '46', 'Message object (46)', 3, '', 23, 1),
(60, '2021-08-26 09:14:21.036114', '45', 'Message object (45)', 3, '', 23, 1),
(61, '2021-08-26 10:56:32.962502', '13', 'call for Dialogue Writing', 3, '', 18, 1),
(62, '2021-08-26 10:56:33.027242', '12', 'call for Script Doctoring', 3, '', 18, 1),
(63, '2021-08-26 10:56:33.046555', '11', 'call for Lyrics Writing', 3, '', 18, 1),
(64, '2021-08-26 10:56:33.071700', '10', 'call for Story Writing', 3, '', 18, 1),
(65, '2021-08-26 10:56:33.115607', '9', 'call for Story Writing', 3, '', 18, 1),
(66, '2021-08-26 10:56:33.248912', '8', 'call for Story Discussion', 3, '', 18, 1),
(67, '2021-08-26 10:56:33.293757', '7', 'call for Story Writing', 3, '', 18, 1),
(68, '2021-08-26 10:56:33.313820', '6', 'call for Story Writing', 3, '', 18, 1),
(69, '2021-08-26 10:56:33.372240', '5', 'call for Story Writing', 3, '', 18, 1),
(70, '2021-08-26 10:56:33.391245', '4', 'call for Story Writing', 3, '', 18, 1),
(71, '2021-08-26 10:56:33.438579', '3', 'call for Story Writing', 3, '', 18, 1),
(72, '2021-08-26 10:56:33.526904', '2', 'call for Story Writing', 3, '', 18, 1),
(73, '2021-08-26 10:56:33.546943', '1', 'call for Story Writing', 3, '', 18, 1),
(74, '2021-08-26 10:56:45.153973', '10', 'Methagu', 3, '', 20, 1),
(75, '2021-08-26 10:56:45.749737', '9', 'Spider Man', 3, '', 20, 1),
(76, '2021-08-26 10:56:45.873712', '8', 'Sample', 3, '', 20, 1),
(77, '2021-08-26 10:56:45.893913', '7', 'aaa', 3, '', 20, 1),
(78, '2021-08-26 10:56:45.951146', '6', 'aaa', 3, '', 20, 1),
(79, '2021-08-26 10:56:46.038274', '5', 'aaa', 3, '', 20, 1),
(80, '2021-08-26 10:56:46.119600', '4', 'ddd', 3, '', 20, 1),
(81, '2021-08-26 10:56:46.238151', '3', '22 pitch', 3, '', 20, 1),
(82, '2021-08-26 10:56:46.320206', '2', '22 pitch', 3, '', 20, 1),
(83, '2021-08-26 10:56:46.376763', '1', 'new pitch', 3, '', 20, 1),
(84, '2021-08-26 11:16:13.985918', '2', 'Madhan Umk', 2, '[{\"changed\": {\"fields\": [\"Interested format\", \"Open to\", \"Languages to work\"]}}]', 6, 1),
(85, '2021-08-26 17:16:38.965788', '2', 'Madhan Umk', 2, '[{\"changed\": {\"fields\": [\"Superuser status\", \"Is staff\"]}}]', 6, 1),
(86, '2021-08-26 17:16:55.908297', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Superuser status\", \"Is staff\"]}}]', 6, 1),
(87, '2021-08-29 16:44:01.980372', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(88, '2021-08-29 16:49:09.555238', '5', 'SR Prabhu', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(89, '2021-08-29 16:49:25.689970', '5', 'SR Prabhu', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 6, 1),
(90, '2021-08-31 11:11:18.160869', '12', 'Kaviya Thalaivan', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Budget\", \"Pitch to people\"]}}]', 20, 1),
(91, '2021-08-31 11:36:32.453294', '11', 'Methagu', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Budget\", \"Pitch to people\"]}}]', 20, 1),
(92, '2021-08-31 11:36:50.267573', '11', 'Methagu', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 20, 1),
(93, '2021-08-31 11:37:20.575920', '11', 'Methagu', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 20, 1),
(94, '2021-08-31 11:37:42.763164', '11', 'Methagu', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 20, 1),
(95, '2021-08-31 11:37:55.276205', '11', 'Methagu', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 20, 1),
(96, '2021-08-31 11:38:21.437514', '11', 'Methagu', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 20, 1),
(97, '2021-08-31 11:49:57.620494', '11', 'Methagu', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 20, 1),
(98, '2021-08-31 11:50:13.414342', '11', 'Methagu', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 20, 1),
(99, '2021-08-31 12:04:44.153494', '11', 'Methagu', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 20, 1),
(100, '2021-09-07 14:40:34.254915', '1', 'Upvote object (1)', 3, '', 32, 1),
(101, '2021-09-07 14:41:18.485831', '2', 'Upvote object (2)', 3, '', 32, 1),
(102, '2021-09-07 14:43:07.499950', '3', 'Upvote object (3)', 3, '', 32, 1),
(103, '2021-09-07 15:16:40.965834', '4', 'Upvote object (4)', 3, '', 32, 1),
(104, '2021-09-07 15:19:33.714590', '5', 'Upvote object (5)', 3, '', 32, 1),
(105, '2021-09-07 15:29:38.307549', '3', 'Downvote object (3)', 3, '', 33, 1),
(106, '2021-09-07 15:32:27.906622', '8', 'Downvote object (8)', 3, '', 33, 1),
(107, '2021-09-07 15:32:27.989149', '7', 'Downvote object (7)', 3, '', 33, 1),
(108, '2021-09-07 15:32:28.009591', '6', 'Downvote object (6)', 3, '', 33, 1),
(109, '2021-09-07 15:32:28.067114', '5', 'Downvote object (5)', 3, '', 33, 1),
(110, '2021-09-07 16:27:33.547131', '8', 'Report_People object (8)', 2, '[{\"changed\": {\"fields\": [\"Report file\"]}}]', 31, 1),
(111, '2021-09-07 16:31:50.915979', '1', 'Life Liker', 1, '[{\"added\": {}}]', 34, 1),
(112, '2021-09-08 10:46:21.749822', '1', 'GKM', 3, '', 34, 1),
(113, '2021-09-08 14:53:14.877179', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(114, '2021-09-08 14:53:39.752920', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(115, '2021-09-08 16:23:56.936487', '1', 'Rating object (1)', 3, '', 35, 1),
(116, '2021-09-09 09:41:10.569334', '2', 'Chennai', 1, '[{\"added\": {}}]', 10, 1),
(117, '2021-09-09 09:41:59.703667', '2', 'Bakkiyaraj Kannan', 2, '[{\"changed\": {\"fields\": [\"Username\", \"Email address\", \"First name\", \"Dob\", \"Profile photo\", \"Location\", \"Address\"]}}]', 6, 1),
(118, '2021-09-09 09:44:54.168454', '4', 'Sulthan - 2020', 3, '', 16, 1),
(119, '2021-09-09 09:44:54.305558', '3', 'Best Producer of 2021 - 2021', 3, '', 16, 1),
(120, '2021-09-09 09:44:54.372021', '2', 'Best Producer - 2020', 3, '', 16, 1),
(121, '2021-09-09 09:44:54.401543', '1', 'Best Singer - 2021', 3, '', 16, 1),
(122, '2021-09-09 10:22:14.611695', '21', 'Master', 2, '[{\"changed\": {\"fields\": [\"Story title\"]}}]', 20, 1),
(123, '2021-09-09 10:22:48.536497', '21', 'Master', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 20, 1),
(124, '2021-09-09 11:38:38.214488', '24', 'call for Lyrics Writing', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 18, 1),
(125, '2021-09-09 14:28:57.503732', '11', 'Hi', 3, '', 13, 1),
(126, '2021-09-09 14:28:57.616268', '10', 'hi', 3, '', 13, 1),
(127, '2021-09-09 14:28:57.639817', '9', 'ddd', 3, '', 13, 1),
(128, '2021-09-09 14:28:57.660259', '8', 'Testimonial', 3, '', 13, 1),
(129, '2021-09-09 14:28:57.706289', '7', 'Life liker', 3, '', 13, 1),
(130, '2021-09-09 14:28:57.771338', '6', 'hai', 3, '', 13, 1),
(131, '2021-09-09 14:28:57.817564', '5', 'Life liker', 3, '', 13, 1),
(132, '2021-09-09 14:28:58.398499', '4', 'Life liker', 3, '', 13, 1),
(133, '2021-09-09 14:28:58.482967', '3', 'Hi', 3, '', 13, 1),
(134, '2021-09-09 14:41:03.989692', '12', 'Sample Testimonial Title', 2, '[{\"changed\": {\"fields\": [\"Video content\"]}}]', 13, 1),
(135, '2021-09-09 14:41:58.114226', '12', 'Sample Testimonial Title', 2, '[]', 13, 1),
(136, '2021-09-09 14:43:01.479798', '12', 'Sample Testimonial Title', 2, '[{\"changed\": {\"fields\": [\"Video content\"]}}]', 13, 1),
(137, '2021-09-09 14:46:57.493977', '12', 'Sample Testimonial Title', 2, '[{\"changed\": {\"fields\": [\"Video content\"]}}]', 13, 1),
(138, '2021-09-09 14:47:46.000428', '12', 'Sample Testimonial Title', 2, '[{\"changed\": {\"fields\": [\"Text content\", \"Picture content\"]}}]', 13, 1),
(139, '2021-09-09 14:48:31.000113', '12', 'Sample Testimonial Title', 2, '[{\"changed\": {\"fields\": [\"Text content\", \"Picture content\"]}}]', 13, 1),
(140, '2021-09-09 15:47:31.301964', '12', 'Interest object (12)', 3, '', 19, 1),
(141, '2021-09-09 15:47:31.429394', '11', 'Interest object (11)', 3, '', 19, 1),
(142, '2021-09-09 15:47:31.484672', '10', 'Interest object (10)', 3, '', 19, 1),
(143, '2021-09-09 15:47:31.529892', '9', 'Interest object (9)', 3, '', 19, 1),
(144, '2021-09-10 11:02:46.667387', '85', 'Message object (85)', 3, '', 23, 1),
(145, '2021-09-10 11:02:47.498400', '84', 'Message object (84)', 3, '', 23, 1),
(146, '2021-09-10 11:02:47.601470', '83', 'Message object (83)', 3, '', 23, 1),
(147, '2021-09-10 11:02:47.675522', '82', 'Message object (82)', 3, '', 23, 1),
(148, '2021-09-10 11:02:47.774593', '81', 'Message object (81)', 3, '', 23, 1),
(149, '2021-09-10 11:02:47.862082', '80', 'Message object (80)', 3, '', 23, 1),
(150, '2021-09-10 11:02:47.928670', '79', 'Message object (79)', 3, '', 23, 1),
(151, '2021-09-10 11:02:48.028765', '78', 'Message object (78)', 3, '', 23, 1),
(152, '2021-09-10 11:02:48.094494', '77', 'Message object (77)', 3, '', 23, 1),
(153, '2021-09-10 11:02:48.139501', '76', 'Message object (76)', 3, '', 23, 1),
(154, '2021-09-10 11:02:48.205615', '75', 'Message object (75)', 3, '', 23, 1),
(155, '2021-09-10 11:02:48.228222', '74', 'Message object (74)', 3, '', 23, 1),
(156, '2021-09-10 11:02:48.363204', '73', 'Message object (73)', 3, '', 23, 1),
(157, '2021-09-10 11:04:19.722538', '86', 'Message object (86)', 3, '', 23, 1),
(158, '2021-09-10 11:08:25.573157', '87', 'Message object (87)', 3, '', 23, 1),
(159, '2021-09-10 14:57:52.993874', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"profile_photo\"]}}]', 6, 3),
(160, '2021-09-10 15:08:15.162121', '5', 'Shanmugam Shankar', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"gender\", \"dob\", \"mobile_no\", \"profile_photo\", \"location\", \"address\", \"specialization_of_genre\", \"interested_format\", \"open_to\", \"languages_to_work\"]}}]', 6, 1),
(161, '2021-09-10 15:31:31.406824', '4', 'Kishor', 2, '[{\"changed\": {\"fields\": [\"dob\", \"address\", \"specialization_of_genre\", \"interested_format\", \"open_to\", \"languages_to_work\"]}}, {\"added\": {\"name\": \"qualification\", \"object\": \"BE - RKR - 2008\"}}, {\"added\": {\"name\": \"assistant\", \"object\": \"Assistant object (4)\"}}, {\"added\": {\"name\": \"award\", \"object\": \"Behindwoods Awards - 2013\"}}, {\"added\": {\"name\": \"testimonial\", \"object\": \"Sample Testimonial\"}}]', 6, 1),
(162, '2021-09-10 15:32:31.245618', '4', 'Kishor', 2, '[{\"changed\": {\"fields\": [\"groups\"]}}]', 6, 1),
(163, '2021-09-13 11:32:46.489967', '26', 'call for Story Writing', 2, '[{\"changed\": {\"fields\": [\"Expiry date\"]}}]', 18, 1),
(164, '2021-09-13 12:03:42.226876', '2', 'Bakkiyaraj Kannan', 2, '[{\"changed\": {\"fields\": [\"Superuser status\"]}}]', 6, 1),
(165, '2021-09-13 12:03:59.174563', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Superuser status\"]}}]', 6, 1),
(166, '2021-09-13 22:06:09.693750', '26', 'call for Story Writing', 2, '[]', 18, 1),
(167, '2021-09-13 22:13:27.981802', '26', 'call for Story Writing', 2, '[{\"changed\": {\"fields\": [\"Expiry date\"]}}]', 18, 1),
(168, '2021-09-13 22:13:50.705907', '26', 'call for Story Writing', 2, '[{\"changed\": {\"fields\": [\"Expiry date\"]}}]', 18, 1),
(169, '2021-09-13 22:13:53.740916', '77', 'Ramesh Pnr\'s Call for Story Writing', 2, '[]', 21, 1),
(170, '2021-09-13 22:15:44.205155', '26', 'call for Story Writing', 2, '[{\"changed\": {\"fields\": [\"Expiry date\"]}}]', 18, 1),
(171, '2021-09-13 22:17:07.600336', '26', 'call for Story Writing', 2, '[{\"changed\": {\"fields\": [\"Expiry date\"]}}]', 18, 1),
(172, '2021-09-13 22:17:09.153834', '77', 'Ramesh Pnr\'s Call for Story Writing', 2, '[]', 21, 1),
(173, '2021-09-13 22:18:08.609079', '26', 'call for Story Writing', 2, '[]', 18, 1),
(174, '2021-09-13 22:53:01.587297', '28', 'hi', 3, '', 20, 1),
(175, '2021-09-13 22:53:01.651382', '27', 'jio 1', 3, '', 20, 1),
(176, '2021-09-13 22:53:01.675465', '26', 'hai', 3, '', 20, 1),
(177, '2021-09-13 22:53:01.699528', '25', 'Anniyan 2', 3, '', 20, 1),
(178, '2021-09-13 22:53:01.731630', '24', 'Anniyan', 3, '', 20, 1),
(179, '2021-09-13 22:53:01.802828', '23', 'anniyan', 3, '', 20, 1),
(180, '2021-09-14 14:38:24.794183', '26', 'call for Story Writing', 2, '[{\"changed\": {\"fields\": [\"Expiry date\"]}}]', 18, 1),
(181, '2021-09-14 15:48:26.082021', '1', 'Conversation object (1)', 1, '[{\"added\": {}}]', 37, 1),
(182, '2021-09-14 15:50:36.760321', '1', 'Chat object (1)', 1, '[{\"added\": {}}]', 36, 1),
(183, '2021-09-14 16:28:09.466137', '2', 'Conversation object (2)', 3, '', 37, 1),
(184, '2021-09-14 16:29:10.143837', '3', 'Conversation object (3)', 3, '', 37, 1),
(185, '2021-09-14 16:33:39.880116', '1', 'Conversation object (1)', 3, '', 37, 1),
(186, '2021-09-14 23:06:27.931185', '78', 'Read my Outline of Story New story', 3, '', 21, 1),
(187, '2021-09-14 23:06:28.023378', '77', 'Ramesh Pnr\'s Call for Story Writing', 3, '', 21, 1),
(188, '2021-09-17 11:13:55.965691', '18', 'Interest object (18)', 3, '', 19, 1),
(189, '2021-09-17 11:15:24.366910', '19', 'Interest object (19)', 3, '', 19, 1),
(190, '2021-09-17 11:16:03.763286', '20', 'Interest object (20)', 3, '', 19, 1),
(191, '2021-09-17 11:16:56.352423', '21', 'Interest object (21)', 3, '', 19, 1),
(192, '2021-09-17 11:17:46.061157', '22', 'Interest object (22)', 3, '', 19, 1),
(193, '2021-09-17 11:22:52.427893', '23', 'Interest object (23)', 3, '', 19, 1),
(194, '2021-09-17 11:29:19.020703', '24', 'Interest object (24)', 3, '', 19, 1),
(195, '2021-09-21 09:56:18.319307', '27', 'kaithi 5', 3, '', 20, 1),
(196, '2021-09-21 09:56:18.395817', '26', 'Kaithi 3', 3, '', 20, 1),
(197, '2021-09-21 09:56:18.491133', '25', 'kaithi 2', 3, '', 20, 1),
(198, '2021-09-21 09:56:18.591217', '24', 'Kaithi', 3, '', 20, 1),
(199, '2021-09-21 09:56:18.734380', '23', 'New story', 3, '', 20, 1),
(200, '2021-09-21 09:56:33.110689', '28', 'call for Script Doctoring', 3, '', 18, 1),
(201, '2021-09-21 09:56:33.201858', '27', 'call for Story Writing', 3, '', 18, 1),
(202, '2021-09-21 09:56:33.256716', '26', 'call for Story Writing', 3, '', 18, 1),
(203, '2021-09-30 15:34:17.177358', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Make mobile no visible\", \"Make address visible\"]}}]', 6, 1),
(204, '2021-09-30 15:45:19.538057', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Make mobile no visible\"]}}]', 6, 1),
(205, '2021-09-30 15:46:07.743683', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Make address visible\"]}}]', 6, 1),
(206, '2021-09-30 15:55:16.906415', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Make mobile no visible\"]}}]', 6, 1),
(207, '2021-09-30 15:56:52.536229', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Make mobile no visible\"]}}]', 6, 1),
(208, '2021-09-30 16:09:54.000586', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Make address visible\"]}}]', 6, 1),
(209, '2021-09-30 16:10:10.770794', '3', 'Ramesh Pnr Producer', 2, '[{\"changed\": {\"fields\": [\"Make address visible\"]}}]', 6, 1),
(210, '2021-10-03 06:57:45.596211', '2', 'Bakkiyaraj Kannan', 2, '[{\"changed\": {\"fields\": [\"mobile_no\", \"make_mobile_no_visible\", \"make_address_visible\"]}}]', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(17, 'account', 'assistant'),
(16, 'account', 'award'),
(38, 'account', 'blocked_user'),
(36, 'account', 'chat'),
(34, 'account', 'company'),
(37, 'account', 'conversation'),
(7, 'account', 'format'),
(8, 'account', 'genre'),
(15, 'account', 'highlight'),
(9, 'account', 'language'),
(10, 'account', 'location'),
(11, 'account', 'open_to'),
(12, 'account', 'project'),
(14, 'account', 'qualification'),
(35, 'account', 'rating'),
(31, 'account', 'report_people'),
(13, 'account', 'testimonial'),
(6, 'account', 'user'),
(26, 'account', 'userfollowing'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(27, 'clubhouse', 'club_house'),
(30, 'clubhouse', 'club_house_member'),
(29, 'clubhouse', 'event'),
(28, 'clubhouse', 'event_registration'),
(4, 'contenttypes', 'contenttype'),
(18, 'project', 'call'),
(25, 'project', 'comment'),
(33, 'project', 'downvote'),
(19, 'project', 'interest'),
(24, 'project', 'like'),
(23, 'project', 'message'),
(20, 'project', 'pitch'),
(21, 'project', 'post'),
(22, 'project', 'report'),
(32, 'project', 'upvote'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-08-19 14:01:37.454881'),
(2, 'contenttypes', '0002_remove_content_type_name', '2021-08-19 14:01:39.537798'),
(3, 'auth', '0001_initial', '2021-08-19 14:01:52.911949'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-08-19 14:01:56.256245'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-08-19 14:01:56.491325'),
(6, 'auth', '0004_alter_user_username_opts', '2021-08-19 14:01:56.604123'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-08-19 14:01:56.709710'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-08-19 14:01:56.830840'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-08-19 14:01:56.950845'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-08-19 14:01:57.222872'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2021-08-19 14:01:57.310871'),
(12, 'auth', '0010_alter_group_name_max_length', '2021-08-19 14:01:59.027876'),
(13, 'auth', '0011_update_proxy_permissions', '2021-08-19 14:01:59.101184'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2021-08-19 14:01:59.205787'),
(15, 'account', '0001_initial', '2021-08-19 14:02:54.960512'),
(16, 'admin', '0001_initial', '2021-08-19 14:03:00.917367'),
(17, 'admin', '0002_logentry_remove_auto_add', '2021-08-19 14:03:00.993229'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2021-08-19 14:03:01.105245'),
(19, 'project', '0001_initial', '2021-08-19 14:03:45.780615'),
(20, 'sessions', '0001_initial', '2021-08-19 14:03:48.688681'),
(21, 'project', '0002_auto_20210821_1400', '2021-08-21 14:00:46.778923'),
(22, 'account', '0002_userfollowing', '2021-08-23 06:19:48.715036'),
(23, 'account', '0003_auto_20210823_1101', '2021-08-23 11:03:10.536091'),
(24, 'account', '0004_userfollowing', '2021-08-23 11:03:15.091658'),
(25, 'project', '0003_auto_20210824_1525', '2021-08-24 15:25:38.056670'),
(26, 'project', '0004_message_m_file', '2021-08-24 17:59:03.569363'),
(27, 'account', '0005_auto_20210825_0945', '2021-08-25 09:45:29.446433'),
(28, 'account', '0006_remove_testimonial_designation', '2021-08-25 11:40:55.199732'),
(29, 'account', '0007_auto_20210827_1520', '2021-08-27 15:20:39.465704'),
(30, 'project', '0005_auto_20210827_1520', '2021-08-27 15:20:46.150547'),
(31, 'project', '0006_auto_20210829_1520', '2021-08-29 15:20:13.403828'),
(32, 'account', '0008_rename_following_user_id_userfollowing_following_user', '2021-09-01 10:06:58.056784'),
(33, 'account', '0009_alter_project_options', '2021-09-04 11:26:08.132415'),
(34, 'clubhouse', '0001_initial', '2021-09-04 11:26:19.773260'),
(35, 'account', '0010_report_people', '2021-09-07 10:40:24.150607'),
(36, 'account', '0011_auto_20210907_1126', '2021-09-07 11:26:32.275004'),
(37, 'project', '0007_downvote_upvote', '2021-09-07 13:53:47.265050'),
(38, 'account', '0012_auto_20210907_1630', '2021-09-07 16:30:49.015697'),
(39, 'account', '0013_auto_20210908_0942', '2021-09-08 09:42:52.018986'),
(40, 'account', '0014_rename_established_year_company_started_year', '2021-09-08 09:45:00.723087'),
(41, 'account', '0015_alter_company_started_year', '2021-09-08 09:48:14.088279'),
(42, 'account', '0016_company_logo', '2021-09-08 09:59:37.536697'),
(43, 'account', '0017_delete_company', '2021-09-08 10:07:47.297830'),
(44, 'account', '0018_company', '2021-09-08 10:08:28.479892'),
(45, 'account', '0019_rename_started_year_company_started_date', '2021-09-08 10:32:57.110863'),
(46, 'account', '0020_rating', '2021-09-08 15:21:55.467452'),
(47, 'account', '0021_alter_testimonial_project', '2021-09-09 13:45:45.197117'),
(48, 'project', '0008_message_message_to', '2021-09-09 15:13:53.855452'),
(49, 'project', '0009_alter_message_interest', '2021-09-09 15:15:10.806580'),
(50, 'project', '0010_auto_20210913_1032', '2021-09-13 10:48:17.936737'),
(51, 'project', '0011_call_expiry_date', '2021-09-13 10:49:35.523110'),
(52, 'account', '0022_user_no_of_filims_worked', '2021-09-13 16:12:38.250858'),
(53, 'account', '0023_alter_user_no_of_filims_worked', '2021-09-13 16:16:00.102391'),
(54, 'project', '0012_alter_post_date', '2021-09-13 16:31:09.546461'),
(55, 'account', '0024_project_status', '2021-09-13 16:36:51.698195'),
(56, 'project', '0013_alter_message_date', '2021-09-14 09:23:56.657379'),
(57, 'account', '0025_chat_conversation', '2021-09-14 15:23:45.215777'),
(58, 'account', '0026_chat_conversation', '2021-09-14 15:50:05.902889'),
(59, 'project', '0014_auto_20210920_1337', '2021-09-20 13:37:54.276535'),
(60, 'project', '0015_alter_pitch_pitch_to_people', '2021-09-20 14:48:37.564290'),
(61, 'project', '0016_auto_20210920_1542', '2021-09-20 15:42:43.460396'),
(62, 'account', '0027_auto_20210921_0907', '2021-09-21 09:07:35.003741'),
(63, 'project', '0017_alter_call_format', '2021-09-21 09:07:35.160772'),
(64, 'account', '0028_alter_user_make_mobile_no_visible', '2021-09-30 09:44:46.033980'),
(65, 'project', '0018_alter_pitch_story_file', '2021-09-30 09:44:46.491396'),
(66, 'project', '0019_alter_message_date', '2021-09-30 11:54:24.546876'),
(67, 'account', '0029_blocked_user', '2021-09-30 13:27:50.078899'),
(68, 'account', '0030_auto_20210930_1527', '2021-09-30 15:27:42.509984');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('096nkwm902a5elc6arjkl3szia295pyc', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mJ6J2:GyOsFrBFdlkldgH59qHklWpS8JS5wUsexoDCTJKWS8k', '2021-09-09 09:13:56.199358'),
('0wojwh69x14zrzaknne9ahw9mvg96a66', 'ZjNmMDllMTExMjhiNGJlYWU5Y2Y0ZGJlYjdjM2E0N2YzNTEwZmMyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGQwZmNhYzJlZTQyMmE1NzA0NWIwZWY2ZTk0YTRlMjFlMTg0MTZhMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-10-06 15:14:38.269069'),
('1ao0ewirzaou1gw02vv4suibb74qzc8f', '.eJxVjDsOwjAQBe_iGlmY9ZeSPmeI1t41DiBbipMKcXdkKQW0b2beW8y4b2XeO6_zQuIqQJx-t4jpyXUAemC9N5la3dYlyqHIg3Y5NeLX7XD_Dgr2MmodTHCQXAQTrb8E4ByzCpg1QSD2lL1PEZUxyVlLjgE5Kz5bbb0GKz5f8lM4Lg:1mLH2t:udpmxs4zRpb2q-oUPjdqSrYeithweSkdgt-DyxhNzsc', '2021-09-15 09:06:15.206039'),
('2cyri6k31byd7yah7nvr203ikopimk58', 'MGVhY2EwODA1NGFhNTY1MzFmNWZlMjIwY2Y1YTllZTQ2OTlkOGFiYTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9oYXNoIjoiZmJmYzllOGZlZTM4OWI1ZmY1M2QxNmQ0M2Q1ZGNlNzc3ODMwMzFlZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-09-25 09:41:33.335681'),
('31ez3o8uk7w25cwxwyn207zmb2hbqjff', 'Y2MzZGI0M2NhYTgzY2M4M2NhOTNlMTU3YjI0NjFkZTJlN2U1ZjdkMTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYmZjOWU4ZmVlMzg5YjVmZjUzZDE2ZDQzZDVkY2U3Nzc4MzAzMWVkIn0=', '2021-09-25 13:25:44.613802'),
('34izt1pjfrbv4wkcb5yjpd2xoo2jbz03', 'MTM0MGM4MzU2ZWNkNzFiZTAxMzNiZjZhODJmMTMyYmEwOWNjYmFmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA4N2U3MDFkMTYwNjg0ZTE3MDE5MjQ4NjcyNjQ2NDM1MjAyNmVjNDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=', '2021-10-15 15:33:09.425263'),
('36bykjz9cr0rrpcfdcq80ien2mdfn15e', 'NzQxMjQyNGYwZDNiYzljNGJhNGE0YzA2NmRmNzU3NmUzZDFhNDg2Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiI4ZDBmY2FjMmVlNDIyYTU3MDQ1YjBlZjZlOTRhNGUyMWUxODQxNmEzIn0=', '2021-10-12 10:51:28.274652'),
('3xr3aige7541cydvflgx6aocu7rng558', 'MDk4NTRiMzFkY2QyMzE3YjhiOGY0YzdhMDlhMmNiNGU1ZDVhNDFlMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2hhc2giOiIyNDYxOWI1MGNiYTc5OGYzZjk2NWY3NThlZTBmOTAwZDlmOTljYTQwIn0=', '2021-10-05 11:04:45.865853'),
('4frxw5i1rhumbanlf2jtfizuwajksn5d', 'OTFiYjhjMmUwZmU2YWM3ODhkMmQ4OTJlMDhiZTY0OGQ1YmRmYmI0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY4NGM2ZjhlYzM3MGJkMzE1Yzc3ZDBmODQxMDY4Njk0YzRhZmZiYzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2021-09-28 23:25:15.089870'),
('4hi990ccjwr7h64frx82iph3pa7z7yat', 'OWY0NzY0NjVmMmVjMzdmNGZkOTY2OGRlZmM2YjI1OTUzOGQyMTQ4Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjY4NGM2ZjhlYzM3MGJkMzE1Yzc3ZDBmODQxMDY4Njk0YzRhZmZiYzIiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-09-29 12:45:42.640178'),
('4vv93elygt4ax2znyd42gg4y3wtf68ks', '.eJxVjDsOwjAQBe_iGlmOP7sOJT1nsHazNgmgWIqTCnF3iJQC2jcz76USbeuYtpaXNIk6q6BOvxvT8MjzDuRO863qoc7rMrHeFX3Qpq9V8vNyuH8HI7XxWw_Su94Ie0Zk11lLJVqAWBA6F6VkKBZFojHGMgAHDOSxC-jFBjSg3h_YZTbx:1mPzXN:0ycjY-L0ERsmdwIxL2W9e_GdjCBTcHLXIHzCvtjCQlw', '2021-09-28 09:25:13.004350'),
('5rzsty69ij13y9j710qbt6a72pcxeeqg', '.eJxVjDsOwjAQBe_iGlk46y8lPWeI1t41DiBbipMKcXdkKQW0b2beW8y4b2XeO6_zQuIiJnH63SKmJ9cB6IH13mRqdVuXKIciD9rlrRG_rof7d1Cwl1HrYIKD5CKYaP0UgHPMKmDWBIHYU_Y-RVTGJGctOQbkrPhstfUarPh8AfG6OC0:1mI1uS:KCEp-PW5-_T8UDQbRtD5JZ8L-Hna84OsC6sFS-TBQn0', '2021-09-06 10:20:08.032007'),
('6csj6b7ojj7manh8q5lbwydwzvve13m2', 'M2MwOWU3N2ViZWVkYzI5YjE2ZDZkZDZhNzE3YzRjNGIzZTA5N2Q2Yzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0Nzk0MTZiYjBjYjRmMWQzNzQxYTNhY2I4YjM5N2UzMzIyYWEzZGVmIn0=', '2021-10-15 14:06:22.651194'),
('6frq6xrqc36zgvzfjv5u7g89px0we1cs', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mIlru:deMVUuTmLhd0Oj9sUUTQARbpknH03ZBChDdy9QRt7wo', '2021-09-08 11:24:34.626832'),
('6hqy8jo060rdbqm4z5q901hzgi7g1zqg', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFFaffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X84U4MA:1mKuvu:h5216e1ihJAxmTG-0y7R2YHGBDfrPV64oWiP9T8tjGE', '2021-09-14 09:29:34.554046'),
('7j9r4om50armgz79cb2ik233kygz0opq', 'MGI0NWE5YjI4NTljNmZiZWFlNDUyNjdjNDI3ODQwOTM5OGZmNDE3NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUiLCJfYXV0aF91c2VyX2hhc2giOiIyNGZiZGU2NjQwMTE2YTEzODY5YTY0ZmUyODhkZjVkNjI4MjlkNDZhIn0=', '2021-10-12 13:05:57.555134'),
('7nc8uq8caujfa4vad738422pc2y5uqt6', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mKIkd:fZQEN4HhUfSZoVFQqw2PqrwkHnMQ7TmmZS-qzNsmn9s', '2021-09-12 16:43:23.718789'),
('7tr27k78wpfqvtl3iptv7lt6w0e831i2', 'YWY2NzdiYjYzZjQwZWRmM2I4NjI0N2YxYWUzYmY1NTQwNWE3M2Y0Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2hhc2giOiIwNDFlZWI2NWI1OTQ3NmE1ZWFmYjc3ZjYxZDIxNDljOGVkOTE0NmM2In0=', '2021-09-30 09:47:36.063433'),
('7vjjkiawojy0z2bh2ufk0erjd1o6hnnm', 'NWY2ODEwNWVkM2VhMmQyNjY3MGU4ZGYyOTgwYWQ4MTU5YTk3ODdmNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDg3ZTcwMWQxNjA2ODRlMTcwMTkyNDg2NzI2NDY0MzUyMDI2ZWM0NiIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=', '2021-10-15 13:07:21.365932'),
('8u5c4fl45qpy65x9zu2zgf16c3cyexki', '.eJxVjDsOwjAQBe_iGlmY9ZeSPmeI1t41DiBbipMKcXdkKQW0b2beW8y4b2XeO6_zQuIqQJx-t4jpyXUAemC9N5la3dYlyqHIg3Y5NeLX7XD_Dgr2MmodTHCQXAQTrb8E4ByzCpg1QSD2lL1PEZUxyVlLjgE5Kz5bbb0GKz5f8lM4Lg:1mGeZN:UEBPbuPWHL-f63Gyjo7KX6ZHq-n8rCuDSw5VSUrF1QM', '2021-09-02 15:12:41.689897'),
('8vniduc4jcp3mkautua3r9sl3cvjapio', 'NzBkM2YwMTMzZjVkMDA0OTkxNzQxODJhOTYyNmM0MGIwZWFhNTNhMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiIyZDUwNDYwYzlmZmQ2YmQ2NGQ0ODY4YTgzYTdiYzlkYmYxNWFhYjE5In0=', '2021-10-14 19:16:15.698748'),
('8w6qkckscbgr84h50khfrou6cb0jgi1r', 'NDg1OTA0ZGU3YTMyYzlkMTc3YTU5MmMyM2I5NjVlMWMxZmNjNjcyZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI0NjE5YjUwY2JhNzk4ZjNmOTY1Zjc1OGVlMGY5MDBkOWY5OWNhNDAiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-10-09 20:22:06.631285'),
('983tg37hqe8hb9zknl8rt44s69efoahc', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mOYze:2uo4IHZ7Hl3f8gOWV1xngZcp9O8C2GuSxPFyOi2iJ98', '2021-09-24 10:52:30.003606'),
('9fxdgree5smt5ysjfbgd1g46vynpuom9', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mIQQK:CwSyygNAFAKQu8UOoV_XdrMJxY2bJ_b2MM6TDN39CrU', '2021-09-07 12:30:40.357414'),
('9iimywzktps1t9gix1ya50nrg2gogckh', 'ZjNmMDllMTExMjhiNGJlYWU5Y2Y0ZGJlYjdjM2E0N2YzNTEwZmMyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGQwZmNhYzJlZTQyMmE1NzA0NWIwZWY2ZTk0YTRlMjFlMTg0MTZhMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-10-09 08:07:34.471024'),
('9tn2yfoh6m8it5cjqd6nyhdbe0m73v3i', '.eJxVjEEOwiAQRe_C2hCgyIBL9z0DmWGmUjVtUtqV8e7apAvd_vfef6mM21rz1mTJI6uLcur0uxGWh0w74DtOt1mXeVqXkfSu6IM23c8sz-vh_h1UbPVbk4fAHEqkzpD1yUaMAxT0AGhDjALAMRCIIS5pSJa6YtBJCHAW55N6fwDpCzft:1mVnSC:hHkKcY95QG3X42YjMDlhi9NBa9dEzLNB66k4R8xIkEQ', '2021-10-14 09:43:52.495990'),
('9uay2wszh5ymhaud66z6zwib08c77ned', 'MGVhY2EwODA1NGFhNTY1MzFmNWZlMjIwY2Y1YTllZTQ2OTlkOGFiYTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9oYXNoIjoiZmJmYzllOGZlZTM4OWI1ZmY1M2QxNmQ0M2Q1ZGNlNzc3ODMwMzFlZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-09-27 09:06:19.149554'),
('a9qc564lcbvpymiee8e45l50w9emjn8k', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mGeVK:36tLkQkKorOrN8UDoql2UwdMT6u_O_xUDxjGfpqEmzo', '2021-09-02 15:08:30.671102'),
('ac9be1ds80ubymb1zhds3k50zehgqrde', '.eJxVjDsOwjAQBe_iGlmY9ZeSPmeI1t41DiBbipMKcXdkKQW0b2beW8y4b2XeO6_zQuIqQJx-t4jpyXUAemC9N5la3dYlyqHIg3Y5NeLX7XD_Dgr2MmodTHCQXAQTrb8E4ByzCpg1QSD2lL1PEZUxyVlLjgE5Kz5bbb0GKz5f8lM4Lg:1mJDqk:LzYPo_Gi8qtfzhCfzTATq9Af5tVV7FW4t70SIJ1AsXM', '2021-09-09 17:17:14.981285'),
('acfvf35g4qaaccxp0t1pkxcheytblcpj', '.eJxVjMsOwiAQRf-FtSHTUmBw6d5vIAwz2KqBpI-V8d-1SRe6veec-1IxbesYt0XmOLE6K6NOvxul_JC6A76nems6t7rOE-ld0Qdd9LWxPC-H-3cwpmX81q4UDMCDHSQhgHhDhSixY5cRgoXBBQ_UZd-jAPc9dJ4JEL0xFq2o9wfkNjdK:1mRUQg:5fSYmp-0Rwqu6Xj_ZQLjzIIxhGwWUPUm6H_V921X9Fw', '2021-10-02 12:36:30.089660'),
('ag188f16wikydfsw2tq2iqp0jlzi1m1h', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mOFI6:UvDlnfbxzoYErGAXURsgKhGEQZ9WEx9FFpqSN_rouxk', '2021-09-23 13:50:14.067026'),
('akz1yh0i9o2dgrdo5e4czqp4yuygq1p6', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mLO3X:C2InQ4EnVcYhjHYcTyJx8jYXdbH3T5nqe5dLk-Cm8EM', '2021-09-15 16:35:23.111132'),
('awpq37rsfgso3yvp4eehba9xkm50b5qt', 'ODAyZjczNTQ0YjZjMjBhNTE5MmNkNzI2ODY5MWZlMTc3MDUxNTA2ZDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNDYxOWI1MGNiYTc5OGYzZjk2NWY3NThlZTBmOTAwZDlmOTljYTQwIn0=', '2021-10-05 16:04:15.749505'),
('b2j0x54ifnoev7t5jhgnfdj18umsd51y', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mOBLc:h0mAJUa0slNVbH-IvdSVg-dP4bLpRm9yWRY7ObT2YNI', '2021-09-23 09:37:36.348127'),
('bojlwlqivjmugo4t9awkkny2vczsnmv5', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mIvRn:DoNf2DLV-MX2J3cWuLui9M7cTmeYf0SSdcVuiXd1EV4', '2021-09-08 21:38:15.842594'),
('c7em8voibt32ob80l1z4xjqd4t2zfpb4', '.eJxVjDsOwjAQBe_iGlmY9ZeSPmeI1t41DiBbipMKcXdkKQW0b2beW8y4b2XeO6_zQuIqQJx-t4jpyXUAemC9N5la3dYlyqHIg3Y5NeLX7XD_Dgr2MmodTHCQXAQTrb8E4ByzCpg1QSD2lL1PEZUxyVlLjgE5Kz5bbb0GKz5f8lM4Lg:1mKuus:AtWcc6TWRB7hsmBTnWvGnxLBhyZ1xKeLq5Vw2WkYvHk', '2021-09-14 09:28:30.452143'),
('ccd3irqkyrq844osryhofnh9cf8d05st', '.eJxVjDsOwjAQBe_iGln-26Gk5wzW2rtLAsiW8qkQd4dIKaB9M_NeIsO2jnlbaM4TirPQ4vS7FagPajvAO7Rbl7W3dZ6K3BV50EVeO9Lzcrh_ByMs47euZBUb44bCCVApVpZNRG05OK81W0AolEy0nikR8EDR1xocxhKU8-L9AfTBOF8:1mPf2C:7o2XJ8tdy1abW3F4UDa4WbDD5v1F03qgRumQEVuFe9I', '2021-09-27 11:31:40.139574'),
('d6f541w5uf57wb09126m16d7uf9x1rm3', '.eJxVjDsOwjAQBe_iGlmY9ZeSPmeI1t41DiBbipMKcXdkKQW0b2beW8y4b2XeO6_zQuIqQJx-t4jpyXUAemC9N5la3dYlyqHIg3Y5NeLX7XD_Dgr2MmodTHCQXAQTrb8E4ByzCpg1QSD2lL1PEZUxyVlLjgE5Kz5bbb0GKz5f8lM4Lg:1mKFqI:p0eFuSgLydJKvbVYdBXUgfKUR-kBDUv3yWxsHMSN42Q', '2021-09-12 13:37:02.133399'),
('dy8lldnevepw6wrpkkzigdo4l5hw2vwz', '.eJxVjMsOwiAQRf-FtSHTUmBw6d5vIAwz2KqBpI-V8d-1SRe6veec-1IxbesYt0XmOLE6K6NOvxul_JC6A76nems6t7rOE-ld0Qdd9LWxPC-H-3cwpmX81q4UDMCDHSQhgHhDhSixY5cRgoXBBQ_UZd-jAPc9dJ4JEL0xFq2o9wfkNjdK:1mR5x5:sVDg-l5PXRGfYkxKLNu692b0UEdjtvaZXPc-1pBD7BU', '2021-10-01 10:28:19.248509'),
('e0u57b2obil1oswhygemg5rz2tqkpnr3', 'OWYzNjljMmM0OTM0N2IwNThiYjg1ZmUxOWNmMGZlYjIwODc1NzJhMjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwODdlNzAxZDE2MDY4NGUxNzAxOTI0ODY3MjY0NjQzNTIwMjZlYzQ2In0=', '2021-10-15 13:07:21.375564'),
('e1g8aedw9ysm80amdryp9sh6dovk6ijy', 'MGVmODM4NWY0NWJjNzk3MzZmOTdkNjhmZTQwMTk2ZTg3ODFkZmViMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI0ZmJkZTY2NDAxMTZhMTM4NjlhNjRmZTI4OGRmNWQ2MjgyOWQ0NmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=', '2021-10-13 19:39:09.363288'),
('f0thag3zh4d1c1fc78feymwwu362m2c7', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mKwVj:eayVxe8AziREeWSfkV3THCR6g-DheJh4R3-gCrgFz6k', '2021-09-14 11:10:39.530967'),
('f0zui90rsnxc5auu4czwezqa31uzy3lr', 'NWY2ODEwNWVkM2VhMmQyNjY3MGU4ZGYyOTgwYWQ4MTU5YTk3ODdmNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDg3ZTcwMWQxNjA2ODRlMTcwMTkyNDg2NzI2NDY0MzUyMDI2ZWM0NiIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=', '2021-10-16 00:46:30.454627'),
('g6bt6c4g9u71wdx4v8gcb8b3ic3z73le', 'ZDdkMDAzZjY0NGFiNzMwMGExMmQ5YjBlNThiNDg0ZGIyZWYyMmJjNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDc5NDE2YmIwY2I0ZjFkMzc0MWEzYWNiOGIzOTdlMzMyMmFhM2RlZiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-10-15 11:40:55.609908'),
('gkcp5wgqv3ta2ccrip5ed0804urr7phr', '.eJxVjDsOwjAQBe_iGlmY9ZeSPmeI1t41DiBbipMKcXdkKQW0b2beW8y4b2XeO6_zQuIqQJx-t4jpyXUAemC9N5la3dYlyqHIg3Y5NeLX7XD_Dgr2MmodTHCQXAQTrb8E4ByzCpg1QSD2lL1PEZUxyVlLjgE5Kz5bbb0GKz5f8lM4Lg:1mKFsi:hfpsc5qYyZy1oHVJozHptjrZ_fSjwARAMU5ZwH09Gvg', '2021-09-12 13:39:32.903384'),
('gl9pz4bguwfmwqnq891qc7ansj8o0xi8', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFFaffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X84U4MA:1mKIqt:Dwi4wjvXSaHqZZopVWeMNSMF3bXWwxYRsHJ_tGWGmtE', '2021-09-12 16:49:51.223493'),
('gp2ur0a8qam6lxy9jjl67wgcr6ps1988', 'M2UwNzczZjQwNWVlNWMxNzNjYmIwYmU1YjNkMWQ3YjhjMmI2YmU1MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmQ1MDQ2MGM5ZmZkNmJkNjRkNDg2OGE4M2E3YmM5ZGJmMTVhYWIxOSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2021-10-14 19:16:17.938491'),
('guay2byxasoixyk2br5qc5w858eknr9o', '.eJxVjDsOwjAQBe_iGlmOP7sOJT1nsHazNgmgWIqTCnF3iJQC2jcz76USbeuYtpaXNIk6q6BOvxvT8MjzDuRO863qoc7rMrHeFX3Qpq9V8vNyuH8HI7XxWw_Su94Ie0Zk11lLJVqAWBA6F6VkKBZFojHGMgAHDOSxC-jFBjSg3h_YZTbx:1mQ2yy:n7bkW9iu4VOFR0TfdYOfbv8FDRDPF7BE3XSPiX1_LAI', '2021-09-28 13:05:56.806035'),
('hb81fj892xr8ljdjikxp31lehcgazutu', 'YTZmNjdiODI2NGYxYzYwYjk4ZWVkMDA1ZGYzZmU0YWZiOWE3YWFjZDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2Q5MzA0ODI3NjM4MGYxZTA3ZTc5NGY2YzcxZGE5YTFjNmM4NzlhZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-09-24 15:21:02.975742'),
('jk7l0yfzgevgp9lw1x2j52uplv4db8x6', 'ZjNmMDllMTExMjhiNGJlYWU5Y2Y0ZGJlYjdjM2E0N2YzNTEwZmMyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGQwZmNhYzJlZTQyMmE1NzA0NWIwZWY2ZTk0YTRlMjFlMTg0MTZhMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-10-13 13:01:54.756387'),
('jth03m5zjm6ihnrsfxtlai05nrje8tqt', 'ZDRmZDIzN2U0ZDI0ZDRhMDdiNzU2MDdhNDRiZWRhYmYzMzY0MGZhYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjliNDEzOTc1NTVmMGFhNTBhMzlhZjJiMzkyMjNiYTk4ZDZjMjk3ZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-09-25 13:30:40.994018'),
('jw3rgeqyt0i5kdymbbgp3owgmgxmcg45', 'NWM0YjY1Y2RmZDljMTQxZjY3MTE0NGMzMWJkMzI1MTkyMDA4ZjM1ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjI0NjE5YjUwY2JhNzk4ZjNmOTY1Zjc1OGVlMGY5MDBkOWY5OWNhNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=', '2021-10-09 20:08:48.449832'),
('khjgi10urdx1j6os90ud47ycp1bcxftx', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mIKjA:ok89Wi77ivm-FDJheZXse67pDYEcGNhAW71qsM_C-1g', '2021-09-07 06:25:44.623015'),
('kp6zdquy5yj7z2p501afs9ystttgb7qk', 'NjdlYjYxZWVjNDk0YmM3MTQyNDRmNWFlMDk0YzQ1MzA1MmY3NjY2ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzQzOGNlNTVhMzY1ZDM2NjcyYTlkNzNhNzgxNGI2NzI5NTExODI5In0=', '2021-09-28 23:10:04.542148'),
('kumqzx9b8ix06glowlsh1d1154wk4rpi', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mNX7T:ZIxEuIt-scBs6KG_5KO_P_YmwYsviq9c_S-_H-9lXyU', '2021-09-21 14:40:19.691437'),
('lfz9a7suho2yhw00bzw2lrwynfdkemtp', 'ZjNmMDllMTExMjhiNGJlYWU5Y2Y0ZGJlYjdjM2E0N2YzNTEwZmMyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGQwZmNhYzJlZTQyMmE1NzA0NWIwZWY2ZTk0YTRlMjFlMTg0MTZhMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-10-13 18:17:16.587269'),
('lgwkkt5cbp2t6dyo51x4pvn8tw7bblc2', 'NGQ2NGZhNTM0YmM4NDcxNzkxOGY0ZDU3NDhkNWQ1N2RhZGU4MTgxNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjhkMGZjYWMyZWU0MjJhNTcwNDViMGVmNmU5NGE0ZTIxZTE4NDE2YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2021-10-09 20:02:06.699618'),
('lgyguzpp6shudi6qegcnsu2kesixs3vm', '.eJxVjMsOwiAQRf-FtSEwCAMu3fcbyPCSqoGktCvjv2uTLnR7zzn3xTxta_XbyIufE7swYKffLVB85LaDdKd26zz2ti5z4LvCDzr41FN-Xg_376DSqN9aCuOgSJuUQ-OCEY6ETIoMGotKaQn2DEWbEAkBhSgQoKDWKUiMwlr2_gCi-DZZ:1mR5e4:hZUnKMWW9APNuWu3epGv0zARyQVfWPKHBHvfljrJDSA', '2021-10-01 10:08:40.759446'),
('ls3ecqbgoxq44qo8wg5qxpa9kfhm5u14', 'OWVkMmUxZDBkNGM5YzZiZjNjMjM1MTg3ZWM5NzczNWNhZmM0ODJkNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4YWQyNjUxMTMyM2QxN2Q0NGU5NWUyZjMzNDQ2YTY1YWM4MjAxZGU4In0=', '2021-09-24 15:05:24.683008'),
('m93wwvvc8e1cy08qllg7owvtphi4815a', '.eJxVjE0OwiAYBe_C2hAoAsGle89Avj-kamhS2lXj3bVJF7p9M_M2lWFdal67zHlkdVFWnX43BHpK2wE_oN0nTVNb5hH1ruiDdn2bWF7Xw_07qNDrtwYfkhmsI4pkExccirfikU2JHksMKZ5jILCMLhiMaNglEJMkeOeE1PsD6mo4MA:1mSFQa:IoxkywRJbvJUrtJsC6Ine-lXUHqq5SVPKTj5FYjbj1E', '2021-10-04 14:47:32.884734'),
('mb4i4l7snseuudsc36hpz6odr3x8nm3b', 'ZjNmMDllMTExMjhiNGJlYWU5Y2Y0ZGJlYjdjM2E0N2YzNTEwZmMyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGQwZmNhYzJlZTQyMmE1NzA0NWIwZWY2ZTk0YTRlMjFlMTg0MTZhMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-10-09 10:38:06.487626'),
('metcr06qj5tbuorwlprjpoanp4lkarts', 'MWM5YWQ2YmFkMTBiYmRiNmM1YWE2N2MwYTYxNDc0MzU5NjE5YzM5Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiJiOWI0MTM5NzU1NWYwYWE1MGEzOWFmMmIzOTIyM2JhOThkNmMyOTdkIn0=', '2021-09-24 18:56:37.507638'),
('mgjhldc52u09ikfej9p5ocqt8ekfwlaq', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFFaffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X84U4MA:1mLesv:CkKRv8oFCUlUL_XERFWLxb8GQA5lsZWB7JqaD3hx39g', '2021-09-16 10:33:33.773742'),
('mo8w7qrygf1ix1jj85unjrzbuzy1l5u5', 'N2E4ZGNhMGUyYTU3ZmNkNDFjZDVlNjczOTk2ZmM5MDM0Y2Q5OTFmODp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiZmM5ZThmZWUzODliNWZmNTNkMTZkNDNkNWRjZTc3NzgzMDMxZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=', '2021-09-24 16:42:57.042374'),
('n8rxrv5duzzvo4n9uduvaqhsyc4ou7hg', '.eJxVjDsOwjAQBe_iGln-26Gk5wzW2rtLAsiW8qkQd4dIKaB9M_NeIsO2jnlbaM4TirPQ4vS7FagPajvAO7Rbl7W3dZ6K3BV50EVeO9Lzcrh_ByMs47euZBUb44bCCVApVpZNRG05OK81W0AolEy0nikR8EDR1xocxhKU8-L9AfTBOF8:1mPovp:FYKuyvMZgVpBRQgPVjhWAaaJ8S_qUlWy8DaY34g-kMA', '2021-09-27 22:05:45.639280'),
('owaqvb9qktyhwmxrtb09tpzjwanix9k1', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mNpwN:RnAl4RZHzY11sxg6qy_ByuzL7VGaP1Rrb4rcfuS9rRg', '2021-09-22 10:46:07.390420'),
('podcvzbt6mr4a59dn9np4mss5m9j9yi4', 'ZjRhYmQyMGJiNTIxMzUzNzZhMTBjNDdiNWUyODY1NTFiYjY5YWFmNjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ODRjNmY4ZWMzNzBiZDMxNWM3N2QwZjg0MTA2ODY5NGM0YWZmYmMyIn0=', '2021-09-30 19:54:38.312249'),
('ppa575ppkk28gfurjwb3wx61hmx4xu55', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mHMRV:6BXSwW2uzh0ebQePG60nY1mttYfPbzHovyewvZWXnKQ', '2021-09-04 14:03:29.499660'),
('ppm4hkkvhxuq7jk3zn2kd4uqve86p2l1', 'NGE1YmZjOTczZWY4YWE0NjgzMzA4ZDUwOGZhZTkzYzkxYjM5YjhiMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjg0YzZmOGVjMzcwYmQzMTVjNzdkMGY4NDEwNjg2OTRjNGFmZmJjMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-09-29 16:32:50.970721'),
('pr4dznckozzbe5qcnqdurc632u44886h', 'MDM5ZjZlNmUwMTFlYzEyOWFlYzNhYTNmZDlkMzA2NzI3MTg3NDFjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhkMGZjYWMyZWU0MjJhNTcwNDViMGVmNmU5NGE0ZTIxZTE4NDE2YTMiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2021-10-06 14:05:40.855731'),
('q225hs14kjgnnituxr07bv4qpbov35w5', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mIhGS:squq9uL4XIyVwnmwDU466t0P1b-15N04UjpZH3-zgaw', '2021-09-08 06:29:36.762585'),
('rfgsf2bqq9x7tmg48qm76zypvfegkivo', 'NzQxMjQyNGYwZDNiYzljNGJhNGE0YzA2NmRmNzU3NmUzZDFhNDg2Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiI4ZDBmY2FjMmVlNDIyYTU3MDQ1YjBlZjZlOTRhNGUyMWUxODQxNmEzIn0=', '2021-10-10 12:24:41.845521'),
('sf1sillwrsor3ilg193o014kdbmqf7z7', 'NmYxYWZjN2Q5Zjg0NjJkOTMwMGU5ZDUwOTBjZDI0ZTk5MmY3MDkwYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGQwZmNhYzJlZTQyMmE1NzA0NWIwZWY2ZTk0YTRlMjFlMTg0MTZhMyIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2021-10-06 15:41:52.155927'),
('si41a2e0wsgao353ggdqd9fgvm66hqv9', '.eJxVjDsOwjAQBe_iGlmY9ZeSPmeI1t41DiBbipMKcXdkKQW0b2beW8y4b2XeO6_zQuIqQJx-t4jpyXUAemC9N5la3dYlyqHIg3Y5NeLX7XD_Dgr2MmodTHCQXAQTrb8E4ByzCpg1QSD2lL1PEZUxyVlLjgE5Kz5bbb0GKz5f8lM4Lg:1mM2rk:liNL8dhUbee4SHYnIoueQzDf9jytmmvEH3zdIusstDs', '2021-09-17 12:09:56.481328'),
('tpm2nieuwj43devy9r6o1ty7eedkr0gg', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mHxTj:ajuYmvjTcuBFSM0tevO5zhr2LdNcJYumRuMAezV_I-8', '2021-09-06 05:36:15.316508'),
('ux58d19prkp0wogyb12e9uaz9kj18b9j', '.eJxVjE0OwiAYBe_C2hAoAsGle89Avj-kamhS2lXj3bVJF7p9M_M2lWFdal67zHlkdVFWnX43BHpK2wE_oN0nTVNb5hH1ruiDdn2bWF7Xw_07qNDrtwYfkhmsI4pkExccirfikU2JHksMKZ5jILCMLhiMaNglEJMkeOeE1PsD6mo4MA:1mSXLw:fI-EwLYgomLFrc6z8MnD7MdiyhuwlO6X-SU92RNxxEY', '2021-10-05 09:55:56.745862'),
('v47nufo1uzfmcrk288kcsi1ppiqp50c3', 'ZjRhYmQyMGJiNTIxMzUzNzZhMTBjNDdiNWUyODY1NTFiYjY5YWFmNjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ODRjNmY4ZWMzNzBiZDMxNWM3N2QwZjg0MTA2ODY5NGM0YWZmYmMyIn0=', '2021-09-30 09:06:12.454497'),
('v8iwouvvatqr60w2z5y4rft4ywwjfxc2', 'MTM0MGM4MzU2ZWNkNzFiZTAxMzNiZjZhODJmMTMyYmEwOWNjYmFmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA4N2U3MDFkMTYwNjg0ZTE3MDE5MjQ4NjcyNjQ2NDM1MjAyNmVjNDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=', '2021-10-14 18:50:54.189723'),
('vp5li47w3u6frh5h6kgdt497l9ofrymz', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mHca0:8G4lvZQBHg0RFoJoavhxAkGcAbAicf4CXdqCJDzG_CA', '2021-09-05 07:17:20.830882'),
('w49ym43cpcu43hbodbs85i0k1a4itolk', 'Y2NlNjkxNTA5OGRmMmU4ODY2OGFiZGNjM2NkZWQ2MTM2NDZjY2I3MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5YjQxMzk3NTU1ZjBhYTUwYTM5YWYyYjM5MjIzYmE5OGQ2YzI5N2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2021-09-24 14:48:01.813114'),
('wlrrng94yevf8c3cu1ms943m44l9za4h', 'NzQxMjQyNGYwZDNiYzljNGJhNGE0YzA2NmRmNzU3NmUzZDFhNDg2Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiI4ZDBmY2FjMmVlNDIyYTU3MDQ1YjBlZjZlOTRhNGUyMWUxODQxNmEzIn0=', '2021-10-06 15:53:25.023033'),
('x7st8dafz1lpk2ct0pgybkb292gzjeem', '.eJxVjDsOwjAQBe_iGln-26Gk5wzW2rtLAsiW8qkQd4dIKaB9M_NeIsO2jnlbaM4TirPQ4vS7FagPajvAO7Rbl7W3dZ6K3BV50EVeO9Lzcrh_ByMs47euZBUb44bCCVApVpZNRG05OK81W0AolEy0nikR8EDR1xocxhKU8-L9AfTBOF8:1mQ4O3:km_W38oKj0lXdWwWa_y6A0hhtHbIWD8gDpB5bt9XC9Q', '2021-09-28 14:35:55.479706'),
('xo6859iogmdz9mjn7rubkyyy7cmzufya', '.eJxVjDsOwjAQBe_iGlkY_ynpc4Zo17vGAWRLcVIh7o4spYD2zcx7ixn2rcx753VeSFyFEqffDSE9uQ5AD6j3JlOr27qgHIo8aJdTI37dDvfvoEAvozbRRq-TR23RhUvUnDGrCNmQjsSBcggJQVmbvHPkWQNnxWdnXDDaic8X8SE4LA:1mHO4j:LI5Jlz8L7sivrepXeBxUPzM1ghQlOa_C32Lo7dVQpvE', '2021-09-04 15:48:05.435890'),
('ygjn1rb4vjrd703ljv8n91494qacmfnu', '.eJxVjDsOwjAQBe_iGlmY9ZeSPmeI1t41DiBbipMKcXdkKQW0b2beW8y4b2XeO6_zQuIqQJx-t4jpyXUAemC9N5la3dYlyqHIg3Y5NeLX7XD_Dgr2MmodTHCQXAQTrb8E4ByzCpg1QSD2lL1PEZUxyVlLjgE5Kz5bbb0GKz5f8lM4Lg:1mJW1r:JbnrKFd_bUborb9tAL3yRgmoz28Mp_ESck1rKdVD9so', '2021-09-10 12:41:55.194408'),
('z5de4hkyd6ye3oroj9bm9xuamoyypont', '.eJxVjMsOwiAQRf-FtSHTUmBw6d5vIAwz2KqBpI-V8d-1SRe6veec-1IxbesYt0XmOLE6K6NOvxul_JC6A76nems6t7rOE-ld0Qdd9LWxPC-H-3cwpmX81q4UDMCDHSQhgHhDhSixY5cRgoXBBQ_UZd-jAPc9dJ4JEL0xFq2o9wfkNjdK:1mSAe3:63MZD9vM5Qg6L0oGJ__WzJVDPEbfrHnqe2hJfxetbAY', '2021-10-04 09:41:07.897942'),
('zsj7w3lho7u5k7v4h6sfrogte0herfnf', '.eJxVjE0OwiAYBe_C2hAoAsGle89Avj-kamhS2lXj3bVJF7p9M_M2lWFdal67zHlkdVFWnX43BHpK2wE_oN0nTVNb5hH1ruiDdn2bWF7Xw_07qNDrtwYfkhmsI4pkExccirfikU2JHksMKZ5jILCMLhiMaNglEJMkeOeE1PsD6mo4MA:1mVrlW:2kZnWenmmPLsKrpeC28blOcnx9XavOu1qtkROe_D6e4', '2021-10-14 14:20:06.148519'),
('zxqyydysgbshs5d80dqh30cmeotbc5ta', '.eJxVjDsOwyAQRO9CHSEW802Z3mdAixeCkwgkY1dR7h5bcpE0U8x7M28WcFtL2HpawkzsygZ2-e0iTs9UD0APrPfGp1bXZY78UPhJOx8bpdftdP8OCvayr6NyoKWdlMw-EmVLRkkwkMg7ZcEJqz3uKXCw0msEm6MkgSrnrAwA-3wByFA3Gw:1mVsHI:ECnASlhItp0WM139kLshzqGDifyRtML8U28uOtXfC28', '2021-10-14 14:52:56.728900');

-- --------------------------------------------------------

--
-- Table structure for table `project_call`
--

CREATE TABLE `project_call` (
  `id` bigint NOT NULL,
  `title` varchar(255) NOT NULL,
  `call_for_id` bigint NOT NULL,
  `format_id` bigint DEFAULT NULL,
  `language_id` bigint DEFAULT NULL,
  `owner_id` bigint NOT NULL,
  `budget` double DEFAULT NULL,
  `description` longtext,
  `expiry_date` date DEFAULT NULL,
  `other_genre` varchar(50) DEFAULT NULL,
  `other_language` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_call`
--

INSERT INTO `project_call` (`id`, `title`, `call_for_id`, `format_id`, `language_id`, `owner_id`, `budget`, `description`, `expiry_date`, `other_genre`, `other_language`) VALUES
(14, '', 1, 1, 1, 3, NULL, NULL, '2021-11-17', NULL, NULL),
(15, '', 4, 1, 1, 3, NULL, NULL, '2021-10-06', NULL, NULL),
(16, '', 5, 3, 1, 3, NULL, NULL, '2021-10-13', NULL, NULL),
(17, '', 6, 3, 1, 3, NULL, 'description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here description goe here here', '2021-10-06', NULL, NULL),
(18, '', 3, 5, 1, 3, 100000, 'description content goes here, description content goes here, description content goes here,', '2021-10-13', NULL, NULL),
(19, '', 4, 1, 1, 3, 20000, 'Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here Description content goes here', '2021-10-06', NULL, NULL),
(20, '', 3, 3, 1, 3, 2000, '', '2021-09-30', NULL, NULL),
(21, '', 4, 2, 2, 3, 3333, '', '2021-09-30', NULL, NULL),
(22, '', 6, 1, 1, 3, 907, '', '2021-09-30', NULL, NULL),
(23, '', 2, 1, 3, 3, 344, '', '2021-09-30', NULL, NULL),
(24, '', 4, 2, 1, 5, 3333, 'Description content goes here', '2021-11-18', NULL, NULL),
(25, '', 6, 4, 1, 3, 10000, '1k per episode', '2021-11-17', NULL, NULL),
(29, '', 2, 1, 1, 3, NULL, 'sample', '2021-09-16', '', ''),
(30, '', 4, 1, 2, 3, NULL, 'sample', '2021-10-01', '', ''),
(31, '', 6, 1, 1, 3, NULL, '', '2021-10-01', '', ''),
(32, '', 5, 2, 1, 3, NULL, '', '2021-10-01', '', ''),
(33, '', 2, 1, 1, 3, NULL, 'sample goes here', '2021-12-23', '', ''),
(34, '', 4, 1, 1, 3, NULL, 'Morris Chestnut, Michael Eklund, Michael Imperioli, and David Otunga also star. The story was originally envisioned as a television series, but D\'Ovidio later rewrote it as a film.', '2021-10-31', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `project_call_genre`
--

CREATE TABLE `project_call_genre` (
  `id` bigint NOT NULL,
  `call_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_call_genre`
--

INSERT INTO `project_call_genre` (`id`, `call_id`, `genre_id`) VALUES
(17, 14, 1),
(18, 14, 2),
(19, 14, 3),
(20, 14, 4),
(21, 14, 5),
(22, 14, 6),
(23, 15, 2),
(24, 16, 4),
(25, 17, 1),
(26, 17, 2),
(27, 17, 3),
(28, 18, 1),
(29, 19, 1),
(30, 19, 4),
(31, 20, 1),
(32, 20, 3),
(33, 21, 3),
(34, 22, 1),
(35, 22, 6),
(36, 23, 2),
(37, 24, 2),
(38, 25, 1),
(39, 25, 3),
(40, 25, 6),
(45, 29, 1),
(46, 30, 2),
(47, 31, 4),
(48, 32, 2),
(49, 33, 1),
(50, 33, 2),
(51, 34, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_comment`
--

CREATE TABLE `project_comment` (
  `id` bigint NOT NULL,
  `comment` longtext NOT NULL,
  `date` date NOT NULL,
  `commented_by_id` bigint NOT NULL,
  `post_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_comment`
--

INSERT INTO `project_comment` (`id`, `comment`, `date`, `commented_by_id`, `post_id`) VALUES
(19, 'Hai', '2021-08-23', 2, 19),
(21, 'Hi', '2021-08-28', 3, 40);

-- --------------------------------------------------------

--
-- Table structure for table `project_downvote`
--

CREATE TABLE `project_downvote` (
  `id` bigint NOT NULL,
  `downvoted_by_id` bigint NOT NULL,
  `post_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_downvote`
--

INSERT INTO `project_downvote` (`id`, `downvoted_by_id`, `post_id`) VALUES
(14, 3, 50),
(15, 3, 55),
(23, 3, 51),
(24, 3, 73),
(26, 2, 35),
(44, 2, 76),
(45, 2, 71),
(46, 2, 72),
(51, 2, 90),
(52, 2, 67);

-- --------------------------------------------------------

--
-- Table structure for table `project_interest`
--

CREATE TABLE `project_interest` (
  `id` bigint NOT NULL,
  `post_id` bigint NOT NULL,
  `shown_by_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_interest`
--

INSERT INTO `project_interest` (`id`, `post_id`, `shown_by_id`) VALUES
(13, 46, 2),
(14, 47, 2),
(15, 73, 3),
(16, 34, 2),
(25, 43, 2),
(26, 45, 2),
(27, 68, 3),
(28, 76, 2),
(29, 68, 5),
(30, 90, 2),
(31, 44, 3);

-- --------------------------------------------------------

--
-- Table structure for table `project_like`
--

CREATE TABLE `project_like` (
  `id` bigint NOT NULL,
  `liked_by_id` bigint NOT NULL,
  `post_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_like`
--

INSERT INTO `project_like` (`id`, `liked_by_id`, `post_id`) VALUES
(18, 2, 23),
(25, 3, 19),
(26, 3, 68),
(27, 3, 35),
(28, 2, 52);

-- --------------------------------------------------------

--
-- Table structure for table `project_message`
--

CREATE TABLE `project_message` (
  `id` bigint NOT NULL,
  `date` datetime(6) NOT NULL,
  `message` longtext NOT NULL,
  `unread` tinyint(1) NOT NULL,
  `interest_id` bigint DEFAULT NULL,
  `message_by_id` bigint NOT NULL,
  `m_file` varchar(100) DEFAULT NULL,
  `message_to_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_message`
--

INSERT INTO `project_message` (`id`, `date`, `message`, `unread`, `interest_id`, `message_by_id`, `m_file`, `message_to_id`) VALUES
(88, '2021-09-10 00:00:00.000000', 'Hi i am bala', 0, NULL, 2, '', 3),
(89, '2021-09-10 00:00:00.000000', 'Hi i am bala', 0, NULL, 2, '', 3),
(90, '2021-09-10 00:00:00.000000', 'hai i am ramesh', 0, NULL, 3, '', 2),
(91, '2021-09-10 00:00:00.000000', 'Hello bakkiyaraj', 0, NULL, 3, '', 2),
(92, '2021-09-10 00:00:00.000000', 'Sir, could you please share your phone number with me?', 0, 14, 2, '', 3),
(93, '2021-09-10 00:00:00.000000', 'Hello bakiyaraj', 0, 15, 3, '', 2),
(94, '2021-09-10 00:00:00.000000', 'This is ramesh from Movie Studios', 0, 15, 3, '', 2),
(95, '2021-09-10 00:00:00.000000', 'Thanks for connecting sir. Pls share the phone number ', 0, NULL, 2, '', 3),
(96, '2021-09-10 00:00:00.000000', 'Hello sir, I am interested in lyrics writing. Pls find the links for my previous works. I charge 20k per song. My contact: ##########', 0, 16, 2, '', 3),
(97, '2021-09-10 00:00:00.000000', 'Hello sir, I am interested in lyrics writing. Pls find the links for my previous works. I charge 20k per song. My contact: ##########', 0, 16, 2, '', 3),
(98, '2021-09-10 00:00:00.000000', 'Hello sir', 0, 15, 2, '', 3),
(99, '2021-09-11 00:00:00.000000', 'Hai', 0, NULL, 5, '', 2),
(100, '2021-09-11 00:00:00.000000', 'hello', 0, NULL, 2, '', 5),
(101, '2021-09-14 00:00:00.000000', 'Thanks for connecting', 0, NULL, 2, '', 5),
(102, '2021-09-14 00:00:00.000000', 'Hello sir', 1, NULL, 3, '', 5),
(103, '2021-09-14 00:00:00.000000', 'Hi bakiyaraj', 0, NULL, 3, '', 2),
(107, '2021-09-17 00:00:00.000000', 'Hi', 0, 25, 2, '', 3),
(108, '2021-09-17 00:00:00.000000', 'Hi', 0, 26, 2, '', 3),
(109, '2021-09-22 00:00:00.000000', 'Hello', 0, 27, 3, '', 2),
(110, '2021-09-26 00:00:00.000000', 'x', 0, 28, 2, '', 3),
(111, '2021-09-29 00:00:00.000000', 'Hello', 0, 29, 5, '', 2),
(112, '2021-09-30 00:00:00.000000', 'hi', 0, 30, 2, '', 3),
(113, '2021-09-22 11:56:00.521132', 'hi bak', 0, 30, 3, '', 2),
(114, '2021-09-30 11:58:49.883279', 'haiiiii bakiyaraja', 0, 30, 3, '', 2),
(115, '2021-09-30 12:09:25.716889', 'Hello sir', 0, 30, 2, '', 3),
(116, '2021-09-30 12:11:59.768575', 'ayyapanum koshiyum', 0, 30, 2, '', 3),
(117, '2021-09-30 13:22:40.345909', 'hi', 0, 30, 3, '', 2),
(118, '2021-09-30 19:06:38.055000', 'hi', 1, 30, 2, '', 3),
(119, '2021-09-30 19:10:21.403109', 'hello', 1, 30, 2, '', 3),
(120, '2021-09-30 19:12:02.737484', 'hello', 0, 15, 2, '', 3),
(121, '2021-10-01 13:19:54.489512', 'Hello bakiyaraj, i like ', 1, 31, 3, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `project_pitch`
--

CREATE TABLE `project_pitch` (
  `id` bigint NOT NULL,
  `story_title` varchar(255) NOT NULL,
  `story_file` varchar(100) DEFAULT NULL,
  `format_id` bigint DEFAULT NULL,
  `language_id` bigint DEFAULT NULL,
  `owner_id` bigint NOT NULL,
  `budget` double DEFAULT NULL,
  `description` longtext,
  `other_genre` varchar(50) DEFAULT NULL,
  `other_language` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_pitch`
--

INSERT INTO `project_pitch` (`id`, `story_title`, `story_file`, `format_id`, `language_id`, `owner_id`, `budget`, `description`, `other_genre`, `other_language`) VALUES
(11, 'Methagu', 'stories/gess203_6kz7OFH.pdf', 1, 1, 2, 1000, 'Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here . Description goes here .', NULL, NULL),
(12, 'Kaviya Thalaivan', 'stories/iemh110.pdf', 1, 1, 2, 20000, 'Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here , Description goes here ,', NULL, NULL),
(13, 'Guru', 'stories/Human_Welfare.pdf', 1, 2, 2, 10, '', NULL, NULL),
(14, 'Kolo soda', 'stories/sample.pdf', 1, 1, 5, 298, 'Hello', NULL, NULL),
(15, 'jodi', 'stories/cc_n8hyheL.pdf', 2, 1, 5, 444, '', NULL, NULL),
(16, 'Krish', 'stories/Human_Welfare_QAX01DG.pdf', 4, 1, 5, 424, 'erere', NULL, NULL),
(17, 'krish 2', 'stories/sample_tMQSaTr.pdf', 2, 2, 5, 344, 'dfdfd', NULL, NULL),
(18, 'krish 4', 'stories/sample_i0oF4XZ.pdf', 1, 1, 5, 444, '4444', NULL, NULL),
(19, 'krish6', 'stories/sample_DAaiHmO.pdf', 4, 3, 5, 333, '333', NULL, NULL),
(20, 'cool', 'stories/cc_m7oaIsF.pdf', 2, 3, 5, 444, '4444', NULL, NULL),
(21, 'Master', 'stories/41.pdf', 2, 1, 2, 566, 'content goes here', NULL, NULL),
(22, 'Cinderella', 'stories/sample_dFfwdVr.pdf', 1, 1, 2, 532, 'After the untimely death of her father, Ella is troubled by her stepmother and stepsisters. However, her life changes forever after dancing with a charming stranger at the Royal Ball. After the untimely death of her father, Ella is troubled by her stepmother and stepsisters. However, her life changes forever after dancing with a charming stranger at the Royal Ball.', NULL, NULL),
(28, 'sample', '', 1, 1, 2, NULL, 'sample', '', ''),
(29, 'Ayyapanum Khosiyum', '', 1, 1, 2, NULL, 'Looking for the best places to submit fiction? Start with our write-up of the best journals for short story submissions.', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `project_pitch_genre`
--

CREATE TABLE `project_pitch_genre` (
  `id` bigint NOT NULL,
  `pitch_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_pitch_genre`
--

INSERT INTO `project_pitch_genre` (`id`, `pitch_id`, `genre_id`) VALUES
(12, 11, 1),
(13, 11, 2),
(14, 11, 3),
(15, 11, 4),
(16, 12, 1),
(17, 12, 2),
(18, 12, 3),
(19, 13, 1),
(20, 14, 2),
(21, 15, 2),
(22, 16, 2),
(23, 17, 1),
(24, 18, 2),
(25, 19, 5),
(26, 20, 4),
(27, 21, 1),
(28, 22, 5),
(35, 28, 2),
(36, 29, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_pitch_pitch_to_people`
--

CREATE TABLE `project_pitch_pitch_to_people` (
  `id` bigint NOT NULL,
  `pitch_id` bigint NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_pitch_pitch_to_people`
--

INSERT INTO `project_pitch_pitch_to_people` (`id`, `pitch_id`, `user_id`) VALUES
(2, 11, 1),
(1, 12, 2),
(3, 14, 2),
(4, 14, 3),
(5, 15, 2),
(6, 16, 2),
(7, 17, 2),
(8, 21, 3),
(9, 22, 3),
(12, 29, 3);

-- --------------------------------------------------------

--
-- Table structure for table `project_post`
--

CREATE TABLE `project_post` (
  `id` bigint NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_category` varchar(1) NOT NULL,
  `date` datetime(6) NOT NULL,
  `assistant_id` bigint DEFAULT NULL,
  `award_id` bigint DEFAULT NULL,
  `call_id` bigint DEFAULT NULL,
  `pitch_id` bigint DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_post`
--

INSERT INTO `project_post` (`id`, `post_title`, `post_category`, `date`, `assistant_id`, `award_id`, `call_id`, `pitch_id`, `project_id`, `active`) VALUES
(19, 'Bakkiyaraj Kannan Worked in Sulthan', 'P', '2021-09-10 00:00:00.000000', NULL, NULL, NULL, NULL, 1, 1),
(20, 'Madhan Umk Worked as Assistant Director in Sulthan', 'S', '2021-08-23 00:00:00.000000', 1, NULL, NULL, NULL, NULL, 1),
(23, 'Ramesh Pnr Worked as Assistant Director in Sulthan', 'S', '2021-08-23 00:00:00.000000', 2, NULL, NULL, NULL, NULL, 1),
(24, 'Ramesh Pnr Worked as Assistant Director in Sulthan', 'S', '2021-08-23 00:00:00.000000', 3, NULL, NULL, NULL, NULL, 1),
(33, 'Ramesh Pnr Producer\'s Call for Story Writing', 'C', '2021-08-26 00:00:00.000000', NULL, NULL, 14, NULL, NULL, 1),
(34, 'Ramesh Pnr Producer\'s Call for Lyrics Writing', 'C', '2021-08-26 00:00:00.000000', NULL, NULL, 15, NULL, NULL, 1),
(35, 'Read my Outline of Story Methagu', 'T', '2021-09-22 16:02:25.574514', NULL, NULL, NULL, 11, NULL, 1),
(36, 'Ramesh Pnr Producer\'s Call for Story Discussion', 'C', '2021-08-27 00:00:00.000000', NULL, NULL, 16, NULL, NULL, 1),
(39, 'Ramesh Pnr Producer\'s Call for Script Doctoring', 'C', '2021-08-27 00:00:00.000000', NULL, NULL, 17, NULL, NULL, 1),
(40, 'Read my Outline of Story Kaviya Thalaivan', 'T', '2021-09-18 12:27:31.461153', NULL, NULL, NULL, 12, NULL, 1),
(41, 'Ramesh Pnr Producer\'s Call for Dialogue Writing', 'C', '2021-08-28 00:00:00.000000', NULL, NULL, 18, NULL, NULL, 1),
(42, 'Ramesh Pnr Producer\'s Call for Lyrics Writing', 'C', '2021-09-01 00:00:00.000000', NULL, NULL, 19, NULL, NULL, 1),
(43, 'Ramesh Pnr Producer\'s Call for Dialogue Writing', 'C', '2021-08-31 00:00:00.000000', NULL, NULL, 20, NULL, NULL, 1),
(44, 'Read my Outline of Story Guru', 'T', '2021-09-30 18:42:40.460927', NULL, NULL, NULL, 13, NULL, 1),
(45, 'Ramesh Pnr Producer\'s Call for Lyrics Writing', 'C', '2021-09-01 00:00:00.000000', NULL, NULL, 21, NULL, NULL, 1),
(46, 'Ramesh Pnr Producer\'s Call for Script Doctoring', 'C', '2021-09-02 00:00:00.000000', NULL, NULL, 22, NULL, NULL, 1),
(47, 'Ramesh Pnr Producer\'s Call for Screen Writing', 'C', '2021-09-02 00:00:00.000000', NULL, NULL, 23, NULL, NULL, 1),
(48, 'Read my Outline of Story Kolo soda', 'T', '2021-09-02 00:00:00.000000', NULL, NULL, NULL, 14, NULL, 1),
(49, 'Read my Outline of Story jodi', 'T', '2021-09-02 00:00:00.000000', NULL, NULL, NULL, 15, NULL, 1),
(50, 'Read my Outline of Story Krish', 'T', '2021-09-02 00:00:00.000000', NULL, NULL, NULL, 16, NULL, 1),
(51, 'Read my Outline of Story krish 2', 'T', '2021-09-02 00:00:00.000000', NULL, NULL, NULL, 17, NULL, 1),
(52, 'SR Prabhu\'s Call for Lyrics Writing', 'C', '2021-09-09 00:00:00.000000', NULL, NULL, 24, NULL, NULL, 1),
(53, 'Read my Outline of Story krish 4', 'T', '2021-09-02 00:00:00.000000', NULL, NULL, NULL, 18, NULL, 1),
(54, 'Read my Outline of Story krish6', 'T', '2021-09-02 00:00:00.000000', NULL, NULL, NULL, 19, NULL, 1),
(55, 'Read my Outline of Story cool', 'T', '2021-09-29 10:09:17.875964', NULL, NULL, NULL, 20, NULL, 1),
(64, 'Shanmugam Shankar Worked in Enthiran', 'P', '2021-09-10 00:00:00.000000', NULL, NULL, NULL, NULL, 17, 1),
(67, 'Ramesh Pnr Worked in Puli Murugan', 'P', '2021-09-10 00:00:00.000000', NULL, NULL, NULL, NULL, 19, 1),
(68, 'Read my Outline of Story Master', 'T', '2021-09-18 13:06:54.260541', NULL, NULL, NULL, 21, NULL, 1),
(69, 'Bakkiyaraj Kannan Worked in Remo', 'P', '2021-09-09 00:00:00.000000', NULL, NULL, NULL, NULL, 20, 1),
(70, 'Bakkiyaraj Kannan Recieved the Award Edition Award', 'A', '2021-09-09 00:00:00.000000', NULL, 5, NULL, NULL, NULL, 1),
(71, 'Ramesh Pnr Recieved the Award Edition Award', 'A', '2021-09-10 00:00:00.000000', NULL, 6, NULL, NULL, NULL, 1),
(72, 'Shanmugam Shankar Recieved the Award Filmfare Award for Best Director – Tamil', 'A', '2021-09-10 00:00:00.000000', NULL, 7, NULL, NULL, NULL, 1),
(73, 'Read my Outline of Story Cinderella', 'T', '2021-09-30 18:39:03.651382', NULL, NULL, NULL, 22, NULL, 1),
(74, 'Kishor Worked as Assistant Director in Remo', 'S', '2021-09-10 00:00:00.000000', 4, NULL, NULL, NULL, NULL, 1),
(75, 'Kishor Recieved the Award Behindwoods Awards', 'A', '2021-09-10 00:00:00.000000', NULL, 8, NULL, NULL, NULL, 1),
(76, 'Ramesh Pnr\'s Call for Script Doctoring', 'C', '2021-09-28 15:04:18.363989', NULL, NULL, 25, NULL, NULL, 1),
(85, 'Read my Outline of Story sample', 'T', '2021-09-30 09:53:21.851189', NULL, NULL, NULL, 28, NULL, 1),
(86, 'Ramesh Pnr\'s Call for Screen Writing', 'C', '2021-09-30 09:58:00.142385', NULL, NULL, 29, NULL, NULL, 1),
(87, 'Ramesh Pnr\'s Call for Lyrics Writing', 'C', '2021-09-30 10:01:45.593014', NULL, NULL, 30, NULL, NULL, 1),
(88, 'Ramesh Pnr\'s Call for Script Doctoring', 'C', '2021-09-30 10:26:09.070263', NULL, NULL, 31, NULL, NULL, 1),
(89, 'Ramesh Pnr\'s Call for Story Discussion', 'C', '2021-09-30 10:27:30.617986', NULL, NULL, 32, NULL, NULL, 1),
(90, 'Ramesh Pnr\'s Call for Screen Writing', 'C', '2021-10-01 13:23:36.826365', NULL, NULL, 33, NULL, NULL, 1),
(91, 'Ramesh Pnr\'s Call for Lyrics Writing', 'C', '2021-10-01 13:32:31.222142', NULL, NULL, 34, NULL, NULL, 1),
(92, 'Read my Outline of Story Ayyapanum Khosiyum', 'T', '2021-10-01 14:43:29.953619', NULL, NULL, NULL, 29, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_report`
--

CREATE TABLE `project_report` (
  `id` bigint NOT NULL,
  `comment` longtext NOT NULL,
  `date` date NOT NULL,
  `post_id` bigint NOT NULL,
  `reported_by_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

-- --------------------------------------------------------

--
-- Table structure for table `project_upvote`
--

CREATE TABLE `project_upvote` (
  `id` bigint NOT NULL,
  `post_id` bigint NOT NULL,
  `upvoted_by_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 TABLESPACE `techthoughts_wportal3`;

--
-- Dumping data for table `project_upvote`
--

INSERT INTO `project_upvote` (`id`, `post_id`, `upvoted_by_id`) VALUES
(12, 19, 3),
(13, 54, 3),
(15, 39, 2),
(17, 48, 3),
(19, 68, 3),
(25, 70, 3),
(42, 52, 2),
(47, 64, 2),
(48, 89, 2),
(50, 23, 2),
(51, 44, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_assistant`
--
ALTER TABLE `account_assistant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_assistant_project_id_3413590e_fk_account_project_id` (`project_id`),
  ADD KEY `account_assistant_senior_link_id_cb88ff18_fk_account_user_id` (`senior_link_id`),
  ADD KEY `account_assistant_user_id_e657449f_fk_account_user_id` (`user_id`);

--
-- Indexes for table `account_award`
--
ALTER TABLE `account_award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_award_project_id_dbe02c08_fk_account_project_id` (`project_id`),
  ADD KEY `account_award_user_id_bdb380e5_fk_account_user_id` (`user_id`);

--
-- Indexes for table `account_blocked_user`
--
ALTER TABLE `account_blocked_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_blocked_user_blocked_by_id_fb2b209b_fk_account_user_id` (`blocked_by_id`),
  ADD KEY `account_blocked_user_blocked_user_id_784b3531_fk_account_user_id` (`blocked_user_id`);

--
-- Indexes for table `account_chat`
--
ALTER TABLE `account_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_chat_sender_id_fa6c8461_fk_account_user_id` (`sender_id`),
  ADD KEY `account_chat_conversation_id_1c0aeeb5_fk_account_conversation_id` (`conversation_id`);

--
-- Indexes for table `account_company`
--
ALTER TABLE `account_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `owner_id` (`owner_id`),
  ADD KEY `account_company_location_id_1db26525_fk_account_location_id` (`location_id`);

--
-- Indexes for table `account_conversation`
--
ALTER TABLE `account_conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_conversation_receiver_id_02551a23_fk_account_user_id` (`receiver_id`),
  ADD KEY `account_conversation_sender_id_dc7e4fe3_fk_account_user_id` (`sender_id`);

--
-- Indexes for table `account_format`
--
ALTER TABLE `account_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_genre`
--
ALTER TABLE `account_genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_highlight`
--
ALTER TABLE `account_highlight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_highlight_project_id_a859a431_fk_account_project_id` (`project_id`),
  ADD KEY `account_highlight_user_id_c3727fef_fk_account_user_id` (`user_id`);

--
-- Indexes for table `account_language`
--
ALTER TABLE `account_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_location`
--
ALTER TABLE `account_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_open_to`
--
ALTER TABLE `account_open_to`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_project`
--
ALTER TABLE `account_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_project_genre_id_4b659441_fk_account_genre_id` (`genre_id`),
  ADD KEY `account_project_language_id_e488aa03_fk_account_language_id` (`language_id`),
  ADD KEY `account_project_created_by_id_6500e9e1_fk_account_user_id` (`created_by_id`);

--
-- Indexes for table `account_qualification`
--
ALTER TABLE `account_qualification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_qualification_user_id_df90edb6_fk_account_user_id` (`user_id`);

--
-- Indexes for table `account_rating`
--
ALTER TABLE `account_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_rating_rated_by_id_53e36b80_fk_account_user_id` (`rated_by_id`),
  ADD KEY `account_rating_user_id_9b860557_fk_account_user_id` (`user_id`);

--
-- Indexes for table `account_report_people`
--
ALTER TABLE `account_report_people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_report_people_reported_by_id_dd7f8473_fk_account_user_id` (`reported_by_id`),
  ADD KEY `account_report_peopl_reported_user_id_7826eddf_fk_account_u` (`reported_user_id`);

--
-- Indexes for table `account_testimonial`
--
ALTER TABLE `account_testimonial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_testimonial_person_id_b81e7d7e_fk_account_user_id` (`person_id`),
  ADD KEY `account_testimonial_user_id_4f84d6dd_fk_account_user_id` (`user_id`),
  ADD KEY `account_testimonial_project_id_24df45e7_fk_account_project_id` (`project_id`);

--
-- Indexes for table `account_user`
--
ALTER TABLE `account_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_user_location_id_621ee626_fk_account_location_id` (`location_id`);

--
-- Indexes for table `account_userfollowing`
--
ALTER TABLE `account_userfollowing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_userfollowing_user_id_3df84ba0_fk_account_user_id` (`user_id`),
  ADD KEY `account_userfollowin_following_user_id_b685e31c_fk_account_u` (`following_user_id`);

--
-- Indexes for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_user_groups_user_id_group_id_4d09af3e_uniq` (`user_id`,`group_id`),
  ADD KEY `account_user_groups_group_id_6c71f749_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `account_user_interested_format`
--
ALTER TABLE `account_user_interested_format`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_user_interested_format_user_id_format_id_3fb3c8ee_uniq` (`user_id`,`format_id`),
  ADD KEY `account_user_interes_format_id_f9d5e78d_fk_account_f` (`format_id`);

--
-- Indexes for table `account_user_languages_to_work`
--
ALTER TABLE `account_user_languages_to_work`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_user_languages_to_work_user_id_language_id_ddfea647_uniq` (`user_id`,`language_id`),
  ADD KEY `account_user_languag_language_id_57878ece_fk_account_l` (`language_id`);

--
-- Indexes for table `account_user_open_to`
--
ALTER TABLE `account_user_open_to`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_user_open_to_user_id_open_to_id_28f07bf2_uniq` (`user_id`,`open_to_id`),
  ADD KEY `account_user_open_to_open_to_id_8c0cf169_fk_account_open_to_id` (`open_to_id`);

--
-- Indexes for table `account_user_specialization_of_genre`
--
ALTER TABLE `account_user_specialization_of_genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_user_specializat_user_id_genre_id_5232c134_uniq` (`user_id`,`genre_id`),
  ADD KEY `account_user_special_genre_id_ef6c03c9_fk_account_g` (`genre_id`);

--
-- Indexes for table `account_user_user_permissions`
--
ALTER TABLE `account_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_user_user_permis_user_id_permission_id_48bdd28b_uniq` (`user_id`,`permission_id`),
  ADD KEY `account_user_user_pe_permission_id_66c44191_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `clubhouse_club_house`
--
ALTER TABLE `clubhouse_club_house`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clubhouse_club_house_admin_id_85c805f1_fk_account_user_id` (`admin_id`);

--
-- Indexes for table `clubhouse_club_house_member`
--
ALTER TABLE `clubhouse_club_house_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clubhouse_club_house_club_house_id_92fc9705_fk_account_u` (`club_house_id`),
  ADD KEY `clubhouse_club_house_member_id_20a1f2bc_fk_account_u` (`member_id`);

--
-- Indexes for table `clubhouse_event`
--
ALTER TABLE `clubhouse_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clubhouse_event_club_house_id_bb925628_fk_clubhouse` (`club_house_id`),
  ADD KEY `clubhouse_event_location_id_28584329_fk_account_location_id` (`location_id`);

--
-- Indexes for table `clubhouse_event_registration`
--
ALTER TABLE `clubhouse_event_registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clubhouse_event_regi_event_id_581ffa8f_fk_clubhouse` (`event_id`),
  ADD KEY `clubhouse_event_regi_registered_by_id_309c70d3_fk_account_u` (`registered_by_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_account_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `project_call`
--
ALTER TABLE `project_call`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_call_call_for_id_890be918_fk_account_open_to_id` (`call_for_id`),
  ADD KEY `project_call_format_id_25811232_fk_account_format_id` (`format_id`),
  ADD KEY `project_call_language_id_468ad8a6_fk_account_language_id` (`language_id`),
  ADD KEY `project_call_owner_id_1ef18e27_fk_account_user_id` (`owner_id`);

--
-- Indexes for table `project_call_genre`
--
ALTER TABLE `project_call_genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_call_Genre_call_id_genre_id_d0991960_uniq` (`call_id`,`genre_id`),
  ADD KEY `project_call_Genre_genre_id_896dd586_fk_account_genre_id` (`genre_id`);

--
-- Indexes for table `project_comment`
--
ALTER TABLE `project_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_comment_commented_by_id_b43cb97c_fk_account_user_id` (`commented_by_id`),
  ADD KEY `project_comment_post_id_cced476f_fk_project_post_id` (`post_id`);

--
-- Indexes for table `project_downvote`
--
ALTER TABLE `project_downvote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_downvote_downvoted_by_id_f93204f3_fk_account_user_id` (`downvoted_by_id`),
  ADD KEY `project_downvote_post_id_15726f23_fk_project_post_id` (`post_id`);

--
-- Indexes for table `project_interest`
--
ALTER TABLE `project_interest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_interest_post_id_632199cc_fk_project_post_id` (`post_id`),
  ADD KEY `project_interest_shown_by_id_5f0860d2_fk_account_user_id` (`shown_by_id`);

--
-- Indexes for table `project_like`
--
ALTER TABLE `project_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_like_liked_by_id_cadc5a83_fk_account_user_id` (`liked_by_id`),
  ADD KEY `project_like_post_id_9a0cd216_fk_project_post_id` (`post_id`);

--
-- Indexes for table `project_message`
--
ALTER TABLE `project_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_message_message_by_id_62da839a_fk_account_user_id` (`message_by_id`),
  ADD KEY `project_message_message_to_id_1b7075cf_fk_account_user_id` (`message_to_id`),
  ADD KEY `project_message_interest_id_e635ef63_fk_project_interest_id` (`interest_id`);

--
-- Indexes for table `project_pitch`
--
ALTER TABLE `project_pitch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_pitch_format_id_a4672181_fk_account_format_id` (`format_id`),
  ADD KEY `project_pitch_language_id_d758ae60_fk_account_language_id` (`language_id`),
  ADD KEY `project_pitch_owner_id_fcce08a4_fk_account_user_id` (`owner_id`);

--
-- Indexes for table `project_pitch_genre`
--
ALTER TABLE `project_pitch_genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_pitch_Genre_pitch_id_genre_id_64fc1930_uniq` (`pitch_id`,`genre_id`),
  ADD KEY `project_pitch_Genre_genre_id_d99acdbe_fk_account_genre_id` (`genre_id`);

--
-- Indexes for table `project_pitch_pitch_to_people`
--
ALTER TABLE `project_pitch_pitch_to_people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_pitch_pitch_to_people_pitch_id_user_id_b048c858_uniq` (`pitch_id`,`user_id`),
  ADD KEY `project_pitch_pitch__user_id_3b1bcb9f_fk_account_u` (`user_id`);

--
-- Indexes for table `project_post`
--
ALTER TABLE `project_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pitch_id` (`pitch_id`),
  ADD UNIQUE KEY `call_id` (`call_id`),
  ADD UNIQUE KEY `assistant_id` (`assistant_id`),
  ADD UNIQUE KEY `award_id` (`award_id`),
  ADD UNIQUE KEY `project_id` (`project_id`);

--
-- Indexes for table `project_report`
--
ALTER TABLE `project_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_report_post_id_7ba54fdd_fk_project_post_id` (`post_id`),
  ADD KEY `project_report_reported_by_id_85ac6f06_fk_account_user_id` (`reported_by_id`);

--
-- Indexes for table `project_upvote`
--
ALTER TABLE `project_upvote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_upvote_post_id_1f7e5171_fk_project_post_id` (`post_id`),
  ADD KEY `project_upvote_upvoted_by_id_63dd97b5_fk_account_user_id` (`upvoted_by_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_assistant`
--
ALTER TABLE `account_assistant`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `account_award`
--
ALTER TABLE `account_award`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `account_blocked_user`
--
ALTER TABLE `account_blocked_user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `account_chat`
--
ALTER TABLE `account_chat`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `account_company`
--
ALTER TABLE `account_company`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `account_conversation`
--
ALTER TABLE `account_conversation`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `account_format`
--
ALTER TABLE `account_format`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `account_genre`
--
ALTER TABLE `account_genre`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `account_highlight`
--
ALTER TABLE `account_highlight`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `account_language`
--
ALTER TABLE `account_language`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `account_location`
--
ALTER TABLE `account_location`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_open_to`
--
ALTER TABLE `account_open_to`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `account_project`
--
ALTER TABLE `account_project`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `account_qualification`
--
ALTER TABLE `account_qualification`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `account_rating`
--
ALTER TABLE `account_rating`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_report_people`
--
ALTER TABLE `account_report_people`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `account_testimonial`
--
ALTER TABLE `account_testimonial`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `account_user`
--
ALTER TABLE `account_user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `account_userfollowing`
--
ALTER TABLE `account_userfollowing`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `account_user_interested_format`
--
ALTER TABLE `account_user_interested_format`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `account_user_languages_to_work`
--
ALTER TABLE `account_user_languages_to_work`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `account_user_open_to`
--
ALTER TABLE `account_user_open_to`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `account_user_specialization_of_genre`
--
ALTER TABLE `account_user_specialization_of_genre`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `account_user_user_permissions`
--
ALTER TABLE `account_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `clubhouse_club_house`
--
ALTER TABLE `clubhouse_club_house`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clubhouse_club_house_member`
--
ALTER TABLE `clubhouse_club_house_member`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clubhouse_event`
--
ALTER TABLE `clubhouse_event`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clubhouse_event_registration`
--
ALTER TABLE `clubhouse_event_registration`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `project_call`
--
ALTER TABLE `project_call`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `project_call_genre`
--
ALTER TABLE `project_call_genre`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `project_comment`
--
ALTER TABLE `project_comment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `project_downvote`
--
ALTER TABLE `project_downvote`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `project_interest`
--
ALTER TABLE `project_interest`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `project_like`
--
ALTER TABLE `project_like`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `project_message`
--
ALTER TABLE `project_message`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `project_pitch`
--
ALTER TABLE `project_pitch`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `project_pitch_genre`
--
ALTER TABLE `project_pitch_genre`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `project_pitch_pitch_to_people`
--
ALTER TABLE `project_pitch_pitch_to_people`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `project_post`
--
ALTER TABLE `project_post`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `project_report`
--
ALTER TABLE `project_report`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_upvote`
--
ALTER TABLE `project_upvote`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_assistant`
--
ALTER TABLE `account_assistant`
  ADD CONSTRAINT `account_assistant_project_id_3413590e_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`),
  ADD CONSTRAINT `account_assistant_senior_link_id_cb88ff18_fk_account_user_id` FOREIGN KEY (`senior_link_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `account_assistant_user_id_e657449f_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_award`
--
ALTER TABLE `account_award`
  ADD CONSTRAINT `account_award_project_id_dbe02c08_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`),
  ADD CONSTRAINT `account_award_user_id_bdb380e5_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_blocked_user`
--
ALTER TABLE `account_blocked_user`
  ADD CONSTRAINT `account_blocked_user_blocked_by_id_fb2b209b_fk_account_user_id` FOREIGN KEY (`blocked_by_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `account_blocked_user_blocked_user_id_784b3531_fk_account_user_id` FOREIGN KEY (`blocked_user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_chat`
--
ALTER TABLE `account_chat`
  ADD CONSTRAINT `account_chat_conversation_id_1c0aeeb5_fk_account_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `account_conversation` (`id`),
  ADD CONSTRAINT `account_chat_sender_id_fa6c8461_fk_account_user_id` FOREIGN KEY (`sender_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_company`
--
ALTER TABLE `account_company`
  ADD CONSTRAINT `account_company_location_id_1db26525_fk_account_location_id` FOREIGN KEY (`location_id`) REFERENCES `account_location` (`id`),
  ADD CONSTRAINT `account_company_owner_id_cba96d59_fk_account_user_id` FOREIGN KEY (`owner_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_conversation`
--
ALTER TABLE `account_conversation`
  ADD CONSTRAINT `account_conversation_receiver_id_02551a23_fk_account_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `account_conversation_sender_id_dc7e4fe3_fk_account_user_id` FOREIGN KEY (`sender_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_highlight`
--
ALTER TABLE `account_highlight`
  ADD CONSTRAINT `account_highlight_project_id_a859a431_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`),
  ADD CONSTRAINT `account_highlight_user_id_c3727fef_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_project`
--
ALTER TABLE `account_project`
  ADD CONSTRAINT `account_project_created_by_id_6500e9e1_fk_account_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `account_project_genre_id_4b659441_fk_account_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `account_genre` (`id`),
  ADD CONSTRAINT `account_project_language_id_e488aa03_fk_account_language_id` FOREIGN KEY (`language_id`) REFERENCES `account_language` (`id`);

--
-- Constraints for table `account_qualification`
--
ALTER TABLE `account_qualification`
  ADD CONSTRAINT `account_qualification_user_id_df90edb6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_rating`
--
ALTER TABLE `account_rating`
  ADD CONSTRAINT `account_rating_rated_by_id_53e36b80_fk_account_user_id` FOREIGN KEY (`rated_by_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `account_rating_user_id_9b860557_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_report_people`
--
ALTER TABLE `account_report_people`
  ADD CONSTRAINT `account_report_peopl_reported_user_id_7826eddf_fk_account_u` FOREIGN KEY (`reported_user_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `account_report_people_reported_by_id_dd7f8473_fk_account_user_id` FOREIGN KEY (`reported_by_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_testimonial`
--
ALTER TABLE `account_testimonial`
  ADD CONSTRAINT `account_testimonial_person_id_b81e7d7e_fk_account_user_id` FOREIGN KEY (`person_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `account_testimonial_project_id_24df45e7_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`),
  ADD CONSTRAINT `account_testimonial_user_id_4f84d6dd_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_user`
--
ALTER TABLE `account_user`
  ADD CONSTRAINT `account_user_location_id_621ee626_fk_account_location_id` FOREIGN KEY (`location_id`) REFERENCES `account_location` (`id`);

--
-- Constraints for table `account_userfollowing`
--
ALTER TABLE `account_userfollowing`
  ADD CONSTRAINT `account_userfollowin_following_user_id_b685e31c_fk_account_u` FOREIGN KEY (`following_user_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `account_userfollowing_user_id_3df84ba0_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  ADD CONSTRAINT `account_user_groups_group_id_6c71f749_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `account_user_groups_user_id_14345e7b_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_user_interested_format`
--
ALTER TABLE `account_user_interested_format`
  ADD CONSTRAINT `account_user_interes_format_id_f9d5e78d_fk_account_f` FOREIGN KEY (`format_id`) REFERENCES `account_format` (`id`),
  ADD CONSTRAINT `account_user_interes_user_id_b06f5ff8_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_user_languages_to_work`
--
ALTER TABLE `account_user_languages_to_work`
  ADD CONSTRAINT `account_user_languag_language_id_57878ece_fk_account_l` FOREIGN KEY (`language_id`) REFERENCES `account_language` (`id`),
  ADD CONSTRAINT `account_user_languag_user_id_397025b1_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_user_open_to`
--
ALTER TABLE `account_user_open_to`
  ADD CONSTRAINT `account_user_open_to_open_to_id_8c0cf169_fk_account_open_to_id` FOREIGN KEY (`open_to_id`) REFERENCES `account_open_to` (`id`),
  ADD CONSTRAINT `account_user_open_to_user_id_770d0da7_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_user_specialization_of_genre`
--
ALTER TABLE `account_user_specialization_of_genre`
  ADD CONSTRAINT `account_user_special_genre_id_ef6c03c9_fk_account_g` FOREIGN KEY (`genre_id`) REFERENCES `account_genre` (`id`),
  ADD CONSTRAINT `account_user_special_user_id_36f4df88_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_user_user_permissions`
--
ALTER TABLE `account_user_user_permissions`
  ADD CONSTRAINT `account_user_user_pe_permission_id_66c44191_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `account_user_user_pe_user_id_cc42d270_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `clubhouse_club_house`
--
ALTER TABLE `clubhouse_club_house`
  ADD CONSTRAINT `clubhouse_club_house_admin_id_85c805f1_fk_account_user_id` FOREIGN KEY (`admin_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `clubhouse_club_house_member`
--
ALTER TABLE `clubhouse_club_house_member`
  ADD CONSTRAINT `clubhouse_club_house_club_house_id_92fc9705_fk_account_u` FOREIGN KEY (`club_house_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `clubhouse_club_house_member_id_20a1f2bc_fk_account_u` FOREIGN KEY (`member_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `clubhouse_event`
--
ALTER TABLE `clubhouse_event`
  ADD CONSTRAINT `clubhouse_event_club_house_id_bb925628_fk_clubhouse` FOREIGN KEY (`club_house_id`) REFERENCES `clubhouse_club_house` (`id`),
  ADD CONSTRAINT `clubhouse_event_location_id_28584329_fk_account_location_id` FOREIGN KEY (`location_id`) REFERENCES `account_location` (`id`);

--
-- Constraints for table `clubhouse_event_registration`
--
ALTER TABLE `clubhouse_event_registration`
  ADD CONSTRAINT `clubhouse_event_regi_event_id_581ffa8f_fk_clubhouse` FOREIGN KEY (`event_id`) REFERENCES `clubhouse_club_house` (`id`),
  ADD CONSTRAINT `clubhouse_event_regi_registered_by_id_309c70d3_fk_account_u` FOREIGN KEY (`registered_by_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `project_call`
--
ALTER TABLE `project_call`
  ADD CONSTRAINT `project_call_call_for_id_890be918_fk_account_open_to_id` FOREIGN KEY (`call_for_id`) REFERENCES `account_open_to` (`id`),
  ADD CONSTRAINT `project_call_format_id_25811232_fk_account_format_id` FOREIGN KEY (`format_id`) REFERENCES `account_format` (`id`),
  ADD CONSTRAINT `project_call_language_id_468ad8a6_fk_account_language_id` FOREIGN KEY (`language_id`) REFERENCES `account_language` (`id`),
  ADD CONSTRAINT `project_call_owner_id_1ef18e27_fk_account_user_id` FOREIGN KEY (`owner_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `project_call_genre`
--
ALTER TABLE `project_call_genre`
  ADD CONSTRAINT `project_call_Genre_call_id_b579c36d_fk_project_call_id` FOREIGN KEY (`call_id`) REFERENCES `project_call` (`id`),
  ADD CONSTRAINT `project_call_Genre_genre_id_896dd586_fk_account_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `account_genre` (`id`);

--
-- Constraints for table `project_comment`
--
ALTER TABLE `project_comment`
  ADD CONSTRAINT `project_comment_commented_by_id_b43cb97c_fk_account_user_id` FOREIGN KEY (`commented_by_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `project_comment_post_id_cced476f_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`);

--
-- Constraints for table `project_downvote`
--
ALTER TABLE `project_downvote`
  ADD CONSTRAINT `project_downvote_downvoted_by_id_f93204f3_fk_account_user_id` FOREIGN KEY (`downvoted_by_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `project_downvote_post_id_15726f23_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`);

--
-- Constraints for table `project_interest`
--
ALTER TABLE `project_interest`
  ADD CONSTRAINT `project_interest_post_id_632199cc_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`),
  ADD CONSTRAINT `project_interest_shown_by_id_5f0860d2_fk_account_user_id` FOREIGN KEY (`shown_by_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `project_like`
--
ALTER TABLE `project_like`
  ADD CONSTRAINT `project_like_liked_by_id_cadc5a83_fk_account_user_id` FOREIGN KEY (`liked_by_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `project_like_post_id_9a0cd216_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`);

--
-- Constraints for table `project_message`
--
ALTER TABLE `project_message`
  ADD CONSTRAINT `project_message_interest_id_e635ef63_fk_project_interest_id` FOREIGN KEY (`interest_id`) REFERENCES `project_interest` (`id`),
  ADD CONSTRAINT `project_message_message_by_id_62da839a_fk_account_user_id` FOREIGN KEY (`message_by_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `project_message_message_to_id_1b7075cf_fk_account_user_id` FOREIGN KEY (`message_to_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `project_pitch`
--
ALTER TABLE `project_pitch`
  ADD CONSTRAINT `project_pitch_format_id_a4672181_fk_account_format_id` FOREIGN KEY (`format_id`) REFERENCES `account_format` (`id`),
  ADD CONSTRAINT `project_pitch_language_id_d758ae60_fk_account_language_id` FOREIGN KEY (`language_id`) REFERENCES `account_language` (`id`),
  ADD CONSTRAINT `project_pitch_owner_id_fcce08a4_fk_account_user_id` FOREIGN KEY (`owner_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `project_pitch_genre`
--
ALTER TABLE `project_pitch_genre`
  ADD CONSTRAINT `project_pitch_Genre_genre_id_d99acdbe_fk_account_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `account_genre` (`id`),
  ADD CONSTRAINT `project_pitch_Genre_pitch_id_f74ab68d_fk_project_pitch_id` FOREIGN KEY (`pitch_id`) REFERENCES `project_pitch` (`id`);

--
-- Constraints for table `project_pitch_pitch_to_people`
--
ALTER TABLE `project_pitch_pitch_to_people`
  ADD CONSTRAINT `project_pitch_pitch__pitch_id_3688b28c_fk_project_p` FOREIGN KEY (`pitch_id`) REFERENCES `project_pitch` (`id`),
  ADD CONSTRAINT `project_pitch_pitch__user_id_3b1bcb9f_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `project_post`
--
ALTER TABLE `project_post`
  ADD CONSTRAINT `project_post_assistant_id_7d57ada0_fk_account_assistant_id` FOREIGN KEY (`assistant_id`) REFERENCES `account_assistant` (`id`),
  ADD CONSTRAINT `project_post_award_id_516c5efe_fk_account_award_id` FOREIGN KEY (`award_id`) REFERENCES `account_award` (`id`),
  ADD CONSTRAINT `project_post_call_id_60bf2917_fk_project_call_id` FOREIGN KEY (`call_id`) REFERENCES `project_call` (`id`),
  ADD CONSTRAINT `project_post_pitch_id_157b5cf9_fk_project_pitch_id` FOREIGN KEY (`pitch_id`) REFERENCES `project_pitch` (`id`),
  ADD CONSTRAINT `project_post_project_id_7ba7481c_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`);

--
-- Constraints for table `project_report`
--
ALTER TABLE `project_report`
  ADD CONSTRAINT `project_report_post_id_7ba54fdd_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`),
  ADD CONSTRAINT `project_report_reported_by_id_85ac6f06_fk_account_user_id` FOREIGN KEY (`reported_by_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `project_upvote`
--
ALTER TABLE `project_upvote`
  ADD CONSTRAINT `project_upvote_post_id_1f7e5171_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`),
  ADD CONSTRAINT `project_upvote_upvoted_by_id_63dd97b5_fk_account_user_id` FOREIGN KEY (`upvoted_by_id`) REFERENCES `account_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
