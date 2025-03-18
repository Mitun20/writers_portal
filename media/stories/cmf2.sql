-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2021 at 07:05 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmf2`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_course`
--

CREATE TABLE `account_course` (
  `id` int(11) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `age_limit` int(10) UNSIGNED NOT NULL,
  `overview` longtext NOT NULL,
  `prerequisite` longtext NOT NULL,
  `learning_outcome` longtext NOT NULL,
  `others` longtext NOT NULL,
  `gurukulam_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_course`
--

INSERT INTO `account_course` (`id`, `topic`, `age_limit`, `overview`, `prerequisite`, `learning_outcome`, `others`, `gurukulam_id`) VALUES
(1, 'New Course', 45, 'Overview goes her', 'Nothing', 'All', 'Othrts', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_district`
--

CREATE TABLE `account_district` (
  `id` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_district`
--

INSERT INTO `account_district` (`id`, `district_name`) VALUES
(1, 'Coimbatore'),
(2, 'Erode'),
(3, 'Chennai');

-- --------------------------------------------------------

--
-- Table structure for table `account_event_organizer`
--

CREATE TABLE `account_event_organizer` (
  `id` int(11) NOT NULL,
  `about_us` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_event_organizer`
--

INSERT INTO `account_event_organizer` (`id`, `about_us`, `user_id`) VALUES
(1, '<p>GBK Event Organizer in Bangalore since 2008 and offers some of the best event management services in the whole of the Tamilnadu and near by states.</p> <br><p>Since our inception we have developed key qualities which have resulted in a privileged position as event organisers and party planners within the industry. We are proud to cater in Bangalore’s most prestigious venues and our event organisers look after an impressive client base from a broad range of backgrounds.</p><p><br></p>', 2);

-- --------------------------------------------------------

--
-- Table structure for table `account_event_organizer_highlight`
--

CREATE TABLE `account_event_organizer_highlight` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `video_link` varchar(200) NOT NULL,
  `event_organizer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_event_organizer_highlight_highlight_category`
--

CREATE TABLE `account_event_organizer_highlight_highlight_category` (
  `id` int(11) NOT NULL,
  `event_organizer_highlight_id` int(11) NOT NULL,
  `highlight_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_event_performer`
--

CREATE TABLE `account_event_performer` (
  `id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `event_organizer_id` int(11) NOT NULL,
  `musician_id` int(11) DEFAULT NULL,
  `troupe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_event_performer`
--

INSERT INTO `account_event_performer` (`id`, `status`, `event_organizer_id`, `musician_id`, `troupe_id`) VALUES
(9, 'A', 1, 1, NULL),
(10, 'S', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_gurukulam`
--

CREATE TABLE `account_gurukulam` (
  `id` int(11) NOT NULL,
  `about_us` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_gurukulam`
--

INSERT INTO `account_gurukulam` (`id`, `about_us`, `user_id`, `phone_no`) VALUES
(1, 'about us content goes here', 5, '4444444444');

-- --------------------------------------------------------

--
-- Table structure for table `account_gurukulam_award`
--

CREATE TABLE `account_gurukulam_award` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `gurukulam_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_gurukulam_award`
--

INSERT INTO `account_gurukulam_award` (`id`, `title`, `photo`, `gurukulam_id`) VALUES
(1, 'New Award', 'gurukulam/award/hari.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_gurukulam_skill`
--

CREATE TABLE `account_gurukulam_skill` (
  `id` int(11) NOT NULL,
  `gurukulam_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_gurukulam_skill`
--

INSERT INTO `account_gurukulam_skill` (`id`, `gurukulam_id`, `skill_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_gurukulam_testimonial`
--

CREATE TABLE `account_gurukulam_testimonial` (
  `id` int(11) NOT NULL,
  `testimonial` longtext NOT NULL,
  `gurukulam_id` int(11) NOT NULL,
  `musician_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_gurukulam_testimonial`
--

INSERT INTO `account_gurukulam_testimonial` (`id`, `testimonial`, `gurukulam_id`, `musician_id`) VALUES
(1, 'Hai hello', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_highlight_category`
--

CREATE TABLE `account_highlight_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_highlight_category`
--

INSERT INTO `account_highlight_category` (`id`, `category_name`) VALUES
(1, 'Key Event');

-- --------------------------------------------------------

--
-- Table structure for table `account_key_performer`
--

CREATE TABLE `account_key_performer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `profile_photo` varchar(100) NOT NULL,
  `musician_id` int(11) DEFAULT NULL,
  `troupe_id` int(11) NOT NULL,
  `status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_key_performer`
--

INSERT INTO `account_key_performer` (`id`, `name`, `profile_photo`, `musician_id`, `troupe_id`, `status`) VALUES
(1, NULL, '', 1, 1, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `account_lecture_video`
--

CREATE TABLE `account_lecture_video` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `video` varchar(200) NOT NULL,
  `gurukulam_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_lecture_video`
--

INSERT INTO `account_lecture_video` (`id`, `title`, `video`, `gurukulam_id`) VALUES
(1, 'New Lecture Video', 'https://www.youtube.com/watch?v=qRPNyYZrFwE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_musician`
--

CREATE TABLE `account_musician` (
  `id` int(11) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `profession` varchar(50) NOT NULL,
  `about_me` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_musician`
--

INSERT INTO `account_musician` (`id`, `dob`, `gender`, `profession`, `about_me`, `user_id`) VALUES
(1, '2021-05-24', 'M', 'Sinnger', 'Completed my Diploma in music, Teacher training in music and Bachelor in music. I have rendered many bajan programs. I can teach Bajans too.. B grade artist in AIR Devotional category. Residing in Germany and can take classes online. I really welcome students who passionately wish to learn and enjoy music', 3),
(2, '2021-05-27', 'M', 'Instruments', 'About me content goes here', 6),
(3, '2021-05-31', 'M', 'Keyboard Piano-ist', 'Hai i am Keyboard Piano-ist. And another content goes here.', 7),
(4, '2021-06-19', 'M', 'Singer', 'Hello online world, here i', 8),
(5, '2021-06-19', 'M', 'Sinnger', 'Hello guys i am hari, Hp Krish..!', 9);

-- --------------------------------------------------------

--
-- Table structure for table `account_musician_award`
--

CREATE TABLE `account_musician_award` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `musician_id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_musician_award`
--

INSERT INTO `account_musician_award` (`id`, `title`, `musician_id`, `image`) VALUES
(1, 'MIRCHI MUSIC AWARDS', 1, 'musician_award/download_OI3s29q.jpg'),
(2, 'Bill Board Awards', 1, 'musician_award/download_1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `account_musician_gurukulam`
--

CREATE TABLE `account_musician_gurukulam` (
  `id` int(11) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `gurukulam_id` int(11) NOT NULL,
  `musician_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_musician_gurukulam`
--

INSERT INTO `account_musician_gurukulam` (`id`, `status`, `gurukulam_id`, `musician_id`) VALUES
(2, 'R', 1, 3),
(6, 'A', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_musician_highlight`
--

CREATE TABLE `account_musician_highlight` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `video_link` varchar(200) NOT NULL,
  `musician_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_musician_highlight_highlight_category`
--

CREATE TABLE `account_musician_highlight_highlight_category` (
  `id` int(11) NOT NULL,
  `musician_highlight_id` int(11) NOT NULL,
  `highlight_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_musician_skill`
--

CREATE TABLE `account_musician_skill` (
  `id` int(11) NOT NULL,
  `musician_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `skill_level_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_musician_skill`
--

INSERT INTO `account_musician_skill` (`id`, `musician_id`, `skill_id`, `skill_level_id`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 2, 1),
(4, 3, 3, 1),
(5, 4, 1, 1),
(6, 4, 2, 1),
(7, 4, 3, 1),
(8, 5, 1, 1),
(9, 5, 2, 1),
(10, 5, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_post`
--

CREATE TABLE `account_post` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `posted_on` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `interest_id` int(11) DEFAULT NULL,
  `invitation_id` int(11) DEFAULT NULL,
  `musician_highlight_id` int(11) DEFAULT NULL,
  `likes` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_post`
--

INSERT INTO `account_post` (`id`, `content`, `posted_on`, `user_id`, `location_id`, `interest_id`, `invitation_id`, `musician_highlight_id`, `likes`) VALUES
(5, 'I am  in <a  href=\"/event_details/5/\">Hade Event</a> <br> <img class=\"img-fluid\" src=\"/media/event_poster/eventer_q1HbMH4.jpg\">', '2021-06-21 10:30:38.869537', 6, 1, NULL, NULL, NULL, 1),
(8, 'Hello Guys <br>\r\nDemo post', '2021-06-24 15:45:54.062836', 6, 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_post_comment`
--

CREATE TABLE `account_post_comment` (
  `id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `commented_on` datetime(6) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_post_comment`
--

INSERT INTO `account_post_comment` (`id`, `comment`, `commented_on`, `post_id`, `user_id`) VALUES
(1, 'Hello premji', '2021-06-25 10:41:55.667675', 5, 3),
(2, 'Mahilchi', '2021-06-26 09:51:04.975041', 5, 3),
(3, 'Sirapu', '2021-06-26 09:58:13.326420', 5, 3),
(4, 'Comment 1', '2021-06-26 09:59:16.767442', 5, 3),
(5, 'Comment 1', '2021-06-26 09:59:26.850990', 5, 3),
(6, 'Comment 2', '2021-06-26 10:00:28.164322', 5, 3),
(7, 'Comment 2', '2021-06-26 10:01:26.248550', 5, 3),
(8, 'Comment 2', '2021-06-26 10:01:49.762808', 5, 3),
(9, 'Comment 2', '2021-06-26 10:02:23.182150', 5, 3),
(10, 'Comment 2', '2021-06-26 10:03:18.336928', 5, 3),
(11, 'Comment 2', '2021-06-26 10:03:32.126775', 5, 3),
(12, 'Comment 2', '2021-06-26 10:03:55.552794', 5, 3),
(13, 'Comment 2', '2021-06-26 10:04:54.828655', 5, 3),
(14, 'Comment 2', '2021-06-26 10:05:03.610965', 5, 3),
(15, 'Comment 2', '2021-06-26 10:05:14.724123', 5, 3),
(16, 'comment 3', '2021-06-26 10:05:44.864554', 5, 3),
(26, 'hai', '2021-06-29 09:44:31.264481', 8, 3),
(27, 'new comment 2', '2021-06-29 10:07:34.696281', 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `account_post_user_likes`
--

CREATE TABLE `account_post_user_likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_post_user_likes`
--

INSERT INTO `account_post_user_likes` (`id`, `post_id`, `user_id`) VALUES
(48, 5, 3),
(61, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `account_reply`
--

CREATE TABLE `account_reply` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `reply` longtext NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_reply`
--

INSERT INTO `account_reply` (`id`, `created`, `reply`, `comment_id`, `user_id`) VALUES
(1, '2021-06-28 15:03:53.552884', 'Sollu nanba', 1, 6),
(6, '2021-06-28 16:37:31.860969', 'Hai', 1, 3),
(7, '2021-06-28 16:37:36.564076', 'hi', 1, 3),
(24, '2021-06-29 10:26:41.745218', 'hai', 26, 3);

-- --------------------------------------------------------

--
-- Table structure for table `account_skill`
--

CREATE TABLE `account_skill` (
  `id` int(11) NOT NULL,
  `skill_name` varchar(50) NOT NULL,
  `skill_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_skill`
--

INSERT INTO `account_skill` (`id`, `skill_name`, `skill_category_id`) VALUES
(1, 'Flute', 2),
(2, 'Veena', 2),
(3, 'Carnatic', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_skill_category`
--

CREATE TABLE `account_skill_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_skill_category`
--

INSERT INTO `account_skill_category` (`id`, `category_name`) VALUES
(1, 'Vocal'),
(2, 'Instrument');

-- --------------------------------------------------------

--
-- Table structure for table `account_skill_level`
--

CREATE TABLE `account_skill_level` (
  `id` int(11) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_skill_level`
--

INSERT INTO `account_skill_level` (`id`, `level`) VALUES
(1, 'Performer');

-- --------------------------------------------------------

--
-- Table structure for table `account_troupe`
--

CREATE TABLE `account_troupe` (
  `id` int(11) NOT NULL,
  `president` varchar(100) NOT NULL,
  `about_us` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_troupe`
--

INSERT INTO `account_troupe` (`id`, `president`, `about_us`, `user_id`) VALUES
(1, 'Umk', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 4);

-- --------------------------------------------------------

--
-- Table structure for table `account_troupe_highlight`
--

CREATE TABLE `account_troupe_highlight` (
  `id` int(11) NOT NULL,
  `title` varchar(400) NOT NULL,
  `video_link` varchar(200) NOT NULL,
  `troupe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_troupe_highlight_highlight_category`
--

CREATE TABLE `account_troupe_highlight_highlight_category` (
  `id` int(11) NOT NULL,
  `troupe_highlight_id` int(11) NOT NULL,
  `highlight_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_troupe_skill`
--

CREATE TABLE `account_troupe_skill` (
  `id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `troupe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_troupe_skill`
--

INSERT INTO `account_troupe_skill` (`id`, `skill_id`, `troupe_id`) VALUES
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_user`
--

CREATE TABLE `account_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(60) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `name` varchar(400) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `verified_email` tinyint(1) NOT NULL,
  `address` longtext,
  `mobile_no` varchar(10) DEFAULT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `cover_picture` varchar(100) DEFAULT NULL,
  `registered_on` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `district_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_user`
--

INSERT INTO `account_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `name`, `email`, `verified_email`, `address`, `mobile_no`, `profile_picture`, `cover_picture`, `registered_on`, `is_active`, `is_staff`, `district_id`) VALUES
(1, 'pbkdf2_sha256$260000$vUXDXwhfRSHYzCamszOIyj$tEsmXNFIk0VnIb6LCRZ21YLKO4q+i1P87oIlRgJ/mc4=', '2021-06-29 09:58:39.932231', 1, 'admin', '', '', '', NULL, 0, NULL, NULL, '', '', '2021-05-24', 1, 1, NULL),
(2, 'pbkdf2_sha256$260000$w53uhv69hgNgLnCS6Zinax$ZYqvSPwCqmDvlPb3QnaF0mN2qTZGOkRMAF2P/pxoz1Y=', '2021-06-22 18:40:10.270685', 0, 'eventer@gmail.com', '', '', 'GBK Event Organizer', 'eventer@gmail.com', 1, 'gudugathur', '9444305984', '', 'eventer_EQg1wBn.jpg', '2021-05-24', 1, 0, 1),
(3, 'pbkdf2_sha256$260000$HdBYL5c1uEfgM2Yn91kFKX$/wicrB3hB63NkaxXFk6QIGIHqVjTp/29VVC19EmF1QM=', '2021-06-24 12:37:30.474922', 0, 'musician@gmail.com', 'Madhan Musician', '', '', 'musician@gmail.com', 0, 'Gudimangalam', '9444305984', 'a87zR030_400x400.jpg', '', '2021-05-24', 1, 0, 1),
(4, 'pbkdf2_sha256$260000$6QWeDg0lme7XlPFpVRrClQ$gpAbKk4y1VbGLGjnCEY3q/GE5x4ZRuc09vYkBpYrhSk=', '2021-06-23 10:00:44.368399', 0, 'troupe@gmail.com', '', '', 'Umk Troupe', 'troupe@gmail.com', 1, 'ddd', '9444305984', '', 'eventer_qwXQM8D.jpg', '2021-05-26', 1, 0, 1),
(5, 'pbkdf2_sha256$260000$2EEQFED5Zb2NhLjvDJwEG6$ncj0Q8bF8oVB10e1t3GCkGBjMPSBCtRRsostelwFf4k=', '2021-06-22 14:31:28.332274', 0, 'gurukulam@gmail.com', '', '', 'MK Gurukulam', 'gurukulam@gmail.com', 1, 'gurukulam@gmail.com', NULL, '', 'Madhan_umk.jpg', '2021-05-26', 1, 0, 2),
(6, 'pbkdf2_sha256$260000$SkRcq9VFpmyinMWR5bTAEM$GrYCOCoIU699Ko+zmHVQS9iQiVrZubHYZkQW0/MNzuk=', '2021-06-21 11:38:26.000000', 0, 'musician1@gmail.com', 'Premji', '', '', 'musician1@gmail.com', 1, 'Covai', '9444305984', 'thumb.jpg', '', '2021-05-27', 1, 0, 2),
(7, 'pbkdf2_sha256$260000$V6ZXmNFt6xKmTm8PDHmxYo$IJ7xh6c/g1xynP4/+1fVrWvjx4ah5UExUkb4CehifpU=', '2021-05-31 16:25:59.243747', 0, 'karthick@gmail.com', 'Karthick Kumar', '', '', 'karthick@gmail.com', 1, 'Hi i am karthick. About content goes here', '9444305984', 'photo.jpg', '', '2021-05-31', 1, 0, 3),
(8, 'pbkdf2_sha256$260000$2BOAwGsh5Vo5F4w6IM6p0c$hEYwv018URmxQY105+n0EWdaTJQzIFln3UJFVPYreyA=', NULL, 0, 'musician2@gmail.com', 'Rajamanikam', '', '', 'musician2@gmail.com', 1, 'Neiveli', '9444305984', 'raj.jpg', '', '2021-06-19', 1, 0, 1),
(9, 'pbkdf2_sha256$260000$PkcgpjVtEJlpTMoTGOuyHD$GFDSo36qq5JIcxg7adBhbfByB3xgmYVHBWZqV7lXvAo=', NULL, 0, 'musician3@gmail.com', 'Hari Prasad', '', '', 'musician3@gmail.com', 1, 'Neiveli', '9444305984', 'hari.jpg', '', '2021-06-19', 1, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `account_userfollowing`
--

CREATE TABLE `account_userfollowing` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `following_user_id_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_userfollowing`
--

INSERT INTO `account_userfollowing` (`id`, `created`, `following_user_id_id`, `user_id`) VALUES
(17, '2021-06-21 14:57:22.548886', 6, 3),
(20, '2021-06-21 14:58:24.190827', 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `account_user_groups`
--

CREATE TABLE `account_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_user_groups`
--

INSERT INTO `account_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(4, 5, 4),
(5, 6, 2),
(6, 7, 2),
(7, 8, 2),
(8, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `account_user_user_permissions`
--

CREATE TABLE `account_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Event Organizer'),
(4, 'Gurukulam'),
(2, 'Musician'),
(3, 'Troupe');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(25, 'Can add district', 7, 'add_district'),
(26, 'Can change district', 7, 'change_district'),
(27, 'Can delete district', 7, 'delete_district'),
(28, 'Can view district', 7, 'view_district'),
(29, 'Can add gurukulam', 8, 'add_gurukulam'),
(30, 'Can change gurukulam', 8, 'change_gurukulam'),
(31, 'Can delete gurukulam', 8, 'delete_gurukulam'),
(32, 'Can view gurukulam', 8, 'view_gurukulam'),
(33, 'Can add highlight_ category', 9, 'add_highlight_category'),
(34, 'Can change highlight_ category', 9, 'change_highlight_category'),
(35, 'Can delete highlight_ category', 9, 'delete_highlight_category'),
(36, 'Can view highlight_ category', 9, 'view_highlight_category'),
(37, 'Can add musician', 10, 'add_musician'),
(38, 'Can change musician', 10, 'change_musician'),
(39, 'Can delete musician', 10, 'delete_musician'),
(40, 'Can view musician', 10, 'view_musician'),
(41, 'Can add skill_ category', 11, 'add_skill_category'),
(42, 'Can change skill_ category', 11, 'change_skill_category'),
(43, 'Can delete skill_ category', 11, 'delete_skill_category'),
(44, 'Can view skill_ category', 11, 'view_skill_category'),
(45, 'Can add skill_ level', 12, 'add_skill_level'),
(46, 'Can change skill_ level', 12, 'change_skill_level'),
(47, 'Can delete skill_ level', 12, 'delete_skill_level'),
(48, 'Can view skill_ level', 12, 'view_skill_level'),
(49, 'Can add troupe', 13, 'add_troupe'),
(50, 'Can change troupe', 13, 'change_troupe'),
(51, 'Can delete troupe', 13, 'delete_troupe'),
(52, 'Can view troupe', 13, 'view_troupe'),
(53, 'Can add troupe_ highlight', 14, 'add_troupe_highlight'),
(54, 'Can change troupe_ highlight', 14, 'change_troupe_highlight'),
(55, 'Can delete troupe_ highlight', 14, 'delete_troupe_highlight'),
(56, 'Can view troupe_ highlight', 14, 'view_troupe_highlight'),
(57, 'Can add skill', 15, 'add_skill'),
(58, 'Can change skill', 15, 'change_skill'),
(59, 'Can delete skill', 15, 'delete_skill'),
(60, 'Can view skill', 15, 'view_skill'),
(61, 'Can add musician_ skill', 16, 'add_musician_skill'),
(62, 'Can change musician_ skill', 16, 'change_musician_skill'),
(63, 'Can delete musician_ skill', 16, 'delete_musician_skill'),
(64, 'Can view musician_ skill', 16, 'view_musician_skill'),
(65, 'Can add musician_ highlight', 17, 'add_musician_highlight'),
(66, 'Can change musician_ highlight', 17, 'change_musician_highlight'),
(67, 'Can delete musician_ highlight', 17, 'delete_musician_highlight'),
(68, 'Can view musician_ highlight', 17, 'view_musician_highlight'),
(69, 'Can add musician_ gurukulam', 18, 'add_musician_gurukulam'),
(70, 'Can change musician_ gurukulam', 18, 'change_musician_gurukulam'),
(71, 'Can delete musician_ gurukulam', 18, 'delete_musician_gurukulam'),
(72, 'Can view musician_ gurukulam', 18, 'view_musician_gurukulam'),
(73, 'Can add musician_ award', 19, 'add_musician_award'),
(74, 'Can change musician_ award', 19, 'change_musician_award'),
(75, 'Can delete musician_ award', 19, 'delete_musician_award'),
(76, 'Can view musician_ award', 19, 'view_musician_award'),
(77, 'Can add lecture_ video', 20, 'add_lecture_video'),
(78, 'Can change lecture_ video', 20, 'change_lecture_video'),
(79, 'Can delete lecture_ video', 20, 'delete_lecture_video'),
(80, 'Can view lecture_ video', 20, 'view_lecture_video'),
(81, 'Can add gurukulam_ testimonial', 21, 'add_gurukulam_testimonial'),
(82, 'Can change gurukulam_ testimonial', 21, 'change_gurukulam_testimonial'),
(83, 'Can delete gurukulam_ testimonial', 21, 'delete_gurukulam_testimonial'),
(84, 'Can view gurukulam_ testimonial', 21, 'view_gurukulam_testimonial'),
(85, 'Can add gurukulam_ skill', 22, 'add_gurukulam_skill'),
(86, 'Can change gurukulam_ skill', 22, 'change_gurukulam_skill'),
(87, 'Can delete gurukulam_ skill', 22, 'delete_gurukulam_skill'),
(88, 'Can view gurukulam_ skill', 22, 'view_gurukulam_skill'),
(89, 'Can add gurukulam_ award', 23, 'add_gurukulam_award'),
(90, 'Can change gurukulam_ award', 23, 'change_gurukulam_award'),
(91, 'Can delete gurukulam_ award', 23, 'delete_gurukulam_award'),
(92, 'Can view gurukulam_ award', 23, 'view_gurukulam_award'),
(93, 'Can add event_ organizer', 24, 'add_event_organizer'),
(94, 'Can change event_ organizer', 24, 'change_event_organizer'),
(95, 'Can delete event_ organizer', 24, 'delete_event_organizer'),
(96, 'Can view event_ organizer', 24, 'view_event_organizer'),
(97, 'Can add course', 25, 'add_course'),
(98, 'Can change course', 25, 'change_course'),
(99, 'Can delete course', 25, 'delete_course'),
(100, 'Can view course', 25, 'view_course'),
(101, 'Can add key_ performer', 26, 'add_key_performer'),
(102, 'Can change key_ performer', 26, 'change_key_performer'),
(103, 'Can delete key_ performer', 26, 'delete_key_performer'),
(104, 'Can view key_ performer', 26, 'view_key_performer'),
(105, 'Can add event_ category', 27, 'add_event_category'),
(106, 'Can change event_ category', 27, 'change_event_category'),
(107, 'Can delete event_ category', 27, 'delete_event_category'),
(108, 'Can view event_ category', 27, 'view_event_category'),
(109, 'Can add event', 28, 'add_event'),
(110, 'Can change event', 28, 'change_event'),
(111, 'Can delete event', 28, 'delete_event'),
(112, 'Can view event', 28, 'view_event'),
(113, 'Can add send_ request', 29, 'add_send_request'),
(114, 'Can change send_ request', 29, 'change_send_request'),
(115, 'Can delete send_ request', 29, 'delete_send_request'),
(116, 'Can view send_ request', 29, 'view_send_request'),
(117, 'Can add subscription', 30, 'add_subscription'),
(118, 'Can change subscription', 30, 'change_subscription'),
(119, 'Can delete subscription', 30, 'delete_subscription'),
(120, 'Can view subscription', 30, 'view_subscription'),
(121, 'Can add subscription_ type', 31, 'add_subscription_type'),
(122, 'Can change subscription_ type', 31, 'change_subscription_type'),
(123, 'Can delete subscription_ type', 31, 'delete_subscription_type'),
(124, 'Can view subscription_ type', 31, 'view_subscription_type'),
(125, 'Can add event_ get_ request', 32, 'add_event_get_request'),
(126, 'Can change event_ get_ request', 32, 'change_event_get_request'),
(127, 'Can delete event_ get_ request', 32, 'delete_event_get_request'),
(128, 'Can view event_ get_ request', 32, 'view_event_get_request'),
(129, 'Can add event_ type', 33, 'add_event_type'),
(130, 'Can change event_ type', 33, 'change_event_type'),
(131, 'Can delete event_ type', 33, 'delete_event_type'),
(132, 'Can view event_ type', 33, 'view_event_type'),
(133, 'Can add interest', 32, 'add_interest'),
(134, 'Can change interest', 32, 'change_interest'),
(135, 'Can delete interest', 32, 'delete_interest'),
(136, 'Can view interest', 32, 'view_interest'),
(137, 'Can add invitation', 29, 'add_invitation'),
(138, 'Can change invitation', 29, 'change_invitation'),
(139, 'Can delete invitation', 29, 'delete_invitation'),
(140, 'Can view invitation', 29, 'view_invitation'),
(141, 'Can add event_ skill', 34, 'add_event_skill'),
(142, 'Can change event_ skill', 34, 'change_event_skill'),
(143, 'Can delete event_ skill', 34, 'delete_event_skill'),
(144, 'Can view event_ skill', 34, 'view_event_skill'),
(145, 'Can add message', 35, 'add_message'),
(146, 'Can change message', 35, 'change_message'),
(147, 'Can delete message', 35, 'delete_message'),
(148, 'Can view message', 35, 'view_message'),
(149, 'Can add troupe_ skill', 36, 'add_troupe_skill'),
(150, 'Can change troupe_ skill', 36, 'change_troupe_skill'),
(151, 'Can delete troupe_ skill', 36, 'delete_troupe_skill'),
(152, 'Can view troupe_ skill', 36, 'view_troupe_skill'),
(153, 'Can add event_ organizer_ highlight', 37, 'add_event_organizer_highlight'),
(154, 'Can change event_ organizer_ highlight', 37, 'change_event_organizer_highlight'),
(155, 'Can delete event_ organizer_ highlight', 37, 'delete_event_organizer_highlight'),
(156, 'Can view event_ organizer_ highlight', 37, 'view_event_organizer_highlight'),
(157, 'Can add event_ performer', 38, 'add_event_performer'),
(158, 'Can change event_ performer', 38, 'change_event_performer'),
(159, 'Can delete event_ performer', 38, 'delete_event_performer'),
(160, 'Can view event_ performer', 38, 'view_event_performer'),
(161, 'Can add event_ performer', 39, 'add_event_performer'),
(162, 'Can change event_ performer', 39, 'change_event_performer'),
(163, 'Can delete event_ performer', 39, 'delete_event_performer'),
(164, 'Can view event_ performer', 39, 'view_event_performer'),
(165, 'Can add user following', 40, 'add_userfollowing'),
(166, 'Can change user following', 40, 'change_userfollowing'),
(167, 'Can delete user following', 40, 'delete_userfollowing'),
(168, 'Can view user following', 40, 'view_userfollowing'),
(169, 'Can add post', 41, 'add_post'),
(170, 'Can change post', 41, 'change_post'),
(171, 'Can delete post', 41, 'delete_post'),
(172, 'Can view post', 41, 'view_post'),
(173, 'Can add post_ comment', 42, 'add_post_comment'),
(174, 'Can change post_ comment', 42, 'change_post_comment'),
(175, 'Can delete post_ comment', 42, 'delete_post_comment'),
(176, 'Can view post_ comment', 42, 'view_post_comment'),
(177, 'Can add highlight', 43, 'add_highlight'),
(178, 'Can change highlight', 43, 'change_highlight'),
(179, 'Can delete highlight', 43, 'delete_highlight'),
(180, 'Can view highlight', 43, 'view_highlight'),
(181, 'Can add reply', 44, 'add_reply'),
(182, 'Can change reply', 44, 'change_reply'),
(183, 'Can delete reply', 44, 'delete_reply'),
(184, 'Can view reply', 44, 'view_reply');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-05-24 09:28:28.794212', '1', 'Coimbatore', 1, '[{\"added\": {}}]', 7, 1),
(2, '2021-05-24 09:28:54.311763', '1', 'Event Organizer', 1, '[{\"added\": {}}]', 3, 1),
(3, '2021-05-24 09:29:00.159891', '2', 'eventer@gmail.com', 1, '[{\"added\": {}}]', 6, 1),
(4, '2021-05-24 09:29:17.886452', '1', 'eventer@gmail.com', 1, '[{\"added\": {}}]', 24, 1),
(5, '2021-05-24 09:56:54.972332', '1', 'Online', 1, '[{\"added\": {}}]', 33, 1),
(6, '2021-05-24 09:57:02.564615', '2', 'Offline', 1, '[{\"added\": {}}]', 33, 1),
(7, '2021-05-24 09:57:40.742727', '1', 'Orchestra', 1, '[{\"added\": {}}]', 27, 1),
(8, '2021-05-24 09:58:03.740836', '2', 'Bhajan', 1, '[{\"added\": {}}]', 27, 1),
(9, '2021-05-24 09:58:20.759103', '3', 'Contest', 1, '[{\"added\": {}}]', 27, 1),
(10, '2021-05-24 10:17:52.563131', '1', 'Event 1', 1, '[{\"added\": {}}]', 28, 1),
(11, '2021-05-24 10:27:23.826903', '1', 'Event 1', 2, '[{\"changed\": {\"fields\": [\"To date\"]}}]', 28, 1),
(12, '2021-05-24 10:27:36.373191', '1', 'Event 1', 2, '[{\"changed\": {\"fields\": [\"To date\"]}}]', 28, 1),
(13, '2021-05-24 10:27:49.673983', '1', 'Event 1', 2, '[{\"changed\": {\"fields\": [\"To date\"]}}]', 28, 1),
(14, '2021-05-24 10:46:20.265084', '1', 'Event 1', 2, '[{\"changed\": {\"fields\": [\"Venue\"]}}]', 28, 1),
(15, '2021-05-24 10:55:59.147529', '2', 'Madhan', 2, '[{\"changed\": {\"fields\": [\"To date\"]}}]', 28, 1),
(16, '2021-05-24 10:57:45.017467', '2', 'Madhan', 2, '[{\"changed\": {\"fields\": [\"From date\"]}}]', 28, 1),
(17, '2021-05-24 12:22:42.010017', '2', 'Musician', 1, '[{\"added\": {}}]', 3, 1),
(18, '2021-05-24 12:22:46.457345', '3', 'Madhan Musician', 1, '[{\"added\": {}}]', 6, 1),
(19, '2021-05-24 12:22:59.303820', '1', 'Madhan Musician', 1, '[{\"added\": {}}]', 10, 1),
(20, '2021-05-24 12:23:01.420247', '1', 'Invitation object (1)', 1, '[{\"added\": {}}]', 29, 1),
(21, '2021-05-25 10:07:19.417108', '1', 'Vocal', 1, '[{\"added\": {}}]', 11, 1),
(22, '2021-05-25 10:07:27.220262', '2', 'Instrument', 1, '[{\"added\": {}}]', 11, 1),
(23, '2021-05-25 10:08:29.115834', '1', 'Flute', 1, '[{\"added\": {}}]', 15, 1),
(24, '2021-05-25 10:08:40.812593', '2', 'Veena', 1, '[{\"added\": {}}]', 15, 1),
(25, '2021-05-25 11:57:28.452261', '13', 'event u', 3, '', 28, 1),
(26, '2021-05-25 11:57:28.571352', '12', 'event u', 3, '', 28, 1),
(27, '2021-05-25 11:57:28.627608', '11', 'event u', 3, '', 28, 1),
(28, '2021-05-25 14:29:24.410063', '10', 'event u', 2, '[{\"added\": {\"name\": \"event_ skill\", \"object\": \"Event_Skill object (10)\"}}, {\"added\": {\"name\": \"event_ skill\", \"object\": \"Event_Skill object (11)\"}}]', 28, 1),
(29, '2021-05-26 07:54:10.300332', '1', 'Madhan Musician', 3, '', 29, 1),
(30, '2021-05-26 07:54:35.097433', '1', 'Madhan Musician', 1, '[{\"added\": {}}]', 32, 1),
(31, '2021-05-26 09:17:06.558558', '1', 'Madhan Musician', 3, '', 32, 1),
(32, '2021-05-26 09:17:41.652298', '1', 'Performer', 1, '[{\"added\": {}}]', 12, 1),
(33, '2021-05-26 09:17:44.466504', '1', 'Flute', 1, '[{\"added\": {}}]', 16, 1),
(34, '2021-05-26 09:17:51.699072', '2', 'Veena', 1, '[{\"added\": {}}]', 16, 1),
(35, '2021-05-26 09:51:18.084548', '3', 'Troupe', 1, '[{\"added\": {}}]', 3, 1),
(36, '2021-05-26 09:51:21.098350', '4', 'Umk Troupe', 1, '[{\"added\": {}}]', 6, 1),
(37, '2021-05-26 09:51:41.148531', '1', 'Umk Troupe', 1, '[{\"added\": {}}]', 13, 1),
(38, '2021-05-26 09:52:30.173998', '1', 'Veena', 1, '[{\"added\": {}}]', 36, 1),
(39, '2021-05-26 09:52:35.708859', '1', 'Veena', 3, '', 36, 1),
(40, '2021-05-26 09:52:49.664686', '2', 'Flute', 1, '[{\"added\": {}}]', 36, 1),
(41, '2021-05-26 09:52:58.828030', '2', 'Flute', 2, '[]', 36, 1),
(42, '2021-05-26 09:53:05.640647', '3', 'Veena', 1, '[{\"added\": {}}]', 36, 1),
(43, '2021-05-26 09:54:09.331046', '4', 'Gurukulam', 1, '[{\"added\": {}}]', 3, 1),
(44, '2021-05-26 09:54:14.664032', '5', 'gurukulam@gmail.com', 1, '[{\"added\": {}}]', 6, 1),
(45, '2021-05-26 09:54:38.468921', '1', 'gurukulam@gmail.com', 1, '[{\"added\": {}}]', 8, 1),
(46, '2021-05-26 09:54:49.018335', '1', 'Flute', 1, '[{\"added\": {}}]', 22, 1),
(47, '2021-05-26 09:56:18.119558', '1', 'Flute', 2, '[]', 22, 1),
(48, '2021-05-26 09:56:23.386381', '2', 'Veena', 1, '[{\"added\": {}}]', 22, 1),
(49, '2021-05-26 10:00:43.319030', '2', 'Erode', 1, '[{\"added\": {}}]', 7, 1),
(50, '2021-05-26 10:00:47.669821', '5', 'gurukulam@gmail.com', 2, '[{\"changed\": {\"fields\": [\"District\"]}}]', 6, 1),
(51, '2021-05-26 10:27:27.527435', '2', 'gurukulam@gmail.com', 3, '', 29, 1),
(52, '2021-05-26 10:48:52.761489', '5', 'Umk Troupe', 3, '', 29, 1),
(53, '2021-05-26 10:48:52.857564', '4', 'Umk Troupe', 3, '', 29, 1),
(54, '2021-05-26 10:50:43.476695', '6', 'Umk Troupe', 3, '', 29, 1),
(55, '2021-05-26 11:00:26.241824', '3', 'Veena', 3, '', 36, 1),
(56, '2021-05-26 13:45:25.025936', '1', 'Key Event', 1, '[{\"added\": {}}]', 9, 1),
(57, '2021-05-26 13:45:26.586894', '1', 'Best Award', 1, '[{\"added\": {}}]', 37, 1),
(58, '2021-05-26 14:12:16.356817', '5', 'New Highlight', 3, '', 37, 1),
(59, '2021-05-26 14:12:16.436893', '4', 'New Highlight', 3, '', 37, 1),
(60, '2021-05-26 14:12:16.678023', '3', 'New Highlight', 3, '', 37, 1),
(61, '2021-05-26 14:12:16.766030', '2', 'New Highlight', 3, '', 37, 1),
(62, '2021-05-26 14:12:16.797956', '1', 'Best Award', 3, '', 37, 1),
(63, '2021-05-26 14:15:27.716214', '6', 'New Highlight', 3, '', 37, 1),
(64, '2021-05-26 14:18:24.575029', '7', 'New Highlight', 3, '', 37, 1),
(65, '2021-05-26 14:30:17.604402', '8', 'New Highlight', 3, '', 37, 1),
(66, '2021-05-26 14:31:54.175360', '12', 'New Highlight', 3, '', 37, 1),
(67, '2021-05-26 14:31:54.266157', '11', 'New Highlight', 3, '', 37, 1),
(68, '2021-05-26 14:31:54.445689', '10', 'New Highlight', 3, '', 37, 1),
(69, '2021-05-26 14:31:54.477058', '9', 'New Highlight', 3, '', 37, 1),
(70, '2021-05-26 15:46:21.017271', '9', 'Madhan Musician', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 29, 1),
(71, '2021-05-26 15:53:05.540807', '2', 'Madhan Musician', 3, '', 32, 1),
(72, '2021-05-27 09:11:52.704536', '12', 'Umk Troupe', 1, '[{\"added\": {}}]', 29, 1),
(73, '2021-05-27 09:12:39.829540', '22', 'eventer@gmail.com', 1, '[{\"added\": {}}]', 35, 1),
(74, '2021-05-27 09:15:15.628023', '13', 'Umk Troupe', 1, '[{\"added\": {}}]', 29, 1),
(75, '2021-05-27 09:15:30.675957', '23', 'gurukulam@gmail.com', 1, '[{\"added\": {}}]', 35, 1),
(76, '2021-05-27 09:16:58.262896', '14', 'Madhan Musician', 1, '[{\"added\": {}}]', 29, 1),
(77, '2021-05-27 09:17:19.135487', '24', 'eventer@gmail.com', 1, '[{\"added\": {}}]', 35, 1),
(78, '2021-05-27 09:22:20.878306', '1', 'Madhan Musician', 1, '[{\"added\": {}}]', 32, 1),
(79, '2021-05-27 09:30:11.285119', '25', 'eventer@gmail.com', 1, '[{\"added\": {}}]', 35, 1),
(80, '2021-05-27 09:41:18.935006', '6', 'musician1@gmail.com', 1, '[{\"added\": {}}]', 6, 1),
(81, '2021-05-27 09:41:51.935083', '2', 'musician1@gmail.com', 1, '[{\"added\": {}}]', 10, 1),
(82, '2021-05-27 09:42:10.671151', '3', 'Veena', 1, '[{\"added\": {}}]', 16, 1),
(83, '2021-05-27 11:10:59.169849', '3', 'Madhan Musician', 3, '', 32, 1),
(84, '2021-05-27 11:10:59.247025', '2', 'Madhan Musician', 3, '', 32, 1),
(85, '2021-05-27 11:58:12.945727', '3', 'Carnatic', 1, '[{\"added\": {}}]', 15, 1),
(86, '2021-05-27 14:04:49.916308', '9', 'Madhan Musician', 3, '', 29, 1),
(87, '2021-05-27 14:04:49.978866', '8', 'Madhan Musician', 3, '', 29, 1),
(88, '2021-05-27 14:04:50.005043', '7', 'Umk Troupe', 3, '', 29, 1),
(89, '2021-05-27 14:04:50.029784', '3', 'gurukulam@gmail.com', 3, '', 29, 1),
(90, '2021-05-27 14:04:59.287945', '5', 'Madhan Musician', 3, '', 32, 1),
(91, '2021-05-27 14:04:59.401547', '4', 'Madhan Musician', 3, '', 32, 1),
(92, '2021-05-27 14:09:12.754648', '1', 'Madhan Musician', 2, '[{\"changed\": {\"fields\": [\"About me\"]}}]', 10, 1),
(93, '2021-05-27 14:11:19.941322', '1', 'gurukulam@gmail.com', 1, '[{\"added\": {}}]', 18, 1),
(94, '2021-05-27 14:13:01.849658', '5', 'MK Gurukulam', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 6, 1),
(95, '2021-05-27 14:13:03.959487', '1', 'MK Gurukulam', 2, '[]', 8, 1),
(96, '2021-05-27 14:13:10.122401', '1', 'MK Gurukulam', 2, '[]', 18, 1),
(97, '2021-05-27 14:18:20.328904', '1', 'Best Singer', 1, '[{\"added\": {}}]', 17, 1),
(98, '2021-05-27 14:18:23.947320', '1', 'Best Singer', 2, '[]', 17, 1),
(99, '2021-05-27 14:19:00.618178', '2', 'Raghav Chaitanya, \"Ek Tukda Dhoop\" Thappad', 1, '[{\"added\": {}}]', 17, 1),
(100, '2021-05-27 14:20:56.186681', '1', 'MIRCHI MUSIC AWARDS', 1, '[{\"added\": {}}]', 19, 1),
(101, '2021-05-27 14:21:09.980740', '1', 'MIRCHI MUSIC AWARDS', 2, '[]', 19, 1),
(102, '2021-05-27 14:22:01.140671', '2', 'Bill Board Awards', 1, '[{\"added\": {}}]', 19, 1),
(103, '2021-05-27 14:44:05.083378', '2', 'GBK Event Organizer', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 6, 1),
(104, '2021-05-27 14:48:38.706525', '1', 'GBK Event Organizer', 2, '[{\"changed\": {\"fields\": [\"About us\"]}}]', 24, 1),
(105, '2021-05-27 14:51:08.321995', '1', 'GBK Event Organizer', 2, '[{\"changed\": {\"fields\": [\"About us\"]}}]', 24, 1),
(106, '2021-05-27 14:52:00.418276', '1', 'GBK Event Organizer', 2, '[{\"changed\": {\"fields\": [\"About us\"]}}]', 24, 1),
(107, '2021-05-27 14:52:27.711293', '1', 'GBK Event Organizer', 2, '[{\"changed\": {\"fields\": [\"About us\"]}}]', 24, 1),
(108, '2021-05-27 15:43:10.515528', '1', 'Event 1', 2, '[]', 28, 1),
(109, '2021-05-27 15:43:26.013194', '11', 'musician1@gmail.com', 1, '[{\"added\": {}}]', 29, 1),
(110, '2021-05-27 15:44:04.535735', '6', 'Umk Troupe', 1, '[{\"added\": {}}]', 32, 1),
(111, '2021-05-27 15:44:39.120192', '1', 'Event 1', 2, '[{\"changed\": {\"fields\": [\"Registration close date\"]}}]', 28, 1),
(112, '2021-05-27 15:45:06.111538', '1', 'Event 1', 2, '[{\"changed\": {\"fields\": [\"Registration close date\"]}}]', 28, 1),
(113, '2021-05-28 10:33:25.314830', '2', 'GBK Event Organizer', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 6, 1),
(114, '2021-05-28 11:49:39.294107', '10', 'Madhan Musician', 3, '', 32, 1),
(115, '2021-05-28 11:49:39.366665', '9', 'Madhan Musician', 3, '', 32, 1),
(116, '2021-05-28 11:49:39.382740', '8', 'Madhan Musician', 3, '', 32, 1),
(117, '2021-05-28 11:50:32.360960', '11', 'Madhan Musician', 3, '', 32, 1),
(118, '2021-05-28 11:50:33.185099', '7', 'Madhan Musician', 3, '', 32, 1),
(119, '2021-05-28 12:18:49.721360', '11', 'Event by gurukulam', 2, '[{\"added\": {\"name\": \"event_ skill\", \"object\": \"Event_Skill object (19)\"}}]', 28, 1),
(120, '2021-05-28 12:19:06.006239', '5', 'eee', 2, '[{\"changed\": {\"fields\": [\"Registration close date\"]}}, {\"added\": {\"name\": \"event_ skill\", \"object\": \"Event_Skill object (20)\"}}]', 28, 1),
(121, '2021-05-28 12:22:05.549760', '1', 'Madhan Musician', 1, '[{\"added\": {}}]', 26, 1),
(122, '2021-05-28 16:26:34.699529', '1', 'Event_Performer object (1)', 1, '[{\"added\": {}}]', 38, 1),
(123, '2021-05-29 10:16:14.681810', '1', 'Event_Performer object (1)', 1, '[{\"added\": {}}]', 39, 1),
(124, '2021-05-29 10:27:22.772882', '2', 'Event_Performer object (2)', 1, '[{\"added\": {}}]', 39, 1),
(125, '2021-05-29 10:31:24.474256', '1', 'Event_Performer object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 39, 1),
(126, '2021-05-29 11:22:29.018053', '3', 'Event_Performer object (3)', 1, '[{\"added\": {}}]', 39, 1),
(127, '2021-05-29 11:40:40.440317', '6', 'Event_Performer object (6)', 3, '', 39, 1),
(128, '2021-05-29 11:40:40.536736', '5', 'Event_Performer object (5)', 3, '', 39, 1),
(129, '2021-05-29 11:40:40.580698', '4', 'Event_Performer object (4)', 3, '', 39, 1),
(130, '2021-05-29 12:04:39.376748', '9', 'Event_Performer object (9)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 39, 1),
(131, '2021-05-29 14:52:40.967652', '12', 'Madhan Musician', 3, '', 32, 1),
(132, '2021-05-29 14:52:55.641726', '15', 'Madhan Musician', 3, '', 29, 1),
(133, '2021-05-29 15:01:49.083839', '14', 'Madhan Musician', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 32, 1),
(134, '2021-05-29 15:02:12.646358', '1', 'Event 1', 2, '[{\"changed\": {\"fields\": [\"Event details\"]}}]', 28, 1),
(135, '2021-05-29 15:42:48.800918', '2', 'GBK Event Organizer', 2, '[{\"changed\": {\"fields\": [\"Username\", \"Email address\"]}}]', 6, 1),
(136, '2021-05-31 10:51:16.307355', '16', 'Madhan Musician', 3, '', 32, 1),
(137, '2021-05-31 10:51:16.373583', '15', 'Madhan Musician', 3, '', 32, 1),
(138, '2021-05-31 10:51:16.431153', '14', 'Madhan Musician', 3, '', 32, 1),
(139, '2021-05-31 12:57:19.143201', '18', 'Madhan Musician', 3, '', 32, 1),
(140, '2021-05-31 12:57:19.377909', '17', 'Madhan Musician', 3, '', 32, 1),
(141, '2021-05-31 12:58:02.910336', '1', 'Event Yoyo', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(142, '2021-05-31 12:58:33.608254', '2', 'Maha  TD Event', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Event details\"]}}]', 28, 1),
(143, '2021-05-31 13:14:11.586623', '12', 'Madhan Musician', 1, '[{\"added\": {}}]', 29, 1),
(144, '2021-05-31 15:43:06.485568', '13', 'New Highlight', 2, '[{\"changed\": {\"fields\": [\"Video link\"]}}]', 37, 1),
(145, '2021-05-31 15:43:12.462441', '15', 'New Highlight e', 2, '[{\"changed\": {\"fields\": [\"Video link\"]}}]', 37, 1),
(146, '2021-05-31 16:16:01.960971', '16', 'MK Gurukulam', 3, '', 29, 1),
(147, '2021-05-31 16:16:02.083089', '15', 'Umk Troupe', 3, '', 29, 1),
(148, '2021-05-31 16:16:02.138299', '14', 'musician1@gmail.com', 3, '', 29, 1),
(149, '2021-05-31 16:16:02.194785', '13', 'Madhan Musician', 3, '', 29, 1),
(150, '2021-05-31 16:16:02.271841', '12', 'Madhan Musician', 3, '', 29, 1),
(151, '2021-05-31 16:16:02.530658', '11', 'musician1@gmail.com', 3, '', 29, 1),
(152, '2021-05-31 16:16:02.661228', '10', 'Madhan Musician', 3, '', 29, 1),
(153, '2021-05-31 16:16:14.205601', '19', 'Madhan Musician', 3, '', 32, 1),
(154, '2021-05-31 16:16:23.323726', '13', 'Madhan Musician', 3, '', 32, 1),
(155, '2021-05-31 16:16:23.484247', '6', 'Umk Troupe', 3, '', 32, 1),
(156, '2021-05-31 16:17:56.615615', '9', 'Coimbatore June Events', 2, '[{\"changed\": {\"fields\": [\"Name\", \"From date\", \"To date\", \"Registration close date\"]}}]', 28, 1),
(157, '2021-05-31 16:18:16.749783', '9', 'Coimbatore June Events - 2021', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(158, '2021-05-31 16:22:11.070408', '3', 'Chennai', 1, '[{\"added\": {}}]', 7, 1),
(159, '2021-05-31 16:22:52.255436', '7', 'Karthick Kumar', 1, '[{\"added\": {}}]', 6, 1),
(160, '2021-05-31 16:24:01.404759', '3', 'Karthick Kumar', 1, '[{\"added\": {}}]', 10, 1),
(161, '2021-05-31 16:24:14.189453', '4', 'Carnatic', 1, '[{\"added\": {}}]', 16, 1),
(162, '2021-05-31 17:12:21.510243', '22', 'MK Gurukulam', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 29, 1),
(163, '2021-06-19 09:44:42.056166', '26', 'Madhan Musician', 3, '', 32, 1),
(164, '2021-06-19 09:44:42.127805', '25', 'Madhan Musician', 3, '', 32, 1),
(165, '2021-06-19 09:44:42.147955', '24', 'Madhan Musician', 3, '', 32, 1),
(166, '2021-06-19 09:44:42.194431', '23', 'Madhan Musician', 3, '', 32, 1),
(167, '2021-06-19 09:44:42.214283', '22', 'Madhan Musician', 3, '', 32, 1),
(168, '2021-06-19 09:45:02.309012', '26', 'Madhan Musician', 3, '', 29, 1),
(169, '2021-06-19 09:45:02.384071', '17', 'Madhan Musician', 3, '', 29, 1),
(170, '2021-06-19 13:35:36.075455', '8', 'Raj', 1, '[{\"added\": {}}]', 6, 1),
(171, '2021-06-19 13:36:20.363232', '4', 'Raj', 1, '[{\"added\": {}}]', 10, 1),
(172, '2021-06-19 13:36:33.417042', '5', 'Flute', 1, '[{\"added\": {}}]', 16, 1),
(173, '2021-06-19 13:36:37.768961', '6', 'Veena', 1, '[{\"added\": {}}]', 16, 1),
(174, '2021-06-19 13:36:43.427119', '7', 'Carnatic', 1, '[{\"added\": {}}]', 16, 1),
(175, '2021-06-19 13:37:29.102874', '9', 'Hari', 1, '[{\"added\": {}}]', 6, 1),
(176, '2021-06-19 13:37:56.858773', '5', 'Hari', 1, '[{\"added\": {}}]', 10, 1),
(177, '2021-06-19 13:38:11.948828', '8', 'Flute', 1, '[{\"added\": {}}]', 16, 1),
(178, '2021-06-19 13:38:17.145271', '9', 'Veena', 1, '[{\"added\": {}}]', 16, 1),
(179, '2021-06-19 13:38:22.260007', '10', 'Carnatic', 1, '[{\"added\": {}}]', 16, 1),
(180, '2021-06-19 13:39:18.380960', '9', 'Hari', 2, '[{\"changed\": {\"fields\": [\"District\"]}}]', 6, 1),
(181, '2021-06-19 13:39:29.369820', '9', 'Hari Prasad', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 6, 1),
(182, '2021-06-19 13:39:48.861467', '8', 'Rajamanikam', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 6, 1),
(183, '2021-06-19 13:47:06.180772', '31', 'Rajamanikam', 1, '[{\"added\": {}}]', 32, 1),
(184, '2021-06-19 13:47:12.733749', '32', 'Hari Prasad', 1, '[{\"added\": {}}]', 32, 1),
(185, '2021-06-19 14:01:38.559508', '2', 'GBK Event Organizer', 2, '[{\"changed\": {\"fields\": [\"Cover picture\"]}}]', 6, 1),
(186, '2021-06-19 14:02:22.445562', '5', 'MK Gurukulam', 2, '[{\"changed\": {\"fields\": [\"Cover picture\"]}}]', 6, 1),
(187, '2021-06-19 14:03:19.243798', '8', 'Rajamanikam', 2, '[{\"changed\": {\"fields\": [\"Profile picture\"]}}]', 6, 1),
(188, '2021-06-19 14:03:29.895723', '9', 'Hari Prasad', 2, '[{\"changed\": {\"fields\": [\"Profile picture\"]}}]', 6, 1),
(189, '2021-06-19 15:11:10.217046', '34', 'Madhan Musician', 1, '[{\"added\": {}}]', 29, 1),
(190, '2021-06-21 08:49:12.904535', '1', 'UserFollowing object (1)', 1, '[{\"added\": {}}]', 40, 1),
(191, '2021-06-21 08:50:01.729288', '1', 'Post object (1)', 1, '[{\"added\": {}}]', 41, 1),
(192, '2021-06-21 08:57:26.121350', '1', 'Post object (1)', 2, '[{\"changed\": {\"fields\": [\"Location\"]}}]', 41, 1),
(193, '2021-06-21 10:28:17.665674', '3', 'Post object (3)', 3, '', 41, 1),
(194, '2021-06-21 10:28:17.762881', '2', 'Post object (2)', 3, '', 41, 1),
(195, '2021-06-21 10:28:17.792081', '1', 'Post object (1)', 3, '', 41, 1),
(196, '2021-06-21 10:28:58.979504', '34', 'Madhan Musician', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 29, 1),
(197, '2021-06-21 10:33:28.833520', '5', 'Post object (5)', 2, '[{\"changed\": {\"fields\": [\"Content\", \"Location\"]}}]', 41, 1),
(198, '2021-06-21 10:36:31.761204', '4', 'Post object (4)', 3, '', 41, 1),
(199, '2021-06-21 11:41:17.161229', '7', 'Post object (7)', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 41, 1),
(200, '2021-06-21 11:47:39.753162', '6', 'Premji', 2, '[{\"changed\": {\"fields\": [\"First name\"]}}]', 6, 1),
(201, '2021-06-21 11:48:59.929830', '6', 'Premji', 2, '[{\"changed\": {\"fields\": [\"Profile picture\"]}}]', 6, 1),
(202, '2021-06-21 14:36:17.157302', '4', 'UserFollowing object (4)', 3, '', 40, 1),
(203, '2021-06-21 14:36:17.407541', '3', 'UserFollowing object (3)', 3, '', 40, 1),
(204, '2021-06-21 14:36:17.540961', '2', 'UserFollowing object (2)', 3, '', 40, 1),
(205, '2021-06-21 14:37:20.703674', '5', 'UserFollowing object (5)', 3, '', 40, 1),
(206, '2021-06-21 14:47:14.053056', '6', 'UserFollowing object (6)', 3, '', 40, 1),
(207, '2021-06-21 14:50:06.152881', '7', 'UserFollowing object (7)', 3, '', 40, 1),
(208, '2021-06-21 14:51:16.394707', '8', 'UserFollowing object (8)', 3, '', 40, 1),
(209, '2021-06-21 14:51:21.404567', '1', 'UserFollowing object (1)', 3, '', 40, 1),
(210, '2021-06-21 14:55:08.388645', '12', 'UserFollowing object (12)', 3, '', 40, 1),
(211, '2021-06-22 18:55:42.385742', '7', 'Post object (7)', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 41, 1),
(212, '2021-06-22 18:56:26.434631', '7', 'Post object (7)', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 41, 1),
(213, '2021-06-22 18:57:39.921644', '5', 'Post object (5)', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 41, 1),
(214, '2021-06-23 13:13:03.747395', '33', 'Umk Troupe', 3, '', 32, 1),
(215, '2021-06-24 09:56:25.962025', '5', 'Post object (5)', 2, '[{\"changed\": {\"fields\": [\"Likes\"]}}]', 41, 1),
(216, '2021-06-24 14:47:33.585959', '5', 'Post object (5)', 2, '[{\"changed\": {\"fields\": [\"Likes\", \"User likes\"]}}]', 41, 1),
(217, '2021-06-24 15:44:09.162923', '7', 'Post object (7)', 3, '', 41, 1),
(218, '2021-06-24 15:44:09.336082', '6', 'Post object (6)', 3, '', 41, 1),
(219, '2021-06-24 15:44:19.507813', '5', 'Post object (5)', 2, '[{\"changed\": {\"fields\": [\"Likes\", \"User likes\"]}}]', 41, 1),
(220, '2021-06-24 15:45:54.103836', '8', 'Post object (8)', 1, '[{\"added\": {}}]', 41, 1),
(221, '2021-06-24 16:31:35.895925', '5', 'Post object (5)', 2, '[{\"changed\": {\"fields\": [\"Likes\", \"User likes\"]}}]', 41, 1),
(222, '2021-06-25 10:41:55.721352', '1', 'Post_Comment object (1)', 1, '[{\"added\": {}}]', 42, 1),
(223, '2021-06-26 10:35:02.193382', '23', 'Post_Comment object (23)', 3, '', 42, 1),
(224, '2021-06-26 10:35:02.265488', '22', 'Post_Comment object (22)', 3, '', 42, 1),
(225, '2021-06-26 10:35:02.310156', '21', 'Post_Comment object (21)', 3, '', 42, 1),
(226, '2021-06-26 10:35:02.343240', '20', 'Post_Comment object (20)', 3, '', 42, 1),
(227, '2021-06-26 10:35:02.366533', '19', 'Post_Comment object (19)', 3, '', 42, 1),
(228, '2021-06-28 15:03:53.568896', '1', 'Reply object (1)', 1, '[{\"added\": {}}]', 44, 1),
(229, '2021-06-28 15:05:22.004841', '1', 'Reply object (1)', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 44, 1),
(230, '2021-06-28 17:27:10.190288', '13', 'Reply object (13)', 3, '', 44, 1),
(231, '2021-06-28 17:27:10.406636', '12', 'Reply object (12)', 3, '', 44, 1),
(232, '2021-06-28 17:27:10.539607', '11', 'Reply object (11)', 3, '', 44, 1),
(233, '2021-06-28 17:27:10.617741', '10', 'Reply object (10)', 3, '', 44, 1),
(234, '2021-06-29 09:59:35.220503', '16', 'Reply object (16)', 3, '', 44, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(25, 'account', 'course'),
(7, 'account', 'district'),
(24, 'account', 'event_organizer'),
(37, 'account', 'event_organizer_highlight'),
(39, 'account', 'event_performer'),
(8, 'account', 'gurukulam'),
(23, 'account', 'gurukulam_award'),
(22, 'account', 'gurukulam_skill'),
(21, 'account', 'gurukulam_testimonial'),
(43, 'account', 'highlight'),
(9, 'account', 'highlight_category'),
(26, 'account', 'key_performer'),
(20, 'account', 'lecture_video'),
(10, 'account', 'musician'),
(19, 'account', 'musician_award'),
(18, 'account', 'musician_gurukulam'),
(17, 'account', 'musician_highlight'),
(16, 'account', 'musician_skill'),
(41, 'account', 'post'),
(42, 'account', 'post_comment'),
(44, 'account', 'reply'),
(15, 'account', 'skill'),
(11, 'account', 'skill_category'),
(12, 'account', 'skill_level'),
(13, 'account', 'troupe'),
(14, 'account', 'troupe_highlight'),
(36, 'account', 'troupe_skill'),
(6, 'account', 'user'),
(40, 'account', 'userfollowing'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(28, 'event', 'event'),
(27, 'event', 'event_category'),
(38, 'event', 'event_performer'),
(34, 'event', 'event_skill'),
(33, 'event', 'event_type'),
(32, 'event', 'interest'),
(29, 'event', 'invitation'),
(35, 'event', 'message'),
(30, 'event', 'subscription'),
(31, 'event', 'subscription_type'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'event', '0001_initial', '2021-05-24 09:23:41.998044'),
(2, 'contenttypes', '0001_initial', '2021-05-24 09:23:42.938100'),
(3, 'contenttypes', '0002_remove_content_type_name', '2021-05-24 09:23:44.951994'),
(4, 'auth', '0001_initial', '2021-05-24 09:23:50.266314'),
(5, 'auth', '0002_alter_permission_name_max_length', '2021-05-24 09:23:52.048202'),
(6, 'auth', '0003_alter_user_email_max_length', '2021-05-24 09:23:52.110726'),
(7, 'auth', '0004_alter_user_username_opts', '2021-05-24 09:23:52.175092'),
(8, 'auth', '0005_alter_user_last_login_null', '2021-05-24 09:23:52.268847'),
(9, 'auth', '0006_require_contenttypes_0002', '2021-05-24 09:23:52.316738'),
(10, 'auth', '0007_alter_validators_add_error_messages', '2021-05-24 09:23:52.487773'),
(11, 'auth', '0008_alter_user_username_max_length', '2021-05-24 09:23:52.633298'),
(12, 'auth', '0009_alter_user_last_name_max_length', '2021-05-24 09:23:52.684046'),
(13, 'auth', '0010_alter_group_name_max_length', '2021-05-24 09:23:53.817036'),
(14, 'auth', '0011_update_proxy_permissions', '2021-05-24 09:23:53.863931'),
(15, 'auth', '0012_alter_user_first_name_max_length', '2021-05-24 09:23:53.903300'),
(16, 'account', '0001_initial', '2021-05-24 09:24:51.174815'),
(17, 'account', '0002_auto_20210401_1103', '2021-05-24 09:24:53.793830'),
(18, 'account', '0003_auto_20210402_1104', '2021-05-24 09:24:54.986262'),
(19, 'account', '0004_auto_20210403_1156', '2021-05-24 09:24:55.114582'),
(20, 'account', '0005_auto_20210407_1050', '2021-05-24 09:24:56.882714'),
(21, 'account', '0006_auto_20210408_1209', '2021-05-24 09:24:57.944089'),
(22, 'account', '0007_auto_20210421_1407', '2021-05-24 09:24:58.118233'),
(23, 'account', '0008_auto_20210422_1107', '2021-05-24 09:24:58.346154'),
(24, 'account', '0009_auto_20210423_0918', '2021-05-24 09:24:58.899447'),
(25, 'account', '0010_auto_20210424_1038', '2021-05-24 09:25:01.138973'),
(26, 'event', '0002_auto_20210430_0912', '2021-05-24 09:25:05.669577'),
(27, 'event', '0003_event_self_reference', '2021-05-24 09:25:06.340741'),
(28, 'event', '0004_auto_20210430_1118', '2021-05-24 09:25:07.687966'),
(29, 'event', '0005_auto_20210503_1358', '2021-05-24 09:25:11.047024'),
(30, 'event', '0006_auto_20210503_1557', '2021-05-24 09:25:13.864932'),
(31, 'event', '0007_auto_20210504_0948', '2021-05-24 09:25:26.748821'),
(32, 'event', '0008_auto_20210504_0953', '2021-05-24 09:25:33.154127'),
(33, 'event', '0009_event_get_request', '2021-05-24 09:25:36.484659'),
(34, 'event', '0010_auto_20210513_1503', '2021-05-24 09:25:41.022435'),
(35, 'event', '0011_event_district', '2021-05-24 09:25:42.215631'),
(36, 'event', '0012_auto_20210513_1626', '2021-05-24 09:25:45.407697'),
(37, 'event', '0013_auto_20210513_1628', '2021-05-24 09:25:56.946297'),
(38, 'event', '0014_subscription_type_days', '2021-05-24 09:25:57.506600'),
(39, 'event', '0015_remove_subscription_type_days', '2021-05-24 09:25:58.355222'),
(40, 'event', '0016_subscription_type_days', '2021-05-24 09:25:59.278229'),
(41, 'event', '0017_auto_20210514_1502', '2021-05-24 09:26:01.333435'),
(42, 'event', '0018_subscription_active', '2021-05-24 09:26:02.384467'),
(43, 'event', '0019_event_get_request_troupe', '2021-05-24 09:26:03.794617'),
(44, 'event', '0020_message', '2021-05-24 09:26:11.445924'),
(45, 'event', '0021_delete_message', '2021-05-24 09:26:12.000177'),
(46, 'event', '0022_message', '2021-05-24 09:26:18.378768'),
(47, 'account', '0011_key_performer_status', '2021-05-24 09:26:19.331401'),
(48, 'account', '0012_alter_key_performer_name', '2021-05-24 09:26:20.280438'),
(49, 'event', '0023_event_skill_vocal', '2021-05-24 09:26:26.486379'),
(50, 'event', '0024_event_get_request_gurukulam', '2021-05-24 09:26:28.175763'),
(51, 'event', '0025_remove_event_get_request_gurukulam', '2021-05-24 09:26:30.307958'),
(52, 'event', '0026_auto_20210520_1212', '2021-05-24 09:26:46.042224'),
(53, 'account', '0013_alter_musician_gurukulam_status', '2021-05-24 09:26:47.859564'),
(54, 'account', '0014_auto_20210520_1212', '2021-05-24 09:26:49.607753'),
(55, 'admin', '0001_initial', '2021-05-24 09:26:54.454616'),
(56, 'admin', '0002_logentry_remove_auto_add', '2021-05-24 09:26:54.580218'),
(57, 'admin', '0003_logentry_add_action_flag_choices', '2021-05-24 09:26:54.638242'),
(58, 'event', '0027_auto_20210524_1445', '2021-05-24 09:27:00.128605'),
(59, 'sessions', '0001_initial', '2021-05-24 09:27:00.943729'),
(60, 'event', '0028_auto_20210524_1750', '2021-05-24 12:21:08.132957'),
(61, 'event', '0029_rename_registration_close_date_event_registration_close_date', '2021-05-25 09:35:51.880285'),
(62, 'event', '0030_auto_20210525_1130', '2021-05-25 11:30:49.087695'),
(63, 'event', '0031_message', '2021-05-25 16:59:31.899935'),
(64, 'event', '0032_alter_event_registration_close_date', '2021-05-26 09:01:32.446127'),
(65, 'account', '0015_troupe_skill', '2021-05-26 09:24:16.963144'),
(66, 'account', '0016_event_organizer_highlight', '2021-05-26 13:33:49.840150'),
(67, 'event', '0033_auto_20210528_1622', '2021-05-28 16:22:22.841674'),
(68, 'account', '0017_event_performer', '2021-05-29 09:59:58.777337'),
(69, 'event', '0034_delete_event_performer', '2021-05-29 09:59:59.641383'),
(70, 'event', '0035_auto_20210531_1235', '2021-05-31 12:35:28.291003'),
(71, 'event', '0036_remove_interest_timestamp', '2021-05-31 12:56:45.990824'),
(72, 'account', '0018_alter_event_organizer_highlight_options', '2021-05-31 16:15:26.192430'),
(73, 'event', '0037_interest_timestamp', '2021-05-31 16:15:32.228428'),
(74, 'account', '0019_userfollowing', '2021-06-21 08:41:06.256085'),
(75, 'account', '0020_auto_20210621_0840', '2021-06-21 08:41:08.601428'),
(76, 'account', '0021_post_location', '2021-06-21 08:57:13.032493'),
(77, 'account', '0022_auto_20210623_1528', '2021-06-23 15:28:43.424619'),
(78, 'account', '0023_auto_20210623_1539', '2021-06-23 15:39:32.772021'),
(79, 'account', '0024_auto_20210625_1039', '2021-06-25 10:39:34.471078'),
(80, 'account', '0025_auto_20210628_0937', '2021-06-28 09:37:53.088061'),
(81, 'account', '0026_auto_20210628_1459', '2021-06-28 15:00:40.140096'),
(82, 'account', '0027_reply_user', '2021-06-28 15:05:03.228708');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('147o6ljzeq8nfs49d7xa6c9untz6n744', '.eJxVjM0OwiAQhN-FsyHLj0I9eu8zkF1YpGogKe3J-O62SQ86x_m-mbcIuC4lrJ3nMCVxFVacfjvC-OS6g_TAem8ytrrME8ldkQftcmyJX7fD_Tso2Mu2dmjPOhsApTODB7LZex4G3qKyA-uRQdmstPLmosijISKdIJJhxyA-X9jyN-0:1lrYuE:Hhkm3UhnuHJsVz74j6AbFYbisDp0HFyFeRIWCQWssjI', '2021-06-25 10:06:30.303598'),
('2z0mhqszxh4ups56hc0h2m1f7y1e5msa', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lma9w:3SQ8s4gxFKeC1MTjoeNs-DsrGNPjppJKQkXvTDxsnHE', '2021-06-11 16:26:08.702035'),
('44ay4vpslp6vt5ifff97ertm9tw374fg', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lmBT3:zzawA_uEhONdNii-g7sMM99dXHFdIDxYU33icNnEruQ', '2021-06-10 14:04:13.597195'),
('57pjicqvkoxw5ilzw9lwsdae4naj1rmm', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lwe6p:-1PuaBMoyJYf9vuIReuaE2YnEhL42pLHAt6G1ahe53s', '2021-07-09 10:40:31.045225'),
('5dthddds3mlh25hs1sg80baagath135i', '.eJxVjE0OwiAYBe_C2hD-hOLSfc9AHnwgVUOT0q6Md9cmXej2zcx7sYBtrWHreQkTsQvT7PS7RaRHbjugO9pt5mlu6zJFviv8oJ2PM-Xn9XD_Dip6_dY5kXICXpdBymxLpFS09VY6EmQMIDR5D3innDk7qyFQEmiQORoFsPcH-No4iA:1ltStw:iMvLQb5G61T11Bo7DRZl1pKcZZQy5VW1xnLdMTFABEw', '2021-06-30 16:06:04.781036'),
('5n99j0ri9g481l1pxpkvcj4m23t6a7iq', '.eJxVjE0OwiAYBe_C2hD-hOLSfc9AHnwgVUOT0q6Md9cmXej2zcx7sYBtrWHreQkTsQvT7PS7RaRHbjugO9pt5mlu6zJFviv8oJ2PM-Xn9XD_Dip6_dY5kXICXpdBymxLpFS09VY6EmQMIDR5D3innDk7qyFQEmiQORoFsPcH-No4iA:1lmWau:lpQTsDOFsU2sf3bVGemKD1DE9T4fdtauxiXLm-ogMBQ', '2021-06-11 12:37:44.982426'),
('79g7h2ftfr8kq7ji2dvqrenk5df38xet', '.eJxVjE0OwiAYBe_C2hD-hOLSfc9AHnwgVUOT0q6Md9cmXej2zcx7sYBtrWHreQkTsQvT7PS7RaRHbjugO9pt5mlu6zJFviv8oJ2PM-Xn9XD_Dip6_dY5kXICXpdBymxLpFS09VY6EmQMIDR5D3innDk7qyFQEmiQORoFsPcH-No4iA:1llr12:WlR7UA2KFo-AK1NPvFAOE_cRTult70ka0LJAhBvCRHk', '2021-06-09 16:13:56.400802'),
('82n6bp9zqztxvfkaw8gqpt6mt4eyncsv', '.eJxVjE0OwiAYBe_C2hD-hOLSfc9AHnwgVUOT0q6Md9cmXej2zcx7sYBtrWHreQkTsQvT7PS7RaRHbjugO9pt5mlu6zJFviv8oJ2PM-Xn9XD_Dip6_dY5kXICXpdBymxLpFS09VY6EmQMIDR5D3innDk7qyFQEmiQORoFsPcH-No4iA:1lwGu6:5MqeiSxxTK6mmzlC700L5rScq-1fTYmXCro1uTUpRIc', '2021-07-08 09:53:50.903744'),
('8jd5hj2p41ookgytq9e62k4c9ly4n3qu', '.eJxVjDsOwyAQRO9CHaHFn8WbMr3PgJYFgpMIS8auotw9tuQiqUaa92beyvG2ZrfVuLgpqKtq1OW38yzPWA4QHlzus5a5rMvk9aHok1Y9ziG-bqf7d5C55n2Nkch2LCBRjAFPiMjY2oFs6th7AbTQQ7vHAMTE0HtomFCATUpGfb7OuTc4:1ltP7A:fC13LhZf_xx0ZG_0r75otq8oTqvlHHyKS0BcsDNJVKM', '2021-06-30 12:03:28.344980'),
('9u3de5fgyjbg437zfu5n5szhxtbus09g', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lx0Un:ZGLD6a3Tfz91keYVWroQHIDFk8ptciCm4ClhlSGwzw8', '2021-07-10 10:34:45.327859'),
('a6pb5mu9cdpj06ebe0llz3mxgtk3xntn', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1llkVU:V969-SHUoHU-maF0zBq13JxSqmMtaZmWyc7JYSvZG9c', '2021-06-09 09:16:56.755343'),
('bhcznjayjcstktr8eoexprwxp5yux7r9', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lwLU7:xeo8HSQ-GnwudmSbphHGEpntguDvwjyd_mKLzoQsz6o', '2021-07-08 14:47:19.453403'),
('cc9g3v09j5fgkrnx2kqyb771i44svci7', '.eJxVjE0OwiAYBe_C2hD-hOLSfc9AHnwgVUOT0q6Md9cmXej2zcx7sYBtrWHreQkTsQvT7PS7RaRHbjugO9pt5mlu6zJFviv8oJ2PM-Xn9XD_Dip6_dY5kXICXpdBymxLpFS09VY6EmQMIDR5D3innDk7qyFQEmiQORoFsPcH-No4iA:1llVau:rZW4xc1eg1mo3UFqj1CVlhP7hZvNIukL9bK0FPSjr8A', '2021-06-08 17:21:32.472367'),
('chb71kbmy8wfv52ylnpbvctro98n81va', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lmUeA:xcg8H-SHz7Jvn0eFraMECtjWhAulh6Jth9O7RB9DicQ', '2021-06-11 10:32:58.694900'),
('fio9prmvgxwzfkxmowtgs8und0s9v27g', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lxpsa:4bbm7PpLQTG6vLUPvcXm_vYylHoiBSUvZ3lZV_zHX_8', '2021-07-12 17:26:44.895881'),
('frv0uj4rkmvfm3ugimp43rxfp7j1qs63', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1ly5MW:blEIJBNNdaBOaOMmHeCOsaVxgghK_JnhqgazqIF_Py8', '2021-07-13 09:58:40.111028'),
('gmfe91ovujlb4ysnwaie0lval5mif655', '.eJxVjE0OwiAYBe_C2hD-hOLSfc9AHnwgVUOT0q6Md9cmXej2zcx7sYBtrWHreQkTsQvT7PS7RaRHbjugO9pt5mlu6zJFviv8oJ2PM-Xn9XD_Dip6_dY5kXICXpdBymxLpFS09VY6EmQMIDR5D3innDk7qyFQEmiQORoFsPcH-No4iA:1lm9aa:MYFqYZJ5tgW9u4sXXX3iMzQSmpHxf4ifWdzr5-0PJGc', '2021-06-10 12:03:52.283364'),
('gus23guq8fewi9y051fh3y7qx2e0l39b', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lmqrF:1BsLkbZJcEQE9rLRE1ykebQZ5YNulcatm_63wXN3y6U', '2021-06-12 10:15:57.689696'),
('ifga3brsaghidwks24nx2mod4xqpqtls', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lmvxE:5_DDhkuWdDOJLegvRGM284xALNezSoFiYwLNoU3jDS4', '2021-06-12 15:42:28.392547'),
('ivq04no99mhlcvd3zbk88hxkhioylxs5', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lvgOf:rY8JrbUDJP4cWGZm5xATe0gfL0QVo6a-UVI4AkWHnjQ', '2021-07-06 18:54:57.629431'),
('kyo4qh9mdkl814jxib09gztjtwdjmrkl', '.eJxVjDsOwyAQRO9CHaHFn8WbMr3PgJYFgpMIS8auotw9tuQiqUaa92beyvG2ZrfVuLgpqKtq1OW38yzPWA4QHlzus5a5rMvk9aHok1Y9ziG-bqf7d5C55n2Nkch2LCBRjAFPiMjY2oFs6th7AbTQQ7vHAMTE0HtomFCATUpGfb7OuTc4:1ltjAn:sFSveyDLyQpEdPgVsWGoEcw7i6E3IABKYO_FJz3Kpn4', '2021-07-01 09:28:33.738690'),
('lkg81gn5z9g1ja4ws4cfi2e21est76vx', '.eJxVjM0OwiAQhN-FsyHLj0I9eu8zkF1YpGogKe3J-O62SQ86x_m-mbcIuC4lrJ3nMCVxFVacfjvC-OS6g_TAem8ytrrME8ldkQftcmyJX7fD_Tso2Mu2dmjPOhsApTODB7LZex4G3qKyA-uRQdmstPLmosijISKdIJJhxyA-X9jyN-0:1lqVBz:z_7EtP4befxxS-yQyYa-khjn8VObGwHoCBxwIIRhM1w', '2021-06-22 11:56:27.379670'),
('mqbho8778y78kag1n2t2ogw17m6focro', '.eJxVjE0OwiAYBe_C2hD-hOLSfc9AHnwgVUOT0q6Md9cmXej2zcx7sYBtrWHreQkTsQvT7PS7RaRHbjugO9pt5mlu6zJFviv8oJ2PM-Xn9XD_Dip6_dY5kXICXpdBymxLpFS09VY6EmQMIDR5D3innDk7qyFQEmiQORoFsPcH-No4iA:1lvzrn:cN6tCEHIWpCJ88aYrTfGw_1J-RBezz4QUkdSIjxkerI', '2021-07-07 15:42:19.496082'),
('oxnuub9u39kr3x40b0pf50t9zolyfx2o', '.eJxVjM0OwiAQhN-FsyHLj0I9eu8zkF1YpGogKe3J-O62SQ86x_m-mbcIuC4lrJ3nMCVxFVacfjvC-OS6g_TAem8ytrrME8ldkQftcmyJX7fD_Tso2Mu2dmjPOhsApTODB7LZex4G3qKyA-uRQdmstPLmosijISKdIJJhxyA-X9jyN-0:1lvYSD:gsC_UtZWJWI0yg0uIGS-YKQvTVSRyyQVk9FHQGXdCGI', '2021-07-06 10:26:05.414442'),
('ptwfhz8jk2a33dt46jz293z0p6ynwcte', '.eJxVjDsOwyAQRO9CHaHFn8WbMr3PgJYFgpMIS8auotw9tuQiqUaa92beyvG2ZrfVuLgpqKtq1OW38yzPWA4QHlzus5a5rMvk9aHok1Y9ziG-bqf7d5C55n2Nkch2LCBRjAFPiMjY2oFs6th7AbTQQ7vHAMTE0HtomFCATUpGfb7OuTc4:1luSzL:z7EiD554IrfY_bYGpwQhyxtdNl95OjatH99EdALFaz0', '2021-07-03 10:23:47.082720'),
('rte7mzvb2xfq3t41pysw0192slpisnv6', '.eJxVjDsOwyAQRO9CHaHFn8WbMr3PgJYFgpMIS8auotw9tuQiqUaa92beyvG2ZrfVuLgpqKtq1OW38yzPWA4QHlzus5a5rMvk9aHok1Y9ziG-bqf7d5C55n2Nkch2LCBRjAFPiMjY2oFs6th7AbTQQ7vHAMTE0HtomFCATUpGfb7OuTc4:1llM30:aH-iVY8Lcj53knUrVCmVOVvy6-BI_by4j0KEMD5bk4s', '2021-06-08 01:39:54.265038'),
('s3hprnl342tfbie7x58nzsghbremct6i', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lvBmG:IeFIyjW-KM1clL9q3FMwZGxYDSbxCUS3HqfMtv5f2qA', '2021-07-05 10:13:16.321804'),
('ufrt7f0hy9recphvdjwx0ramoduu3jsu', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lngJ8:ZJBZNf_W7QM4Etn5CB_YdfyaG1m4XAifGfo0zAzsj9E', '2021-06-14 17:12:10.174396'),
('uvtqi0v565x2ixrox09ovsi4za58fnai', '.eJxVjDsOwyAQRO9CHaHFn8WbMr3PgJYFgpMIS8auotw9tuQiqUaa92beyvG2ZrfVuLgpqKtq1OW38yzPWA4QHlzus5a5rMvk9aHok1Y9ziG-bqf7d5C55n2Nkch2LCBRjAFPiMjY2oFs6th7AbTQQ7vHAMTE0HtomFCATUpGfb7OuTc4:1lvgAM:8wHmvW6R1zQaapu71f41zsxI9ibgHCCp3wQ7aDftpsA', '2021-07-06 18:40:10.434509'),
('xe21gw1pm0ww4wbk9dw57ffq4mkli1jh', '.eJxVjDsOwyAQRO9CHaHFn8WbMr3PgJYFgpMIS8auotw9tuQiqUaa92beyvG2ZrfVuLgpqKtq1OW38yzPWA4QHlzus5a5rMvk9aHok1Y9ziG-bqf7d5C55n2Nkch2LCBRjAFPiMjY2oFs6th7AbTQQ7vHAMTE0HtomFCATUpGfb7OuTc4:1lna8A:EragjrJRIN8494uWUOIhuBJGzAGvz0tCS6iM4vugSGU', '2021-06-14 10:36:26.871861'),
('ya83kdjq1pfak5ge572czohslc2c5aba', '.eJxVjE0OwiAYBe_C2hD-hOLSfc9AHnwgVUOT0q6Md9cmXej2zcx7sYBtrWHreQkTsQvT7PS7RaRHbjugO9pt5mlu6zJFviv8oJ2PM-Xn9XD_Dip6_dY5kXICXpdBymxLpFS09VY6EmQMIDR5D3innDk7qyFQEmiQORoFsPcH-No4iA:1lngPo:LFkJDD3-VhyY0INf9SrleJ1agLUjXkXESVJHJEPVQgs', '2021-06-14 17:19:04.249150'),
('ytupv81tfja053xq6anyy6k5sqboxj6u', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1ll6sI:RdDoBgxjPtsOvL7Pz_bmmtD54CAMfuHMVDIQiIJ4O0I', '2021-06-07 09:27:50.429234'),
('zz21an7dhvoplyhxkgz2fqoen8ki5uvg', '.eJxVjEEOwiAQRe_C2pDSYQBduu8ZyEyZStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1IXZdTpd2MaH1J2kO5UblWPtazLzHpX9EGbHmqS5_Vw_w4ytfytXSA7sZEkDnrHZ_DBkPCEpvOeBJClE0rBIhIwOgIjYoESOwNoe_X-APUzOCA:1lvCxL:OJsI-umT9thjtp0CUJlKRjpZo9wAx6tkEvutbtL00DY', '2021-07-05 11:28:47.021027');

-- --------------------------------------------------------

--
-- Table structure for table `event_event`
--

CREATE TABLE `event_event` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `event_details` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `event_category_id` int(11) NOT NULL,
  `event_organizer_id` int(11) DEFAULT NULL,
  `gurukulam_id` int(11) DEFAULT NULL,
  `self_reference` tinyint(1) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  `from_date` datetime(6) DEFAULT NULL,
  `poster_image` varchar(100) DEFAULT NULL,
  `registration_close_date` date DEFAULT NULL,
  `to_date` datetime(6) DEFAULT NULL,
  `venue` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_event`
--

INSERT INTO `event_event` (`id`, `name`, `event_type_id`, `event_details`, `created_on`, `event_category_id`, `event_organizer_id`, `gurukulam_id`, `self_reference`, `district_id`, `from_date`, `poster_image`, `registration_close_date`, `to_date`, `venue`) VALUES
(1, 'Event Yoyo Chennai', 1, 'event ful details goes here', '2021-06-19 08:04:19.000587', 1, 1, NULL, 0, 3, '2021-07-24 17:56:00.000000', 'event_poster/eventer_S9XWq0m.jpg', '2021-06-23', '2021-07-25 17:55:00.000000', 'Nungampakam'),
(2, 'Maha  TD Event', 1, 'Event content goes here', '2021-06-22 18:42:31.994021', 1, 1, NULL, 1, 1, '2021-06-28 17:42:00.000000', 'event_poster/eventer_d5m41Q2.jpg', '2021-06-25', '2021-06-29 17:41:00.000000', 'Dharapuram'),
(5, 'Hade Event', 1, 'eeee', '2021-06-19 07:12:42.382201', 1, 1, NULL, 0, 1, '2021-05-24 10:17:23.000000', 'event_poster/eventer_q1HbMH4.jpg', '2021-05-09', '2021-05-24 10:17:23.000000', 'CBE'),
(7, 'Event 10', 2, 'ddd', '2021-06-22 18:45:44.962796', 2, 1, NULL, 0, 2, '2021-06-24 10:17:23.000000', 'event_poster/eventer_LIScv1c.jpg', '2021-06-22', '2021-06-29 10:17:23.000000', 'Vellalur'),
(8, 'Demo check', 1, 'AttributeError: \'list\' object has no attribute \'strip\'', '2021-06-19 14:45:46.187921', 1, 1, NULL, 0, 1, '2021-05-24 17:56:00.000000', 'event_poster/eventer_q1HbMH4.jpg', '2021-05-24', '2021-05-28 17:56:00.000000', NULL),
(9, 'Coimbatore June Events - 2021', 1, 'AttributeError: \'list\' object has no attribute \'strip\'', '2021-06-22 18:43:53.478673', 1, 1, NULL, 0, 1, '2021-06-29 17:56:00.000000', 'event_poster/eventer_q1HbMH4.jpg', '2021-06-27', '2021-06-29 17:56:00.000000', 'Gudimangalam'),
(10, 'Event Unio', 1, '2021-05-24 17:56:00.000000', '2021-05-31 17:00:29.856158', 1, 1, NULL, 0, 1, '2021-06-24 17:56:00.000000', 'event_poster/eventer_tFoj3qP.jpg', '2021-06-23', '2021-06-28 17:56:00.000000', NULL),
(11, 'Event by gurukulam', 1, 'fff', '2021-05-28 12:18:49.641285', 1, NULL, 1, 0, 1, '2021-05-24 10:17:23.000000', 'event_poster/eventer_q1HbMH4.jpg', '2021-05-24', '2021-05-24 10:17:23.000000', NULL),
(12, 'Event HSQ', 1, 'A music festival is a community event oriented towards live performances of singing and instrument playing that is often presented with a theme such as musical genre (e.g., blues, folk, jazz, classical music), nationality, locality of musicians, or holiday. ... Some, including many rock festivals, are held only once.', '2021-06-19 13:12:28.315556', 1, 1, NULL, 0, 1, '2021-05-30 10:17:23.000000', 'event_poster/eventer_q1HbMH4.jpg', '2021-06-24', '2021-06-24 10:17:23.000000', 'Sulur'),
(13, 'Coimbatore June Music Event  2021', 1, 'Event details goes here..', '2021-06-19 13:33:31.481560', 2, 1, NULL, 0, 1, '2021-06-30 10:17:23.000000', 'event_poster/eventer_q1HbMH4.jpg', '2021-06-28', '2021-06-30 10:17:23.000000', 'Kinathukadavu'),
(14, 'Erode Events 2021', 2, 'Event details goes here', '2021-06-19 14:10:21.449868', 3, 1, NULL, 0, 2, '2021-06-26 17:56:00.000000', 'event_poster/eventer_SEqVZp8.jpg', '2021-06-23', '2021-06-29 10:17:23.000000', 'Erode South'),
(15, 'Mac Music Events 20213', 1, 'Content goes here', '2021-06-22 14:36:01.578048', 1, NULL, 1, 0, 1, '2021-06-27 10:17:23.000000', 'event_poster/Pngtreelaptop__5184713.png', '2021-06-24', '2021-06-28 10:17:23.000000', 'Coimbatore'),
(16, 'Tamilnadu Aug Event 2021', 1, 'Tamilnadu Music Group,... event details goes here', '2021-06-19 09:53:52.871229', 1, 1, NULL, 0, 1, '2021-08-20 10:17:23.000000', 'event_poster/eventer_vs8b53f.jpg', '2021-08-18', '2021-08-24 10:17:23.000000', 'Pollachi'),
(17, 'Erode Aug Music Fest', 2, 'Content goes her', '2021-06-22 18:41:04.714581', 3, 1, NULL, 0, 2, '2021-06-24 17:56:00.000000', 'event_poster/eventer_nliUhEn.jpg', '2021-06-24', '2021-06-27 10:17:23.000000', 'South Erode');

-- --------------------------------------------------------

--
-- Table structure for table `event_event_category`
--

CREATE TABLE `event_event_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_event_category`
--

INSERT INTO `event_event_category` (`id`, `name`) VALUES
(1, 'Orchestra'),
(2, 'Bhajan'),
(3, 'Contest');

-- --------------------------------------------------------

--
-- Table structure for table `event_event_skill`
--

CREATE TABLE `event_event_skill` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `skill_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_event_skill`
--

INSERT INTO `event_event_skill` (`id`, `event_id`, `skill_id`) VALUES
(10, 10, 1),
(11, 10, 2),
(12, 8, 1),
(13, 8, 2),
(15, 1, 2),
(17, 7, 3),
(18, 2, 2),
(19, 11, 3),
(20, 5, 3),
(21, 12, 1),
(22, 13, 2),
(23, 14, 3),
(24, 9, 3),
(25, 2, 3),
(26, 16, 3),
(27, 15, 1),
(28, 12, 3),
(29, 12, 2),
(30, 17, 3),
(31, 15, 3),
(32, 2, 1),
(33, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `event_event_type`
--

CREATE TABLE `event_event_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_event_type`
--

INSERT INTO `event_event_type` (`id`, `name`) VALUES
(1, 'Online'),
(2, 'Offline');

-- --------------------------------------------------------

--
-- Table structure for table `event_interest`
--

CREATE TABLE `event_interest` (
  `id` int(11) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `musician_id` int(11) DEFAULT NULL,
  `troupe_id` int(11) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_interest`
--

INSERT INTO `event_interest` (`id`, `status`, `event_id`, `musician_id`, `troupe_id`, `timestamp`) VALUES
(21, 'S', 5, 3, NULL, '2021-05-31 16:43:12.616520'),
(27, 'S', 1, 1, NULL, '2021-06-19 09:50:21.211922'),
(28, 'A', 7, 1, NULL, '2021-06-19 10:05:24.655328'),
(32, 'S', 12, 5, NULL, '2021-06-19 13:47:12.510605'),
(34, 'S', 9, NULL, 1, '2021-06-23 13:13:13.900046');

-- --------------------------------------------------------

--
-- Table structure for table `event_invitation`
--

CREATE TABLE `event_invitation` (
  `id` int(11) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `gurukulam_id` int(11) DEFAULT NULL,
  `musician_id` int(11) DEFAULT NULL,
  `troupe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_invitation`
--

INSERT INTO `event_invitation` (`id`, `status`, `timestamp`, `event_id`, `gurukulam_id`, `musician_id`, `troupe_id`) VALUES
(18, 'S', '2021-05-31 16:29:22.818619', 14, NULL, 3, NULL),
(19, 'S', '2021-05-31 16:29:38.312840', 14, 1, NULL, NULL),
(20, 'S', '2021-05-31 16:31:38.466403', 1, NULL, 3, NULL),
(22, 'A', '2021-05-31 17:11:39.780329', 2, 1, NULL, NULL),
(23, 'S', '2021-06-17 10:07:15.860402', 7, NULL, 3, NULL),
(25, 'S', '2021-06-17 15:47:44.314633', 15, NULL, 3, NULL),
(27, 'A', '2021-06-19 09:38:44.894196', 5, NULL, 2, NULL),
(28, 'S', '2021-06-19 09:51:25.584171', 14, NULL, 1, NULL),
(29, 'S', '2021-06-19 09:54:22.556267', 16, NULL, 1, NULL),
(30, 'A', '2021-06-19 09:57:58.880623', 11, NULL, 1, NULL),
(31, 'A', '2021-06-19 09:59:16.123418', 15, NULL, 1, NULL),
(32, 'S', '2021-06-19 12:15:25.683262', 12, NULL, 3, NULL),
(33, 'S', '2021-06-19 12:40:22.811392', 12, 1, NULL, NULL),
(34, 'A', '2021-06-19 15:11:10.113406', 5, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_message`
--

CREATE TABLE `event_message` (
  `id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `sent_on` datetime(6) NOT NULL,
  `interest_id` int(11) DEFAULT NULL,
  `invitation_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_message`
--

INSERT INTO `event_message` (`id`, `text`, `sent_on`, `interest_id`, `invitation_id`, `user_id`) VALUES
(63, 'Hello, I\'m the event organiser, ', '2021-05-31 16:29:22.918188', NULL, 18, 2),
(64, 'Hello, I\'m the event organiser, ', '2021-05-31 16:29:38.673040', NULL, 19, 2),
(65, 'Hello, I\'m the event organiser, and msg content goes here', '2021-05-31 16:31:38.521033', NULL, 20, 2),
(68, 'i am interest on ur event', '2021-05-31 16:43:12.721296', 21, NULL, 7),
(71, 'This msg', '2021-05-31 17:11:39.945377', NULL, 22, 2),
(72, 'Hello karthick', '2021-06-17 10:07:15.972730', NULL, 23, 2),
(74, 'hai', '2021-06-17 15:47:44.386634', NULL, 25, 5),
(90, 'Hai', '2021-06-19 09:38:45.152710', NULL, 27, 2),
(91, 'Hello Team i like to join with you', '2021-06-19 09:50:21.309651', 27, NULL, 3),
(92, 'Hello madhan , we like to invite..', '2021-06-19 09:51:25.774129', NULL, 28, 2),
(93, 'Message content goes here', '2021-06-19 09:54:22.689640', NULL, 29, 2),
(94, 'We are , content goes herw', '2021-06-19 09:57:58.953570', NULL, 30, 5),
(95, 'Hello madhan', '2021-06-19 09:59:16.173899', NULL, 31, 5),
(96, 'Hello team', '2021-06-19 10:05:24.738843', 28, NULL, 3),
(97, 'Hai ', '2021-06-19 10:06:14.217772', 28, NULL, 3),
(98, 'Hai accp', '2021-06-19 10:08:35.110861', 28, NULL, 2),
(99, 'Message conten', '2021-06-19 10:22:29.915068', NULL, 31, 3),
(102, 'jj', '2021-06-19 12:15:25.870805', NULL, 32, 2),
(103, 'ffdd', '2021-06-19 12:40:22.889587', NULL, 33, 2),
(104, 'Lorem Ipsum is simply dummy text of the printing ', '2021-06-19 13:46:23.284472', NULL, 33, 2),
(105, ' typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', '2021-06-19 13:46:37.814961', NULL, 32, 2),
(106, 'Lorem Ipsum is simply dummy text of the ', '2021-06-19 13:47:28.569867', 32, NULL, 2),
(108, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ', '2021-06-19 14:36:41.471321', NULL, 29, 3),
(110, 'Can you please send me your mobile number?', '2021-06-19 14:41:38.906944', NULL, 31, 3),
(111, 'Letraset sheets containing Lorem Ipsum passages, and more recently with desktop', '2021-06-19 14:41:50.492701', 28, NULL, 3),
(112, 'Letraset sheets containing Lorem Ipsum passages, and more recently with desktop', '2021-06-19 14:42:01.545501', NULL, 30, 3),
(119, 'Hello', '2021-06-21 10:11:49.986323', NULL, 31, 3),
(120, 'Hello', '2021-06-21 10:12:38.771025', NULL, 31, 3),
(121, 'Hello', '2021-06-21 10:12:53.749436', NULL, 31, 3),
(122, 'Hai', '2021-06-21 10:14:05.035186', NULL, 31, 3),
(123, 'Hai', '2021-06-21 10:27:20.746920', NULL, 31, 3),
(124, 'Haaai', '2021-06-21 10:28:24.190083', NULL, 31, 3),
(125, 'Hello', '2021-06-21 10:29:33.978532', NULL, 34, 3),
(126, 'Hello friends', '2021-06-21 10:30:38.773689', NULL, 27, 6),
(129, 'Hai', '2021-06-22 14:36:41.729197', NULL, 31, 5),
(130, 'Hello Sir', '2021-06-23 13:13:14.056337', 34, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `event_subscription`
--

CREATE TABLE `event_subscription` (
  `id` int(11) NOT NULL,
  `subscription_date` date NOT NULL,
  `event_organizer_id` int(11) DEFAULT NULL,
  `gurukulam_id` int(11) DEFAULT NULL,
  `musician_id` int(11) DEFAULT NULL,
  `subscription_type_id` int(11) NOT NULL,
  `troupe_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_subscription_type`
--

CREATE TABLE `event_subscription_type` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `price` double NOT NULL,
  `days` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_course`
--
ALTER TABLE `account_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_course_gurukulam_id_c30e76c1_fk_account_gurukulam_id` (`gurukulam_id`);

--
-- Indexes for table `account_district`
--
ALTER TABLE `account_district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_event_organizer`
--
ALTER TABLE `account_event_organizer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `account_event_organizer_highlight`
--
ALTER TABLE `account_event_organizer_highlight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_event_organi_event_organizer_id_ee7da733_fk_account_e` (`event_organizer_id`);

--
-- Indexes for table `account_event_organizer_highlight_highlight_category`
--
ALTER TABLE `account_event_organizer_highlight_highlight_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_event_organizer__event_organizer_highligh_eea97578_uniq` (`event_organizer_highlight_id`,`highlight_category_id`),
  ADD KEY `account_event_organi_highlight_category_i_a89da2b9_fk_account_h` (`highlight_category_id`);

--
-- Indexes for table `account_event_performer`
--
ALTER TABLE `account_event_performer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_event_perfor_event_organizer_id_4ba3d1a9_fk_account_e` (`event_organizer_id`),
  ADD KEY `account_event_perfor_musician_id_94b5956b_fk_account_m` (`musician_id`),
  ADD KEY `account_event_performer_troupe_id_b7197768_fk_account_troupe_id` (`troupe_id`);

--
-- Indexes for table `account_gurukulam`
--
ALTER TABLE `account_gurukulam`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `account_gurukulam_award`
--
ALTER TABLE `account_gurukulam_award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_gurukulam_aw_gurukulam_id_850a7a3f_fk_account_g` (`gurukulam_id`);

--
-- Indexes for table `account_gurukulam_skill`
--
ALTER TABLE `account_gurukulam_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_gurukulam_sk_gurukulam_id_0ba6e386_fk_account_g` (`gurukulam_id`),
  ADD KEY `account_gurukulam_skill_skill_id_24272661_fk_account_skill_id` (`skill_id`);

--
-- Indexes for table `account_gurukulam_testimonial`
--
ALTER TABLE `account_gurukulam_testimonial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_gurukulam_te_gurukulam_id_79482f84_fk_account_g` (`gurukulam_id`),
  ADD KEY `account_gurukulam_te_musician_id_9f02f948_fk_account_m` (`musician_id`);

--
-- Indexes for table `account_highlight_category`
--
ALTER TABLE `account_highlight_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_key_performer`
--
ALTER TABLE `account_key_performer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_key_performes_troupe_id_3f811e57_fk_account_troupe_id` (`troupe_id`),
  ADD KEY `account_key_performe_musician_id_4f3ce56e_fk_account_m` (`musician_id`);

--
-- Indexes for table `account_lecture_video`
--
ALTER TABLE `account_lecture_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_lecture_vide_gurukulam_id_f04557b5_fk_account_g` (`gurukulam_id`);

--
-- Indexes for table `account_musician`
--
ALTER TABLE `account_musician`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `account_musician_award`
--
ALTER TABLE `account_musician_award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_musician_awa_musician_id_e0ef4a28_fk_account_m` (`musician_id`);

--
-- Indexes for table `account_musician_gurukulam`
--
ALTER TABLE `account_musician_gurukulam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_musician_gur_gurukulam_id_b795cd52_fk_account_g` (`gurukulam_id`),
  ADD KEY `account_musician_gur_musician_id_09828a77_fk_account_m` (`musician_id`);

--
-- Indexes for table `account_musician_highlight`
--
ALTER TABLE `account_musician_highlight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_musician_hig_musician_id_ded0d393_fk_account_m` (`musician_id`);

--
-- Indexes for table `account_musician_highlight_highlight_category`
--
ALTER TABLE `account_musician_highlight_highlight_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_musician_highlig_musician_highlight_id_hi_1d664573_uniq` (`musician_highlight_id`,`highlight_category_id`),
  ADD KEY `account_musician_hig_highlight_category_i_559c80d0_fk_account_h` (`highlight_category_id`);

--
-- Indexes for table `account_musician_skill`
--
ALTER TABLE `account_musician_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_musician_ski_musician_id_3e2592f4_fk_account_m` (`musician_id`),
  ADD KEY `account_musician_skill_skill_id_bf54c683_fk_account_skill_id` (`skill_id`),
  ADD KEY `account_musician_ski_skill_level_id_4b3054c7_fk_account_s` (`skill_level_id`);

--
-- Indexes for table `account_post`
--
ALTER TABLE `account_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_post_user_id_7502b583_fk_account_user_id` (`user_id`),
  ADD KEY `account_post_location_id_d3c33d49_fk_account_district_id` (`location_id`),
  ADD KEY `account_post_interest_id_c518eff1_fk_event_interest_id` (`interest_id`),
  ADD KEY `account_post_invitation_id_b2033104_fk_event_invitation_id` (`invitation_id`),
  ADD KEY `account_post_musician_highlight_i_839dbaf1_fk_account_m` (`musician_highlight_id`);

--
-- Indexes for table `account_post_comment`
--
ALTER TABLE `account_post_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_post_comment_post_id_5ad1b7ee_fk_account_post_id` (`post_id`),
  ADD KEY `account_post_comment_user_id_75ed6427_fk_account_user_id` (`user_id`);

--
-- Indexes for table `account_post_user_likes`
--
ALTER TABLE `account_post_user_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_post_user_likes_post_id_user_id_75588e89_uniq` (`post_id`,`user_id`),
  ADD KEY `account_post_user_likes_user_id_9aeb685d_fk_account_user_id` (`user_id`);

--
-- Indexes for table `account_reply`
--
ALTER TABLE `account_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_reply_comment_id_c8d4a568_fk_account_post_comment_id` (`comment_id`),
  ADD KEY `account_reply_user_id_794cc73d_fk_account_user_id` (`user_id`);

--
-- Indexes for table `account_skill`
--
ALTER TABLE `account_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_skill_skill_category_id_bf8ebca3_fk_account_s` (`skill_category_id`);

--
-- Indexes for table `account_skill_category`
--
ALTER TABLE `account_skill_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_skill_level`
--
ALTER TABLE `account_skill_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_troupe`
--
ALTER TABLE `account_troupe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `account_troupe_highlight`
--
ALTER TABLE `account_troupe_highlight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_troupe_highlight_troupe_id_96aca7af_fk_account_troupe_id` (`troupe_id`);

--
-- Indexes for table `account_troupe_highlight_highlight_category`
--
ALTER TABLE `account_troupe_highlight_highlight_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_troupe_highlight_troupe_highlight_id_high_6fdb8af7_uniq` (`troupe_highlight_id`,`highlight_category_id`),
  ADD KEY `account_troupe_highl_highlight_category_i_3a241ccd_fk_account_h` (`highlight_category_id`);

--
-- Indexes for table `account_troupe_skill`
--
ALTER TABLE `account_troupe_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_troupe_skill_skill_id_b99b4507_fk_account_skill_id` (`skill_id`),
  ADD KEY `account_troupe_skill_troupe_id_33de635d_fk_account_troupe_id` (`troupe_id`);

--
-- Indexes for table `account_user`
--
ALTER TABLE `account_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_user_district_id_b5d92114_fk_account_district_id` (`district_id`);

--
-- Indexes for table `account_userfollowing`
--
ALTER TABLE `account_userfollowing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_userfollowin_following_user_id_id_68485b1f_fk_account_u` (`following_user_id_id`),
  ADD KEY `account_userfollowing_user_id_3df84ba0_fk_account_user_id` (`user_id`);

--
-- Indexes for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_user_groups_user_id_group_id_4d09af3e_uniq` (`user_id`,`group_id`),
  ADD KEY `account_user_groups_group_id_6c71f749_fk_auth_group_id` (`group_id`);

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
-- Indexes for table `event_event`
--
ALTER TABLE `event_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_event_event_category_id_b55beb35_fk_event_eve` (`event_category_id`),
  ADD KEY `event_event_event_organizer_id_c15859a4_fk_account_e` (`event_organizer_id`),
  ADD KEY `event_event_gurukulam_id_21da1427_fk_account_gurukulam_id` (`gurukulam_id`),
  ADD KEY `event_event_event_type_id_6785b75f` (`event_type_id`),
  ADD KEY `event_event_district_id_68afd138_fk_account_district_id` (`district_id`);

--
-- Indexes for table `event_event_category`
--
ALTER TABLE `event_event_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_event_skill`
--
ALTER TABLE `event_event_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_event_skill_event_id_0cf9dcd3_fk_event_event_id` (`event_id`),
  ADD KEY `event_event_skill_skill_id_15c4484a_fk_account_skill_id` (`skill_id`);

--
-- Indexes for table `event_event_type`
--
ALTER TABLE `event_event_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_interest`
--
ALTER TABLE `event_interest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_event_get_request_event_id_b71053f0_fk_event_event_id` (`event_id`),
  ADD KEY `event_event_get_requ_musician_id_a104ddc9_fk_account_m` (`musician_id`),
  ADD KEY `event_event_get_request_troupe_id_50ab0645_fk_account_troupe_id` (`troupe_id`);

--
-- Indexes for table `event_invitation`
--
ALTER TABLE `event_invitation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_send_request_event_id_994fa47f_fk_event_event_id` (`event_id`),
  ADD KEY `event_send_request_gurukulam_id_933e2b1e_fk_account_gurukulam_id` (`gurukulam_id`),
  ADD KEY `event_send_request_musician_id_a64e1acc_fk_account_musician_id` (`musician_id`),
  ADD KEY `event_send_request_troupe_id_843d1f04_fk_account_troupe_id` (`troupe_id`);

--
-- Indexes for table `event_message`
--
ALTER TABLE `event_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_message_interest_id_a9db718a_fk_event_interest_id` (`interest_id`),
  ADD KEY `event_message_invitation_id_54885e43_fk_event_invitation_id` (`invitation_id`),
  ADD KEY `event_message_user_id_22eb54aa_fk_account_user_id` (`user_id`);

--
-- Indexes for table `event_subscription`
--
ALTER TABLE `event_subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_subscription_subscription_type_id_f5fd6fe2_fk_event_sub` (`subscription_type_id`),
  ADD KEY `event_subscription_event_organizer_id_3000e0a5_fk_account_e` (`event_organizer_id`),
  ADD KEY `event_subscription_gurukulam_id_5bdbe9e0_fk_account_gurukulam_id` (`gurukulam_id`),
  ADD KEY `event_subscription_musician_id_56a7eeae_fk_account_musician_id` (`musician_id`),
  ADD KEY `event_subscription_troupe_id_528c2c8d_fk_account_troupe_id` (`troupe_id`);

--
-- Indexes for table `event_subscription_type`
--
ALTER TABLE `event_subscription_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_course`
--
ALTER TABLE `account_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_district`
--
ALTER TABLE `account_district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `account_event_organizer`
--
ALTER TABLE `account_event_organizer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_event_organizer_highlight`
--
ALTER TABLE `account_event_organizer_highlight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_event_organizer_highlight_highlight_category`
--
ALTER TABLE `account_event_organizer_highlight_highlight_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_event_performer`
--
ALTER TABLE `account_event_performer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `account_gurukulam`
--
ALTER TABLE `account_gurukulam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_gurukulam_award`
--
ALTER TABLE `account_gurukulam_award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_gurukulam_skill`
--
ALTER TABLE `account_gurukulam_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `account_gurukulam_testimonial`
--
ALTER TABLE `account_gurukulam_testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_highlight_category`
--
ALTER TABLE `account_highlight_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_key_performer`
--
ALTER TABLE `account_key_performer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_lecture_video`
--
ALTER TABLE `account_lecture_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_musician`
--
ALTER TABLE `account_musician`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `account_musician_award`
--
ALTER TABLE `account_musician_award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_musician_gurukulam`
--
ALTER TABLE `account_musician_gurukulam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `account_musician_highlight`
--
ALTER TABLE `account_musician_highlight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_musician_highlight_highlight_category`
--
ALTER TABLE `account_musician_highlight_highlight_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_musician_skill`
--
ALTER TABLE `account_musician_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `account_post`
--
ALTER TABLE `account_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `account_post_comment`
--
ALTER TABLE `account_post_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `account_post_user_likes`
--
ALTER TABLE `account_post_user_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `account_reply`
--
ALTER TABLE `account_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `account_skill`
--
ALTER TABLE `account_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `account_skill_category`
--
ALTER TABLE `account_skill_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_skill_level`
--
ALTER TABLE `account_skill_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_troupe`
--
ALTER TABLE `account_troupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_troupe_highlight`
--
ALTER TABLE `account_troupe_highlight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_troupe_highlight_highlight_category`
--
ALTER TABLE `account_troupe_highlight_highlight_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_troupe_skill`
--
ALTER TABLE `account_troupe_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_user`
--
ALTER TABLE `account_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `account_userfollowing`
--
ALTER TABLE `account_userfollowing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `account_user_user_permissions`
--
ALTER TABLE `account_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `event_event`
--
ALTER TABLE `event_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `event_event_category`
--
ALTER TABLE `event_event_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event_event_skill`
--
ALTER TABLE `event_event_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `event_event_type`
--
ALTER TABLE `event_event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_interest`
--
ALTER TABLE `event_interest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `event_invitation`
--
ALTER TABLE `event_invitation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `event_message`
--
ALTER TABLE `event_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `event_subscription`
--
ALTER TABLE `event_subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_subscription_type`
--
ALTER TABLE `event_subscription_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_course`
--
ALTER TABLE `account_course`
  ADD CONSTRAINT `account_course_gurukulam_id_c30e76c1_fk_account_gurukulam_id` FOREIGN KEY (`gurukulam_id`) REFERENCES `account_gurukulam` (`id`);

--
-- Constraints for table `account_event_organizer`
--
ALTER TABLE `account_event_organizer`
  ADD CONSTRAINT `account_event_organizer_user_id_e6b2f5f9_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_event_organizer_highlight`
--
ALTER TABLE `account_event_organizer_highlight`
  ADD CONSTRAINT `account_event_organi_event_organizer_id_ee7da733_fk_account_e` FOREIGN KEY (`event_organizer_id`) REFERENCES `account_event_organizer` (`id`);

--
-- Constraints for table `account_event_organizer_highlight_highlight_category`
--
ALTER TABLE `account_event_organizer_highlight_highlight_category`
  ADD CONSTRAINT `account_event_organi_event_organizer_high_4748bb98_fk_account_e` FOREIGN KEY (`event_organizer_highlight_id`) REFERENCES `account_event_organizer_highlight` (`id`),
  ADD CONSTRAINT `account_event_organi_highlight_category_i_a89da2b9_fk_account_h` FOREIGN KEY (`highlight_category_id`) REFERENCES `account_highlight_category` (`id`);

--
-- Constraints for table `account_event_performer`
--
ALTER TABLE `account_event_performer`
  ADD CONSTRAINT `account_event_perfor_event_organizer_id_4ba3d1a9_fk_account_e` FOREIGN KEY (`event_organizer_id`) REFERENCES `account_event_organizer` (`id`),
  ADD CONSTRAINT `account_event_perfor_musician_id_94b5956b_fk_account_m` FOREIGN KEY (`musician_id`) REFERENCES `account_musician` (`id`),
  ADD CONSTRAINT `account_event_performer_troupe_id_b7197768_fk_account_troupe_id` FOREIGN KEY (`troupe_id`) REFERENCES `account_troupe` (`id`);

--
-- Constraints for table `account_gurukulam`
--
ALTER TABLE `account_gurukulam`
  ADD CONSTRAINT `account_gurukulam_user_id_e1f89a54_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_gurukulam_award`
--
ALTER TABLE `account_gurukulam_award`
  ADD CONSTRAINT `account_gurukulam_aw_gurukulam_id_850a7a3f_fk_account_g` FOREIGN KEY (`gurukulam_id`) REFERENCES `account_gurukulam` (`id`);

--
-- Constraints for table `account_gurukulam_skill`
--
ALTER TABLE `account_gurukulam_skill`
  ADD CONSTRAINT `account_gurukulam_sk_gurukulam_id_0ba6e386_fk_account_g` FOREIGN KEY (`gurukulam_id`) REFERENCES `account_gurukulam` (`id`),
  ADD CONSTRAINT `account_gurukulam_skill_skill_id_24272661_fk_account_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `account_skill` (`id`);

--
-- Constraints for table `account_gurukulam_testimonial`
--
ALTER TABLE `account_gurukulam_testimonial`
  ADD CONSTRAINT `account_gurukulam_te_gurukulam_id_79482f84_fk_account_g` FOREIGN KEY (`gurukulam_id`) REFERENCES `account_gurukulam` (`id`),
  ADD CONSTRAINT `account_gurukulam_te_musician_id_9f02f948_fk_account_m` FOREIGN KEY (`musician_id`) REFERENCES `account_musician` (`id`);

--
-- Constraints for table `account_key_performer`
--
ALTER TABLE `account_key_performer`
  ADD CONSTRAINT `account_key_performe_musician_id_4f3ce56e_fk_account_m` FOREIGN KEY (`musician_id`) REFERENCES `account_musician` (`id`),
  ADD CONSTRAINT `account_key_performes_troupe_id_3f811e57_fk_account_troupe_id` FOREIGN KEY (`troupe_id`) REFERENCES `account_troupe` (`id`);

--
-- Constraints for table `account_lecture_video`
--
ALTER TABLE `account_lecture_video`
  ADD CONSTRAINT `account_lecture_vide_gurukulam_id_f04557b5_fk_account_g` FOREIGN KEY (`gurukulam_id`) REFERENCES `account_gurukulam` (`id`);

--
-- Constraints for table `account_musician`
--
ALTER TABLE `account_musician`
  ADD CONSTRAINT `account_musician_user_id_7c662056_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_musician_award`
--
ALTER TABLE `account_musician_award`
  ADD CONSTRAINT `account_musician_awa_musician_id_e0ef4a28_fk_account_m` FOREIGN KEY (`musician_id`) REFERENCES `account_musician` (`id`);

--
-- Constraints for table `account_musician_gurukulam`
--
ALTER TABLE `account_musician_gurukulam`
  ADD CONSTRAINT `account_musician_gur_gurukulam_id_b795cd52_fk_account_g` FOREIGN KEY (`gurukulam_id`) REFERENCES `account_gurukulam` (`id`),
  ADD CONSTRAINT `account_musician_gur_musician_id_09828a77_fk_account_m` FOREIGN KEY (`musician_id`) REFERENCES `account_musician` (`id`);

--
-- Constraints for table `account_musician_highlight`
--
ALTER TABLE `account_musician_highlight`
  ADD CONSTRAINT `account_musician_hig_musician_id_ded0d393_fk_account_m` FOREIGN KEY (`musician_id`) REFERENCES `account_musician` (`id`);

--
-- Constraints for table `account_musician_highlight_highlight_category`
--
ALTER TABLE `account_musician_highlight_highlight_category`
  ADD CONSTRAINT `account_musician_hig_highlight_category_i_559c80d0_fk_account_h` FOREIGN KEY (`highlight_category_id`) REFERENCES `account_highlight_category` (`id`),
  ADD CONSTRAINT `account_musician_hig_musician_highlight_i_f95e60db_fk_account_m` FOREIGN KEY (`musician_highlight_id`) REFERENCES `account_musician_highlight` (`id`);

--
-- Constraints for table `account_musician_skill`
--
ALTER TABLE `account_musician_skill`
  ADD CONSTRAINT `account_musician_ski_musician_id_3e2592f4_fk_account_m` FOREIGN KEY (`musician_id`) REFERENCES `account_musician` (`id`),
  ADD CONSTRAINT `account_musician_ski_skill_level_id_4b3054c7_fk_account_s` FOREIGN KEY (`skill_level_id`) REFERENCES `account_skill_level` (`id`),
  ADD CONSTRAINT `account_musician_skill_skill_id_bf54c683_fk_account_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `account_skill` (`id`);

--
-- Constraints for table `account_post`
--
ALTER TABLE `account_post`
  ADD CONSTRAINT `account_post_interest_id_c518eff1_fk_event_interest_id` FOREIGN KEY (`interest_id`) REFERENCES `event_interest` (`id`),
  ADD CONSTRAINT `account_post_invitation_id_b2033104_fk_event_invitation_id` FOREIGN KEY (`invitation_id`) REFERENCES `event_invitation` (`id`),
  ADD CONSTRAINT `account_post_location_id_d3c33d49_fk_account_district_id` FOREIGN KEY (`location_id`) REFERENCES `account_district` (`id`),
  ADD CONSTRAINT `account_post_musician_highlight_i_839dbaf1_fk_account_m` FOREIGN KEY (`musician_highlight_id`) REFERENCES `account_musician_highlight` (`id`),
  ADD CONSTRAINT `account_post_user_id_7502b583_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_post_comment`
--
ALTER TABLE `account_post_comment`
  ADD CONSTRAINT `account_post_comment_post_id_5ad1b7ee_fk_account_post_id` FOREIGN KEY (`post_id`) REFERENCES `account_post` (`id`),
  ADD CONSTRAINT `account_post_comment_user_id_75ed6427_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_post_user_likes`
--
ALTER TABLE `account_post_user_likes`
  ADD CONSTRAINT `account_post_user_likes_post_id_c7a7fa9f_fk_account_post_id` FOREIGN KEY (`post_id`) REFERENCES `account_post` (`id`),
  ADD CONSTRAINT `account_post_user_likes_user_id_9aeb685d_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_reply`
--
ALTER TABLE `account_reply`
  ADD CONSTRAINT `account_reply_comment_id_c8d4a568_fk_account_post_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `account_post_comment` (`id`),
  ADD CONSTRAINT `account_reply_user_id_794cc73d_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_skill`
--
ALTER TABLE `account_skill`
  ADD CONSTRAINT `account_skill_skill_category_id_bf8ebca3_fk_account_s` FOREIGN KEY (`skill_category_id`) REFERENCES `account_skill_category` (`id`);

--
-- Constraints for table `account_troupe`
--
ALTER TABLE `account_troupe`
  ADD CONSTRAINT `account_troupe_user_id_3741ee0f_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_troupe_highlight`
--
ALTER TABLE `account_troupe_highlight`
  ADD CONSTRAINT `account_troupe_highlight_troupe_id_96aca7af_fk_account_troupe_id` FOREIGN KEY (`troupe_id`) REFERENCES `account_troupe` (`id`);

--
-- Constraints for table `account_troupe_highlight_highlight_category`
--
ALTER TABLE `account_troupe_highlight_highlight_category`
  ADD CONSTRAINT `account_troupe_highl_highlight_category_i_3a241ccd_fk_account_h` FOREIGN KEY (`highlight_category_id`) REFERENCES `account_highlight_category` (`id`),
  ADD CONSTRAINT `account_troupe_highl_troupe_highlight_id_1d4a4ced_fk_account_t` FOREIGN KEY (`troupe_highlight_id`) REFERENCES `account_troupe_highlight` (`id`);

--
-- Constraints for table `account_troupe_skill`
--
ALTER TABLE `account_troupe_skill`
  ADD CONSTRAINT `account_troupe_skill_skill_id_b99b4507_fk_account_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `account_skill` (`id`),
  ADD CONSTRAINT `account_troupe_skill_troupe_id_33de635d_fk_account_troupe_id` FOREIGN KEY (`troupe_id`) REFERENCES `account_troupe` (`id`);

--
-- Constraints for table `account_user`
--
ALTER TABLE `account_user`
  ADD CONSTRAINT `account_user_district_id_b5d92114_fk_account_district_id` FOREIGN KEY (`district_id`) REFERENCES `account_district` (`id`);

--
-- Constraints for table `account_userfollowing`
--
ALTER TABLE `account_userfollowing`
  ADD CONSTRAINT `account_userfollowin_following_user_id_id_68485b1f_fk_account_u` FOREIGN KEY (`following_user_id_id`) REFERENCES `account_user` (`id`),
  ADD CONSTRAINT `account_userfollowing_user_id_3df84ba0_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  ADD CONSTRAINT `account_user_groups_group_id_6c71f749_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `account_user_groups_user_id_14345e7b_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `event_event`
--
ALTER TABLE `event_event`
  ADD CONSTRAINT `event_event_district_id_68afd138_fk_account_district_id` FOREIGN KEY (`district_id`) REFERENCES `account_district` (`id`),
  ADD CONSTRAINT `event_event_event_category_id_b55beb35_fk_event_eve` FOREIGN KEY (`event_category_id`) REFERENCES `event_event_category` (`id`),
  ADD CONSTRAINT `event_event_event_organizer_id_c15859a4_fk_account_e` FOREIGN KEY (`event_organizer_id`) REFERENCES `account_event_organizer` (`id`),
  ADD CONSTRAINT `event_event_event_type_id_6785b75f_fk_event_event_type_id` FOREIGN KEY (`event_type_id`) REFERENCES `event_event_type` (`id`),
  ADD CONSTRAINT `event_event_gurukulam_id_21da1427_fk_account_gurukulam_id` FOREIGN KEY (`gurukulam_id`) REFERENCES `account_gurukulam` (`id`);

--
-- Constraints for table `event_event_skill`
--
ALTER TABLE `event_event_skill`
  ADD CONSTRAINT `event_event_skill_event_id_0cf9dcd3_fk_event_event_id` FOREIGN KEY (`event_id`) REFERENCES `event_event` (`id`),
  ADD CONSTRAINT `event_event_skill_skill_id_15c4484a_fk_account_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `account_skill` (`id`);

--
-- Constraints for table `event_interest`
--
ALTER TABLE `event_interest`
  ADD CONSTRAINT `event_event_get_requ_musician_id_a104ddc9_fk_account_m` FOREIGN KEY (`musician_id`) REFERENCES `account_musician` (`id`),
  ADD CONSTRAINT `event_event_get_request_event_id_b71053f0_fk_event_event_id` FOREIGN KEY (`event_id`) REFERENCES `event_event` (`id`),
  ADD CONSTRAINT `event_event_get_request_troupe_id_50ab0645_fk_account_troupe_id` FOREIGN KEY (`troupe_id`) REFERENCES `account_troupe` (`id`);

--
-- Constraints for table `event_invitation`
--
ALTER TABLE `event_invitation`
  ADD CONSTRAINT `event_send_request_event_id_994fa47f_fk_event_event_id` FOREIGN KEY (`event_id`) REFERENCES `event_event` (`id`),
  ADD CONSTRAINT `event_send_request_gurukulam_id_933e2b1e_fk_account_gurukulam_id` FOREIGN KEY (`gurukulam_id`) REFERENCES `account_gurukulam` (`id`),
  ADD CONSTRAINT `event_send_request_musician_id_a64e1acc_fk_account_musician_id` FOREIGN KEY (`musician_id`) REFERENCES `account_musician` (`id`),
  ADD CONSTRAINT `event_send_request_troupe_id_843d1f04_fk_account_troupe_id` FOREIGN KEY (`troupe_id`) REFERENCES `account_troupe` (`id`);

--
-- Constraints for table `event_message`
--
ALTER TABLE `event_message`
  ADD CONSTRAINT `event_message_interest_id_a9db718a_fk_event_interest_id` FOREIGN KEY (`interest_id`) REFERENCES `event_interest` (`id`),
  ADD CONSTRAINT `event_message_invitation_id_54885e43_fk_event_invitation_id` FOREIGN KEY (`invitation_id`) REFERENCES `event_invitation` (`id`),
  ADD CONSTRAINT `event_message_user_id_22eb54aa_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `event_subscription`
--
ALTER TABLE `event_subscription`
  ADD CONSTRAINT `event_subscription_event_organizer_id_3000e0a5_fk_account_e` FOREIGN KEY (`event_organizer_id`) REFERENCES `account_event_organizer` (`id`),
  ADD CONSTRAINT `event_subscription_gurukulam_id_5bdbe9e0_fk_account_gurukulam_id` FOREIGN KEY (`gurukulam_id`) REFERENCES `account_gurukulam` (`id`),
  ADD CONSTRAINT `event_subscription_musician_id_56a7eeae_fk_account_musician_id` FOREIGN KEY (`musician_id`) REFERENCES `account_musician` (`id`),
  ADD CONSTRAINT `event_subscription_subscription_type_id_f5fd6fe2_fk_event_sub` FOREIGN KEY (`subscription_type_id`) REFERENCES `event_subscription_type` (`id`),
  ADD CONSTRAINT `event_subscription_troupe_id_528c2c8d_fk_account_troupe_id` FOREIGN KEY (`troupe_id`) REFERENCES `account_troupe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
