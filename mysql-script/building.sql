-- MySQL dump 10.13  Distrib 5.5.36, for Win32 (x86)
--
-- Host: localhost    Database: building
-- ------------------------------------------------------
-- Server version	5.5.36-log

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
INSERT INTO `build_group` VALUES ('GRP00000001','Admin','N','Y'),('GRP00000003','Normal User','N','Y'),('GRP00000005','Chief Executive Officer','N','N'),('GRP00000007','Manager','N','Y'),('GRP00000009','Superviser','N','Y'),('GRP00000011','Chief Associate','N','N'),('GRP00000013','Chief Technical Officer','N','N'),('GRP00000015','Head Master','N','N'),('GRP00000017','New User','N','N'),('GRP00000019','User again','N','N');
/*!40000 ALTER TABLE `build_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_rights`
--

DROP TABLE IF EXISTS `build_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_rights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `is_deleted` enum('N','Y') NOT NULL DEFAULT 'N',
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_rights`
--

LOCK TABLES `build_rights` WRITE;
/*!40000 ALTER TABLE `build_rights` DISABLE KEYS */;
INSERT INTO `build_rights` VALUES (1,'/admin','N','Y'),(2,'/user','N','Y');
/*!40000 ALTER TABLE `build_rights` ENABLE KEYS */;
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
INSERT INTO `build_sequences` VALUES ('GRP_SEQ',21,'GRP'),('USER_SEQ',9,'USR'),('MENU_SEQ',1,'ROLE');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_user`
--

LOCK TABLES `build_user` WRITE;
/*!40000 ALTER TABLE `build_user` DISABLE KEYS */;
INSERT INTO `build_user` VALUES ('USR00000001','Anup Sharma','anupshrm','anupshrm','N','Y'),('USR00000003','Vikrant Rai','vik','vik','N','Y'),('USR00000005','Soura  Bhattacharya','soura','soura','N','Y'),('USR00000007','Chayan Chatterjee','chayan','chayan','N','Y');
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
  CONSTRAINT `user_fk1` FOREIGN KEY (`user_id`) REFERENCES `build_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_fk1` FOREIGN KEY (`group_id`) REFERENCES `build_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_user_group`
--

LOCK TABLES `build_user_group` WRITE;
/*!40000 ALTER TABLE `build_user_group` DISABLE KEYS */;
INSERT INTO `build_user_group` VALUES ('GRP00000001','USR00000001'),('GRP00000003','USR00000001'),('GRP00000003','USR00000003'),('GRP00000003','USR00000005'),('GRP00000003','USR00000007');
/*!40000 ALTER TABLE `build_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vusers_roles`
--

DROP TABLE IF EXISTS `vusers_roles`;
/*!50001 DROP VIEW IF EXISTS `vusers_roles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vusers_roles` (
  `group_id` tinyint NOT NULL,
  `group_title` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `user_title` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `password` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'building'
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
CREATE DEFINER=`root`@`localhost` FUNCTION `GET_ID`(v_CODE VARCHAR(30)) RETURNS varchar(30) CHARSET utf8
BEGIN	
  DECLARE v_VALUE INTEGER;
  SELECT VALUE INTO v_VALUE FROM build_sequences WHERE CODE = v_CODE;
  UPDATE build_sequences SET value=v_VALUE+2 WHERE CODE = v_CODE;
	RETURN CONCAT(v_CODE,LPAD(v_VALUE,8,'0'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GET_SEQUENCE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GET_SEQUENCE`(SEQ_NAME VARCHAR(100)) RETURNS int(11)
BEGIN
	DECLARE v_VALUE INTEGER;
  SELECT VALUE INTO v_VALUE FROM build_sequences WHERE SEQUENCE_NAME = SEQ_NAME;
  UPDATE build_sequences SET value=v_VALUE+2 WHERE SEQUENCE_NAME = SEQ_NAME;
	RETURN v_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vusers_roles`
--

/*!50001 DROP TABLE IF EXISTS `vusers_roles`*/;
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

-- Dump completed on 2014-12-09 18:30:10
