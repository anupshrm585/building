-- MySQL dump 10.13  Distrib 5.1.33, for Win32 (ia32)
--
-- Host: localhost    Database: building
-- ------------------------------------------------------
-- Server version	5.1.33-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `build_group`
--

DROP TABLE IF EXISTS `build_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_group` (
  `id` varchar(30) NOT NULL,
  `title` text NOT NULL,
  `is_deleted` enum('N','Y') NOT NULL DEFAULT 'N',
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_group`
--

LOCK TABLES `build_group` WRITE;
/*!40000 ALTER TABLE `build_group` DISABLE KEYS */;
INSERT INTO `build_group` VALUES ('GRP00000001','Admin','N','Y'),('GRP00000003','Normal User','N','Y'),('GRP00000009','Superviser','N','Y');
/*!40000 ALTER TABLE `build_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_group_roles`
--

DROP TABLE IF EXISTS `build_group_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_group_roles` (
  `group_id` varchar(100) NOT NULL,
  `role_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_group_roles`
--

LOCK TABLES `build_group_roles` WRITE;
/*!40000 ALTER TABLE `build_group_roles` DISABLE KEYS */;
INSERT INTO `build_group_roles` VALUES ('GRP00000001','ROLE00000001');
/*!40000 ALTER TABLE `build_group_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_roles`
--

DROP TABLE IF EXISTS `build_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_roles` (
  `id` varchar(100) NOT NULL,
  `title` text NOT NULL,
  `is_deleted` enum('N','Y') NOT NULL DEFAULT 'N',
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `url` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_roles`
--

LOCK TABLES `build_roles` WRITE;
/*!40000 ALTER TABLE `build_roles` DISABLE KEYS */;
INSERT INTO `build_roles` VALUES ('ROLE00000001','Roles','N','Y','/view/roles.xhtml'),('ROLE00000003','Groups','N','Y','/view/groups.xhtml'),('ROLE00000005','Users','N','Y','/view/uses.xhtml');
/*!40000 ALTER TABLE `build_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_sequences`
--

DROP TABLE IF EXISTS `build_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_sequences` (
  `sequence_name` varchar(100) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_sequences`
--

LOCK TABLES `build_sequences` WRITE;
/*!40000 ALTER TABLE `build_sequences` DISABLE KEYS */;
INSERT INTO `build_sequences` VALUES ('GRP_SEQ',71,'GRP'),('USER_SEQ',13,'USR'),('MENU_SEQ',7,'ROLE');
/*!40000 ALTER TABLE `build_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_user`
--

DROP TABLE IF EXISTS `build_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_user` (
  `id` varchar(30) NOT NULL,
  `title` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `is_deleted` enum('N','Y') NOT NULL DEFAULT 'N',
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `email_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_user`
--

LOCK TABLES `build_user` WRITE;
/*!40000 ALTER TABLE `build_user` DISABLE KEYS */;
INSERT INTO `build_user` VALUES ('USR00000001','Anup Sharma','anupshrm','anupshrm','N','Y',''),('USR00000003','Vikrant Rai','vik','vik','N','Y','lovecls1@gmail.com'),('USR00000005','Soura  Bhattacharya','soura','soura','N','Y',''),('USR00000007','Chayan Chatterjee','chayan','chayan','N','Y',NULL),('USR00000009','Avik Roy','avik','avik','N','Y','ankitshrm585@gmail.com'),('USR00000011','New User','user','user','N','Y','anupshrm585@gmail.com');
/*!40000 ALTER TABLE `build_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_user_group`
--

DROP TABLE IF EXISTS `build_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_user_group` (
  `group_id` varchar(30) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  KEY `group_fk1` (`group_id`),
  KEY `user_fk1` (`user_id`),
  CONSTRAINT `group_fk1` FOREIGN KEY (`group_id`) REFERENCES `build_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_fk1` FOREIGN KEY (`user_id`) REFERENCES `build_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_user_group`
--

LOCK TABLES `build_user_group` WRITE;
/*!40000 ALTER TABLE `build_user_group` DISABLE KEYS */;
INSERT INTO `build_user_group` VALUES ('GRP00000003','USR00000003'),('GRP00000003','USR00000007'),('GRP00000003','USR00000005'),('GRP00000001','USR00000001'),('GRP00000003','USR00000001');
/*!40000 ALTER TABLE `build_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_log`
--

DROP TABLE IF EXISTS `error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_log` (
  `SQL_CODE` int(10) DEFAULT NULL,
  `SQL_ERRM` varchar(1000) DEFAULT NULL,
  `USER_DATE` date DEFAULT NULL,
  `TRANS_HEADING` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_log`
--

LOCK TABLES `error_log` WRITE;
/*!40000 ALTER TABLE `error_log` DISABLE KEYS */;
INSERT INTO `error_log` VALUES (0,'Group Error','2014-12-10','Group ERROR'),(0,'Group Error','2014-12-10','Group ERROR'),(0,'Group Error','2014-12-10','Group ERROR'),(0,'Group Error','2014-12-10','Group ERROR'),(0,'Group Error','2014-12-10','Group ERROR'),(0,'Group Error','2014-12-10','Group ERROR'),(0,'Group Error','2014-12-10','Group ERROR'),(0,'Group Error','2014-12-10','Group ERROR'),(0,'Group Error','2014-12-10','Group ERROR'),(0,'Group Error','2014-12-10','Group ERROR'),(0,'Group Error','2014-12-10','Group ERROR'),(0,'Group Error','2014-12-10','Group ERROR');
/*!40000 ALTER TABLE `error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vusers_roles`
--

DROP TABLE IF EXISTS `vusers_roles`;
/*!50001 DROP VIEW IF EXISTS `vusers_roles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vusers_roles` (
  `group_id` varchar(30),
  `group_title` text,
  `user_id` varchar(30),
  `user_title` text,
  `username` varchar(100),
  `password` varchar(100)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vusers_roles`
--

/*!50001 DROP TABLE `vusers_roles`*/;
/*!50001 DROP VIEW IF EXISTS `vusers_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vusers_roles` AS select `bg`.`id` AS `group_id`,`bg`.`title` AS `group_title`,`bu`.`id` AS `user_id`,`bu`.`title` AS `user_title`,`bu`.`username` AS `username`,`bu`.`password` AS `password` from ((`build_group` `bg` left join `build_user_group` `bug` on((`bg`.`id` = `bug`.`group_id`))) left join `build_user` `bu` on((`bu`.`id` = `bug`.`user_id`))) where ((`bg`.`is_active` = 'Y') and (`bg`.`is_deleted` = 'N') and (`bu`.`is_active` = 'Y') and (`bu`.`is_deleted` = 'N')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-16  3:15:05
