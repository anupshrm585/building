-- MySQL dump 10.13  Distrib 5.6.20, for Win32 (x86)
--
-- Host: localhost    Database: education
-- ------------------------------------------------------
-- Server version	5.6.20-log

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
-- Table structure for table `edu_codes_master`
--

DROP TABLE IF EXISTS `edu_codes_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_codes_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_codes_master`
--

LOCK TABLES `edu_codes_master` WRITE;
/*!40000 ALTER TABLE `edu_codes_master` DISABLE KEYS */;
INSERT INTO `edu_codes_master` VALUES (1,'USER','USR'),(2,'GROUP','GRP'),(3,'ROLE','ROLE'),(4,'EMPLOYEE',NULL),(5,'UNIVERSITY',NULL),(6,'SCHOOL',NULL),(7,'COLLEGE',NULL);
/*!40000 ALTER TABLE `edu_codes_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_group`
--

DROP TABLE IF EXISTS `edu_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_group` (
  `id` varchar(30) NOT NULL,
  `title` text NOT NULL,
  `is_deleted` enum('N','Y') NOT NULL DEFAULT 'N',
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_group`
--

LOCK TABLES `edu_group` WRITE;
/*!40000 ALTER TABLE `edu_group` DISABLE KEYS */;
INSERT INTO `edu_group` VALUES ('GRP00000001','Product Admin','N','Y'),('GRP00000003','User','N','Y');
/*!40000 ALTER TABLE `edu_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_group_roles`
--

DROP TABLE IF EXISTS `edu_group_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_group_roles` (
  `group_id` varchar(30) NOT NULL,
  `roles_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_group_roles`
--

LOCK TABLES `edu_group_roles` WRITE;
/*!40000 ALTER TABLE `edu_group_roles` DISABLE KEYS */;
INSERT INTO `edu_group_roles` VALUES ('GRP00000001','ROLE00000001'),('GRP00000001','ROLE00000003'),('GRP00000001','ROLE00000005');
/*!40000 ALTER TABLE `edu_group_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_roles`
--

DROP TABLE IF EXISTS `edu_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_roles` (
  `id` varchar(100) NOT NULL,
  `title` text NOT NULL,
  `is_deleted` enum('N','Y') NOT NULL DEFAULT 'N',
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `url` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_roles`
--

LOCK TABLES `edu_roles` WRITE;
/*!40000 ALTER TABLE `edu_roles` DISABLE KEYS */;
INSERT INTO `edu_roles` VALUES ('ROLE00000001','ROLE','N','Y','/view/roles.xhtml'),('ROLE00000003','GROUP','N','Y','/view/groups.xhtml'),('ROLE00000005','USER','N','Y','/view/users.xhtml');
/*!40000 ALTER TABLE `edu_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_sequences`
--

DROP TABLE IF EXISTS `edu_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_sequences` (
  `code_id` int(11) DEFAULT NULL,
  `sequence_name` varchar(100) NOT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_sequences`
--

LOCK TABLES `edu_sequences` WRITE;
/*!40000 ALTER TABLE `edu_sequences` DISABLE KEYS */;
INSERT INTO `edu_sequences` VALUES (1,'USER_SEQ',3),(2,'GROUP_SEQ',5),(3,'ROLE_SEQ',7);
/*!40000 ALTER TABLE `edu_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_setting_master`
--

DROP TABLE IF EXISTS `edu_setting_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_setting_master` (
  `id` varchar(30) NOT NULL,
  `code_id` int(11) DEFAULT NULL,
  `code` varchar(45) NOT NULL,
  `start_value` int(11) DEFAULT NULL,
  `auto_increment` enum('N','Y') NOT NULL,
  `size` int(11) DEFAULT NULL,
  `increment_val` int(11) NOT NULL,
  `current_val` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_setting_master`
--

LOCK TABLES `edu_setting_master` WRITE;
/*!40000 ALTER TABLE `edu_setting_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_setting_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_user`
--

DROP TABLE IF EXISTS `edu_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_user` (
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
-- Dumping data for table `edu_user`
--

LOCK TABLES `edu_user` WRITE;
/*!40000 ALTER TABLE `edu_user` DISABLE KEYS */;
INSERT INTO `edu_user` VALUES ('USR00000001','Anup','anupshrm','anupshrm','N','Y','anupshrm585@gmail.com');
/*!40000 ALTER TABLE `edu_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_user_account_settings`
--

DROP TABLE IF EXISTS `edu_user_account_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_user_account_settings` (
  `user_id` varchar(30) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `remaining_days` int(11) NOT NULL,
  `is_active` enum('Y','N') NOT NULL,
  `is_deleted` enum('N','Y') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_user_account_settings`
--

LOCK TABLES `edu_user_account_settings` WRITE;
/*!40000 ALTER TABLE `edu_user_account_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_user_account_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_user_group`
--

DROP TABLE IF EXISTS `edu_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_user_group` (
  `group_id` varchar(30) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `edu_user_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `edu_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `edu_user_group_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `edu_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_user_group`
--

LOCK TABLES `edu_user_group` WRITE;
/*!40000 ALTER TABLE `edu_user_group` DISABLE KEYS */;
INSERT INTO `edu_user_group` VALUES ('GRP00000001','USR00000001');
/*!40000 ALTER TABLE `edu_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_user_roles`
--

DROP TABLE IF EXISTS `edu_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_user_roles` (
  `user_id` varchar(30) NOT NULL,
  `roles_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_user_roles`
--

LOCK TABLES `edu_user_roles` WRITE;
/*!40000 ALTER TABLE `edu_user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_log`
--

DROP TABLE IF EXISTS `error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_log` (
  `sql_state` text CHARACTER SET latin1,
  `sql_msg` text CHARACTER SET latin1,
  `text` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_log`
--

LOCK TABLES `error_log` WRITE;
/*!40000 ALTER TABLE `error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'education'
--
/*!50003 DROP FUNCTION IF EXISTS `GET_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GET_ID`(v_TITLE VARCHAR(30)) RETURNS varchar(30) CHARSET utf8
BEGIN	

        DECLARE v_CODE_ID INTEGER;

        DECLARE v_VAL INTEGER;

        DECLARE v_ID VARCHAR(30);

        SELECT ecm.id code_id,es.value,CONCAT(ecm.code,LPAD(es.value,8,'0')) id INTO v_CODE_ID,v_VAL,v_ID

        FROM 

        edu_codes_master ecm

        JOIN

        edu_sequences es

        ON ecm.id = es.code_id

        WHERE ecm.title = v_TITLE;

  UPDATE edu_sequences SET value=v_VAL+2 WHERE code_id = v_CODE_ID;

	RETURN v_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GET_SIZE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GET_SIZE`(x LONGTEXT) RETURNS int(11)
BEGIN

      DECLARE v_DELIM VARCHAR(5);

      DECLARE v_STR LONGTEXT;

      SET v_DELIM = SUBSTRING(x, 1, 1);

      SET v_STR = CONCAT(SUBSTRING(x, 2),v_DELIM);

	    RETURN LENGTH(v_STR)-LENGTH(REPLACE(v_STR,v_DELIM,''));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR`(

 x longtext,

-- delim VARCHAR(12),

 pos INT

 ) RETURNS varchar(255) CHARSET utf8
BEGIN

  DECLARE v_DELIM VARCHAR(5);

  DECLARE v_STR LONGTEXT;

  SET v_DELIM = SUBSTRING(x, 1, 1);

  SET v_STR = SUBSTRING(x, 2);

  SET pos = pos + 1;

  RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(v_STR, v_DELIM, pos),LENGTH(SUBSTRING_INDEX(v_STR, v_DELIM, pos -1)) + 1),

  v_DELIM, '');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-23 12:04:10
