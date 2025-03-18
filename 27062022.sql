-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: w_portal
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_assistant`
--

DROP TABLE IF EXISTS `account_assistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_assistant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `senior` varchar(100) NOT NULL,
  `year` int unsigned DEFAULT NULL,
  `project_id` bigint NOT NULL,
  `senior_link_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_assistant_project_id_3413590e_fk_account_project_id` (`project_id`),
  KEY `account_assistant_senior_link_id_cb88ff18_fk_account_user_id` (`senior_link_id`),
  KEY `account_assistant_user_id_e657449f_fk_account_user_id` (`user_id`),
  CONSTRAINT `account_assistant_project_id_3413590e_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`),
  CONSTRAINT `account_assistant_senior_link_id_cb88ff18_fk_account_user_id` FOREIGN KEY (`senior_link_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `account_assistant_user_id_e657449f_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `account_assistant_chk_1` CHECK ((`year` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_assistant`
--

LOCK TABLES `account_assistant` WRITE;
/*!40000 ALTER TABLE `account_assistant` DISABLE KEYS */;
INSERT INTO `account_assistant` VALUES (4,'',2019,18,61,63);
/*!40000 ALTER TABLE `account_assistant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_award`
--

DROP TABLE IF EXISTS `account_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_award` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `year` int unsigned NOT NULL,
  `banner` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `project_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_award_project_id_dbe02c08_fk_account_project_id` (`project_id`),
  KEY `account_award_user_id_bdb380e5_fk_account_user_id` (`user_id`),
  CONSTRAINT `account_award_project_id_dbe02c08_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`),
  CONSTRAINT `account_award_user_id_bdb380e5_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `account_award_chk_1` CHECK ((`year` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_award`
--

LOCK TABLES `account_award` WRITE;
/*!40000 ALTER TABLE `account_award` DISABLE KEYS */;
INSERT INTO `account_award` VALUES (4,'Best Cinemotographer',2015,'http://screenwriters.in/my_profile/#','awards/cool.png',18,63);
/*!40000 ALTER TABLE `account_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_blocked_user`
--

DROP TABLE IF EXISTS `account_blocked_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_blocked_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blocked_by_id` bigint NOT NULL,
  `blocked_user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_blocked_user_blocked_by_id_fb2b209b_fk_account_user_id` (`blocked_by_id`),
  KEY `account_blocked_user_blocked_user_id_784b3531_fk_account_user_id` (`blocked_user_id`),
  CONSTRAINT `account_blocked_user_blocked_by_id_fb2b209b_fk_account_user_id` FOREIGN KEY (`blocked_by_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `account_blocked_user_blocked_user_id_784b3531_fk_account_user_id` FOREIGN KEY (`blocked_user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_blocked_user`
--

LOCK TABLES `account_blocked_user` WRITE;
/*!40000 ALTER TABLE `account_blocked_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_blocked_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_chat`
--

DROP TABLE IF EXISTS `account_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `message` longtext NOT NULL,
  `unread` tinyint(1) NOT NULL,
  `m_file` varchar(100) DEFAULT NULL,
  `conversation_id` bigint DEFAULT NULL,
  `sender_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_chat_conversation_id_1c0aeeb5_fk_account_conversation_id` (`conversation_id`),
  KEY `account_chat_sender_id_fa6c8461_fk_account_user_id` (`sender_id`),
  CONSTRAINT `account_chat_conversation_id_1c0aeeb5_fk_account_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `account_conversation` (`id`),
  CONSTRAINT `account_chat_sender_id_fa6c8461_fk_account_user_id` FOREIGN KEY (`sender_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_chat`
--

LOCK TABLES `account_chat` WRITE;
/*!40000 ALTER TABLE `account_chat` DISABLE KEYS */;
INSERT INTO `account_chat` VALUES (68,'2022-01-07 19:07:59.041282','Hi..how are you? ',0,'',16,61),(69,'2022-01-07 19:10:11.019360','i am fine sir. how are you?',0,'',16,62),(70,'2022-01-08 11:22:30.491997','FINAL SCRIPT AR.pdf',0,'message_file/FINAL_SCRIPT_AR.pdf',17,64),(71,'2022-01-08 11:22:41.602518','test script\r\n',0,'',17,64),(72,'2022-01-08 17:35:05.820869','de3278f8ecafa84670034a78f5077d29.pdf',0,'message_file/de3278f8ecafa84670034a78f5077d29.pdf',18,63),(73,'2022-01-08 20:22:17.952025','ARI-C-37035.pdf',0,'message_file/ARI-C-37035.pdf',18,63),(74,'2022-01-08 20:23:44.255640','ARI-C-37035.pdf',0,'message_file/ARI-C-37035_Vtl12wj.pdf',18,63),(75,'2022-01-18 11:39:27.372586','Haai',1,'',19,46),(76,'2022-01-20 09:33:01.878428','de3278f8ecafa84670034a78f5077d29.pdf',1,'message_file/de3278f8ecafa84670034a78f5077d29_TFenD5p.pdf',19,46),(77,'2022-01-20 09:33:08.606992','Hllo ',1,'',19,46),(78,'2022-01-20 09:33:12.525312','this is',1,'',19,46),(79,'2022-01-20 09:33:17.235142','madhan',1,'',19,46),(80,'2022-01-21 09:22:58.736727','hi',1,'',20,46),(81,'2022-01-21 09:23:00.458353','hi',1,'',20,46),(82,'2022-01-21 09:23:04.803294','hello',1,'',20,46),(83,'2022-01-21 09:23:13.108874','hiiii',1,'',20,46),(84,'2022-01-21 09:25:05.779046','hi',1,'',20,46),(85,'2022-01-21 09:28:10.110415','hello',1,'',20,46),(86,'2022-01-21 09:29:39.775459','hi',1,'',21,63),(87,'2022-01-21 09:34:09.993340','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',1,'',21,63),(88,'2022-01-21 10:44:16.837308','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',0,'',18,68),(89,'2022-01-21 10:56:19.420928','sample',0,'',22,46),(90,'2022-01-21 10:56:56.985059','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',0,'',22,46),(91,'2022-01-21 11:00:40.550966','hi',0,'',22,46),(92,'2022-01-21 11:21:52.041785','ggg',0,'',22,46),(93,'2022-01-21 13:53:27.117193','hi',0,'',18,68),(94,'2022-01-21 13:53:28.132436','hi',0,'',18,68),(95,'2022-01-21 13:55:59.183301','hi',0,'',18,68),(96,'2022-01-21 13:57:43.086715','hi',0,'',18,68),(97,'2022-01-21 13:57:45.480086','ddd',0,'',18,68),(98,'2022-02-17 17:00:44.127758','hello',0,'',23,77),(99,'2022-02-17 17:00:46.440147','hello',0,'',23,77),(100,'2022-02-17 17:00:55.560076','!!!',0,'',23,77),(101,'2022-02-17 17:09:33.830499','yes',0,'',23,64),(102,'2022-02-22 14:30:31.418760','',0,'message_file/Accountancy_answer-converted.pdf',18,63),(103,'2022-02-22 14:36:33.865131','',0,'message_file/Biodata_Kamalraj.pdf',18,63),(104,'2022-02-22 14:37:34.171575','Biodata_Kamalraj.pdf',0,'message_file/Biodata_Kamalraj_UHOIvlC.pdf',18,68),(105,'2022-02-22 14:46:53.499950','Biodata_Kamalraj.pdf',0,'message_file/Biodata_Kamalraj_fdafydQ.pdf',18,68),(106,'2022-02-22 14:52:19.592435','',0,'message_file/ECE_A_Newbie_2021-DAY_I_LINK_62WdTty.pdf',18,63),(107,'2022-05-19 22:45:19.843463','I am good. Thanks! ',1,'',16,61);
/*!40000 ALTER TABLE `account_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_company`
--

DROP TABLE IF EXISTS `account_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `address` longtext NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `started_date` date NOT NULL,
  `logo` varchar(100) NOT NULL,
  `location_id` bigint NOT NULL,
  `owner_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_id` (`owner_id`),
  KEY `account_company_location_id_1db26525_fk_account_location_id` (`location_id`),
  CONSTRAINT `account_company_location_id_1db26525_fk_account_location_id` FOREIGN KEY (`location_id`) REFERENCES `account_location` (`id`),
  CONSTRAINT `account_company_owner_id_cba96d59_fk_account_user_id` FOREIGN KEY (`owner_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_company`
--

LOCK TABLES `account_company` WRITE;
/*!40000 ALTER TABLE `account_company` DISABLE KEYS */;
INSERT INTO `account_company` VALUES (3,'Dream Warrior Pictures','T Nagar','9003092205','2014-04-01','Company Logo/Logo_of_Dream_Warrior_Pictures.png',1,61),(4,'Viky','chhenai','8888888883','2022-01-06','Company Logo/maxresdefault.jpg',1,72);
/*!40000 ALTER TABLE `account_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_conversation`
--

DROP TABLE IF EXISTS `account_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_conversation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `receiver_id` bigint NOT NULL,
  `sender_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_conversation_receiver_id_02551a23_fk_account_user_id` (`receiver_id`),
  KEY `account_conversation_sender_id_dc7e4fe3_fk_account_user_id` (`sender_id`),
  CONSTRAINT `account_conversation_receiver_id_02551a23_fk_account_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `account_conversation_sender_id_dc7e4fe3_fk_account_user_id` FOREIGN KEY (`sender_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_conversation`
--

LOCK TABLES `account_conversation` WRITE;
/*!40000 ALTER TABLE `account_conversation` DISABLE KEYS */;
INSERT INTO `account_conversation` VALUES (16,'2022-05-19 22:45:19.839532',62,61),(17,'2022-01-08 11:22:41.599038',62,64),(18,'2022-02-22 14:52:19.586946',68,63),(19,'2022-01-20 09:33:17.231209',71,46),(20,'2022-01-21 09:28:10.082427',72,46),(21,'2022-01-21 09:34:09.988953',72,63),(22,'2022-01-21 11:21:52.038418',68,46),(23,'2022-02-17 17:09:33.826684',64,77);
/*!40000 ALTER TABLE `account_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_format`
--

DROP TABLE IF EXISTS `account_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_format` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_format`
--

LOCK TABLES `account_format` WRITE;
/*!40000 ALTER TABLE `account_format` DISABLE KEYS */;
INSERT INTO `account_format` VALUES (1,'Originals'),(2,'Feature'),(3,'Short films'),(4,'Web Series'),(5,'Documentary'),(6,'Television');
/*!40000 ALTER TABLE `account_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_genre`
--

DROP TABLE IF EXISTS `account_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_genre`
--

LOCK TABLES `account_genre` WRITE;
/*!40000 ALTER TABLE `account_genre` DISABLE KEYS */;
INSERT INTO `account_genre` VALUES (1,'Action'),(2,'Comedy'),(3,'Thriller'),(4,'Horror'),(5,'Romance'),(6,'Real-life'),(7,'Other');
/*!40000 ALTER TABLE `account_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_highlight`
--

DROP TABLE IF EXISTS `account_highlight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_highlight` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint DEFAULT NULL,
  `content` longtext,
  `title` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_highlight_project_id_a859a431_fk_account_project_id` (`project_id`),
  CONSTRAINT `account_highlight_project_id_a859a431_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_highlight`
--

LOCK TABLES `account_highlight` WRITE;
/*!40000 ALTER TABLE `account_highlight` DISABLE KEYS */;
INSERT INTO `account_highlight` VALUES (13,18,'cool','cool');
/*!40000 ALTER TABLE `account_highlight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_join_project`
--

DROP TABLE IF EXISTS `account_join_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_join_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_join_project_project_id_af425906_fk_account_project_id` (`project_id`),
  KEY `account_join_project_user_id_3df1d0c4_fk_account_user_id` (`user_id`),
  CONSTRAINT `account_join_project_project_id_af425906_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`),
  CONSTRAINT `account_join_project_user_id_3df1d0c4_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_join_project`
--

LOCK TABLES `account_join_project` WRITE;
/*!40000 ALTER TABLE `account_join_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_join_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_language`
--

DROP TABLE IF EXISTS `account_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_language` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `language` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_language`
--

LOCK TABLES `account_language` WRITE;
/*!40000 ALTER TABLE `account_language` DISABLE KEYS */;
INSERT INTO `account_language` VALUES (1,'Tamil'),(2,'Malayalam'),(3,'Telugu'),(4,'Kannada'),(5,'Hindi'),(6,'Other');
/*!40000 ALTER TABLE `account_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_location`
--

DROP TABLE IF EXISTS `account_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_location`
--

LOCK TABLES `account_location` WRITE;
/*!40000 ALTER TABLE `account_location` DISABLE KEYS */;
INSERT INTO `account_location` VALUES (1,'Chennai'),(2,'Coimbatore'),(3,'Erode'),(4,'Salem'),(5,'Ariyalur'),(6,'Chengalpattu'),(7,'Cuddalore'),(8,'Dharmapuri'),(9,'Dindigul'),(10,'Kallakurichi'),(11,'Kanchipuram'),(12,'Kanyakumari'),(13,'Karur'),(14,'Krishnagiri'),(15,'Madurai'),(16,'Nagapattinam'),(17,'Namakkal'),(18,'Nilgiris'),(19,'Perambalur'),(20,'Pudukkottai'),(21,'Ramanathapuram'),(22,'Ranipet'),(23,'Sivaganga'),(24,'Tenkasi'),(25,'Thanjavur'),(26,'Theni'),(27,'Thoothukudi'),(28,'Tiruchirappalli'),(29,'Tirunelveli'),(30,'Tirupathur'),(31,'Tiruppur'),(32,'Tiruvallur'),(33,'Tiruvannamalai'),(34,'Tiruvarur'),(35,'Vellore'),(36,'Viluppuram'),(37,'Virudhunagar');
/*!40000 ALTER TABLE `account_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_open_to`
--

DROP TABLE IF EXISTS `account_open_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_open_to` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_open_to`
--

LOCK TABLES `account_open_to` WRITE;
/*!40000 ALTER TABLE `account_open_to` DISABLE KEYS */;
INSERT INTO `account_open_to` VALUES (1,'Story Writing'),(2,'Screen Writing'),(3,'Dialogue Writing'),(4,'Lyrics Writing'),(5,'Story Discussion'),(6,'Script Doctoring');
/*!40000 ALTER TABLE `account_open_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_project`
--

DROP TABLE IF EXISTS `account_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `year` int unsigned NOT NULL,
  `budget` double DEFAULT NULL,
  `imdb_link` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` longtext,
  `status` varchar(1) DEFAULT NULL,
  `created_by_id` bigint NOT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_project_created_by_id_6500e9e1_fk_account_user_id` (`created_by_id`),
  CONSTRAINT `account_project_created_by_id_6500e9e1_fk_account_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `account_project_chk_1` CHECK ((`year` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_project`
--

LOCK TABLES `account_project` WRITE;
/*!40000 ALTER TABLE `account_project` DISABLE KEYS */;
INSERT INTO `account_project` VALUES (14,'Ayalaan',2022,150,'','project_image/Actor-Sivakarthikeyan-Ayalaan-First-Look-Poster-HD.jpg',NULL,'P',65,'2022-04-14'),(15,'ayalaan',2022,150,'','project_image/Actor-Sivakarthikeyan-Ayalaan-First-Look-Poster-HD_BmYMWwi.jpg',NULL,'P',65,NULL),(17,'sample',2022,34,'http://127.0.0.1:8000/my_profile/','project_image/cool_9KYn33T.png',NULL,'C',63,'2022-01-13'),(18,'Vikram',2022,100,'','project_image/Vikram_2021_First_look.jpg',NULL,'P',63,'2022-06-30'),(21,'Vicky',2022,60,'https://www.imdb.com/title/tt0458050/','project_image/maxresdefault.jpg',NULL,'U',72,'2022-01-13'),(33,'Ratha Kanneer',1954,1,'https://www.imdb.com/title/tt0234571/','project_image/maxresdefault_ITxvZp9.jpg',NULL,'C',68,'1954-07-06');
/*!40000 ALTER TABLE `account_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_project_genre`
--

DROP TABLE IF EXISTS `account_project_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_project_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_project_genre_project_id_genre_id_a677af69_uniq` (`project_id`,`genre_id`),
  KEY `account_project_genre_genre_id_37c96c13_fk_account_genre_id` (`genre_id`),
  CONSTRAINT `account_project_genre_genre_id_37c96c13_fk_account_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `account_genre` (`id`),
  CONSTRAINT `account_project_genre_project_id_0431d3af_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_project_genre`
--

LOCK TABLES `account_project_genre` WRITE;
/*!40000 ALTER TABLE `account_project_genre` DISABLE KEYS */;
INSERT INTO `account_project_genre` VALUES (8,14,1),(9,14,3),(12,17,2),(13,18,1),(14,18,3),(27,21,1),(37,33,2),(38,33,3);
/*!40000 ALTER TABLE `account_project_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_project_language`
--

DROP TABLE IF EXISTS `account_project_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_project_language` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `language_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_project_language_project_id_language_id_77b39fe1_uniq` (`project_id`,`language_id`),
  KEY `account_project_lang_language_id_91351332_fk_account_l` (`language_id`),
  CONSTRAINT `account_project_lang_language_id_91351332_fk_account_l` FOREIGN KEY (`language_id`) REFERENCES `account_language` (`id`),
  CONSTRAINT `account_project_lang_project_id_f437166c_fk_account_p` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_project_language`
--

LOCK TABLES `account_project_language` WRITE;
/*!40000 ALTER TABLE `account_project_language` DISABLE KEYS */;
INSERT INTO `account_project_language` VALUES (1,18,1),(2,18,2),(3,18,3),(16,21,1),(17,21,2),(18,21,3),(25,33,1);
/*!40000 ALTER TABLE `account_project_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_qualification`
--

DROP TABLE IF EXISTS `account_qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_qualification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `degree` varchar(100) NOT NULL,
  `institute` varchar(250) NOT NULL,
  `year` int unsigned NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_qualification_user_id_df90edb6_fk_account_user_id` (`user_id`),
  CONSTRAINT `account_qualification_user_id_df90edb6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `account_qualification_chk_1` CHECK ((`year` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_qualification`
--

LOCK TABLES `account_qualification` WRITE;
/*!40000 ALTER TABLE `account_qualification` DISABLE KEYS */;
INSERT INTO `account_qualification` VALUES (8,'Bsc Computer Science','St. Johns College',2005,62),(9,'BE','Computer Science',2019,63),(10,'BE','MCET',2019,72),(11,'Computer Science and Engineering','KIT',1984,68);
/*!40000 ALTER TABLE `account_qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_rating`
--

DROP TABLE IF EXISTS `account_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stars` int NOT NULL,
  `rated_by_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_rating_rated_by_id_53e36b80_fk_account_user_id` (`rated_by_id`),
  KEY `account_rating_user_id_9b860557_fk_account_user_id` (`user_id`),
  CONSTRAINT `account_rating_rated_by_id_53e36b80_fk_account_user_id` FOREIGN KEY (`rated_by_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `account_rating_user_id_9b860557_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_rating`
--

LOCK TABLES `account_rating` WRITE;
/*!40000 ALTER TABLE `account_rating` DISABLE KEYS */;
INSERT INTO `account_rating` VALUES (4,5,68,63);
/*!40000 ALTER TABLE `account_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_report_people`
--

DROP TABLE IF EXISTS `account_report_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_report_people` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reported_on` date NOT NULL,
  `complaint` longtext NOT NULL,
  `report_file` varchar(100) NOT NULL,
  `reported_by_id` bigint NOT NULL,
  `reported_user_id` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_report_people_reported_by_id_dd7f8473_fk_account_user_id` (`reported_by_id`),
  KEY `account_report_peopl_reported_user_id_7826eddf_fk_account_u` (`reported_user_id`),
  CONSTRAINT `account_report_peopl_reported_user_id_7826eddf_fk_account_u` FOREIGN KEY (`reported_user_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `account_report_people_reported_by_id_dd7f8473_fk_account_user_id` FOREIGN KEY (`reported_by_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_report_people`
--

LOCK TABLES `account_report_people` WRITE;
/*!40000 ALTER TABLE `account_report_people` DISABLE KEYS */;
INSERT INTO `account_report_people` VALUES (5,'2022-01-21','ggggg','',68,63,0),(6,'2022-01-21','fraud payan','',68,63,1);
/*!40000 ALTER TABLE `account_report_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_testimonial`
--

DROP TABLE IF EXISTS `account_testimonial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_testimonial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `text_content` longtext NOT NULL,
  `picture_content` varchar(100) NOT NULL,
  `video_content` varchar(200) NOT NULL,
  `person_id` bigint NOT NULL,
  `project_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_testimonial_person_id_b81e7d7e_fk_account_user_id` (`person_id`),
  KEY `account_testimonial_project_id_24df45e7_fk_account_project_id` (`project_id`),
  KEY `account_testimonial_user_id_4f84d6dd_fk_account_user_id` (`user_id`),
  CONSTRAINT `account_testimonial_person_id_b81e7d7e_fk_account_user_id` FOREIGN KEY (`person_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `account_testimonial_project_id_24df45e7_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`),
  CONSTRAINT `account_testimonial_user_id_4f84d6dd_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_testimonial`
--

LOCK TABLES `account_testimonial` WRITE;
/*!40000 ALTER TABLE `account_testimonial` DISABLE KEYS */;
INSERT INTO `account_testimonial` VALUES (5,'sample','sample','','',63,18,68),(6,'sss','ssss','','',63,18,68);
/*!40000 ALTER TABLE `account_testimonial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user`
--

DROP TABLE IF EXISTS `account_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `dob` date DEFAULT NULL,
  `no_of_filims_worked` int unsigned NOT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `profile_photo` varchar(100) DEFAULT NULL,
  `available` varchar(1) DEFAULT NULL,
  `address` longtext,
  `registered_on` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `make_mobile_no_visible` varchar(1) DEFAULT NULL,
  `make_address_visible` varchar(1) DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `other_genre` varchar(100) DEFAULT NULL,
  `other_language` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `get_notification` tinyint(1) NOT NULL,
  `admin_approval` tinyint(1) NOT NULL,
  `verified_email` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `account_user_mobile_no_0d7816b2_uniq` (`mobile_no`),
  KEY `account_user_location_id_621ee626_fk_account_location_id` (`location_id`),
  CONSTRAINT `account_user_location_id_621ee626_fk_account_location_id` FOREIGN KEY (`location_id`) REFERENCES `account_location` (`id`),
  CONSTRAINT `account_user_chk_1` CHECK ((`no_of_filims_worked` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user`
--

LOCK TABLES `account_user` WRITE;
/*!40000 ALTER TABLE `account_user` DISABLE KEYS */;
INSERT INTO `account_user` VALUES (1,'pbkdf2_sha256$260000$Ek5LdUFeezDVWt9qyXfX4u$3+GaZVae5mBxJ9ZvrWsiz7GkvFuUjhZYoQyM/hStS34=','2021-10-30 16:52:49.448148',1,'admin321','admin@wp.com','','','',NULL,0,'9095305984','',NULL,'','2021-10-04',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0),(46,'pbkdf2_sha256$260000$Ek5LdUFeezDVWt9qyXfX4u$3+GaZVae5mBxJ9ZvrWsiz7GkvFuUjhZYoQyM/hStS34=','2022-03-12 11:59:31.915914',0,'portal_admin','portal_admin@gmail.com','Portal Admin','','M','2021-10-22',1,'7010951630','profile_picture/admin_2.jpg',NULL,'','2021-10-22',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0),(48,'pbkdf2_sha256$260000$ZSv75pGKoLpIGOZeE5owWR$NoQR2wF7isRXURmcOkn23K/sUJE8n2ic31zWnB7f84Y=','2022-02-25 14:14:21.337575',1,'admin1','','','','',NULL,0,NULL,'',NULL,NULL,'2021-10-30',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0),(61,'pbkdf2_sha256$260000$TwCOlahTc6z2wQQ4iSaOVx$QIWjGK+jHCmsYkECKOEMMQHzFIt0IWmfAggNBwwuVa0=','2022-06-27 12:25:27.230483',0,'prabhu@dwp.in','prabhu@dwp.in','Prabhu','S R','M','1980-02-06',25,'9003092205','profile_picture/A273F2E3-A4EE-4A82-8F84-1E6CBF43E239.jpeg',NULL,'T Nagar','2022-01-07',1,0,'I','I',1,NULL,NULL,NULL,NULL,'https://twitter.com/prabhu_sr','http://www.srprabhu.com',NULL,0,1,0),(62,'pbkdf2_sha256$260000$MauWPPuiRuVMixyP0oorwO$nVO9BbnNGE3N+TgXNrIFoGngUTKDLNBlwKHipvOjGDA=','2022-05-18 11:52:54.597516',0,'esakkimuthuk@gmail.com','esakkimuthuk@gmail.com','Esakki Muthu','K','M','1984-08-25',2,'7401329448','profile_picture/Suriya1-1595483957.jpg',NULL,'anakaputhur','2022-01-07',1,0,'E','E',1,NULL,NULL,NULL,NULL,'https://twitter.com/esakkimuthuk',NULL,NULL,1,1,0),(63,'pbkdf2_sha256$260000$VytzII5Z4QnOXNRLRCC4lZ$WFwgvyE8hC8Vwz7aVJ12DMFCngm6OhCsAIkwTDOmhx4=','2022-06-09 10:00:49.977405',0,'madhanumk@gmail.com','madhanumk@gmail.com','Madhan Umk','','M','2022-01-07',4,'9444305984','profile_picture/IMG_20210417_100936.jpg',NULL,'1/88A Dharapuram,\r\nTiruppur, 642201','2022-01-08',1,0,NULL,NULL,12,'http://127.0.0.1:8000/my_profile/','http://127.0.0.1:8000/my_profile/',NULL,NULL,NULL,'http://127.0.0.1:8000/my_profile/','http://127.0.0.1:8000/my_profile/',1,1,1),(64,'pbkdf2_sha256$260000$7xcSjt3E8d4bV8HPAjJJei$lFXGPCLtqPSOGP5LxAeFrCgxQtMWx/C06ISy4sHAkFE=','2022-02-17 16:36:38.665530',0,'allaudinh@gmail.com','allaudinh@gmail.com','Allaudin','Hussain','M','1990-07-14',0,'9003217023','profile_picture/162e0ac4-a9cb-4b33-9971-8c68edb1c720.jpg',NULL,'T.Nagar, Chennai','2022-01-08',1,0,'E',NULL,1,'https://www.facebook.com/allaudin.h','https://www.instagram.com/alldin007/',NULL,NULL,'https://www.twitter.com/alldin007/',NULL,NULL,1,1,0),(65,'pbkdf2_sha256$260000$Ig3GtSg9YRUJvUiwJzqc1B$5vDFzB3mUWasahGPalg/ZJ6tAtdeyRYkD9WLW8UhbSE=','2022-01-18 15:30:52.000000',0,'esakki@dwp.in','esakki@dwp.in','Muthu','E','M','1984-08-25',3,'9840540473','profile_picture/Suriya1-1595483957_xFc1jmb.jpg',NULL,'BB Kulam','2022-01-08',1,0,'E','E',15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0),(66,'pbkdf2_sha256$260000$9JTm0I9ZEQtoApjEiuV3Ka$NqVhWLdPzVMMY3zMTfUelOe0sJ2DbO6PCGFerxbdx0w=','2022-02-02 14:22:08.479200',0,'murphy.p@top10cinema.com','murphy.p@top10cinema.com','MURPHY','JOHN','M','1984-03-12',0,'9994241051','profile_picture/murphyweb2_400x400.jpeg',NULL,'M TRINITY','2022-01-08',1,0,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0),(67,'pbkdf2_sha256$260000$WG05zUaLJDvBGSgW9XIG0H$gwBZ27RPWfJGz7ckLY2rHqsDm9F+n7XrAx2jDSgyLvI=','2022-01-08 15:13:23.000000',0,'suhan.mtech@gmail.com','suhan.mtech@gmail.com','SUHANYA','DEVI','F','1984-06-26',0,'6383723173','profile_picture/6fe17292-988c-487e-824f-060501b3e844_hUCkmRF.jpeg',NULL,'SURYA SAMRUDHI APT','2022-01-08',1,0,'E','E',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0),(68,'pbkdf2_sha256$260000$TkQsT3MWmrpgsb44WNPtIr$QHH3DhQ8u+wE8X4Es60I26B3mXkl3gt1rWEDmfTW5Z4=','2022-06-23 14:58:36.541866',0,'letters4ramesh@gmail.com','letters4ramesh@gmail.com','Ramesh','Natarajan','M','1988-09-30',0,'9952294298','profile_picture/aravind.r.jpeg',NULL,'Saibaba Colony','2022-01-08',1,0,NULL,'E',2,'http://fb.com/LifeLiker_in','https://www.instagram.com/madhanumk',NULL,NULL,'http://twitter.com/madhanumk','https://lifeliker.in/','https://www.youtube.com/c/MadhanuMK',1,1,1),(69,'pbkdf2_sha256$260000$9KigQBXyImLygh4SJNLNlt$5OyzRbKEoq7dbn0cfy+CHFq08Uy1hUoPCKOr7Aeka3U=','2022-01-11 13:08:37.000000',0,'krishna@dwp.in','krishna@dwp.in','Madras','Krishna','',NULL,0,'9841089192','',NULL,'','2022-01-11',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0),(71,'pbkdf2_sha256$260000$PQ3tgOuKw4UJ415PYSyKhz$JQmq0bkQeqZgejdONADPhYE8CbkEtBHucNR1HI1nBYM=',NULL,0,'krishnarquotes@gmail.com','krishnarquotes@gmail.com','Test','account 1','M',NULL,0,'7010951633','',NULL,'','2022-01-17',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1),(72,'pbkdf2_sha256$260000$7mIzXbr9IpM0TGyyFAQ2rA$CTQSflu9y5PWXAmzsf1QOv4KFV+V6sXcgyBvfPgG8C4=','2022-01-20 11:48:41.827099',0,'mathankumar.u98@gmail.com','mathankumar.u98@gmail.com','Vignesh Kumar','','M','2022-01-13',20,'8888444442','',NULL,'Thindivanam','2022-01-20',0,0,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'https://www.lifeliker.net/',NULL,1,1,1),(73,'pbkdf2_sha256$260000$FkbYFkRB9uezBNnBKC5gP8$gCZPRkDoKeb2lmjXoBaRyyERGRZTzgt9VONRzeLLACE=',NULL,0,'korathop@gmail.com','korathop@gmail.com','pranesh','murugesan','',NULL,0,'81226 6275','',NULL,NULL,'2022-01-23',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1),(74,'pbkdf2_sha256$260000$eP34S453SzfLDScZPNa9WS$InTAqsT3x7sW+tYB+Mmtw2lhfRrg5/z0raccofnewoA=',NULL,0,'thekingmakerkishor@gmail.com','thekingmakerkishor@gmail.com','pranesh','murugesan','',NULL,0,'6382017150','',NULL,NULL,'2022-01-23',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1),(76,'pbkdf2_sha256$260000$XQrMArrZD8gI7htUWN9WtS$mIBDEciTqiqNBfRhSJRbtg0aXXGV4iIEFCHE5ClIWtE=',NULL,0,'sales.weelz@gmail.com','sales.weelz@gmail.com','Anand','Rs','',NULL,0,'9176126263','',NULL,NULL,'2022-02-08',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1),(77,'pbkdf2_sha256$260000$UzOooiDT6egntgPIIzH5dW$o6XJamsUui8QCjIg9FItHpMZlLvjcfPB5V8rcKtZttk=','2022-03-08 11:37:02.548908',0,'karthickkrishna@gmail.com','karthickkrishna@gmail.com','Karthick Krishna','','M','1987-12-24',3,'7401419575','profile_picture/KK_Passport_size.jpg',NULL,'31, Thanikachalam Road, T Nagar','2022-02-17',1,0,'I','I',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1),(78,'pbkdf2_sha256$260000$5aMkxHSXVtzpajw8Bq3h3Y$IfPf0KWjMtVN2zrHKKjuRH7v3HSMSN0uzJCNRCflnhA=',NULL,0,'chandrucmyk@gmail.com','chandrucmyk@gmail.com','apk','chandru','',NULL,0,'9840612200','',NULL,NULL,'2022-03-02',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1),(79,'pbkdf2_sha256$260000$36kdgUiIJ3iF0CMI12SJfl$2bhNOH2o5yWSVS23W4NLnaydhPqV2iHPu2VIPyWBIUQ=','2022-04-08 16:48:51.672450',0,'saitanya.1603@gmail.com','saitanya.1603@gmail.com','Saitanya','K','',NULL,0,'9941087487','',NULL,NULL,'2022-03-12',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1),(80,'pbkdf2_sha256$260000$bGV2mn2xc6M2MT0uCvw2GT$zSil44kPvP9zSPGoj67ko08Mwyr3zESp0jscqQ3zC7g=',NULL,0,'19ita57@karpagamtech.ac.in','19ita57@karpagamtech.ac.in','Tariq','Jamal A','',NULL,0,'9384207911','',NULL,NULL,'2022-03-15',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1),(81,'pbkdf2_sha256$260000$ZbuoJZruBQhiAQHL1EsEsh$tMdkshg0IvQLx1tXy/Tf3ojU7ysXjIiCGysNQpVGtYg=',NULL,0,'rameshkumar2007.rad@gmail.com','rameshkumar2007.rad@gmail.com','Ram','','',NULL,0,'9784738943','',NULL,NULL,'2022-05-13',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0),(82,'pbkdf2_sha256$260000$Wkn1LA9zYJqI9G6PMQ7VQm$a0hbC0qGzG/E0t648xTTrV2UNIa4gbZ88Rqg+JE9+5Q=',NULL,0,'moviefonts.lifeliker@gmail.com','moviefonts.lifeliker@gmail.com','ram','','',NULL,0,'3444444444','',NULL,NULL,'2022-05-13',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1);
/*!40000 ALTER TABLE `account_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_groups`
--

DROP TABLE IF EXISTS `account_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_groups_user_id_group_id_4d09af3e_uniq` (`user_id`,`group_id`),
  KEY `account_user_groups_group_id_6c71f749_fk_auth_group_id` (`group_id`),
  CONSTRAINT `account_user_groups_group_id_6c71f749_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `account_user_groups_user_id_14345e7b_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_groups`
--

LOCK TABLES `account_user_groups` WRITE;
/*!40000 ALTER TABLE `account_user_groups` DISABLE KEYS */;
INSERT INTO `account_user_groups` VALUES (40,1,4),(45,46,4),(74,61,2),(75,62,1),(97,63,1),(79,64,2),(80,65,3),(82,66,2),(81,66,3),(84,67,1),(83,67,2),(116,68,2),(86,69,2),(91,71,1),(100,72,2),(98,72,3),(101,73,3),(102,74,3),(104,76,2),(105,77,1),(107,78,1),(108,79,1),(111,80,1),(110,80,2),(109,80,3),(114,81,2),(113,81,3),(115,82,3);
/*!40000 ALTER TABLE `account_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_interested_format`
--

DROP TABLE IF EXISTS `account_user_interested_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_interested_format` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `format_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_interested_format_user_id_format_id_3fb3c8ee_uniq` (`user_id`,`format_id`),
  KEY `account_user_interes_format_id_f9d5e78d_fk_account_f` (`format_id`),
  CONSTRAINT `account_user_interes_format_id_f9d5e78d_fk_account_f` FOREIGN KEY (`format_id`) REFERENCES `account_format` (`id`),
  CONSTRAINT `account_user_interes_user_id_b06f5ff8_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_interested_format`
--

LOCK TABLES `account_user_interested_format` WRITE;
/*!40000 ALTER TABLE `account_user_interested_format` DISABLE KEYS */;
INSERT INTO `account_user_interested_format` VALUES (41,61,1),(42,61,2),(43,61,4),(44,61,5),(38,62,1),(39,62,2),(40,62,4),(45,63,1),(46,64,1),(47,64,2),(48,65,1),(49,65,2),(50,65,4),(51,66,1),(52,66,2),(53,66,4),(54,67,1),(55,67,2),(56,67,4),(57,68,1),(58,68,2),(59,72,1),(60,72,2),(61,72,3),(62,77,1),(63,77,2),(64,77,3),(65,77,4),(66,77,5),(67,77,6);
/*!40000 ALTER TABLE `account_user_interested_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_languages_to_work`
--

DROP TABLE IF EXISTS `account_user_languages_to_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_languages_to_work` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `language_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_languages_to_work_user_id_language_id_ddfea647_uniq` (`user_id`,`language_id`),
  KEY `account_user_languag_language_id_57878ece_fk_account_l` (`language_id`),
  CONSTRAINT `account_user_languag_language_id_57878ece_fk_account_l` FOREIGN KEY (`language_id`) REFERENCES `account_language` (`id`),
  CONSTRAINT `account_user_languag_user_id_397025b1_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_languages_to_work`
--

LOCK TABLES `account_user_languages_to_work` WRITE;
/*!40000 ALTER TABLE `account_user_languages_to_work` DISABLE KEYS */;
INSERT INTO `account_user_languages_to_work` VALUES (23,61,1),(24,61,3),(25,61,5),(22,62,1),(26,63,1),(27,64,1),(28,65,1),(29,66,1),(30,67,1),(31,67,2),(32,68,1),(33,72,1),(34,72,2),(35,77,1);
/*!40000 ALTER TABLE `account_user_languages_to_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_open_to`
--

DROP TABLE IF EXISTS `account_user_open_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_open_to` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `open_to_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_open_to_user_id_open_to_id_28f07bf2_uniq` (`user_id`,`open_to_id`),
  KEY `account_user_open_to_open_to_id_8c0cf169_fk_account_open_to_id` (`open_to_id`),
  CONSTRAINT `account_user_open_to_open_to_id_8c0cf169_fk_account_open_to_id` FOREIGN KEY (`open_to_id`) REFERENCES `account_open_to` (`id`),
  CONSTRAINT `account_user_open_to_user_id_770d0da7_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_open_to`
--

LOCK TABLES `account_user_open_to` WRITE;
/*!40000 ALTER TABLE `account_user_open_to` DISABLE KEYS */;
INSERT INTO `account_user_open_to` VALUES (52,63,1),(38,65,1),(39,65,2),(40,65,3),(41,65,5),(42,65,6),(43,66,2),(44,66,3),(45,66,5),(46,66,6),(47,67,1),(48,67,2),(49,67,3),(50,67,5),(51,67,6),(53,72,1),(54,72,2),(55,77,2),(56,77,3),(57,77,5),(58,77,6);
/*!40000 ALTER TABLE `account_user_open_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_specialization_of_genre`
--

DROP TABLE IF EXISTS `account_user_specialization_of_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_specialization_of_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_specializat_user_id_genre_id_5232c134_uniq` (`user_id`,`genre_id`),
  KEY `account_user_special_genre_id_ef6c03c9_fk_account_g` (`genre_id`),
  CONSTRAINT `account_user_special_genre_id_ef6c03c9_fk_account_g` FOREIGN KEY (`genre_id`) REFERENCES `account_genre` (`id`),
  CONSTRAINT `account_user_special_user_id_36f4df88_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_specialization_of_genre`
--

LOCK TABLES `account_user_specialization_of_genre` WRITE;
/*!40000 ALTER TABLE `account_user_specialization_of_genre` DISABLE KEYS */;
INSERT INTO `account_user_specialization_of_genre` VALUES (45,61,1),(46,61,3),(47,61,4),(48,61,5),(49,61,6),(42,62,1),(43,62,3),(44,62,4),(50,63,1),(51,64,1),(52,65,1),(53,65,2),(54,65,3),(55,65,4),(56,65,5),(57,65,6),(58,66,2),(59,66,5),(60,66,6),(61,67,2),(62,67,5),(63,67,6),(64,68,1),(65,68,2),(66,68,3),(67,68,4),(68,68,5),(69,72,1),(70,72,2),(71,72,3),(72,77,1),(73,77,2),(74,77,3),(75,77,4),(76,77,5),(77,77,6);
/*!40000 ALTER TABLE `account_user_specialization_of_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_user_permissions`
--

DROP TABLE IF EXISTS `account_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_user_permis_user_id_permission_id_48bdd28b_uniq` (`user_id`,`permission_id`),
  KEY `account_user_user_pe_permission_id_66c44191_fk_auth_perm` (`permission_id`),
  CONSTRAINT `account_user_user_pe_permission_id_66c44191_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `account_user_user_pe_user_id_cc42d270_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_user_permissions`
--

LOCK TABLES `account_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_userfollowing`
--

DROP TABLE IF EXISTS `account_userfollowing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_userfollowing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `following_user_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_userfollowin_following_user_id_b685e31c_fk_account_u` (`following_user_id`),
  KEY `account_userfollowing_user_id_3df84ba0_fk_account_user_id` (`user_id`),
  CONSTRAINT `account_userfollowin_following_user_id_b685e31c_fk_account_u` FOREIGN KEY (`following_user_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `account_userfollowing_user_id_3df84ba0_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_userfollowing`
--

LOCK TABLES `account_userfollowing` WRITE;
/*!40000 ALTER TABLE `account_userfollowing` DISABLE KEYS */;
INSERT INTO `account_userfollowing` VALUES (126,'2022-01-08 14:48:32.322414',62,61),(127,'2022-01-08 14:48:36.151488',66,61),(128,'2022-01-08 14:48:41.133595',64,61),(132,'2022-01-11 09:32:22.539594',68,63),(133,'2022-01-11 09:32:41.715226',65,63),(134,'2022-01-11 09:32:43.185847',66,63),(136,'2022-01-11 10:33:58.379315',61,68),(139,'2022-01-20 15:59:38.325443',63,72),(153,'2022-05-21 12:15:12.514201',61,63),(159,'2022-05-23 10:20:47.354872',69,63),(160,'2022-05-23 10:21:27.175837',80,63),(164,'2022-06-06 15:36:01.540430',64,68),(165,'2022-06-06 15:36:03.520054',66,68),(166,'2022-06-06 15:36:05.360205',67,68),(167,'2022-06-06 15:36:06.152463',65,68);
/*!40000 ALTER TABLE `account_userfollowing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (4,'Admin'),(3,'Director'),(2,'Producer'),(1,'Writer');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add format',7,'add_format'),(26,'Can change format',7,'change_format'),(27,'Can delete format',7,'delete_format'),(28,'Can view format',7,'view_format'),(29,'Can add genre',8,'add_genre'),(30,'Can change genre',8,'change_genre'),(31,'Can delete genre',8,'delete_genre'),(32,'Can view genre',8,'view_genre'),(33,'Can add language',9,'add_language'),(34,'Can change language',9,'change_language'),(35,'Can delete language',9,'delete_language'),(36,'Can view language',9,'view_language'),(37,'Can add location',10,'add_location'),(38,'Can change location',10,'change_location'),(39,'Can delete location',10,'delete_location'),(40,'Can view location',10,'view_location'),(41,'Can add open_ to',11,'add_open_to'),(42,'Can change open_ to',11,'change_open_to'),(43,'Can delete open_ to',11,'delete_open_to'),(44,'Can view open_ to',11,'view_open_to'),(45,'Can add project',12,'add_project'),(46,'Can change project',12,'change_project'),(47,'Can delete project',12,'delete_project'),(48,'Can view project',12,'view_project'),(49,'Can add user following',13,'add_userfollowing'),(50,'Can change user following',13,'change_userfollowing'),(51,'Can delete user following',13,'delete_userfollowing'),(52,'Can view user following',13,'view_userfollowing'),(53,'Can add testimonial',14,'add_testimonial'),(54,'Can change testimonial',14,'change_testimonial'),(55,'Can delete testimonial',14,'delete_testimonial'),(56,'Can view testimonial',14,'view_testimonial'),(57,'Can add report_ people',15,'add_report_people'),(58,'Can change report_ people',15,'change_report_people'),(59,'Can delete report_ people',15,'delete_report_people'),(60,'Can view report_ people',15,'view_report_people'),(61,'Can add rating',16,'add_rating'),(62,'Can change rating',16,'change_rating'),(63,'Can delete rating',16,'delete_rating'),(64,'Can view rating',16,'view_rating'),(65,'Can add qualification',17,'add_qualification'),(66,'Can change qualification',17,'change_qualification'),(67,'Can delete qualification',17,'delete_qualification'),(68,'Can view qualification',17,'view_qualification'),(69,'Can add highlight',18,'add_highlight'),(70,'Can change highlight',18,'change_highlight'),(71,'Can delete highlight',18,'delete_highlight'),(72,'Can view highlight',18,'view_highlight'),(73,'Can add conversation',19,'add_conversation'),(74,'Can change conversation',19,'change_conversation'),(75,'Can delete conversation',19,'delete_conversation'),(76,'Can view conversation',19,'view_conversation'),(77,'Can add company',20,'add_company'),(78,'Can change company',20,'change_company'),(79,'Can delete company',20,'delete_company'),(80,'Can view company',20,'view_company'),(81,'Can add chat',21,'add_chat'),(82,'Can change chat',21,'change_chat'),(83,'Can delete chat',21,'delete_chat'),(84,'Can view chat',21,'view_chat'),(85,'Can add blocked_ user',22,'add_blocked_user'),(86,'Can change blocked_ user',22,'change_blocked_user'),(87,'Can delete blocked_ user',22,'delete_blocked_user'),(88,'Can view blocked_ user',22,'view_blocked_user'),(89,'Can add award',23,'add_award'),(90,'Can change award',23,'change_award'),(91,'Can delete award',23,'delete_award'),(92,'Can view award',23,'view_award'),(93,'Can add assistant',24,'add_assistant'),(94,'Can change assistant',24,'change_assistant'),(95,'Can delete assistant',24,'delete_assistant'),(96,'Can view assistant',24,'view_assistant'),(97,'Can add call',25,'add_call'),(98,'Can change call',25,'change_call'),(99,'Can delete call',25,'delete_call'),(100,'Can view call',25,'view_call'),(101,'Can add interest',26,'add_interest'),(102,'Can change interest',26,'change_interest'),(103,'Can delete interest',26,'delete_interest'),(104,'Can view interest',26,'view_interest'),(105,'Can add pitch',27,'add_pitch'),(106,'Can change pitch',27,'change_pitch'),(107,'Can delete pitch',27,'delete_pitch'),(108,'Can view pitch',27,'view_pitch'),(109,'Can add post',28,'add_post'),(110,'Can change post',28,'change_post'),(111,'Can delete post',28,'delete_post'),(112,'Can view post',28,'view_post'),(113,'Can add upvote',29,'add_upvote'),(114,'Can change upvote',29,'change_upvote'),(115,'Can delete upvote',29,'delete_upvote'),(116,'Can view upvote',29,'view_upvote'),(117,'Can add report',30,'add_report'),(118,'Can change report',30,'change_report'),(119,'Can delete report',30,'delete_report'),(120,'Can view report',30,'view_report'),(121,'Can add message',31,'add_message'),(122,'Can change message',31,'change_message'),(123,'Can delete message',31,'delete_message'),(124,'Can view message',31,'view_message'),(125,'Can add like',32,'add_like'),(126,'Can change like',32,'change_like'),(127,'Can delete like',32,'delete_like'),(128,'Can view like',32,'view_like'),(129,'Can add downvote',33,'add_downvote'),(130,'Can change downvote',33,'change_downvote'),(131,'Can delete downvote',33,'delete_downvote'),(132,'Can view downvote',33,'view_downvote'),(133,'Can add comment',34,'add_comment'),(134,'Can change comment',34,'change_comment'),(135,'Can delete comment',34,'delete_comment'),(136,'Can view comment',34,'view_comment'),(137,'Can add club_ house',35,'add_club_house'),(138,'Can change club_ house',35,'change_club_house'),(139,'Can delete club_ house',35,'delete_club_house'),(140,'Can view club_ house',35,'view_club_house'),(141,'Can add event_ registration',36,'add_event_registration'),(142,'Can change event_ registration',36,'change_event_registration'),(143,'Can delete event_ registration',36,'delete_event_registration'),(144,'Can view event_ registration',36,'view_event_registration'),(145,'Can add event',37,'add_event'),(146,'Can change event',37,'change_event'),(147,'Can delete event',37,'delete_event'),(148,'Can view event',37,'view_event'),(149,'Can add club_ house_ member',38,'add_club_house_member'),(150,'Can change club_ house_ member',38,'change_club_house_member'),(151,'Can delete club_ house_ member',38,'delete_club_house_member'),(152,'Can view club_ house_ member',38,'view_club_house_member'),(153,'Can add join_ project',39,'add_join_project'),(154,'Can change join_ project',39,'change_join_project'),(155,'Can delete join_ project',39,'delete_join_project'),(156,'Can view join_ project',39,'view_join_project');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubhouse_club_house`
--

DROP TABLE IF EXISTS `clubhouse_club_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubhouse_club_house` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `created_on` date NOT NULL,
  `cover_photo` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clubhouse_club_house_admin_id_85c805f1_fk_account_user_id` (`admin_id`),
  CONSTRAINT `clubhouse_club_house_admin_id_85c805f1_fk_account_user_id` FOREIGN KEY (`admin_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubhouse_club_house`
--

LOCK TABLES `clubhouse_club_house` WRITE;
/*!40000 ALTER TABLE `clubhouse_club_house` DISABLE KEYS */;
/*!40000 ALTER TABLE `clubhouse_club_house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubhouse_club_house_member`
--

DROP TABLE IF EXISTS `clubhouse_club_house_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubhouse_club_house_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(1) NOT NULL,
  `join_date` date NOT NULL,
  `club_house_id` bigint NOT NULL,
  `member_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clubhouse_club_house_club_house_id_92fc9705_fk_account_u` (`club_house_id`),
  KEY `clubhouse_club_house_member_id_20a1f2bc_fk_account_u` (`member_id`),
  CONSTRAINT `clubhouse_club_house_club_house_id_92fc9705_fk_account_u` FOREIGN KEY (`club_house_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `clubhouse_club_house_member_id_20a1f2bc_fk_account_u` FOREIGN KEY (`member_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubhouse_club_house_member`
--

LOCK TABLES `clubhouse_club_house_member` WRITE;
/*!40000 ALTER TABLE `clubhouse_club_house_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `clubhouse_club_house_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubhouse_event`
--

DROP TABLE IF EXISTS `clubhouse_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubhouse_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `event_date` date NOT NULL,
  `venue` longtext NOT NULL,
  `highlight` longtext NOT NULL,
  `registration_close_date` date NOT NULL,
  `poster_image` varchar(100) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `club_house_id` bigint NOT NULL,
  `location_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clubhouse_event_club_house_id_bb925628_fk_clubhouse` (`club_house_id`),
  KEY `clubhouse_event_location_id_28584329_fk_account_location_id` (`location_id`),
  CONSTRAINT `clubhouse_event_club_house_id_bb925628_fk_clubhouse` FOREIGN KEY (`club_house_id`) REFERENCES `clubhouse_club_house` (`id`),
  CONSTRAINT `clubhouse_event_location_id_28584329_fk_account_location_id` FOREIGN KEY (`location_id`) REFERENCES `account_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubhouse_event`
--

LOCK TABLES `clubhouse_event` WRITE;
/*!40000 ALTER TABLE `clubhouse_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `clubhouse_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubhouse_event_registration`
--

DROP TABLE IF EXISTS `clubhouse_event_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubhouse_event_registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(1) NOT NULL,
  `registered_on` datetime(6) NOT NULL,
  `event_id` bigint NOT NULL,
  `registered_by_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clubhouse_event_regi_event_id_581ffa8f_fk_clubhouse` (`event_id`),
  KEY `clubhouse_event_regi_registered_by_id_309c70d3_fk_account_u` (`registered_by_id`),
  CONSTRAINT `clubhouse_event_regi_event_id_581ffa8f_fk_clubhouse` FOREIGN KEY (`event_id`) REFERENCES `clubhouse_club_house` (`id`),
  CONSTRAINT `clubhouse_event_regi_registered_by_id_309c70d3_fk_account_u` FOREIGN KEY (`registered_by_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubhouse_event_registration`
--

LOCK TABLES `clubhouse_event_registration` WRITE;
/*!40000 ALTER TABLE `clubhouse_event_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `clubhouse_event_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-10-04 18:49:21.729962','1','Writer',1,'[{\"added\": {}}]',3,1),(2,'2021-10-04 18:49:36.413990','2','Producer',1,'[{\"added\": {}}]',3,1),(3,'2021-10-04 18:49:53.208093','3','Director',1,'[{\"added\": {}}]',3,1),(4,'2021-10-04 18:50:17.447798','1','Chennai',1,'[{\"added\": {}}]',10,1),(5,'2021-10-04 18:50:25.022778','2','Coimbatore',1,'[{\"added\": {}}]',10,1),(6,'2021-10-04 18:50:36.080221','3','Erode',1,'[{\"added\": {}}]',10,1),(7,'2021-10-04 18:50:45.673406','4','Salem',1,'[{\"added\": {}}]',10,1),(8,'2021-10-04 18:54:15.179689','2','Madhan Umk',3,'',6,1),(9,'2021-10-04 18:56:53.612738','3','Madhan Umk',3,'',6,1),(10,'2021-10-04 19:00:48.023195','4','Madhan Umk',3,'',6,1),(11,'2021-10-04 19:05:23.754944','6','Madhan Umk',3,'',6,1),(12,'2021-10-04 19:06:09.430441','7','Madhan Umk',3,'',6,1),(13,'2021-10-04 19:09:12.409830','8','Madhan Umk',3,'',6,1),(14,'2021-10-04 19:10:57.561168','5','Madhan Umk',2,'[{\"changed\": {\"fields\": [\"Active\", \"Groups\"]}}]',6,1),(15,'2021-10-04 19:15:53.977547','1','Originals',1,'[{\"added\": {}}]',7,1),(16,'2021-10-04 19:16:19.653463','2','Feature',1,'[{\"added\": {}}]',7,1),(17,'2021-10-04 19:17:12.157250','3','Short films',1,'[{\"added\": {}}]',7,1),(18,'2021-10-04 19:17:36.645035','4','Web Series',1,'[{\"added\": {}}]',7,1),(19,'2021-10-04 19:18:01.223123','5','Documentary',1,'[{\"added\": {}}]',7,1),(20,'2021-10-04 19:18:29.264533','6','Television',1,'[{\"added\": {}}]',7,1),(21,'2021-10-04 19:19:08.394400','1','Action',1,'[{\"added\": {}}]',8,1),(22,'2021-10-04 19:19:32.566754','2','Comedy',1,'[{\"added\": {}}]',8,1),(23,'2021-10-04 19:19:51.198626','3','Thriller',1,'[{\"added\": {}}]',8,1),(24,'2021-10-04 19:20:08.977610','4','Horror',1,'[{\"added\": {}}]',8,1),(25,'2021-10-04 19:20:30.908429','5','Romance',1,'[{\"added\": {}}]',8,1),(26,'2021-10-04 19:20:53.144921','6','Real-life',1,'[{\"added\": {}}]',8,1),(27,'2021-10-04 19:21:12.146680','7','Other',1,'[{\"added\": {}}]',8,1),(28,'2021-10-04 19:22:16.052164','1','Tamil',1,'[{\"added\": {}}]',9,1),(29,'2021-10-04 19:22:37.901225','2','Malayalam',1,'[{\"added\": {}}]',9,1),(30,'2021-10-04 19:23:03.244013','3','Telugu',1,'[{\"added\": {}}]',9,1),(31,'2021-10-04 19:23:25.311472','4','Kannada',1,'[{\"added\": {}}]',9,1),(32,'2021-10-04 19:23:47.219473','5','Hindi',1,'[{\"added\": {}}]',9,1),(33,'2021-10-04 19:23:53.937651','6','Other',1,'[{\"added\": {}}]',9,1),(34,'2021-10-04 19:24:30.917704','1','Story Writing',1,'[{\"added\": {}}]',11,1),(35,'2021-10-04 19:25:25.220536','2','Screen Writing',1,'[{\"added\": {}}]',11,1),(36,'2021-10-04 19:25:48.964224','3','Dialogue Writing',1,'[{\"added\": {}}]',11,1),(37,'2021-10-04 19:26:10.990201','4','Lyrics Writing',1,'[{\"added\": {}}]',11,1),(38,'2021-10-04 19:35:53.569464','5','Story Discussion',1,'[{\"added\": {}}]',11,1),(39,'2021-10-04 19:36:20.162990','6','Script Doctoring',1,'[{\"added\": {}}]',11,1),(40,'2021-10-04 19:41:23.490553','5','Madhan Umk',2,'[{\"changed\": {\"fields\": [\"Profile photo\"]}}]',6,1),(41,'2021-10-04 19:53:47.812852','9','Mahilan',2,'[{\"changed\": {\"fields\": [\"Active\", \"Groups\"]}}]',6,1),(42,'2021-10-04 19:54:45.876205','9','Mahilan',2,'[{\"changed\": {\"fields\": [\"Profile photo\", \"Location\", \"Address\"]}}]',6,1),(43,'2021-10-04 21:03:42.655170','13','Vishnu',3,'',6,1),(44,'2021-10-04 21:03:42.659803','12','Vishnu',3,'',6,1),(45,'2021-10-04 21:05:25.929242','14','Ramesh Natarajan',3,'',6,1),(46,'2021-10-04 21:10:12.330494','15','Ramesh Natarajan',3,'',6,1),(47,'2021-10-04 21:15:33.210413','19','Raja Test',3,'',6,1),(48,'2021-10-04 21:15:33.215811','18','Madhu',3,'',6,1),(49,'2021-10-04 21:15:33.220603','17','Madhu',3,'',6,1),(50,'2021-10-04 21:15:33.224141','16','Ramesh Natarajan',3,'',6,1),(51,'2021-10-04 21:15:33.228991','11','Kamal hassan Srinivasan',3,'',6,1),(52,'2021-10-04 21:29:23.500788','23','vishnu',3,'',6,1),(53,'2021-10-04 21:29:23.505718','22','Raja Test',3,'',6,1),(54,'2021-10-04 21:29:23.508367','21','vishnu',3,'',6,1),(55,'2021-10-04 21:29:23.511807','20','Raja Test',3,'',6,1),(56,'2021-10-04 21:39:40.442395','10','Kamal hassan Srinivasan',3,'',6,1),(57,'2021-10-04 21:41:00.265433','25','vishnu',3,'',6,1),(58,'2021-10-04 21:41:00.269328','24','Ramesh Natarajan',3,'',6,1),(59,'2021-10-04 21:41:57.311437','26','vishnu',3,'',6,1),(60,'2021-10-04 21:43:13.512845','27','Ramesh Natarajan',3,'',6,1),(61,'2021-10-13 09:17:17.600928','5','Madhan Umk',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,1),(62,'2021-10-13 10:57:37.154388','5','Ariyalur',1,'[{\"added\": {}}]',10,1),(63,'2021-10-13 10:57:50.545274','6','Chengalpattu',1,'[{\"added\": {}}]',10,1),(64,'2021-10-13 10:58:05.443112','7','Cuddalore',1,'[{\"added\": {}}]',10,1),(65,'2021-10-13 10:58:13.952136','8','Dharmapuri',1,'[{\"added\": {}}]',10,1),(66,'2021-10-13 10:58:23.942449','9','Dindigul',1,'[{\"added\": {}}]',10,1),(67,'2021-10-13 10:58:44.761259','10','Kallakurichi',1,'[{\"added\": {}}]',10,1),(68,'2021-10-13 10:58:53.813711','11','Kanchipuram',1,'[{\"added\": {}}]',10,1),(69,'2021-10-13 10:59:03.664531','12','Kanyakumari',1,'[{\"added\": {}}]',10,1),(70,'2021-10-13 10:59:12.485080','13','Karur',1,'[{\"added\": {}}]',10,1),(71,'2021-10-13 10:59:23.551923','14','Krishnagiri',1,'[{\"added\": {}}]',10,1),(72,'2021-10-13 10:59:33.260793','15','Madurai',1,'[{\"added\": {}}]',10,1),(73,'2021-10-13 10:59:42.622129','16','Nagapattinam',1,'[{\"added\": {}}]',10,1),(74,'2021-10-13 10:59:51.933790','17','Namakkal',1,'[{\"added\": {}}]',10,1),(75,'2021-10-13 11:00:01.145732','18','Nilgiris',1,'[{\"added\": {}}]',10,1),(76,'2021-10-13 11:00:09.222443','19','Perambalur',1,'[{\"added\": {}}]',10,1),(77,'2021-10-13 11:00:17.322095','20','Pudukkottai',1,'[{\"added\": {}}]',10,1),(78,'2021-10-13 11:00:26.441765','21','Ramanathapuram',1,'[{\"added\": {}}]',10,1),(79,'2021-10-13 11:00:35.393282','22','Ranipet',1,'[{\"added\": {}}]',10,1),(80,'2021-10-13 11:00:58.874466','23','Sivaganga',1,'[{\"added\": {}}]',10,1),(81,'2021-10-13 11:01:07.029100','24','Tenkasi',1,'[{\"added\": {}}]',10,1),(82,'2021-10-13 11:01:17.545562','25','Thanjavur',1,'[{\"added\": {}}]',10,1),(83,'2021-10-13 11:01:25.645464','26','Theni',1,'[{\"added\": {}}]',10,1),(84,'2021-10-13 11:01:34.222308','27','Thoothukudi',1,'[{\"added\": {}}]',10,1),(85,'2021-10-13 11:01:42.628036','28','Tiruchirappalli',1,'[{\"added\": {}}]',10,1),(86,'2021-10-13 11:01:50.516563','29','Tirunelveli',1,'[{\"added\": {}}]',10,1),(87,'2021-10-13 11:02:01.170360','30','Tirupathur',1,'[{\"added\": {}}]',10,1),(88,'2021-10-13 11:02:21.058515','31','Tiruppur',1,'[{\"added\": {}}]',10,1),(89,'2021-10-13 11:02:30.870247','32','Tiruvallur',1,'[{\"added\": {}}]',10,1),(90,'2021-10-13 11:02:39.580738','33','Tiruvannamalai',1,'[{\"added\": {}}]',10,1),(91,'2021-10-13 11:02:48.576956','34','Tiruvarur',1,'[{\"added\": {}}]',10,1),(92,'2021-10-13 11:03:01.055610','35','Vellore',1,'[{\"added\": {}}]',10,1),(93,'2021-10-13 11:03:15.101722','36','Viluppuram',1,'[{\"added\": {}}]',10,1),(94,'2021-10-13 11:03:24.243250','37','Virudhunagar',1,'[{\"added\": {}}]',10,1),(95,'2021-10-13 16:09:09.710457','4','Admin',1,'[{\"added\": {}}]',3,1),(96,'2021-10-13 16:09:13.592204','1','admin',2,'[{\"changed\": {\"fields\": [\"Email address\", \"Mobile no\", \"Groups\"]}}]',6,1),(97,'2021-10-13 16:09:33.142207','9','Mahilan',3,'',6,1),(98,'2021-10-13 16:09:46.116555','29','vishnu',3,'',6,1),(99,'2021-10-13 16:10:37.437423','28','Ramesh ramesh',2,'[{\"changed\": {\"fields\": [\"Mobile no\"]}}]',6,1),(100,'2021-10-13 16:14:08.278844','34','Murphy John',2,'[{\"changed\": {\"fields\": [\"Mobile no\"]}}]',6,1),(101,'2021-10-13 16:15:19.556441','44','Madhan umk',3,'',6,1),(102,'2021-10-13 17:07:59.480243','37','suhan suhan',2,'[{\"changed\": {\"fields\": [\"Mobile no\"]}}]',6,1),(103,'2021-10-13 17:15:32.888871','39','FINAL DRAFT',2,'[{\"changed\": {\"fields\": [\"Mobile no\"]}}]',6,1),(104,'2021-10-13 17:21:38.265899','28','Ramesh ramesh',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,1),(105,'2021-10-13 17:25:41.858547','28','Ramesh ramesh',2,'[{\"changed\": {\"fields\": [\"Specialization of genre\"]}}]',6,1),(106,'2021-10-13 17:27:02.916618','28','Ramesh ramesh',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,1),(107,'2021-10-13 17:36:46.204060','28','Ramesh ramesh',2,'[{\"changed\": {\"fields\": [\"Profile photo\"]}}]',6,1),(108,'2021-10-14 12:12:15.148334','4','call for Story Writing',3,'',25,1),(109,'2021-10-15 15:58:34.005805','28','Ramesh ramesh',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,1),(110,'2021-10-15 17:48:15.348068','7','My story 2',3,'',27,1),(111,'2021-10-15 17:48:15.354115','6','My Story',3,'',27,1),(112,'2021-10-15 17:48:15.356494','5','Sample',3,'',27,1),(113,'2021-10-22 18:05:41.607896','46','Portal Admin',1,'[{\"added\": {}}]',6,1),(114,'2021-12-30 12:26:14.045845','17','pitch to ramesh pnr 2',3,'',27,48),(115,'2021-12-30 12:26:14.049967','16','pitch to ramesh pnr',3,'',27,48),(116,'2021-12-30 12:26:14.052347','15','sample 28 2',3,'',27,48),(117,'2021-12-30 12:26:14.054653','14','Sample 28',3,'',27,48),(118,'2021-12-30 14:05:06.755360','28','Ramesh ramesh',2,'[{\"changed\": {\"fields\": [\"Username\", \"Email address\"]}}]',6,48),(119,'2021-12-30 14:11:16.771114','21','same pitch to ram',3,'',27,48),(120,'2021-12-30 14:11:16.775635','20','Sample',3,'',27,48),(121,'2021-12-30 14:11:16.777669','19','Sample',3,'',27,48),(122,'2021-12-30 14:11:16.781183','18','Sample',3,'',27,48),(123,'2021-12-30 14:43:25.635427','51','Chat object (51)',3,'',21,48),(124,'2021-12-30 14:46:15.451834','52','Chat object (52)',3,'',21,48),(125,'2021-12-31 11:12:55.458282','5','Sugumar',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,48),(126,'2022-01-04 12:35:20.368692','5','Sugumar',3,'',6,48),(127,'2022-01-04 14:05:15.735764','56','Chat object (56)',3,'',21,48),(128,'2022-01-04 14:05:15.738952','55','Chat object (55)',3,'',21,48),(129,'2022-01-04 14:05:15.740945','54','Chat object (54)',3,'',21,48),(130,'2022-01-04 14:24:59.721181','57','Chat object (57)',3,'',21,48),(131,'2022-01-04 14:26:37.249517','58','Chat object (58)',3,'',21,48),(132,'2022-01-04 19:03:20.917559','28','Ramesh ramesh',2,'[{\"changed\": {\"fields\": [\"Username\", \"Email address\"]}}]',6,48),(133,'2022-01-04 19:03:21.554460','28','Ramesh ramesh',2,'[]',6,48),(134,'2022-01-05 11:02:45.303641','26','umk',2,'[{\"changed\": {\"fields\": [\"Story title\", \"Pitch to people\"]}}]',27,48),(135,'2022-01-05 11:53:58.058800','26','umk',2,'[{\"changed\": {\"fields\": [\"Pitch to people\"]}}]',27,48),(136,'2022-01-05 11:55:13.549982','26','umk',2,'[{\"changed\": {\"fields\": [\"Pitch to people\"]}}]',27,48),(137,'2022-01-05 11:56:23.408648','26','umk',2,'[{\"changed\": {\"fields\": [\"Pitch to people\"]}}]',27,48),(138,'2022-01-05 14:23:16.358877','27','Pitch to Pnr',2,'[{\"changed\": {\"fields\": [\"Pitch to people\"]}}]',27,48),(139,'2022-01-05 14:29:03.949430','27','Pitch to Pnr',2,'[{\"changed\": {\"fields\": [\"Pitch to people\"]}}]',27,48),(140,'2022-01-05 14:29:59.330400','27','Pitch to Pnr',3,'',27,48),(141,'2022-01-05 14:35:53.679763','29','Pitch To all',3,'',27,48),(142,'2022-01-05 14:35:53.684069','28','Pitch To all',3,'',27,48),(143,'2022-01-07 11:08:20.945225','46','Portal Admin',2,'[{\"changed\": {\"fields\": [\"Is staff\"]}}]',6,48),(144,'2022-01-07 16:37:08.760413','60','madhan umk',3,'',6,48),(145,'2022-01-07 16:37:08.763736','58','Esakki K',3,'',6,48),(146,'2022-01-07 16:37:08.765220','57','Esakki M',3,'',6,48),(147,'2022-01-07 16:37:08.766988','56','Nithish S',3,'',6,48),(148,'2022-01-07 16:37:08.768703','55','Esakki Muthu',3,'',6,48),(149,'2022-01-07 16:37:08.770813','54','Allaudin',3,'',6,48),(150,'2022-01-07 16:37:08.773007','53','Mukil kumar',3,'',6,48),(151,'2022-01-07 16:37:08.774796','52','Arul S',3,'',6,48),(152,'2022-01-07 16:37:08.776357','51','Jiitthendra A',3,'',6,48),(153,'2022-01-07 16:37:08.778233','50','Apoorv',3,'',6,48),(154,'2022-01-07 16:37:08.782526','49','Apoorv',3,'',6,48),(155,'2022-01-07 16:37:08.784524','47','Sundar Ganesan',3,'',6,48),(156,'2022-01-07 16:37:08.788026','45','madhan Umk',3,'',6,48),(157,'2022-01-07 16:37:08.790537','43','Sethu Ramkumar V',3,'',6,48),(158,'2022-01-07 16:37:08.792094','42','chandru apk',3,'',6,48),(159,'2022-01-07 16:37:08.795084','41','chandrasekaran c',3,'',6,48),(160,'2022-01-07 16:37:08.796649','40','suhan suhan',3,'',6,48),(161,'2022-01-07 16:37:08.798625','39','FINAL DRAFT',3,'',6,48),(162,'2022-01-07 16:37:08.800883','38','FINAL DRAFT',3,'',6,48),(163,'2022-01-07 16:37:08.802780','37','suhan suhan',3,'',6,48),(164,'2022-01-07 16:37:08.804345','36','GUHAN S',3,'',6,48),(165,'2022-01-07 16:37:08.809079','35','Suhanya devi',3,'',6,48),(166,'2022-01-07 16:37:08.812034','34','Murphy John',3,'',6,48),(167,'2022-01-07 16:37:08.813706','33','Kathiravan Ramajayam',3,'',6,48),(168,'2022-01-07 16:37:08.815301','32','sr Prakash',3,'',6,48),(169,'2022-01-07 16:37:08.816794','31','Prabhu SR',3,'',6,48),(170,'2022-01-07 16:37:08.818557','30','Subburaj G V',3,'',6,48),(171,'2022-01-07 16:37:08.820211','28','Ramesh ramesh',3,'',6,48),(172,'2022-01-07 16:38:11.940462','7','sample 2',3,'',12,48),(173,'2022-01-07 16:38:11.946831','6','sample 1',3,'',12,48),(174,'2022-01-08 15:00:50.828174','36','Pushpa',3,'',27,48),(175,'2022-01-11 09:29:00.147375','13','call for Story Writing',2,'[{\"changed\": {\"fields\": [\"Language\"]}}]',25,48),(176,'2022-01-11 09:29:04.734044','14','call for Story Writing',2,'[{\"changed\": {\"fields\": [\"Language\"]}}]',25,48),(177,'2022-01-11 09:29:11.656913','15','call for Story Writing',2,'[{\"changed\": {\"fields\": [\"Language\"]}}]',25,48),(178,'2022-01-11 09:29:19.920134','16','call for Dialogue Writing',2,'[{\"changed\": {\"fields\": [\"Language\"]}}]',25,48),(179,'2022-01-11 09:29:49.244936','33','Guru',2,'[{\"changed\": {\"fields\": [\"Language\"]}}]',27,48),(180,'2022-01-11 09:29:59.633529','34','Guru',2,'[{\"changed\": {\"fields\": [\"Language\"]}}]',27,48),(181,'2022-01-11 09:30:14.705427','37','Pushpa',2,'[{\"changed\": {\"fields\": [\"Language\"]}}]',27,48),(182,'2022-01-11 09:30:26.346987','38','Infinity',2,'[{\"changed\": {\"fields\": [\"Language\"]}}]',27,48),(183,'2022-01-11 10:11:42.613159','14','Interest object (14)',3,'',26,48),(184,'2022-01-11 10:13:03.324774','14','call for Story Writing',3,'',25,48),(185,'2022-01-11 10:35:21.267353','13','call for Story Writing',2,'[{\"changed\": {\"fields\": [\"Expiry date\"]}}]',25,48),(186,'2022-01-11 10:35:24.539703','66','Prabhu\'s Call for Story Writing',2,'[]',28,48),(187,'2022-01-11 10:35:51.037450','13','call for Story Writing',2,'[{\"changed\": {\"fields\": [\"Expiry date\"]}}]',25,48),(188,'2022-01-11 10:35:53.243506','66','Prabhu\'s Call for Story Writing',2,'[]',28,48),(189,'2022-01-11 10:47:21.556181','13','call for Story Writing',2,'[{\"changed\": {\"fields\": [\"Expiry date\"]}}]',25,48),(190,'2022-01-11 10:47:38.337632','13','call for Story Writing',2,'[{\"changed\": {\"fields\": [\"Expiry date\"]}}]',25,48),(191,'2022-01-11 12:08:43.222788','13','call for Story Writing',2,'[{\"changed\": {\"fields\": [\"Expiry date\"]}}]',25,48),(192,'2022-01-11 12:11:21.892337','13','call for Story Writing',2,'[{\"changed\": {\"fields\": [\"Expiry date\"]}}]',25,48),(193,'2022-01-11 12:13:10.834686','13','call for Story Writing',2,'[{\"changed\": {\"fields\": [\"Expiry date\"]}}]',25,48),(194,'2022-01-11 14:18:28.105019','61','Prabhu S R',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,48),(195,'2022-01-11 14:19:13.151944','68','Ramesh Natarajan',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,48),(196,'2022-01-11 14:20:45.720136','68','Ramesh Natarajan',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,48),(197,'2022-01-11 14:20:57.442773','61','Prabhu S R',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,48),(198,'2022-01-11 15:39:12.537723','35','sample',2,'[{\"changed\": {\"fields\": [\"Language\"]}}]',27,48),(199,'2022-01-14 14:01:34.929644','2','Madhan UmkAyalaan',1,'[{\"added\": {}}]',39,48),(200,'2022-01-14 14:24:25.133556','9','Highlight object (9)',3,'',18,48),(201,'2022-01-14 14:24:25.139642','8','Highlight object (8)',3,'',18,48),(202,'2022-01-14 14:24:25.142220','6','Highlight object (6)',3,'',18,48),(203,'2022-01-17 09:53:29.907152','70','Test account 1',3,'',6,48),(204,'2022-01-17 14:19:31.075140','63','Madhan Umk',2,'[{\"changed\": {\"fields\": [\"Active\", \"Verified email\"]}}]',6,48),(205,'2022-01-17 16:09:37.021756','71','Test account 1',2,'[{\"changed\": {\"fields\": [\"Gender\"]}}]',6,48),(206,'2022-01-17 16:09:58.812458','71','Test account 1',2,'[{\"changed\": {\"fields\": [\"Gender\"]}}]',6,48),(207,'2022-01-17 18:04:41.430657','68','Ramesh Natarajan',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,48),(208,'2022-01-18 09:48:56.998133','71','Test account 1',2,'[{\"changed\": {\"fields\": [\"Active\", \"Verified email\", \"Admin approval\"]}}]',6,48),(209,'2022-01-18 11:40:10.960416','71','Test account 1',2,'[{\"changed\": {\"fields\": [\"Active\", \"Admin approval\"]}}]',6,48),(210,'2022-01-18 11:41:42.738390','71','Test account 1',2,'[{\"changed\": {\"fields\": [\"Active\", \"Admin approval\"]}}]',6,48),(211,'2022-01-18 12:27:41.753681','71','Test account 1',2,'[{\"changed\": {\"fields\": [\"Active\", \"Admin approval\"]}}]',6,48),(212,'2022-01-19 09:46:21.017383','61','Prabhu S R',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,48),(213,'2022-01-19 09:46:58.650459','62','Esakki Muthu K',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,48),(214,'2022-01-19 09:47:32.037128','63','Madhan Umk',2,'[]',6,48),(215,'2022-01-19 09:48:03.554633','64','Allaudin Hussain',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,48),(216,'2022-01-19 09:48:24.342796','65','Muthu E',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,48),(217,'2022-01-19 09:48:42.708468','66','MURPHY JOHN',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,48),(218,'2022-01-19 09:49:06.019485','67','SUHANYA DEVI',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,48),(219,'2022-01-19 09:49:24.974113','68','Ramesh Natarajan',2,'[{\"changed\": {\"fields\": [\"Get notification\", \"Verified email\", \"Admin approval\"]}}]',6,48),(220,'2022-01-19 09:49:47.684560','69','Madras Krishna',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,48),(221,'2022-01-20 09:17:25.380518','46','Portal Admin',2,'[{\"changed\": {\"fields\": [\"Profile photo\"]}}]',6,48),(222,'2022-01-20 09:18:15.644363','46','Portal Admin',2,'[{\"changed\": {\"fields\": [\"Profile photo\"]}}]',6,48),(223,'2022-01-20 09:19:44.527458','46','Portal Admin',2,'[{\"changed\": {\"fields\": [\"Profile photo\"]}}]',6,48),(224,'2022-01-20 15:04:01.502356','18','call for Story Discussion',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',25,48),(225,'2022-01-20 15:07:49.281091','18','call for Story Discussion',2,'[{\"changed\": {\"fields\": [\"Expiry date\"]}}]',25,48),(226,'2022-01-20 15:08:03.978712','18','call for Story Discussion',2,'[{\"changed\": {\"fields\": [\"Expiry date\"]}}]',25,48),(227,'2022-01-20 15:08:33.781815','18','call for Story Discussion',2,'[{\"changed\": {\"fields\": [\"Expiry date\"]}}]',25,48),(228,'2022-01-20 17:36:27.682407','28','ssss',3,'',12,48),(229,'2022-01-20 17:36:27.685075','27','ffff',3,'',12,48),(230,'2022-01-20 17:36:27.686677','26','ssss',3,'',12,48),(231,'2022-01-20 17:36:27.688809','25','ssss',3,'',12,48),(232,'2022-01-20 17:36:27.690582','24','stone',3,'',12,48),(233,'2022-01-20 17:36:27.691812','23','stone',3,'',12,48),(234,'2022-01-20 17:36:27.693068','22','stone',3,'',12,48),(235,'2022-01-27 14:52:46.108835','75','Madhan 1',2,'[{\"changed\": {\"fields\": [\"Active\", \"Is staff\", \"Verified email\", \"Admin approval\"]}}]',6,48),(236,'2022-01-27 15:02:24.511871','75','Madhan 1',3,'',6,48),(237,'2022-02-15 11:14:59.127510','63','Madhan Umk',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,48),(238,'2022-02-16 11:28:08.570596','49','Gaani',2,'[{\"changed\": {\"fields\": [\"Cover image\"]}}]',27,48),(239,'2022-02-16 14:28:11.969501','31','llll',3,'',12,48),(240,'2022-02-16 14:28:11.972142','30','vvv',3,'',12,48),(241,'2022-02-16 14:28:11.973969','29','dd',3,'',12,48),(242,'2022-02-16 14:29:04.519671','49','Gaani',2,'[{\"changed\": {\"fields\": [\"Cover image\"]}}]',27,48),(243,'2022-02-22 13:51:04.114804','63','Madhan Umk',2,'[{\"changed\": {\"fields\": [\"Active\", \"Admin approval\"]}}]',6,48),(244,'2022-02-22 13:55:17.875657','63','Madhan Umk',2,'[{\"changed\": {\"fields\": [\"Active\", \"Admin approval\"]}}]',6,48),(245,'2022-02-23 13:34:59.618668','63','Madhan Umk',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,48),(246,'2022-02-25 14:14:47.670854','52','p',3,'',27,48),(247,'2022-02-25 14:14:47.673490','51','pp',3,'',27,48),(248,'2022-02-25 14:14:47.675324','50','gaani 6',3,'',27,48),(249,'2022-02-25 14:14:47.676566','48','sample 2q',3,'',27,48),(250,'2022-02-25 14:14:47.678500','47','sample 1',3,'',27,48),(251,'2022-02-25 14:15:21.428651','46','to vicky',3,'',27,48),(252,'2022-02-25 14:15:21.431452','41','Sample',3,'',27,48),(253,'2022-02-25 14:15:21.432931','40','sample 2',3,'',27,48),(254,'2022-02-25 14:15:21.434575','39','Sample',3,'',27,48),(255,'2022-02-25 14:16:13.274156','16','Interest object (16)',3,'',26,48),(256,'2022-02-25 14:16:55.425295','37','Pushpa',3,'',27,48),(257,'2022-02-25 14:17:41.600530','45','vasantham',3,'',27,48),(258,'2022-02-25 14:17:41.603541','42','pitch to pnr',3,'',27,48),(259,'2022-02-25 14:17:41.604955','35','sample',3,'',27,48),(260,'2022-02-25 14:25:57.191531','43','Dreams have Duties',2,'[{\"changed\": {\"fields\": [\"Pitch to people\"]}}]',27,48);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (24,'account','assistant'),(23,'account','award'),(22,'account','blocked_user'),(21,'account','chat'),(20,'account','company'),(19,'account','conversation'),(7,'account','format'),(8,'account','genre'),(18,'account','highlight'),(39,'account','join_project'),(9,'account','language'),(10,'account','location'),(11,'account','open_to'),(12,'account','project'),(17,'account','qualification'),(16,'account','rating'),(15,'account','report_people'),(14,'account','testimonial'),(6,'account','user'),(13,'account','userfollowing'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(35,'clubhouse','club_house'),(38,'clubhouse','club_house_member'),(37,'clubhouse','event'),(36,'clubhouse','event_registration'),(4,'contenttypes','contenttype'),(25,'project','call'),(34,'project','comment'),(33,'project','downvote'),(26,'project','interest'),(32,'project','like'),(31,'project','message'),(27,'project','pitch'),(28,'project','post'),(30,'project','report'),(29,'project','upvote'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-10-04 18:33:05.510813'),(2,'contenttypes','0002_remove_content_type_name','2021-10-04 18:33:05.561510'),(3,'auth','0001_initial','2021-10-04 18:33:05.762375'),(4,'auth','0002_alter_permission_name_max_length','2021-10-04 18:33:05.798046'),(5,'auth','0003_alter_user_email_max_length','2021-10-04 18:33:05.807205'),(6,'auth','0004_alter_user_username_opts','2021-10-04 18:33:05.816761'),(7,'auth','0005_alter_user_last_login_null','2021-10-04 18:33:05.825756'),(8,'auth','0006_require_contenttypes_0002','2021-10-04 18:33:05.830988'),(9,'auth','0007_alter_validators_add_error_messages','2021-10-04 18:33:05.839878'),(10,'auth','0008_alter_user_username_max_length','2021-10-04 18:33:05.849123'),(11,'auth','0009_alter_user_last_name_max_length','2021-10-04 18:33:05.858106'),(12,'auth','0010_alter_group_name_max_length','2021-10-04 18:33:05.878813'),(13,'auth','0011_update_proxy_permissions','2021-10-04 18:33:05.892016'),(14,'auth','0012_alter_user_first_name_max_length','2021-10-04 18:33:05.903054'),(15,'account','0001_initial','2021-10-04 18:33:08.058602'),(16,'admin','0001_initial','2021-10-04 18:33:08.179842'),(17,'admin','0002_logentry_remove_auto_add','2021-10-04 18:33:08.209020'),(18,'admin','0003_logentry_add_action_flag_choices','2021-10-04 18:33:08.240496'),(19,'clubhouse','0001_initial','2021-10-04 18:33:08.715786'),(20,'project','0001_initial','2021-10-04 18:33:10.498571'),(21,'sessions','0001_initial','2021-10-04 18:33:10.535046'),(22,'account','0002_auto_20211013_1704','2021-10-13 17:15:40.638677'),(23,'project','0002_auto_20211013_1704','2021-10-13 17:15:40.999993'),(24,'account','0003_auto_20211030_1655','2021-10-30 16:59:07.773683'),(25,'account','0004_auto_20211230_1122','2021-12-30 12:19:36.064906'),(26,'account','0005_auto_20220111_0921','2022-01-11 09:24:24.510625'),(27,'project','0003_auto_20220111_0921','2022-01-11 09:24:25.002760'),(28,'account','0006_auto_20220114_1332','2022-01-14 13:35:04.573743'),(29,'account','0007_auto_20220114_1418','2022-01-14 14:21:08.804221'),(30,'account','0008_auto_20220117_1416','2022-01-17 14:18:02.335913'),(31,'account','0009_auto_20220216_1039','2022-02-16 10:43:14.239952'),(32,'project','0004_pitch_cover_image','2022-02-16 10:43:14.317822'),(33,'account','0010_alter_project_image','2022-02-16 12:17:40.986033');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('03hahq1mg7rmgz8we7vdjnv5ehns65l1','.eJxVi8sKwjAQAP8lZynbvDb1KPQ7wu4mIUWtYJqT-O9a6EEvc5hhXipS32rsLT_jktRZWVSnX8kk17zuhUQefd2Gw7RhvtNyuxz9b6rU6vdAkzVpLGzQIYLl4Jz2wCkbXZxAmew4WiM7OIcgxkPSQDaxeDeJen8ABiUy3Q:1meKmz:jmJw7UKYqLmKHvGeqk4aOTUWhbZq993ctNQ0fDfu-TI','2021-11-06 22:56:37.010155'),('051zcdbz39ixn6jg2f3pbdze2ljacbmq','.eJxVjMsKwjAQAP8lZynJ5rEbj4LfEbbZhBS1gmlO4r-L0oNeZ5h5qsRja2n08kiLqKMKpA6_cOZ8KevHcM73sW7TTvp0vvFyPe3-L2rc2_flEZgDRhRCsd46Qec1meijBwESAIdaV-vIWKSK0VYKM5SSjQ3q9Qbi6zHJ:1nM2hb:xZSDa7YKrsQeoST3p5XdJ3qYyQIm2t3AyHrs6egcGek','2022-03-07 12:31:43.156344'),('07m2ce0kb0a7937q6o74y3t8hz7l1fu1','.eJxVy00KwjAQQOG7ZC1lOvl3KXiOMJlMSFErmGYl3l2FLnT7Pt5TJRpbS6PLIy1FHZX36vAbM_FF1q8Q832s27SXPp1vtFxPu_9NjXr7HMJaPFlXQmQxtRgU42JBE9kLhoAz-FJnqJq0xEyWEDFr0BDBZbbq9QY4fjN8:1nRSzu:EmyhsdD8fOUp8OMKHAd0pd0rj-XszpB-m3yfMieQwHw','2022-03-22 11:37:02.554357'),('09tvlwl38xldoiuhy5obt4ppxydfl7f5','.eJxVjMsKwjAQAP8lZynJ5rEbj4LfEbbZhBS1gmlO4r-L0oNeZ5h5qsRja2n08kiLqKMKpA6_cOZ8KevHcM73sW7TTvp0vvFyPe3-L2rc2_flEZgDRhRCsd46Qec1meijBwESAIdaV-vIWKSK0VYKM5SSjQ3q9Qbi6zHJ:1nZ7rd:YTkIaiCU2kI4gHnI0ScQo3tAsKCEYMXciUpnxdkkpRw','2022-04-12 14:40:09.590291'),('0mrm9dzutsv7onb95c7vux5oe8eivnw6','.eJxVy00KwjAQQOG7ZC1l8t-4FDxHmGRmSFErmGYl3l2FLnT7Pt5TZRxby6PzIy-kjioYdfiNBeuF169grfexbtNe-nS-4XI97f43Neztc4DWlkmTNwyhiHMgIpBAgo9pZqSqHSSKTLamxD44KxJNKcy2mDSr1xsozTPo:1nSue6:76312t4p0tf-3eVXWvQmZUycnAd-4dWhGSq8Eofcp_w','2022-03-26 11:20:30.020352'),('0vf0vj0i1aef4nbpp9l1bwrmufyfkehj','.eJxVjEEKwyAQAP_iuYQYddUeC32HrLsrhrYp1Hgq_XsJ5JBcZ5j5qoR9rak3-aSZ1VU5qy5HmJEesmwGid59WYedtOH-wvl52_0pqtjq9vJMOkIxHKIWdMxQEKK14AOMoUj2fsQ8gQVng0Q2WnOYjJBQZtHq9wclYjPI:1mzDYi:ThZOUIm-wzIymakN8S3fIfYR6sze5nvsEGhFgogbdEc','2022-01-03 13:28:12.034811'),('1bgd2d0aos5czwg8bwl1iji59eoptuul','.eJxVy00KwjAQQOG7zFpK0szkx6XgOcIkmZCiVjDNSry7Cl3o9n28J0QeW4ujyyMuBY5gDRx-Y-J8kfUrnPN9rNu0lz6db7xcT7v_TY17-xziXAjaiDdUHBFSSGwosHeoVfWsC7KtdlZZCIUqElbMyCnNSnmL8HoDBNEyyg:1ntkpw:iOGNfgmxdcncv9qjHEcYOwZ8tW5RySJFxjGegFRDo5o','2022-06-08 12:19:40.397860'),('1lgu9ws8rthe4rq86i8ilkwrqn6uo4zl','.eJxVi8sKwjAQAP8lZymbV5N4FPodYZPdkKJWMM1J_Hcj9KDMbYZ5iYh9r7E3fsaVxFlYLU6_MmG-8vYtmPOjb_t0mDYtd1xvl6P_TRVbHQcZ8oAhW1-k9wSOTUmGgKWzTjOzmmHWTklSgxQUgMw6SCgAaljx_gAgfjLS:1mvfe3:fhU2vypHJ57fd9d1YaUK6IuCp5ncaN4NqpkMJFukDAM','2021-12-24 18:39:03.391228'),('1nov7x2g116a0meugo6cya07wyzs4fbz','eyJfcGFzc3dvcmRfcmVzZXRfdG9rZW4iOiJheWlwd3UtMWNjYWM3ZjRjMTI5NGQ3NjFjMTZjMWExOWU5NGEzMDgifQ:1n3AjE:Y2O29qyhsD-FlE8uza547zzTPX-SG_BRNTwydCf2NfY','2022-01-14 11:15:24.470639'),('2518aklobxc1s014ngqjnxy4snmrbntr','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1mvBvH:yYgG9Ko1mDSyLsPp1ds830XPRXtL-JrLGo1jf1ZvfRM','2021-12-23 10:54:51.916419'),('2cm00a6c8tkq4ncr0nbuw4u92beik49x','.eJxVjEEKwyAQAP_iuYQYddUeC32HrLsrhrYp1Hgq_XsJ5JBcZ5j5qoR9rak3-aSZ1VU5qy5HmJEesmwGid59WYedtOH-wvl52_0pqtjq9vJMOkIxHKIWdMxQEKK14AOMoUj2fsQ8gQVng0Q2WnOYjJBQZtHq9wclYjPI:1n0Eq2:o9r3p5qUJRMlgj5sSRRPPhiqbaGT-1DoxvIEp7ipdCc','2022-01-06 09:02:18.611441'),('2qsmt7y2hgogqhngrwds404fxo8ivt7n','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nMmeS:3aANCKOHhVCbyBH8gEZ6ezwgPcdIjlyOFfOAR8he3yw','2022-03-09 13:35:32.887934'),('32kmsfiu3r9nzrx3jv1wfz4umt2cd3ov','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nNBE0:AjVrRYubMA-wwjqMN0wC48lFAIfWyadyFgrP2PhEuB8','2022-03-10 15:49:52.954431'),('37y84hp3c5bf5fubmyhs86poc6hs5ei8','.eJxVy00KwjAQQOG7ZC1lOvl3KXiOMJlMSFErmGYl3l2FLnT7Pt5TJRpbS6PLIy1FHZX36vAbM_FF1q8Q832s27SXPp1vtFxPu_9NjXr7HMJaPFlXQmQxtRgU42JBE9kLhoAz-FJnqJq0xEyWEDFr0BDBZbbq9QY4fjN8:1nNqTn:fo9lvCj2-a0Geu-gxMofV5X-OIvVRXKHsWJfuU_VkiE','2022-03-12 11:52:55.330300'),('3jyl7ie3f1v0c0kn7bxa06dn43o14xdo','.eJxVjMsKwjAQAP8lZynJ5rEbj4LfEbbZhBS1gmlO4r-L0oNeZ5h5qsRja2n08kiLqKMKpA6_cOZ8KevHcM73sW7TTvp0vvFyPe3-L2rc2_flEZgDRhRCsd46Qec1meijBwESAIdaV-vIWKSK0VYKM5SSjQ3q9Qbi6zHJ:1n7950:0tqgPT0jbS0NErbGAjbIOrf6LOaJe2dk19h80ODRQuw','2022-01-25 10:18:18.770124'),('40d8eyilzd0dko0i9asjid1ccrh2irxc','.eJxVy00KwjAQQOG7ZC0lk59J4lLoOcLMJJKiVjDNSry7Cl3o9n28p8o0tpZHr4-8FHVUCOrwG5nkUtevkMh9rNu0lz7NN1qup93_pka9fQ6HhjkZR1F7qCHaYAuC1gWZraAk8qGK5eoJIVKxYCKxJMfnIj6Aer0BE3gzmw:1n5pFu:r8MdxlSBRt47urjyA8azhvGnVB1mFEs3-ELUGx0RWv8','2022-01-21 18:56:06.382535'),('414s1phjyzz15eja60jjml2aetv4os99','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1mbNaJ:YrJm_p6W4viYRGBCt757UvFyQ1QpRG6OBQfN1o3S8Hc','2021-10-29 19:19:19.895417'),('49327mufrrgxih0m6bnk7b5serkqgsbt','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1mp1jV:qFi33noKc7KlegtkpQN_r7PxA8lAHyrmkRmur_lWd_A','2021-12-06 10:49:13.689752'),('49xg4botdoxq7d2hk6vx52euite9ysgf','.eJxVy0EKwjAQQNG7ZC0lMybpxKXQc4TpZEKKWsE0K_HuUuhCt__x3yZx32rqTV9pyeZiAprTb5xZbrruwiLPvm7DUdowPXi5Xw__myq3uh_ZkXgCpeAFx2Lj7KMLFACY1DsaFRACnNG7yIqqFnIsVhzGmAuYzxcDJjKe:1nM0HB:Wi6-ht3PgcJ8LmEH6YI-6ass9C-IfVxeG8iPExrDNLw','2022-03-07 09:56:17.761969'),('4dho78oyavoptckt6lmbwulyle4t3qtc','.eJxVi0kKwjAUhu-StZRMzeBS8Bzh_a8JKWoF06zEu9tCF7r9hrdI1NeaesuvNE_iLJwRp18I4ltedkPMz76sw0HacH3QfL8c_m-q1Op2sMSolQS8LBwyqwzChGKtt8E7U7TSxng4p6KWFgxJoTBi3GJQFJ8vOeM0KQ:1nAAFD:4NpQorUu3xLjQf_UQdVWQaFVQ8iMNsbbNlFmjMjFoDE','2022-02-02 18:09:19.631685'),('4g5slpa8jbz6rpi8kcrbnd7rcw1ichyq','.eJxVi8sKwjAQAP8lZylNmtd6FPodYbO7IUWtYJqT-O9W6EGPM8O8VMK-1dSbPNPC6qycUadfmZGusn4LEj36ug2HacN8x-V2OfrfVLHV_TCsJ2QhcA7J75CzBMai2VsRI8UX0CRO_OijJaPLiDYATBA5Igf1_gBXyTR4:1mqWts:uoMX027u4IneA32SW0_MmvPwn_caifFO7gWVpgxTOOQ','2021-12-10 14:18:08.517632'),('4gwai54fm6hzd7ju9v4lmxt23ljma5xl','.eJxVy0EKwjAQRuG7ZC0laZuZxKXQc4TJ74QUtYJpV-LdVehCt-_jPU2Sba1pa_pI89kczUjm8Buz4KLLVwS4b8va7aV1003m62n3v6lKq58jRBDZGD2AXpynUViiZucHKdpDNYtlhgPnYNmhhBypEFtCUDeY1xszWzPo:1nGwtq:JEPKtuoLEXNNW0OFgaxBdSB-DX7u5NI078Ls_dV2slc','2022-02-21 11:19:18.151693'),('4k3j677swc202y1lxza4jftx68wvpchb','.eJxVy0sKwjAURuG9ZCwl3KS5fxwKriPcvEhRK5h2VNy7FTrQ6Xc4mwqyLi2svbzClNVZOVKnX4ySbmX-Fknpuc7LcEgfrg-Z7pej_01NetsPW8m4nIhzZAsL0npEBZwA8FQYRtedBM6PvqTM8DHBlezZMhn1_gD8uDJv:1nrD5C:Cqr1_MWVKP8rHcTzd2e0xqRwJYnaWuFWQBQVsb_Je6Y','2022-06-01 11:52:54.601640'),('4th4wp65pz2vmabbmfpbb6rz6qfumcgq','.eJxVi8sKwjAQAP9lz1LyWJKsR8HvCJtkQ4pawTSn4r9boQe9zGGG2SDyWFscXV5xLnAGT3D6lYnzTZZv4ZyfY1mnw_Tp-uD5fjn639S4t_3AnFJxREYq7ayMbBWSFRfEOkVovHZSBNkHnZxBhRh0sVWUF48a3h8g9jLY:1ncmdf:sJo0dnuoqQ9-tL_aZUs4e9jnxzmayyMhrgLhq7bYqrY','2022-04-22 16:48:51.679831'),('53l0zyebeghg33011yzzcan93dvrl1x1','.eJxVy0EKwjAQRuG7ZC0laZuZxKXQc4TJ74QUtYJpV-LdVehCt-_jPU2Sba1pa_pI89kczUjm8Buz4KLLVwS4b8va7aV1003m62n3v6lKq58jRBDZGD2AXpynUViiZucHKdpDNYtlhgPnYNmhhBypEFtCUDeY1xszWzPo:1nJrI9:T_DKBa_uUjnKVP4gg_LBGnQ93Hjnkln3qC67BDBG8jU','2022-03-01 11:56:25.661253'),('5azl8qoevly1tnv1c6th3q3pmtjr8550','.eJxVjMsKwjAQAP8lZynJbpLdeBT8jrDNgxS1gmlO4r9LoQe9zjDzVlHG1uLo5RWXrM7Kozr9wlnSray7kZSeY92mg_Tp-pDlfjn8X9Skt_3FjkDEU6DMlNGhzWSdZhNccJCBM4AlrStaNkhcKWBlP0MpyaBXny_gKjHE:1nJsx0:u_aLvhVXF_LXQXVLOM6B4VuqkBVJi-tCh8x-XAbfUVk','2022-03-01 13:42:42.399557'),('5kgb0kn4l8bqws5xh2oe8zb867raqwv6','.eJxVy00KwjAQQOG7ZC0lk59J4lLoOcLMJJKiVjDNSry7Cl3o9n28p8o0tpZHr4-8FHVUCOrwG5nkUtevkMh9rNu0lz7NN1qup93_pka9fQ6HhjkZR1F7qCHaYAuC1gWZraAk8qGK5eoJIVKxYCKxJMfnIj6Aer0BE3gzmw:1nd2iw:zkgiaz4MejFOJ3D6JGypI4FaaHyzFi4i1LBrDxMoGaU','2022-04-23 09:59:22.039466'),('5v2k9fv3it51toxau25vwrgnxmpqnazr','.eJxVy00KwjAQQOG7ZC1lOvl3KXiOMJlMSFErmGYl3l2FLnT7Pt5TJRpbS6PLIy1FHZX36vAbM_FF1q8Q832s27SXPp1vtFxPu_9NjXr7HMJaPFlXQmQxtRgU42JBE9kLhoAz-FJnqJq0xEyWEDFr0BDBZbbq9QY4fjN8:1nNqWw:9REQeK6YXNJY7IwddxQb1mEelSVoTxVntGdQlzMRn5M','2022-03-12 11:56:10.730006'),('655e5qkrvhgmogc41y5tpyi1sjmd0hpa','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1n2qxz:Z94mt_2HMuovSWu73WC1DQgeidLcioOtuHZT-5qFmnw','2022-01-13 14:09:19.235798'),('657v0yu9mjdpra9pknlmschxzvmaxvt3','e30:1nKeMM:ELDaBCKsQNB7BOMyIy2ugFRDKhOPWs-Ax1oU7UYj8eY','2022-03-03 16:20:02.849692'),('6l6moxneqxujew043ii1lxbrz18bv8px','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1mpPyn:uESnJ-CLS0GkidqgEIdF5p1r3Xr3knqAPRX9cRT-llc','2021-12-07 12:42:37.663747'),('6mxpmoowwdk2vy1ssf9u5d6h6m55uteo','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nNSyy:F5eXu5D2ugLFvlYTQc-0OXAOEv_S3I0gI_XAPrdF-y4','2022-03-11 10:47:32.732947'),('6zhb14ol01282htn8yhdgpeqza9qrjn6','.eJxVi8sKwjAQAP9lz1LyWJKsR8HvCJtkQ4pawTSn4r9boQe9zGGG2SDyWFscXV5xLnAGT3D6lYnzTZZv4ZyfY1mnw_Tp-uD5fjn639S4t_3AnFJxREYq7ayMbBWSFRfEOkVovHZSBNkHnZxBhRh0sVWUF48a3h8g9jLY:1nSvMZ:9_5pJUxIbdHVa15qyVmytwlapGp3xhobXjFBo54ZsV4','2022-03-26 12:06:27.624977'),('73ukv7ui1wupren8nqhqporbrra2btzc','.eJxVy00KwjAQQOG7ZC0lk59J4lLoOcLMJJKiVjDNSry7Cl3o9n28p8o0tpZHr4-8FHVUCOrwG5nkUtevkMh9rNu0lz7NN1qup93_pka9fQ6HhjkZR1F7qCHaYAuC1gWZraAk8qGK5eoJIVKxYCKxJMfnIj6Aer0BE3gzmw:1n77wX:Iel4dEmBvvzjSywQ8mM4bYu_L0k5zrnju5inqajRFeg','2022-01-25 09:05:29.746252'),('74syyo3mi5lyzstiklxehnl7m6ojpfzp','.eJxVy0EKwjAQQNG7ZC0lmaTTjkvBc4TJZEKKWsE0K_HuKnSh2__4TxO5bzX2po-4ZHM0AczhNyaWi65fYZF7X7dhL20433i5nnb_myq3-jmKOsQEM-UANDvgXDIosVoe_WQLBi06AqBXoclZ8RaREpEmxoDevN4nvTNZ:1mYnM7:jaDwvKueslEUXY4hGuyU9VX_Ajrr-U-yH8xufNL46Hk','2021-10-22 16:13:59.655018'),('7h70nj5twqkf3lws7ma6mgrlm77x788l','eyJfcGFzc3dvcmRfcmVzZXRfdG9rZW4iOiJiNW1iaDMtMjE1MThkM2Y1NWY4N2E2YzhjYjFjYmNmMGZjZDFmOTMifQ:1nrD4c:cdCECKzvgatqLkwtxi0Xkza47lBmgWqtB_kLLUz4Zeg','2022-06-01 11:52:18.683004'),('7yzp54rn5i3xxqfw9jv1jnzeqr43tgy7','.eJxVy0EKwjAQQNG7ZC0lJjNp41LoOcLMJEOKWsE0K_HuKnSh2__4T5OobzX1Vh5pyeZkAM3hNzLJpaxfIZF7X7dhL22Yb7Rcz7v_TZVa_RwaQCb2KuScGxUxY4iWQaP1xBokEhT2OaogOMjFFy_2yCHgNDpvzesNOrszrA:1mbM8f:7otUHhy9JWha3JaXNAd4m07KiVooQqk_SJgc4WBxaTE','2021-10-29 17:46:41.505963'),('883zo8v76hn5c2rxh4kfr3b37dbby9uk','.eJxVjM0KwjAQBt8lZymJ_cnGo9DnCLv7JaSoFUxzEt9dCj3odYaZt4ncthJbTa-4wFzMaE6_TFhvad0Fqz7bunUHqd384OV-PfxfVLiWfaVgmWSinAPUpR5OAywDlKgfhfvBelI_WAgCwC7YzGclx55IxHy-QRc0xg:1mlAu4:sGWCaUNg4QOtn9xKPpt3is3mG9lVfhQscBsGh0PpgV4','2021-11-25 19:48:12.941462'),('8h42omy02lh0v5jrc9gmxor3ccjlqtlc','.eJxVy0EKwjAQRuG7ZC0l05pM4lLwHGHyOyFFrWCalXh3FbrQ7ft4T5OkrzX1po80n83BkNn9tiy46PIFAe59WYettOF0k_l63PxvqtLq5wgR3tsYHYBRyPm9sETN5CYpOkI1i2UGgXOwTCghR188W4-gNJnXGw1LM68:1mZrNH:xi_aTNJbHyYw6DCrNgFhc-5L9L4qrvDlEWehKDb8nG0','2021-10-25 14:43:35.704233'),('8iz8vkk7usu1vnurertuo6p1ax0q8uw3','.eJxVy0sKwjAURuG9ZCwljxtiHAquI9z-ySVFrWCakbh3K3TQTr_D-ajEfampt_JOU1YXRUad9jgy7mX-FwZefV6GTdpwe_L0uG79MFVudT0iihUCnBghjULQwSOLNy7zaojOsSbvrM7BGmskhlyiPVMERs_q-wNB6zP8:1mYMxt:VcTp0iQOta2FsyhfF5MCLYV0LzbV3roQ-szVdaK1X5w','2021-10-21 12:03:13.379150'),('8l0wtdtzln0p4zw83wv7go750sdvjag3','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1n9fwz:w7qOi7DKQWPzjNlQoUzmalbF-T72t7HsC8eK3uQMm4w','2022-02-01 09:48:29.678234'),('8r426caahpy780bp9f4tluf974pbsvg1','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1n233b:7H0kot6qh8OXnKW5Ot8WPNWSoyBZDNRwiGUbQmUJdwg','2022-01-11 08:51:47.308002'),('9a974hzlpp5wwm6ua6ssacwxqxq3znn6','.eJxVi0EKwjAQAP-Ss5Rmm2xTj0LfEXazWVLUCqY5iX-3Qg96G2aYl4nUthJbzc-4iDkbb06_jild8_oNlNKjrVt3mNrNd1pul6P_TYVq2Q8OCAqkDKJqnbI6GwgBg07kNAgS0-RtD5pHhjxg75MddsqoIqN5fwArYDRp:1mvEqF:lhr4k0akKU9E7WFn963ZqzC60lRqK80EZWp_Yz7Y9J8','2021-12-23 14:01:51.798240'),('9ah08pqx4q98ersril7pucmnfbbg7pc9','.eJxVjM0KwjAQBt8lZymJ_cnGo9DnCLv7JaSoFUxzEt9dCj3odYaZt4ncthJbTa-4wFzMaE6_TFhvad0Fqz7bunUHqd384OV-PfxfVLiWfaVgmWSinAPUpR5OAywDlKgfhfvBelI_WAgCwC7YzGclx55IxHy-QRc0xg:1mghX3:pTB4a01L9z7g6EJviNwkYX9CtvQ-stU0kHT7ua_Wwds','2021-11-13 11:37:57.435991'),('9eiqwyo1cbgfhtozot19nic3jkea4pdo','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1mpjse:r2JLY0KTCIYfAenfw9-foatvyPyEVSIeefil9psD8JY','2021-12-08 09:57:36.314787'),('9ih3swptc7lu39ydoe1p6m9yc1wftm5v','.eJxVy0EKwjAQQNG7ZC1lnMQmcSn0HGEmkyFFrWCalXh3K3Sh2_f5L5OorzX1Vp5pFnM2LprDLzLla1m-hXJ-9GUddmnDdKf5dtn731Sp1e3IJ1U7opID9FrgSAieXCnOSxBlgYieAwPaACFEllFZQSwxbQDm_QE6yjQD:1mlPsy:Ogdb0ys1c4n-UdpX_x39kDgl58y3MW50b-BRmDWw3SY','2021-11-26 11:48:04.822537'),('9n5fw45lacun3lzq9b3dmiwnfl913k32','.eJxVy00KwjAQQOG7ZC0lk59J4lLoOcLMJJKiVjDNSry7Cl3o9n28p8o0tpZHr4-8FHVUCOrwG5nkUtevkMh9rNu0lz7NN1qup93_pka9fQ6HhjkZR1F7qCHaYAuC1gWZraAk8qGK5eoJIVKxYCKxJMfnIj6Aer0BE3gzmw:1nJwF0:vw1uOVNX_CCp0rk309fubTC-FH_q6lGIka4mHn8e1HM','2022-03-01 17:13:30.021371'),('9w7b6se26zstluquwibzm3vfmpyh4sgj','.eJxVy00KAjEMQOG7dC1D-jNpcCl4jpI2KR3UEex0Jd5dhVno9n28p0k8tpZG10daxByNt-bwGzOXi65f4VLuY92mvfTpfOPletr9b2rc2-cQL5acQ8mKwQdFV7EKxZlnrCTOgUMAGzVEJiDwGqAwBkEtlNWa1xsQVzMS:1mpXLP:_JrINKnCKtxMqaYFgAZMhaZKhmHqs36UaxhLkIjvjho','2021-12-07 20:34:27.569246'),('9y53kaegteqa5m9wqmpj0gitcn13ns9i','.eJxVy0EKwjAQRuG7ZC0laZuZxKXQc4TJ74QUtYJpV-LdVehCt-_jPU2Sba1pa_pI89kczUjm8Buz4KLLVwS4b8va7aV1003m62n3v6lKq58jRBDZGD2AXpynUViiZucHKdpDNYtlhgPnYNmhhBypEFtCUDeY1xszWzPo:1n9gL6:NCaLa0fP_MXNTKx4GdHHEAQSprSKbZVU1nLikX9hp-Q','2022-02-01 10:13:24.908666'),('a0cadruqzx1j1vtng2469uvnz97id11s','.eJxVy00KwjAQQOG7ZC0lM5n8uRQ8R5hMGlLUCqZZiXdXoQvdvo_3VInH1tLo8yMtRR0VWXX4jZnlMq9fYZH7WLdpL30633i5nnb_mxr39jl80CSAPjojzkXCwIDV6GyBTdFQrImhZAxEulhdxeXsOQiCQVeF1OsN7fMyfA:1n4yXk:MkwNndllfBpc7eqHwN_YsMsagQwFX71fXSNWGF2cge8','2022-01-19 10:39:00.812983'),('a989f8edqvvu620b84z631t8ymmtkn40','.eJxVi0kKwjAUhu-StZRMzeBS8Bzh_a8JKWoF06zEu9tCF7r9hrdI1NeaesuvNE_iLJwRp18I4ltedkPMz76sw0HacH3QfL8c_m-q1Op2sMSolQS8LBwyqwzChGKtt8E7U7TSxng4p6KWFgxJoTBi3GJQFJ8vOeM0KQ:1nAVnn:vWeEYL56oWAoPqjiyJtbf1hZJD7yHYe-J6D23s-jtcc','2022-02-03 17:10:27.755858'),('ajgeo6zqaexofwfl3tdgaaq5oyornwus','.eJxVy00KwjAQQOG7ZC0l_zNxKXiOMDNJSFEr2GYl3l2FLnT7Pt5TZRpbz2OtjzwXdVTOqcNvZJJLXb5CIvexbNNe1ul8o_l62v1v6rT2zxHECIYIycbkDTsMjnXwwTYAYm2lRG5NR2SLFTylClWADEpDXZqo1xsElDOL:1mXcl2:Xq5mW7AvqVXQsCEudn0DXWyip0lBDebyeJhuegzB86g','2021-10-19 10:42:52.822367'),('ankxjjevt25x9bi1e40m0ax11m2nan98','.eJxVy00KwjAQQOG7ZC0lP5NMdCl4jjAzHUlRK5hmJd7dFrrQ7ft4b1OoL7X0pq8yjeZkUjCH38gkN503IZFnn5dhL224PGi6n3f_myq1uh4Ygb04iw4QKSU_BmHINqOwak6BPLkrsFUUm9VJOIqPqFE9M4Azny8PzDM7:1n9mlQ:nOWvRA58gcTMvT6WFxdrw6YWfVK2gqKL-PwAeHIZT4g','2022-02-01 17:05:00.639801'),('apjyir4aqxil87y8pf14ijbe5f3ntopk','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1n6m2O:UuGfwko1WcxHlxjKEyQYeUWRs8EQ-sM725S2pzgSKYU','2022-01-24 09:42:04.128711'),('arbk3g4vf2ew9mhnjtyaqpuy9dass25j','e30:1nHIhL:guXXgD_NWG_vT3TRSDOJ9oMn13X5KDcnPW07lC0aByQ','2022-02-22 10:35:51.601382'),('awzi3l10oah5ghh3kboe1aobpfg1drav','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1n2nU7:toQ5xvvhFQbPb22r6KdwRp3r-usoac6OVZoTqr3SHC8','2022-01-13 10:26:15.715852'),('bjdtlf9b9v0ln4h0h8kor5po7zesj1bf','.eJxVy0EKwjAQQNG7ZC0lzkwmiUuh5wjTSUKKWsG0K_HuKnSh2__4T5NkW1vaenmkOZuTYTSH3ziJXsryFVG9b8s67KUP403m63n3v6lJb5_jSCyWgVTBBbXkCmWe1LO3EAtHcmwJg3cAgYLHailHzBWRq4ei5vUG68IyDg:1nt0C6:YiNNAB2EAje_wvndVYVAt4-5SgCfb2-TVv1gYMBHD2k','2022-06-06 10:31:26.722832'),('bkyw0d5r5h85a5da7exodfhsj48qfusc','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1nMQPa:3FB5G4IHHuDjj3eUxaa1VxhW5rBsXvRFBbTOSJfQRZs','2022-03-08 13:50:42.717417'),('bma7wovwjv2qxhbyd2ezbgctp3wgb2yd','.eJxVy00KwjAQQOG7ZC0lk59J4lLoOcLMJJKiVjDNSry7Cl3o9n28p8o0tpZHr4-8FHVUCOrwG5nkUtevkMh9rNu0lz7NN1qup93_pka9fQ6HhjkZR1F7qCHaYAuC1gWZraAk8qGK5eoJIVKxYCKxJMfnIj6Aer0BE3gzmw:1n68db:e1k8kPg1okPV0Q15L6mhA89-Hz0x6g--kh1gnNQkFXQ','2022-01-22 15:37:51.206218'),('bqiyjqnh9a2rwk9vxc3nh8nx3k1czuwf','.eJxVy8EKwjAMgOF36VlGapN09SjsOUqWZnSoE-x2Et9dhR30-n_8T5dlW2vemj3yXNzJEbvDbxxFL7Z8RVTv27J2e2ndcJP5et79b6rS6udIxNiDD1MUHyCQKE7Mhkw9IHpNBDgmCN6CFW9cIh3VQC1aikjiXm_uvTKP:1n0UDs:m124g8oaSneU0uo0bbe1rJ3bPWY52xIJcjfe_XZTBTc','2022-01-07 01:27:56.404739'),('brp86nhe152wzn51xdlzl63upn41xbr3','.eJxVjMsKwjAQAP8lZynJ5rEbj4LfEbbZhBS1gmlO4r-L0oNeZ5h5qsRja2n08kiLqKMKpA6_cOZ8KevHcM73sW7TTvp0vvFyPe3-L2rc2_flEZgDRhRCsd46Qec1meijBwESAIdaV-vIWKSK0VYKM5SSjQ3q9Qbi6zHJ:1nRuGm:d0MN7QAsIB0mfGNMLYgpgB-eaNzz8QbsCq6jbn15ZGU','2022-03-23 16:44:16.843889'),('c0u7xuq4t09yzh23jcox0yatwkhot8ys','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nNCm8:r6Z3OeWpXfvnYEiVmBpnVenfMSwLdYtc3k5OqV2G0Iw','2022-03-10 17:29:12.975937'),('cdfdex7yesqjiqhyl6nh36gbq4ju2o6o','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1mrvRi:M3q7QiGW99rYS19FXvAnVYmlzYk4ElgAcSZ9QAznYk4','2021-12-14 10:42:50.917148'),('ci49rmvtxat6v3fd392n6y24r45ikksv','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1nD0z9:m_e0vaX3BwwFN3OJrp4aVvRYgBu-_eKLGi7CU8umg5g','2022-02-10 14:52:31.146386'),('cxd4dsthkvhqjig41znrdxmoj7btqgpu','.eJxVy0EKwjAQQNG7ZC0lzkwmiUuh5wjTSUKKWsG0K_HuKnSh2__4T5NkW1vaenmkOZuTYTSH3ziJXsryFVG9b8s67KUP403m63n3v6lJb5_jSCyWgVTBBbXkCmWe1LO3EAtHcmwJg3cAgYLHailHzBWRq4ei5vUG68IyDg:1nszwh:HOkV5xjWHjSzlfvZTA7Q_ZlVUbtmCPWmxgYnQAxGuFk','2022-06-06 10:15:31.416553'),('cz2lfhr1vuf6o3osazm5qwqwpwisj6wl','.eJxVjMsKwjAQAP8lZynJbpLdeBT8jrDNgxS1gmlO4r9LoQe9zjDzVlHG1uLo5RWXrM7Kozr9wlnSray7kZSeY92mg_Tp-pDlfjn8X9Skt_3FjkDEU6DMlNGhzWSdZhNccJCBM4AlrStaNkhcKWBlP0MpyaBXny_gKjHE:1nJwK6:MzvGX6j8twXlqXPnx5Nnlt-0b32K9ssf8wZVhk32WLo','2022-03-01 17:18:46.829825'),('djtgwzxt6zxk0f30byngm29798klrl96','.eJxVjMsKwjAQAP8lZynJ5rEbj4LfEbbZhBS1gmlO4r-L0oNeZ5h5qsRja2n08kiLqKMKpA6_cOZ8KevHcM73sW7TTvp0vvFyPe3-L2rc2_flEZgDRhRCsd46Qec1meijBwESAIdaV-vIWKSK0VYKM5SSjQ3q9Qbi6zHJ:1nWtiB:8xxFcYTL85nDDBM8k_pOmcRY-TXj1eMWPIsk-jU-8s4','2022-04-06 11:09:11.234185'),('do3mc6attc80vl88nkus2auqbzbhh481','.eJxVy0sKwjAURuG9ZCwljyYkDgXXEf7ce0OKWsE0I3HvKnSg0_NxnipjbC2PLo-8sDoqp9XhNxbQRdavgOg-1m3aS5_ONyzX0-5_U0NvnyPE6AWi2XtLNlZjjCUgJMClqosT1onmoilIZXGOLKIhngEOQbN6vQE1eDR6:1mXQxB:U1tq0KQnTR_TfpusxZadVJ1ealVzkAqXYKag5MqWmjg','2021-10-18 22:06:37.245298'),('dog63tjxgyojdqj00hlorxm1fm4ntwkt','.eJxVy0sKwjAUQNG9ZCwln6ZJHAquI7y8DylqBdOMpHuvQgc6vYf7Vhn6WnNv_MozqbNykzr9xgJ44-UrgPjsyzocpQ3XB8z3y-F_U4VWP4cdE1DUYoNGtNZHX8gUDlGzHw0ZcR4EnY1pcoF1YTCJANgEkEgiatsBIzQ0Ng:1mXyxd:DaHEMnjhsCqXYprwPdWAYzXsqlxIOX9Og-mpXVK5bjQ','2021-10-20 10:25:21.317612'),('dqq73rq8hh80yvmr46puqgd88gm6uv6n','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nMmfU:jA0WlsM3E50Jlbqa2FNOIcYyRNdWFyhBAKTHITIsM8c','2022-03-09 13:36:36.720187'),('dzhdbgj0iug9teha1tt7n6fpoxnnn4or','.eJxVy8EKwjAMgOF36VlGWZN08Sj4HCVNMzrUCXY9ie-uwg56_T_-p0vSt5p6s0daijs6Anf4jVn0YutXRPXe123YSxvON1mup93_piqtfg4PMmkxGYXiSBIxzAUKIGdgC4AxZAVDyeKZp4yeSGeAyOCRjcy93iuhM18:1nA3lq:YZ_8pEatHUtTXYAXCrRrrHpODUrLwqwzMqp2gmkqVXY','2022-02-02 11:14:34.889342'),('e0gah62g0h902xzfo0i4282hvxvnhaqw','.eJxVy00KAjEMQOG7dC1D-jNpcCl4jpI2KR3UEex0Jd5dhVno9n28p0k8tpZG10daxByNt-bwGzOXi65f4VLuY92mvfTpfOPletr9b2rc2-cQL5acQ8mKwQdFV7EKxZlnrCTOgUMAGzVEJiDwGqAwBkEtlNWa1xsQVzMS:1mYnDH:-pWueQs4NGpCRnFhn73ErQck8dAZ-P2V2t4tHzMThrc','2021-10-22 16:04:51.847389'),('e5yj1f7gf4cudfwgf8iofrbx1k040y96','e30:1nM2OJ:o8mdca4j_U2FYiRoDVUCzi3WK1P3TKqRAqr6jiaVT-A','2022-03-07 12:11:47.757575'),('flub55459ovnutyuhpi5qm3xd6pk4nh6','.eJxVy0EKwjAQRuG7ZC0laZuZxKXQc4TJ74QUtYJpV-LdVehCt-_jPU2Sba1pa_pI89kczUjm8Buz4KLLVwS4b8va7aV1003m62n3v6lKq58jRBDZGD2AXpynUViiZucHKdpDNYtlhgPnYNmhhBypEFtCUDeY1xszWzPo:1n5hzJ:84JaZ8-cE3gfLBdHiUr_F8giQGTea6ExHV6O00fu2fQ','2022-01-21 11:10:29.489680'),('formpucyaxkq6ygz0gg6umq4040990r4','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nNB5X:JDhW0T6N8nILv_4kEAiaD3EBC2OcdgPl97LFAxqL_Eg','2022-03-10 15:41:07.765138'),('g6q6ghc5p12eoytaw1s5y86k9dlgg2y5','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1nNWD7:UWxADAQc8iKU0TN-20qiVEdloURU1IDINTy5mdQvA_Y','2022-03-11 14:14:21.341285'),('g8lu46fhqun9dpnfzeaubfqcsidutmfa','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nNCdg:d_ouLR4WQnURSXlYnNcHoa50eJPGLQv3VpnEegJWkGY','2022-03-10 17:20:28.756035'),('guo7mshns9vmmrbykuzafuvew7o7ja52','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1mq9xT:Wm-GoK5MtgNXoD8SOcxRc0MM2Hkn6VnSIH6nJZpqIGA','2021-12-09 13:48:19.781917'),('h9n021gx71y4m8ggmyv2sd1sg5zdfhl0','.eJxVy00KwjAQQOG7ZC1lOvl3KXiOMJlMSFErmGYl3l2FLnT7Pt5TJRpbS6PLIy1FHZX36vAbM_FF1q8Q832s27SXPp1vtFxPu_9NjXr7HMJaPFlXQmQxtRgU42JBE9kLhoAz-FJnqJq0xEyWEDFr0BDBZbbq9QY4fjN8:1nNZil:OKuAS9xPH7G2hBaTyFTNzjiy3vlTAUQ-gofg1OUs9uA','2022-03-11 17:59:15.721879'),('i3za7oxv40tsf84ncayjyj26ovrff9kl','.eJxVy0EKwjAQQNG7ZC0lmSaTxKXQc4TJzEiKWsG0K_HuKnSh2__4T1NoW1vZuj7KLOZoMJnDb6zEF12-Qsz3bVmHvfRhutF8Pe3-NzXq7XNUxpiAAUU0hQSRxNvqgrUaRXLOZ6dQfQAdo9jq0QkGGH0OlMAxmtcbI_cy9A:1o4J8e:_wv_rE9djZZC2SREnpuqKKd5aKjL5Hg5AvCAkZhmHHU','2022-07-07 14:58:36.548264'),('iiocdm9p89eukmxemq7wly5c6rbna6ny','.eJxVy00KwjAQQOG7ZC1lOvl3KXiOMJlMSFErmGYl3l2FLnT7Pt5TJRpbS6PLIy1FHZX36vAbM_FF1q8Q832s27SXPp1vtFxPu_9NjXr7HMJaPFlXQmQxtRgU42JBE9kLhoAz-FJnqJq0xEyWEDFr0BDBZbbq9QY4fjN8:1nNncd:Lg6dOU3LdJkIWOF05JD-zQE6I67kiVXqgbi_2akUs0E','2022-03-12 08:49:51.179979'),('j7zeoabds8rap1wtrso19z9cebztvg39','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1n2p3v:vtHP50qAIYlssQjTxOieyZ5srKM4vO38WuLVRaGCH0I','2022-01-13 12:07:19.319504'),('jal2ops3x8c4vdxcd458bv74filg6txh','.eJxVy00KwjAQQOG7ZC0lk59J4lLoOcLMJJKiVjDNSry7Cl3o9n28p8o0tpZHr4-8FHVUCOrwG5nkUtevkMh9rNu0lz7NN1qup93_pka9fQ6HhjkZR1F7qCHaYAuC1gWZraAk8qGK5eoJIVKxYCKxJMfnIj6Aer0BE3gzmw:1o3vqI:8LfRfD4rZLcDMmJULWgIigcoimXFSY_00DJ5WWtjCE4','2022-07-06 14:06:06.634888'),('jpcwg5g9j8nhzq04sxhc0gygorftev4r','.eJxVjMsKwjAQAP8lZynJ5rEbj4LfEbbZhBS1gmlO4r-L0oNeZ5h5qsRja2n08kiLqKMKpA6_cOZ8KevHcM73sW7TTvp0vvFyPe3-L2rc2_flEZgDRhRCsd46Qec1meijBwESAIdaV-vIWKSK0VYKM5SSjQ3q9Qbi6zHJ:1nMR8L:pjgQHLqXDj3ddNVH0McrPhx05KPFIMauiBXYBcIddGk','2022-03-08 14:36:57.462412'),('jvyi9hue2ejrv7cmf2qvnplcyxhq7l65','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nOt84:srPCOdnjmCT_FN6uzj_6lOVCbldZrdEbwufp3QGd6Yo','2022-03-15 08:54:48.581908'),('k885mswxxnjdn4r6f17nqa7y2074ydzn','.eJxVy0EKwjAQRuG7ZC0laZuZxKXQc4TJ74QUtYJpV-LdVehCt-_jPU2Sba1pa_pI89kczUjm8Buz4KLLVwS4b8va7aV1003m62n3v6lKq58jRBDZGD2AXpynUViiZucHKdpDNYtlhgPnYNmhhBypEFtCUDeY1xszWzPo:1n9jrv:qs1V98WVkuhIQ9WBXfVJmSC3nkyRFzbcp5M7rpAVqaU','2022-02-01 13:59:31.766920'),('kbld4sa42phduomuteyjimo723woe65c','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nNTDM:py8to9Yu1YsSr23u2XZKLNljRXlUGNJie85OM9V5ytk','2022-03-11 11:02:24.720746'),('kl86mcd8nikpuxnh4l2rqxek1a2a9uzu','.eJxVy0EKwjAQQNG7ZC0lmSaTxKXQc4TJzEiKWsG0K_HuKnSh2__4T1NoW1vZuj7KLOZoMJnDb6zEF12-Qsz3bVmHvfRhutF8Pe3-NzXq7XNUxpiAAUU0hQSRxNvqgrUaRXLOZ6dQfQAdo9jq0QkGGH0OlMAxmtcbI_cy9A:1ny9iK:dacFp3ttgxS843oYMS4m4aPw4OoH9RAAQwQjDboh81M','2022-06-20 15:42:00.197404'),('kljpakk2h78jlmk14vmtdlbte4uwo35x','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1mx6X0:0rdobPtJaTHyk3xdcJtu4bRx7KAnplyYNROIPSmz8ec','2021-12-28 17:33:42.089749'),('kritfkgf9bahn7jqnuhfeqer5apss2x0','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1nKDK9:ZEzUSGQxH2ELYJdqPMk8vuTTXj_CSpmjpsg5_NTDr8I','2022-03-02 11:27:57.105434'),('kzd43j42cxzg0z4t3qxgbuediufkopae','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1n4fHT:XO0JvCoAhDjnmf9G1Bi2H9uO_kD8O62iefYAfoyYwjA','2022-01-18 14:04:55.398011'),('lg88ptl6ehpuovlahj0ryb98jtl5nq00','.eJxVy0EKwjAQRuG7ZC1lGjOTxqXgOcKfdEKKWsG0K_HuVuhCt9_jvUzEutS4Nn3GaTQnI2IOv5iQrzp_C3J-rPPS7dK6yx3T7bz3v6mi1e1gr4MeU0nMnKxQSLaQMJyAAbWD1V6pWARsKtoXH7zkkbxDIHLm_QEutjN5:1nFBN2:aDokIJ5eqjl2149b-HJVvonl0bQPYv2hxFO-7CZEbe0','2022-02-16 14:22:08.484142'),('lni9loxm26wasi6vo5gvfr684s9sfr0r','.eJxVjM0KwjAQBt8lZymJ_cnGo9DnCLv7JaSoFUxzEt9dCj3odYaZt4ncthJbTa-4wFzMaE6_TFhvad0Fqz7bunUHqd384OV-PfxfVLiWfaVgmWSinAPUpR5OAywDlKgfhfvBelI_WAgCwC7YzGclx55IxHy-QRc0xg:1mbJmS:2ouvSxsOPm5zdSH2s9Th96iHuEDS61L-_NSvpDVf02w','2021-10-29 15:15:36.295726'),('mas5l2eo9l8ublyc59l3ily0tqwmzvfx','.eJxVy8EKAiEQgOF38RyLOuOsdgx6DhlHxaXaINdT9O4V7KGu_8f_VJHH1uLo5RGXrI4KnDr8xsRyKetXWOQ-1m3aS5_ON16up93_psa9fQ4DmBOANp481RoAJM2kHVijMRi0ySNSoJRJ12yBtTgXasiC1nKZ1esN6kkyVw:1mXwiz:LONWh40Aypinb-Gmtm_62HUlBbhI-KADSY67HOgDR0k','2021-10-20 08:02:05.318563'),('miyewyf8fql8c2xrambzshooxhmdowp2','.eJxVy00KAjEMQOG7dC1D-jNpcCl4jpI2KR3UEex0Jd5dhVno9n28p0k8tpZG10daxByNt-bwGzOXi65f4VLuY92mvfTpfOPletr9b2rc2-cQL5acQ8mKwQdFV7EKxZlnrCTOgUMAGzVEJiDwGqAwBkEtlNWa1xsQVzMS:1mY1m9:SE4N6Xm3PVtFwhDzx3zQrEoZMeaUiwMqtBHdRQPyWYA','2021-10-20 13:25:41.469692'),('mkf61qnr569xdiwbr66j0fcb2nd87irk','.eJxVjMsKwjAQAP8lZynJ5rEbj4LfEbbZhBS1gmlO4r-L0oNeZ5h5qsRja2n08kiLqKMKpA6_cOZ8KevHcM73sW7TTvp0vvFyPe3-L2rc2_flEZgDRhRCsd46Qec1meijBwESAIdaV-vIWKSK0VYKM5SSjQ3q9Qbi6zHJ:1n9OQO:w7mry-lpECHEkaUB8RyIk5ONL_zWTNLyulNX7rZS7ow','2022-01-31 15:05:40.115063'),('modyjkhr3vgugt4ti0wsazwjqd5tcwdh','.eJxVy0EKwjAQRuG7ZC0l05pM4lLwHGHyOyFFrWCalXh3FbrQ7ft4T5OkrzX1po80n83BkNn9tiy46PIFAe59WYettOF0k_l63PxvqtLq5wgR3tsYHYBRyPm9sETN5CYpOkI1i2UGgXOwTCghR188W4-gNJnXGw1LM68:1mbg1j:sy3ereWTFlQL4lIqmKsb749BbhIWF4K_j6J9b1tj7aM','2021-10-30 15:00:51.155599'),('moplzqg517q7xom7ee3wzx2lbtwcv4s7','eyJfcGFzc3dvcmRfcmVzZXRfdG9rZW4iOiJhengwMDktNzFmM2ViZWVkOTliODdmNGFlYTU5NWJkNjQwMDhkOWMifQ:1nD0zv:lnm_feqb5dsbta4BW2pkEqwGioxYrK4rbPdhIt1HVis','2022-02-10 14:53:19.369717'),('muyftadqlnfz6n7mtwgmgl3qwvbdujix','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nMnnK:y1iAk4e03F5Hky5poHGRuxxclXWDuZKuqcbo4Af5vvs','2022-03-09 14:48:46.128234'),('n5mew98usozugj5wgjf7sre8vgjmy6xr','.eJxVi80KwjAMgN-lZxlp14XUo-BzlCRt6VAn2PUkvrsTdpjX7-dtIve1xt7yK87JnI0jczpCYb3l5WdY9dmXddhJG64Pnu-X3f9NlVvdjiRaIDtLAUr2TgviOBJBSN6L5pCYoYiQFQUQRT9ZDIqEWwhsi_l8AUI7NAc:1n5KJ0:T2YS7b6b5n4KVTJeX8H6VDKzvVF5fr0RkyJOl0GaQjY','2022-01-20 09:53:14.921236'),('n7iyo9ov4td1hyv18ct4ldhsan9n504b','.eJxVy00KAjEMQOG7dC1D-jNpcCl4jpI2KR3UEex0Jd5dhVno9n28p0k8tpZG10daxByNt-bwGzOXi65f4VLuY92mvfTpfOPletr9b2rc2-cQL5acQ8mKwQdFV7EKxZlnrCTOgUMAGzVEJiDwGqAwBkEtlNWa1xsQVzMS:1mbhYU:8LiwGr1i7IC9WJo4WAGHze2X7z5Lf6Gfjld5S0Zqc9U','2021-10-30 16:38:46.546902'),('nu7aaw2zzgsdqgxy0dptakn4h4nr2rrn','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1n3AfE:OHc3tKbGXE6taVa8pLTEriGv24BDG39OC8cQLXsT1Wc','2022-01-14 11:11:16.701368'),('of1cr87z7gs2x8i50w8121emd5h7rdl4','.eJxVy00KwjAQQOG7ZC0lk59J4lLoOcLMJJKiVjDNSry7Cl3o9n28p8o0tpZHr4-8FHVUCOrwG5nkUtevkMh9rNu0lz7NN1qup93_pka9fQ6HhjkZR1F7qCHaYAuC1gWZraAk8qGK5eoJIVKxYCKxJMfnIj6Aer0BE3gzmw:1nXw1W:GQYDZgXktPZDJRvqQHGRbw52i1n_aDmgd1PE6x0SeiY','2022-04-09 07:49:26.170949'),('oi9au45l1yfe893gs1amhqoc29shq0pn','.eJxVy0EKwjAQRuG7ZC0laZuZxKXQc4TJ74QUtYJpV-LdVehCt-_jPU2Sba1pa_pI89kczUjm8Buz4KLLVwS4b8va7aV1003m62n3v6lKq58jRBDZGD2AXpynUViiZucHKdpDNYtlhgPnYNmhhBypEFtCUDeY1xszWzPo:1n9qRj:IE1tGuVD1eKghGi8ErVyfNomPhAChTqwykBJ-d7qMxk','2022-02-01 21:00:55.009177'),('onacl3hbls2x54pafn7ubh8jku13ktqy','.eJxVjMsKwjAQAP8lZynJ5rEbj4LfEbbZhBS1gmlO4r-L0oNeZ5h5qsRja2n08kiLqKMKpA6_cOZ8KevHcM73sW7TTvp0vvFyPe3-L2rc2_flEZgDRhRCsd46Qec1meijBwESAIdaV-vIWKSK0VYKM5SSjQ3q9Qbi6zHJ:1nSC0K:KdCZVEy7M-ntVDYh5MVClhbHVfSySUnq7uVeNM09YyY','2022-03-24 11:40:28.494832'),('oysjnqdzg1dwgjzv7hxmlzpbcisemxhw','.eJxVy00KwjAQQOG7ZC1lOvl3KXiOMJlMSFErmGYl3l2FLnT7Pt5TJRpbS6PLIy1FHZX36vAbM_FF1q8Q832s27SXPp1vtFxPu_9NjXr7HMJaPFlXQmQxtRgU42JBE9kLhoAz-FJnqJq0xEyWEDFr0BDBZbbq9QY4fjN8:1nNr1j:AsCM0O2AaOWaSlkBHICq1H-aEn6Q6rsIAo6Rf9DJuEw','2022-03-12 12:27:59.419566'),('p49vcepgon8s3ieq7rspsgp1rc3j56o1','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1n67YX:lYhCnDIxPzkA5LHmoIe7p6Dtl2ZpNGMGEAA7NVHyu_k','2022-01-22 14:28:33.226577'),('pal69vos249dxvvot2jt1pyu7mm3ynpd','.eJxVy0EKwjAQRuG7ZC0l05pM4lLwHGHyOyFFrWCalXh3FbrQ7ft4T5OkrzX1po80n83BkNn9tiy46PIFAe59WYettOF0k_l63PxvqtLq5wgR3tsYHYBRyPm9sETN5CYpOkI1i2UGgXOwTCghR188W4-gNJnXGw1LM68:1maVEI:KksOxlYNHtp6PxhqNwZdy1J-ffh-kbie1DFx5OX9v-o','2021-10-27 09:16:58.856403'),('pcox5xsxvjketgmseyv7it7quezr52w2','.eJxVy00KAjEMQOG7dC1D-jNpcCl4jpI2KR3UEex0Jd5dhVno9n28p0k8tpZG10daxByNt-bwGzOXi65f4VLuY92mvfTpfOPletr9b2rc2-cQL5acQ8mKwQdFV7EKxZlnrCTOgUMAGzVEJiDwGqAwBkEtlNWa1xsQVzMS:1mXbix:cj3PY8sMES1Y8iqXQUHdO61MIVfLZ_4qIFCRYrpYDN0','2021-10-19 09:36:39.991208'),('pdu63mm8ioyuov9dcrj2xa7tnda2jq3n','.eJxVjEEKwyAQAP_iuYQYddUeC32HrLsrhrYp1Hgq_XsJ5JBcZ5j5qoR9rak3-aSZ1VU5qy5HmJEesmwGid59WYedtOH-wvl52_0pqtjq9vJMOkIxHKIWdMxQEKK14AOMoUj2fsQ8gQVng0Q2WnOYjJBQZtHq9wclYjPI:1mzZ4G:bR1A2WfyI3Ev_o58vCmcqjYXYpHwN6d52QNIY4VJKv8','2022-01-04 12:26:12.377620'),('pijw39h4oenb6rmqg9wutwcwba9ugww6','.eJxVy0EKwjAQRuG7ZC0l05pM4lLwHGHyOyFFrWCalXh3FbrQ7ft4T5OkrzX1po80n83BkNn9tiy46PIFAe59WYettOF0k_l63PxvqtLq5wgR3tsYHYBRyPm9sETN5CYpOkI1i2UGgXOwTCghR188W4-gNJnXGw1LM68:1mXNwo:EHOW7oX7V3-CipT1OqVrnDQmhe60BDnGKCoLINALYtQ','2021-10-18 18:54:02.947962'),('po6apwms3dh16v5ra9hc443z13fphsm6','.eJxVi0kKwjAUhu-StZRMzeBS8Bzh_a8JKWoF06zEu9tCF7r9hrdI1NeaesuvNE_iLJwRp18I4ltedkPMz76sw0HacH3QfL8c_m-q1Op2sMSolQS8LBwyqwzChGKtt8E7U7TSxng4p6KWFgxJoTBi3GJQFJ8vOeM0KQ:1nAQKW:16PH3tMWWvPrlxqsWMMfS1kuIC5Jq2BHkluQ6Wl6GKU','2022-02-03 11:19:52.096604'),('pp75h1i08o8mj091wg0wzcv3zro0uw3v','.eJxVy00KwjAQQOG7ZC0lk59J4lLoOcLMJJKiVjDNSry7Cl3o9n28p8o0tpZHr4-8FHVUCOrwG5nkUtevkMh9rNu0lz7NN1qup93_pka9fQ6HhjkZR1F7qCHaYAuC1gWZraAk8qGK5eoJIVKxYCKxJMfnIj6Aer0BE3gzmw:1n5qTK:_Sy9sHnPezCBuz6kY5Sey8F0y30ZhZSpnSUqtw5YWO4','2022-01-21 20:14:02.364542'),('ppn83vggp88s2wz9rgxhs7t8g3qgs6jk','.eJxVy8EKAiEQgOF38RyLOuOsdgx6DhlHxaXaINdT9O4V7KGu_8f_VJHH1uLo5RGXrI4KnDr8xsRyKetXWOQ-1m3aS5_ON16up93_psa9fQ4DmBOANp481RoAJM2kHVijMRi0ySNSoJRJ12yBtTgXasiC1nKZ1esN6kkyVw:1mY9EV:5jD90pVOgRUaGgu133QGcRhKoAUfoMCDP0Y8hCk2me4','2021-10-20 21:23:27.200799'),('pvq9xzefki64zwbr21yp4lhu0ypq36ag','.eJxVi0EKwjAQAP-Ss5Rmm2xTj0LfEXazWVLUCqY5iX-3Qg96G2aYl4nUthJbzc-4iDkbb06_jild8_oNlNKjrVt3mNrNd1pul6P_TYVq2Q8OCAqkDKJqnbI6GwgBg07kNAgS0-RtD5pHhjxg75MddsqoIqN5fwArYDRp:1mx6XV:Yb5gXdOy03RPFoYJqILt17IBFOcjrXrM7ZEdVkopB4Y','2021-12-28 17:34:13.480516'),('pz7n16h909dsgefj6zopztkoqijonj16','.eJxVjM0KwjAQBt8lZymJ_cnGo9DnCLv7JaSoFUxzEt9dCj3odYaZt4ncthJbTa-4wFzMaE6_TFhvad0Fqz7bunUHqd384OV-PfxfVLiWfaVgmWSinAPUpR5OAywDlKgfhfvBelI_WAgCwC7YzGclx55IxHy-QRc0xg:1mgmdX:oB9nGOCXsLyXtA1VERZEpHuIjUh5HjDKC6OsxJXY800','2021-11-13 17:04:59.168463'),('qb8ca3sm578v9x3j3kt5owcgqe81xddq','.eJxVy00KAjEMQOG7dC1D-jNpcCl4jpI2KR3UEex0Jd5dhVno9n28p0k8tpZG10daxByNt-bwGzOXi65f4VLuY92mvfTpfOPletr9b2rc2-cQL5acQ8mKwQdFV7EKxZlnrCTOgUMAGzVEJiDwGqAwBkEtlNWa1xsQVzMS:1mfnyN:c-OG2Mx2CIXDqRgwdUhJwU2FkwXuBNW2PDpUYxliXew','2021-11-11 00:18:27.105576'),('qmblcdrdktk6al5i0o3bmalv4ryx4p0m','.eJxVi8sKwjAQAP8lZym7eTSNR6HfETa7CSlqBdOcxH-3Qg96nBnmpSL1rcbe8jMuos5q1Or0KxPxNa_fQsyPvm7DYdow32m5XY7-N1VqdT9s4bGg1Tpp6z2UtANgclSCE1cIAuKEWUAHkwwZzt4aMTJJZg-C6v0BHvQzkw:1nA3mI:K3ZFby36tkgxU4pJCSGeQbNbuhpguxvQLRnzwSPiUZ0','2022-02-02 11:15:02.145141'),('r6lwtrwsvd8owmtkcgt798j315gocen8','.eJxVy0EKwjAQRuG7ZC0l05pM4lLwHGHyOyFFrWCalXh3FbrQ7ft4T5OkrzX1po80n83BkNn9tiy46PIFAe59WYettOF0k_l63PxvqtLq5wgR3tsYHYBRyPm9sETN5CYpOkI1i2UGgXOwTCghR188W4-gNJnXGw1LM68:1mXPxk:KnASP_4Zp007J1UejIHsQbqdbIDoaGBKCRyHDymjAnw','2021-10-18 21:03:08.318170'),('r6zoxkpy6k7n5jqu466gs3b7kdob75ww','.eJxVy0EKwjAQRuG7ZC0laZuZxKXQc4TJ74QUtYJpV-LdVehCt-_jPU2Sba1pa_pI89kczUjm8Buz4KLLVwS4b8va7aV1003m62n3v6lKq58jRBDZGD2AXpynUViiZucHKdpDNYtlhgPnYNmhhBypEFtCUDeY1xszWzPo:1n5h8Y:mALrFi9ejrzdLIDq64d20kZNyyIc9KbPr4al-Ml4OXE','2022-01-21 10:15:58.426977'),('rcgwif7bgezpg9r6lu5i90p0ss0mqhs5','.eJxVy0EKwjAQQNG7ZC0lmSaTxKXQc4TJzEiKWsG0K_HuKnSh2__4T1NoW1vZuj7KLOZoMJnDb6zEF12-Qsz3bVmHvfRhutF8Pe3-NzXq7XNUxpiAAUU0hQSRxNvqgrUaRXLOZ6dQfQAdo9jq0QkGGH0OlMAxmtcbI_cy9A:1ny9jL:Iba0_FaV8TOjAAWkWeDpNn0mcaGoWbnVUAH71Lfl_mg','2022-06-20 15:43:03.804538'),('rdpexa2fms43dxj2x8b2cn5b25q9shyj','.eJxVjMsKwjAQAP8lZynJ5rEbj4LfEbbZhBS1gmlO4r-L0oNeZ5h5qsRja2n08kiLqKMKpA6_cOZ8KevHcM73sW7TTvp0vvFyPe3-L2rc2_flEZgDRhRCsd46Qec1meijBwESAIdaV-vIWKSK0VYKM5SSjQ3q9Qbi6zHJ:1n67u7:--ngP5WHSH-iycaMaboHf4TMn93wkbu81cFeSWRIu2g','2022-01-22 14:50:51.111035'),('rdtdushglsy1ymzdq4p6i2dudi0i7gra','.eJxVi0EKwjAQAP-Ss5Rmm2xTj0LfEXazWVLUCqY5iX-3Qg96G2aYl4nUthJbzc-4iDkbb06_jild8_oNlNKjrVt3mNrNd1pul6P_TYVq2Q8OCAqkDKJqnbI6GwgBg07kNAgS0-RtD5pHhjxg75MddsqoIqN5fwArYDRp:1n1ivJ:j5hnXf2YAQUjCQqagjOI7jqEGWWwf62CiVPhRJmjvWI','2022-01-10 11:21:53.404513'),('rekdbqdnc7y6xqxiy2346232b1a0mwb5','.eJxVy0EKwjAQRuG7ZC0l05pM4lLwHGHyOyFFrWCalXh3FbrQ7ft4T5OkrzX1po80n83BkNn9tiy46PIFAe59WYettOF0k_l63PxvqtLq5wgR3tsYHYBRyPm9sETN5CYpOkI1i2UGgXOwTCghR188W4-gNJnXGw1LM68:1mXQ9H:uyX8Vq6fwD6qs_byeB2fq5j9LBCfulJboeHicJu3PEY','2021-10-18 21:15:03.242512'),('rvvs051wmjcg6o6ekanjqbkqm5g85le0','.eJxVi80KwjAMgN-lZxlp14XUo-BzlCRt6VAn2PUkvrsTdpjX7-dtIve1xt7yK87JnI0jczpCYb3l5WdY9dmXddhJG64Pnu-X3f9NlVvdjiRaIDtLAUr2TgviOBJBSN6L5pCYoYiQFQUQRT9ZDIqEWwhsi_l8AUI7NAc:1n4y9s:zg7iVCDV3GQ94KxU1-XL5Fho70pi_QKoJ2aezWpVeos','2022-01-19 10:14:20.335951'),('rxxsam65tatja7l4zpr026rt2b0g9bta','.eJxVy0EKwjAQRuG7ZC0l05pM4lLwHGHyOyFFrWCalXh3FbrQ7ft4T5OkrzX1po80n83BkNn9tiy46PIFAe59WYettOF0k_l63PxvqtLq5wgR3tsYHYBRyPm9sETN5CYpOkI1i2UGgXOwTCghR188W4-gNJnXGw1LM68:1mbM9l:XPct0qisrUEUhLWx1XraHYy3s9iASxmOBacRvw0S6Pk','2021-10-29 17:47:49.301272'),('ry6ml2sdz51jjo3234me16bkfofx8qlj','.eJxVy0EKwjAQRuG7ZC0l05pM4lLwHGHyOyFFrWCalXh3FbrQ7ft4T5OkrzX1po80n83BkNn9tiy46PIFAe59WYettOF0k_l63PxvqtLq5wgR3tsYHYBRyPm9sETN5CYpOkI1i2UGgXOwTCghR188W4-gNJnXGw1LM68:1mbKQH:GHxxeSKYpBV5rOj1ajr70Q8HUmucTZjynPjYxiVXZVU','2021-10-29 15:56:45.400861'),('s9cnrde7ys8xhi8msc44z28tgv3yd7vr','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1mad99:VAql0JnhvXlvQSWiCxg6bf6ROEKAM_cF79pk7JimMb0','2021-10-27 17:44:11.261360'),('sjaszvwxdhqngc485rh5o693acfynazz','.eJxVjEEKwyAQAP_iuYQYddUeC32HrLsrhrYp1Hgq_XsJ5JBcZ5j5qoR9rak3-aSZ1VU5qy5HmJEesmwGid59WYedtOH-wvl52_0pqtjq9vJMOkIxHKIWdMxQEKK14AOMoUj2fsQ8gQVng0Q2WnOYjJBQZtHq9wclYjPI:1myquU:sJXrnVQX093y63hnV1uvGa1EaNnlcxutbqACEFejtJU','2022-01-02 13:17:10.152837'),('t0ditj15wid9ntt018mvgy729ycip1ku','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1nGwlt:uPPtL_J1dD5tR-GN1FJlD2HpLpBAgVeyh8Qr7JkayAs','2022-02-21 11:11:05.939934'),('t4domj5rf8z6y4u9wh8wtgyoeqo5hswn','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1nA2j9:NmuwV7tWLu6FHLdKgOoVh_pFyM7w39htDLpMQc-Z0qk','2022-02-02 10:07:43.361707'),('tgn7mlskzcc1nl1gb2k6hnzw9fytx294','.eJxVy8EKwjAMgOF36VlGWZN08Sj4HCVNMzrUCXY9ie-uwg56_T_-p0vSt5p6s0daijs6Anf4jVn0YutXRPXe123YSxvON1mup93_piqtfg4PMmkxGYXiSBIxzAUKIGdgC4AxZAVDyeKZp4yeSGeAyOCRjcy93iuhM18:1n66T3:EpmuLV4BGnMEtQrH62rLQXLR_1EZTlj20bLKcoVXyb0','2022-01-22 13:18:49.739519'),('tp5ndjueb8yytmdngyfay461yvri7afn','.eJxVi0EKwjAQRe-StZR0konGpdBzhMlMQopawTQr8e5NoQuFv_nv8T4qUFtLaDW9wyzqqhDV6RdG4ntadkPMr7asw0HqMD1pftwO_xcVqqUXYG124GW8oEbynGXsAy3s8BwpGW9S_8gZjY0GQZNH0cmRjuIA1HcDH2IzZg:1mzy5m:tf2kyG73jo9EebjRR_DKgCcPtjEiDt_30MuW5v8XUAE','2022-01-05 15:09:26.530430'),('u51v0y9wyf6hxsy1iar0m3ercvbqziza','.eJxVi0EKwjAQAP-Ss5Rmm2xTj0LfEXazWVLUCqY5iX-3Qg96G2aYl4nUthJbzc-4iDkbb06_jild8_oNlNKjrVt3mNrNd1pul6P_TYVq2Q8OCAqkDKJqnbI6GwgBg07kNAgS0-RtD5pHhjxg75MddsqoIqN5fwArYDRp:1n24UR:GTQHwTUAkJkTtmfRkZvT9T08H-AA1B2NyDwFTzY7zsY','2022-01-11 10:23:35.331977'),('uj64yudexsxczktlf0lw6goem4qnm0nz','.eJxVjEGuwjAMBe-SNSCnSZOYJRLniGzHURH_U9S0AoG4O0Viw3bmzXuafKXWbuNU8qRN5zyPZ72YvaHHHQC30VanrFoQOcXqSanHnkvwAKmgmI3JtMxDXppO-VTWMrhfyCTr5ceQyLhc5t2XtN3xn05_h6__iQZqw1oIcN9ZYI5QJalYZeLC1fvoUwyudrZzLnIIFjvwLAyUqjDiOmZC83oDlDZJaQ:1nGvCj:i3TSDuXw2waM4MwVEpksmCGQThMqc_Nu0N4ZcJwIdcU','2022-02-21 09:30:41.041401'),('ujc1fkix95b4teumfq524xcrr211gi9d','.eJxVjMsKwjAQAP8lZynJ5rEbj4LfEbbZhBS1gmlO4r-L0oNeZ5h5qsRja2n08kiLqKMKpA6_cOZ8KevHcM73sW7TTvp0vvFyPe3-L2rc2_flEZgDRhRCsd46Qec1meijBwESAIdaV-vIWKSK0VYKM5SSjQ3q9Qbi6zHJ:1ngQJr:y_54dR9ldL_MBypqroLR9IKw8JWW8eP1ml8sz27yrz0','2022-05-02 17:47:27.398513'),('uo92g67th5sn6lkrz3xe764nr9ujn3c9','.eJxVy0EKwjAQRuG7ZC0laZuZxKXQc4TJ74QUtYJpV-LdVehCt-_jPU2Sba1pa_pI89kczUjm8Buz4KLLVwS4b8va7aV1003m62n3v6lKq58jRBDZGD2AXpynUViiZucHKdpDNYtlhgPnYNmhhBypEFtCUDeY1xszWzPo:1mdtw8:L8IyLqP7_qqSanxBjA4QiQzwn5gbZnmkfYQiEUN-4Hc','2021-11-05 18:16:16.577578'),('up1g5436wbvq3kesvxplopigtm3zkst9','.eJxVy0EKwjAQRuG7ZC0laZuZxKXQc4TJ74QUtYJpV-LdVehCt-_jPU2Sba1pa_pI89kczUjm8Buz4KLLVwS4b8va7aV1003m62n3v6lKq58jRBDZGD2AXpynUViiZucHKdpDNYtlhgPnYNmhhBypEFtCUDeY1xszWzPo:1n9fsX:smVJEXFItM1jY-4OE28jNX9auf_vpMQqL7dWD9QgR4I','2022-02-01 09:43:53.225598'),('v3nlx99s7tj6w9yr1tr7m7tc0p5d0l6f','.eJxVjM0KwjAQBt8lZymJ_cnGo9DnCLv7JaSoFUxzEt9dCj3odYaZt4ncthJbTa-4wFzMaE6_TFhvad0Fqz7bunUHqd384OV-PfxfVLiWfaVgmWSinAPUpR5OAywDlKgfhfvBelI_WAgCwC7YzGclx55IxHy-QRc0xg:1maVFO:lsHGOGasuKZDW0tLKe8KJlLfC7bHlcbIJOYQzjTVUoQ','2021-10-27 09:18:06.124910'),('v3uffptavct31u6s9ick96j0kyjphwbf','.eJxVy00KAjEMQOG7dC1D-jNpcCl4jpI2KR3UEex0Jd5dhVno9n28p0k8tpZG10daxByNt-bwGzOXi65f4VLuY92mvfTpfOPletr9b2rc2-cQL5acQ8mKwQdFV7EKxZlnrCTOgUMAGzVEJiDwGqAwBkEtlNWa1xsQVzMS:1mYMyU:_242O62jUK-BuzT1wpqkpHEwmjlwrdEQ_lhIXsJBp3o','2021-10-21 12:03:50.055115'),('vdgatn1xub6986p2nypykaa0zbp9y4ed','.eJxVi80KwjAMgN-lZxlp14XUo-BzlCRt6VAn2PUkvrsTdpjX7-dtIve1xt7yK87JnI0jczpCYb3l5WdY9dmXddhJG64Pnu-X3f9NlVvdjiRaIDtLAUr2TgviOBJBSN6L5pCYoYiQFQUQRT9ZDIqEWwhsi_l8AUI7NAc:1n4Lgw:eabbnhh3mTezyWa1W1m78kLdsN1uuekGVnsVIYwRCik','2022-01-17 17:09:54.137739'),('vfo981f2a1pdi7u6zx7z0hwsvpkd42rv','.eJxVjM0KwjAQBt8lZymJ_cnGo9DnCLv7JaSoFUxzEt9dCj3odYaZt4ncthJbTa-4wFzMaE6_TFhvad0Fqz7bunUHqd384OV-PfxfVLiWfaVgmWSinAPUpR5OAywDlKgfhfvBelI_WAgCwC7YzGclx55IxHy-QRc0xg:1mbJLY:tIfNxnzWa6pi9HGb0TAT88D42b-TwPgKfMKn8tbokpc','2021-10-29 14:47:48.684882'),('vqcc1rs55bq6ue7lv7ytmmnfyb6xcevy','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nMsb3:KM7hpaOyzbOmEZFc2k4Oc8ttDM7MVS_EyVtZJarYFsQ','2022-03-09 19:56:25.111782'),('w3pt141emviuse0nac914gro7vqpq202','.eJxVy0EKwjAQRuG7ZC0laZuZxKXQc4TJ74QUtYJpV-LdVehCt-_jPU2Sba1pa_pI89kczUjm8Buz4KLLVwS4b8va7aV1003m62n3v6lKq58jRBDZGD2AXpynUViiZucHKdpDNYtlhgPnYNmhhBypEFtCUDeY1xszWzPo:1nKDLU:PUDPqWiA_P7oUA7WUeI6Mp6n_KNoUAybja58mxKZ1IU','2022-03-02 11:29:20.669956'),('w88681l3rmhf4bksxe3pwuiuy7i6hash','.eJxVy00KwjAQQOG7ZC0l_zNxKXiOMDNJSFEr2GYl3l2FLnT7Pt5TZRpbz2OtjzwXdVTOqcNvZJJLXb5CIvexbNNe1ul8o_l62v1v6rT2zxHECIYIycbkDTsMjnXwwTYAYm2lRG5NR2SLFTylClWADEpDXZqo1xsElDOL:1mXdAb:rUVoL9aDvxEmd2jZgD9X7_Qsqre-4iAXWNxUtQnlC7s','2021-10-19 11:09:17.242876'),('w928sbjn1kxej8hkkvbwp3mlmvbz87u9','.eJxVi0sKwjAQhu-StRTznIlLoecIf-KEFLWCaVfi3a3QhW6_x0slrEtLa5dnmi7qpIJVh1-YUa4yfw1KeazzMuykD-Md0-28-7-pobftEGhwFIBFgqWgvWibo6-gcswCm6mY6sm4uAWxBkdMxjryDHaO1fsDQRwzbg:1nHIj7:mmaMgddFexPDuNNoRsHAnFil1kRLrzr6xgoY9wC0yPQ','2022-02-22 10:37:41.315972'),('wcg0m7qwyia469ntwkzz766ee150il7q','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1n78J4:Goy1xeYYlXPe1ShiAVRcB2Ou5bFY9AR0ZGXeqEY9lXM','2022-01-25 09:28:46.219025'),('wztpyv50hfmyf6mewo79cb51y7labxsj','.eJxVy00KwjAQQOG7ZC0lk59J4lLoOcLMJJKiVjDNSry7Cl3o9n28p8o0tpZHr4-8FHVUCOrwG5nkUtevkMh9rNu0lz7NN1qup93_pka9fQ6HhjkZR1F7qCHaYAuC1gWZraAk8qGK5eoJIVKxYCKxJMfnIj6Aer0BE3gzmw:1o2dHg:vVh8GtVlNgC2Ihus8GJLgcIvLAN4_-_zfiSf5ExDn_8','2022-07-03 00:05:00.180482'),('xk6p2kd8ybh9l8zbzyrd92i7wcmgzpv9','.eJxVy00KwjAQQOG7ZC0lk59J4lLoOcLMJJKiVjDNSry7Cl3o9n28p8o0tpZHr4-8FHVUCOrwG5nkUtevkMh9rNu0lz7NN1qup93_pka9fQ6HhjkZR1F7qCHaYAuC1gWZraAk8qGK5eoJIVKxYCKxJMfnIj6Aer0BE3gzmw:1nXFOx:u6po4LGlSTCgk9ClNqAXB7o65eAiZ5VaqAgH67bky_I','2022-04-07 10:18:47.728459'),('xkdd7qzt8zk4kpbzglqnfmid1j95og99','.eJxVy00KwjAQQOG7ZC0lk59J4lLoOcLMJJKiVjDNSry7Cl3o9n28p8o0tpZHr4-8FHVUCOrwG5nkUtevkMh9rNu0lz7NN1qup93_pka9fQ6HhjkZR1F7qCHaYAuC1gWZraAk8qGK5eoJIVKxYCKxJMfnIj6Aer0BE3gzmw:1nrjjS:AZ3cEP3krlaVej8JB4WSAATXQINLXSAJrFX5RogDn7E','2022-06-02 22:44:38.640607'),('xkghjxez0km8v6eztfk1v1vxyk5dvtzq','.eJxVjM0KwjAQBt8lZymJ_cnGo9DnCLv7JaSoFUxzEt9dCj3odYaZt4ncthJbTa-4wFzMaE6_TFhvad0Fqz7bunUHqd384OV-PfxfVLiWfaVgmWSinAPUpR5OAywDlKgfhfvBelI_WAgCwC7YzGclx55IxHy-QRc0xg:1maciL:aCNcR3KH04_wdGW_8Y2xZUmpIunjbb0Mi1IEe0ljom8','2021-10-27 17:16:29.532754'),('xsjir986583bm273i1wdjf2947n83hot','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1n8HvJ:SpWKyGCEe96wAXBkNEWs6RgPRatUIaS-BhJAuR5Phl0','2022-01-28 13:57:01.683213'),('ybz9txa5a2k3ao097yj0wvw1gmoc3jfs','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nMsZz:rV0tA-tgJqHZrCaqPtI5VcKTpLqzX0vhq_cOl-SXcwc','2022-03-09 19:55:19.854979'),('yhg2uj3hrf4ra0s0apy5rynw1zb8uzbv','.eJxVy0EKwjAQQNG7ZC0lSZOx41LoOcJkZkKKWsE0K_HuKnSh2__4T5OobzX1po-0iDkZGM3hN2bii65fIeZ7X7dhL22Yb7Rcz7v_TZVa_RxqR_JBhRnyJCHGQKqTOsYSLIxFoiI6IgkFEShb8ICuYHFy9D6Leb0BSUY0SA:1nNU6y:ujc0lDBC_xhNnzyDtJH-QukKjTLWDQauLlnDf1W_A6A','2022-03-11 11:59:52.203673'),('ysvbhq6ftfxd00250aoqp0hzrcbxrcaw','.eJxVy8EKAiEQgOF38RyLOuOsdgx6DhlHxaXaINdT9O4V7KGu_8f_VJHH1uLo5RGXrI4KnDr8xsRyKetXWOQ-1m3aS5_ON16up93_psa9fQ4DmBOANp481RoAJM2kHVijMRi0ySNSoJRJ12yBtTgXasiC1nKZ1esN6kkyVw:1mXwF5:Yel2_MBjSmDH7Dmn9PtWO9D2Skph8V8oo1Dq4Q0QDMU','2021-10-20 07:31:11.344073'),('zge1f5uupgp9y7qo7wojnew7z346gxn6','.eJxVi0EKwjAQAP-Ss5S12e4mHgXfETabhBS1gmlO4t-t0IMeZ4Z5mSB9raG3_AxzMiczmcOvi6LXvHyDqD76sg67acPlLvPtvPe_qUqr2wHITNEqEfuUsRxHzgiRFaxLGzmaPAOUSBZ9Bi3qaERQiVQkkTPvD-R4MvQ:1mXODY:Qu3HZ14CdlfzZzl4tW0zuiYYGRD-857_Fdb3_N3U30I','2021-10-18 19:11:20.750617'),('zhmf8aj9go2mmdlmglwk9nxmuwk04n1t','.eJxVy00KwjAQQOG7ZC1lOvl3KXiOMJlMSFErmGYl3l2FLnT7Pt5TJRpbS6PLIy1FHZX36vAbM_FF1q8Q832s27SXPp1vtFxPu_9NjXr7HMJaPFlXQmQxtRgU42JBE9kLhoAz-FJnqJq0xEyWEDFr0BDBZbbq9QY4fjN8:1nNr0s:LeU8LP-o23cQ4JaK3HACLRBDkD6CkKMnMuQ-S1qxkME','2022-03-12 12:27:06.740356'),('zidf9tap1vhn5e3f69krq9x4qi92ugg2','.eJxVi0kKwjAUhu-StZRMzeBS8Bzh_a8JKWoF06zEu9tCF7r9hrdI1NeaesuvNE_iLJwRp18I4ltedkPMz76sw0HacH3QfL8c_m-q1Op2sMSolQS8LBwyqwzChGKtt8E7U7TSxng4p6KWFgxJoTBi3GJQFJ8vOeM0KQ:1nAQNB:3Bvrg2EW5Ev5WuoM9ZkVoC5dAjWkclViK4OQssfIISA','2022-02-03 11:22:37.041444'),('zqgw54w21856f5sk8w83vo9dfxtfe8io','.eJxVy00KAjEMQOG7dC1D-jNpcCl4jpI2KR3UEex0Jd5dhVno9n28p0k8tpZG10daxByNt-bwGzOXi65f4VLuY92mvfTpfOPletr9b2rc2-cQL5acQ8mKwQdFV7EKxZlnrCTOgUMAGzVEJiDwGqAwBkEtlNWa1xsQVzMS:1mzyOc:hsa2pkKw_equ8uz788yc9RKozxinB_f11F-qEp-L8Rk','2022-01-05 15:28:54.709457'),('zwgfjw4mq6zym8ujhp8tq4x57zh7dabc','.eJxVi8sKwjAQAP8lZyndPJrEo9DvCLubDSlqBdOcxH-3Qg96G2aYl0rYt5p6k2dasjorG9TpVxLyVdZvQeZHX7fhMG2Y77jcLkf_myq2uh8AhYCzcWEspXjH2o5UxO1IXnTwlp01hqbIMTsPCCZqmQJlIyBZq_cHMUAztw:1nJuNi:gYASPTRsKywvJ-mZSpS1hhaKFLBdsRujjLZVmhRzRW4','2022-03-01 15:14:22.439863'),('zwou2bccg6ra9extpaczaj9682uwcqru','.eJxVy0EKwjAQQNG7ZC2lycR04lLoOUJmJkOKWsE0K_HuKnSh2__4T5Ny32rqrTzSIuZkHJrDb6TMl7J-JTPf-7oNe2nDfMvL9bz731Rzq5_DeoAiI3geCT0FCjaQsywaYgFxTimjTkdEFtQIZCMHFC8SVRUm83oDKWI0Ig:1ml8vC:rgrKZ0I1u476k6YFtK0GgdCnclIs_Z8usC9_kj6vpZA','2021-11-25 17:41:14.476973'),('zxyti399rgz3wzny40eks2ptt2sevn5o','.eJxVy00KwjAQQOG7zFrK5LeJS8FzhMlkQopawTQr8e4qdKHb9_GekGhsLY0uj7QUOIKJcPiNmfgi61eI-T7WbdpLn843Wq6n3f-mRr19Dk01FI_BVWdnL0ZZgzmIqmJjZUOVNUUMaJUpOVpC8ehFOVdm7ZEYXm8fszNE:1mYAF9:1J4LIt6Ja6J7a63LdWJwknQR5-4Q5Ota0pJZHj61xXs','2021-10-20 22:28:11.119449');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_call`
--

DROP TABLE IF EXISTS `project_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_call` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `other_genre` varchar(50) DEFAULT NULL,
  `other_language` varchar(100) DEFAULT NULL,
  `description` longtext,
  `budget` double DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `call_for_id` bigint NOT NULL,
  `format_id` bigint DEFAULT NULL,
  `owner_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_call_call_for_id_890be918_fk_account_open_to_id` (`call_for_id`),
  KEY `project_call_format_id_25811232_fk_account_format_id` (`format_id`),
  KEY `project_call_owner_id_1ef18e27_fk_account_user_id` (`owner_id`),
  CONSTRAINT `project_call_call_for_id_890be918_fk_account_open_to_id` FOREIGN KEY (`call_for_id`) REFERENCES `account_open_to` (`id`),
  CONSTRAINT `project_call_format_id_25811232_fk_account_format_id` FOREIGN KEY (`format_id`) REFERENCES `account_format` (`id`),
  CONSTRAINT `project_call_owner_id_1ef18e27_fk_account_user_id` FOREIGN KEY (`owner_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_call`
--

LOCK TABLES `project_call` WRITE;
/*!40000 ALTER TABLE `project_call` DISABLE KEYS */;
INSERT INTO `project_call` VALUES (13,'',NULL,NULL,'No caste based or murder mystery pls. Have the synopsis short.',NULL,'2022-01-14',1,2,61),(15,'',NULL,NULL,'need it urgent',NULL,'2022-01-10',1,1,65),(16,'',NULL,NULL,'',NULL,'2022-02-08',3,1,66),(17,'','','','Welcome Budget Flims',NULL,'2022-01-19',1,1,68),(18,'',NULL,NULL,'sample goes here t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',NULL,'2022-01-20',5,1,72),(19,'','','','sample goes here',NULL,'2022-02-27',4,1,68),(20,'','','','Hello to all Writers out there! \r\nThere is a requirement for a Dialogue Writer For a feature Film in  Tamil. The film is a  Rural Based Action Film. An Experienced Dialogue writer with expertise in Tirunelveli dialect and Diction Preferable.  For More details call 9 0 0 3 2 1 7 0 2 3',NULL,'2022-02-20',3,2,64),(21,'','','','Need a Story idea for a Feature Film',NULL,'2022-03-06',1,1,64);
/*!40000 ALTER TABLE `project_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_call_genre`
--

DROP TABLE IF EXISTS `project_call_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_call_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `call_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_call_genre_call_id_genre_id_e34b7a98_uniq` (`call_id`,`genre_id`),
  KEY `project_call_genre_genre_id_c352ce34_fk_account_genre_id` (`genre_id`),
  CONSTRAINT `project_call_genre_call_id_24fa3a8c_fk_project_call_id` FOREIGN KEY (`call_id`) REFERENCES `project_call` (`id`),
  CONSTRAINT `project_call_genre_genre_id_c352ce34_fk_account_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `account_genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_call_genre`
--

LOCK TABLES `project_call_genre` WRITE;
/*!40000 ALTER TABLE `project_call_genre` DISABLE KEYS */;
INSERT INTO `project_call_genre` VALUES (35,13,1),(36,13,3),(37,13,5),(38,13,6),(40,15,1),(41,15,2),(42,16,1),(43,16,2),(44,16,5),(45,17,1),(46,17,2),(47,17,3),(48,17,5),(49,18,1),(50,19,5),(51,20,1),(52,20,3),(53,21,1),(54,21,2),(55,21,3);
/*!40000 ALTER TABLE `project_call_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_call_language`
--

DROP TABLE IF EXISTS `project_call_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_call_language` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `call_id` bigint NOT NULL,
  `language_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_call_language_call_id_language_id_88ba15ed_uniq` (`call_id`,`language_id`),
  KEY `project_call_languag_language_id_27efc54a_fk_account_l` (`language_id`),
  CONSTRAINT `project_call_languag_language_id_27efc54a_fk_account_l` FOREIGN KEY (`language_id`) REFERENCES `account_language` (`id`),
  CONSTRAINT `project_call_language_call_id_10d6cc02_fk_project_call_id` FOREIGN KEY (`call_id`) REFERENCES `project_call` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_call_language`
--

LOCK TABLES `project_call_language` WRITE;
/*!40000 ALTER TABLE `project_call_language` DISABLE KEYS */;
INSERT INTO `project_call_language` VALUES (1,13,1),(3,15,1),(4,15,2),(5,15,3),(6,16,3),(7,16,4),(8,16,5),(9,17,1),(10,17,2),(11,18,1),(12,19,1),(13,19,2),(14,20,1),(15,21,1);
/*!40000 ALTER TABLE `project_call_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_comment`
--

DROP TABLE IF EXISTS `project_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `date` date NOT NULL,
  `commented_by_id` bigint NOT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_comment_commented_by_id_b43cb97c_fk_account_user_id` (`commented_by_id`),
  KEY `project_comment_post_id_cced476f_fk_project_post_id` (`post_id`),
  CONSTRAINT `project_comment_commented_by_id_b43cb97c_fk_account_user_id` FOREIGN KEY (`commented_by_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `project_comment_post_id_cced476f_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_comment`
--

LOCK TABLES `project_comment` WRITE;
/*!40000 ALTER TABLE `project_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_downvote`
--

DROP TABLE IF EXISTS `project_downvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_downvote` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `downvoted_by_id` bigint NOT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_downvote_downvoted_by_id_f93204f3_fk_account_user_id` (`downvoted_by_id`),
  KEY `project_downvote_post_id_15726f23_fk_project_post_id` (`post_id`),
  CONSTRAINT `project_downvote_downvoted_by_id_f93204f3_fk_account_user_id` FOREIGN KEY (`downvoted_by_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `project_downvote_post_id_15726f23_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_downvote`
--

LOCK TABLES `project_downvote` WRITE;
/*!40000 ALTER TABLE `project_downvote` DISABLE KEYS */;
INSERT INTO `project_downvote` VALUES (37,68,106);
/*!40000 ALTER TABLE `project_downvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_interest`
--

DROP TABLE IF EXISTS `project_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_interest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `shown_by_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_interest_post_id_632199cc_fk_project_post_id` (`post_id`),
  KEY `project_interest_shown_by_id_5f0860d2_fk_account_user_id` (`shown_by_id`),
  CONSTRAINT `project_interest_post_id_632199cc_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`),
  CONSTRAINT `project_interest_shown_by_id_5f0860d2_fk_account_user_id` FOREIGN KEY (`shown_by_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_interest`
--

LOCK TABLES `project_interest` WRITE;
/*!40000 ALTER TABLE `project_interest` DISABLE KEYS */;
INSERT INTO `project_interest` VALUES (13,66,62),(15,80,62),(22,106,68),(24,112,77),(25,113,77);
/*!40000 ALTER TABLE `project_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_like`
--

DROP TABLE IF EXISTS `project_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `liked_by_id` bigint NOT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_like_liked_by_id_cadc5a83_fk_account_user_id` (`liked_by_id`),
  KEY `project_like_post_id_9a0cd216_fk_project_post_id` (`post_id`),
  CONSTRAINT `project_like_liked_by_id_cadc5a83_fk_account_user_id` FOREIGN KEY (`liked_by_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `project_like_post_id_9a0cd216_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_like`
--

LOCK TABLES `project_like` WRITE;
/*!40000 ALTER TABLE `project_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_message`
--

DROP TABLE IF EXISTS `project_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `message` longtext NOT NULL,
  `unread` tinyint(1) NOT NULL,
  `m_file` varchar(100) DEFAULT NULL,
  `interest_id` bigint DEFAULT NULL,
  `message_by_id` bigint NOT NULL,
  `message_to_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_message_interest_id_e635ef63_fk_project_interest_id` (`interest_id`),
  KEY `project_message_message_by_id_62da839a_fk_account_user_id` (`message_by_id`),
  KEY `project_message_message_to_id_1b7075cf_fk_account_user_id` (`message_to_id`),
  CONSTRAINT `project_message_interest_id_e635ef63_fk_project_interest_id` FOREIGN KEY (`interest_id`) REFERENCES `project_interest` (`id`),
  CONSTRAINT `project_message_message_by_id_62da839a_fk_account_user_id` FOREIGN KEY (`message_by_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `project_message_message_to_id_1b7075cf_fk_account_user_id` FOREIGN KEY (`message_to_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_message`
--

LOCK TABLES `project_message` WRITE;
/*!40000 ALTER TABLE `project_message` DISABLE KEYS */;
INSERT INTO `project_message` VALUES (53,'2022-01-07 19:09:31.497614','hi sir...',0,'',13,62,61),(55,'2022-01-08 15:15:23.080421','i am interested to join in ur movie sir',0,'',15,62,66),(56,'2022-01-08 15:15:25.061805','i am interested to join in ur movie sir',0,'',15,62,66),(68,'2022-02-16 11:27:20.439277','hello',1,'',22,68,63),(71,'2022-02-17 16:59:33.677266','testing the feature',1,'message_file/2021_release.pdf',24,77,64),(72,'2022-02-17 16:59:59.624352','hello',1,'',24,77,64),(73,'2022-02-21 12:14:08.338184','test',1,'',25,77,64),(74,'2022-02-21 12:14:48.490711','test 2',1,'message_file/Producers_list.pdf',25,77,64);
/*!40000 ALTER TABLE `project_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_pitch`
--

DROP TABLE IF EXISTS `project_pitch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_pitch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `story_title` varchar(255) NOT NULL,
  `story_file` varchar(100) DEFAULT NULL,
  `other_genre` varchar(50) DEFAULT NULL,
  `other_language` varchar(100) DEFAULT NULL,
  `description` longtext,
  `budget` double DEFAULT NULL,
  `format_id` bigint DEFAULT NULL,
  `owner_id` bigint NOT NULL,
  `cover_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_pitch_format_id_a4672181_fk_account_format_id` (`format_id`),
  KEY `project_pitch_owner_id_fcce08a4_fk_account_user_id` (`owner_id`),
  CONSTRAINT `project_pitch_format_id_a4672181_fk_account_format_id` FOREIGN KEY (`format_id`) REFERENCES `account_format` (`id`),
  CONSTRAINT `project_pitch_owner_id_fcce08a4_fk_account_user_id` FOREIGN KEY (`owner_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_pitch`
--

LOCK TABLES `project_pitch` WRITE;
/*!40000 ALTER TABLE `project_pitch` DISABLE KEYS */;
INSERT INTO `project_pitch` VALUES (33,'Guru','',NULL,NULL,'how a poor man become rich man in india',NULL,2,62,NULL),(34,'Guru','',NULL,NULL,'how a poor man becomes richest man in india',NULL,2,62,NULL),(38,'Infinity','',NULL,NULL,'Time Loop Concept',NULL,2,66,NULL),(43,'Dreams have Duties','stories/zoho_vs_teachpod.docx',NULL,NULL,'',NULL,1,63,''),(44,'Viruman','','','','Its Rural Subject',NULL,2,62,NULL),(49,'Gaani','',NULL,NULL,'sanple goes here',NULL,1,63,'pitch_cover/gaani_OHcS35o.jpg');
/*!40000 ALTER TABLE `project_pitch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_pitch_genre`
--

DROP TABLE IF EXISTS `project_pitch_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_pitch_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pitch_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_pitch_genre_pitch_id_genre_id_f53ff618_uniq` (`pitch_id`,`genre_id`),
  KEY `project_pitch_genre_genre_id_818be102_fk_account_genre_id` (`genre_id`),
  CONSTRAINT `project_pitch_genre_genre_id_818be102_fk_account_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `account_genre` (`id`),
  CONSTRAINT `project_pitch_genre_pitch_id_db850549_fk_project_pitch_id` FOREIGN KEY (`pitch_id`) REFERENCES `project_pitch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_pitch_genre`
--

LOCK TABLES `project_pitch_genre` WRITE;
/*!40000 ALTER TABLE `project_pitch_genre` DISABLE KEYS */;
INSERT INTO `project_pitch_genre` VALUES (40,33,6),(41,34,6),(45,38,1),(46,38,3),(51,43,6),(52,44,1),(53,44,5),(58,49,1),(59,49,5);
/*!40000 ALTER TABLE `project_pitch_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_pitch_language`
--

DROP TABLE IF EXISTS `project_pitch_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_pitch_language` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pitch_id` bigint NOT NULL,
  `language_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_pitch_language_pitch_id_language_id_c0e8664f_uniq` (`pitch_id`,`language_id`),
  KEY `project_pitch_langua_language_id_71590e52_fk_account_l` (`language_id`),
  CONSTRAINT `project_pitch_langua_language_id_71590e52_fk_account_l` FOREIGN KEY (`language_id`) REFERENCES `account_language` (`id`),
  CONSTRAINT `project_pitch_language_pitch_id_a464cf72_fk_project_pitch_id` FOREIGN KEY (`pitch_id`) REFERENCES `project_pitch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_pitch_language`
--

LOCK TABLES `project_pitch_language` WRITE;
/*!40000 ALTER TABLE `project_pitch_language` DISABLE KEYS */;
INSERT INTO `project_pitch_language` VALUES (1,33,1),(2,33,5),(3,34,1),(4,34,5),(10,38,5),(17,43,1),(18,44,1),(19,44,3),(24,49,5);
/*!40000 ALTER TABLE `project_pitch_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_pitch_pitch_to_people`
--

DROP TABLE IF EXISTS `project_pitch_pitch_to_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_pitch_pitch_to_people` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pitch_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_pitch_pitch_to_people_pitch_id_user_id_b048c858_uniq` (`pitch_id`,`user_id`),
  KEY `project_pitch_pitch__user_id_3b1bcb9f_fk_account_u` (`user_id`),
  CONSTRAINT `project_pitch_pitch__pitch_id_3688b28c_fk_project_p` FOREIGN KEY (`pitch_id`) REFERENCES `project_pitch` (`id`),
  CONSTRAINT `project_pitch_pitch__user_id_3b1bcb9f_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_pitch_pitch_to_people`
--

LOCK TABLES `project_pitch_pitch_to_people` WRITE;
/*!40000 ALTER TABLE `project_pitch_pitch_to_people` DISABLE KEYS */;
INSERT INTO `project_pitch_pitch_to_people` VALUES (24,33,61),(27,38,67);
/*!40000 ALTER TABLE `project_pitch_pitch_to_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_post`
--

DROP TABLE IF EXISTS `project_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) NOT NULL,
  `post_category` varchar(1) NOT NULL,
  `date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `assistant_id` bigint DEFAULT NULL,
  `award_id` bigint DEFAULT NULL,
  `call_id` bigint DEFAULT NULL,
  `pitch_id` bigint DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `cannot_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assistant_id` (`assistant_id`),
  UNIQUE KEY `award_id` (`award_id`),
  UNIQUE KEY `call_id` (`call_id`),
  UNIQUE KEY `pitch_id` (`pitch_id`),
  UNIQUE KEY `project_id` (`project_id`),
  CONSTRAINT `project_post_assistant_id_7d57ada0_fk_account_assistant_id` FOREIGN KEY (`assistant_id`) REFERENCES `account_assistant` (`id`),
  CONSTRAINT `project_post_award_id_516c5efe_fk_account_award_id` FOREIGN KEY (`award_id`) REFERENCES `account_award` (`id`),
  CONSTRAINT `project_post_call_id_60bf2917_fk_project_call_id` FOREIGN KEY (`call_id`) REFERENCES `project_call` (`id`),
  CONSTRAINT `project_post_pitch_id_157b5cf9_fk_project_pitch_id` FOREIGN KEY (`pitch_id`) REFERENCES `project_pitch` (`id`),
  CONSTRAINT `project_post_project_id_7ba7481c_fk_account_project_id` FOREIGN KEY (`project_id`) REFERENCES `account_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_post`
--

LOCK TABLES `project_post` WRITE;
/*!40000 ALTER TABLE `project_post` DISABLE KEYS */;
INSERT INTO `project_post` VALUES (64,'Read my Outline of Story Guru','T','2022-01-11 09:29:49.238716',1,NULL,NULL,NULL,33,NULL,0),(65,'Read my Outline of Story Guru','T','2022-01-11 09:29:59.627676',1,NULL,NULL,NULL,34,NULL,0),(66,'Prabhu\'s Call for Story Writing','C','2022-01-11 12:13:10.831893',1,NULL,NULL,13,NULL,NULL,0),(69,'Muthu Worked in Ayalaan','P','2022-01-08 12:54:51.895013',1,NULL,NULL,NULL,NULL,14,0),(70,'Muthu Worked in ayalaan','P','2022-01-08 12:57:23.465356',1,NULL,NULL,NULL,NULL,15,0),(72,'Muthu\'s Call for Story Writing','C','2022-01-11 09:29:11.653243',1,NULL,NULL,15,NULL,NULL,0),(73,'Madhan Umk Worked in sample','P','2022-01-08 13:35:28.375341',1,NULL,NULL,NULL,NULL,17,0),(74,'Madhan Umk Worked in Vikram','P','2022-01-19 10:20:10.275523',1,NULL,NULL,NULL,NULL,18,0),(76,'Madhan Umk Worked as Assistant Director in Vikram','S','2022-01-08 14:42:38.023888',1,4,NULL,NULL,NULL,NULL,0),(77,'Madhan Umk Recieved the Award Best Cinemotographer','A','2022-01-20 11:25:00.474747',1,NULL,4,NULL,NULL,NULL,0),(80,'MURPHY\'s Call for Dialogue Writing','C','2022-01-11 09:29:19.916444',1,NULL,NULL,16,NULL,NULL,0),(81,'Read my Outline of Story Infinity','T','2022-01-11 09:30:26.342670',1,NULL,NULL,NULL,38,NULL,0),(86,'Ramesh\'s Call for Story Writing','C','2022-02-15 11:15:36.283789',1,NULL,NULL,17,NULL,NULL,0),(87,'Read my story synopsis of Dreams have Duties','T','2022-02-25 14:42:53.537626',1,NULL,NULL,NULL,43,NULL,0),(89,'Read my Outline of Story Viruman','T','2022-01-20 10:27:09.187548',0,NULL,NULL,NULL,44,NULL,1),(90,'Vignesh Kumar Worked in Vicky','P','2022-01-20 13:42:22.497554',1,NULL,NULL,NULL,NULL,21,0),(93,'Vignesh Kumar\'s Call for Story Discussion','C','2022-01-20 15:08:33.777818',1,NULL,NULL,18,NULL,NULL,0),(105,'Ramesh\'s Call for Lyrics Writing','C','2022-02-15 11:16:48.872196',1,NULL,NULL,19,NULL,NULL,0),(106,'Read my story synopsis of Gaani','T','2022-02-25 14:41:41.123699',1,NULL,NULL,NULL,49,NULL,0),(112,'Allaudin\'s Call for Dialogue Writing','C','2022-02-17 16:26:24.796413',1,NULL,NULL,20,NULL,NULL,0),(113,'Allaudin\'s Call for Story Writing','C','2022-02-17 17:02:02.960851',1,NULL,NULL,21,NULL,NULL,0),(116,'Ramesh Worked in Ratha Kanneer','P','2022-06-06 15:44:56.924047',1,NULL,NULL,NULL,NULL,33,0);
/*!40000 ALTER TABLE `project_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_report`
--

DROP TABLE IF EXISTS `project_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `date` date NOT NULL,
  `post_id` bigint NOT NULL,
  `reported_by_id` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_report_post_id_7ba54fdd_fk_project_post_id` (`post_id`),
  KEY `project_report_reported_by_id_85ac6f06_fk_account_user_id` (`reported_by_id`),
  CONSTRAINT `project_report_post_id_7ba54fdd_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`),
  CONSTRAINT `project_report_reported_by_id_85ac6f06_fk_account_user_id` FOREIGN KEY (`reported_by_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_report`
--

LOCK TABLES `project_report` WRITE;
/*!40000 ALTER TABLE `project_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_upvote`
--

DROP TABLE IF EXISTS `project_upvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_upvote` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `upvoted_by_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_upvote_post_id_1f7e5171_fk_project_post_id` (`post_id`),
  KEY `project_upvote_upvoted_by_id_63dd97b5_fk_account_user_id` (`upvoted_by_id`),
  CONSTRAINT `project_upvote_post_id_1f7e5171_fk_project_post_id` FOREIGN KEY (`post_id`) REFERENCES `project_post` (`id`),
  CONSTRAINT `project_upvote_upvoted_by_id_63dd97b5_fk_account_user_id` FOREIGN KEY (`upvoted_by_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_upvote`
--

LOCK TABLES `project_upvote` WRITE;
/*!40000 ALTER TABLE `project_upvote` DISABLE KEYS */;
INSERT INTO `project_upvote` VALUES (32,64,62),(34,66,62),(35,66,63),(36,80,62),(37,66,68),(40,80,63),(41,70,63),(44,65,72),(45,80,72),(53,70,68),(56,90,63),(65,90,77);
/*!40000 ALTER TABLE `project_upvote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-27 10:36:06
