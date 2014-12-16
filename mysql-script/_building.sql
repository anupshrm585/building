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
INSERT INTO `build_group` VALUES ('GRP00000001','Admin','N','Y'),('GRP00000003','Normal User','N','Y'),('GRP00000005','Chief Executive Officer','N','N'),('GRP00000007','Manager','N','Y'),('GRP00000009','Superviser','N','Y'),('GRP00000011','Chief Associate','N','N'),('GRP00000013','Chief Technical Officer','N','N'),('GRP00000015','Head Master','N','N'),('GRP00000017','New User','N','N'),('GRP00000019','User again','N','N'),('GRP00000021','New User','N','N'),('GRP00000023','New User','N','N'),('GRP00000025','New User2','N','N'),('GRP00000027','New User 3','N','N'),('GRP00000029','New User 4','N','N'),('GRP00000031','New User 4','N','N'),('GRP00000033','New User 5','N','N'),('GRP00000037','New User 6','N','N'),('GRP00000039','NEW','N','N'),('GRP00000041','NEW AGAIN','N','N'),('GRP00000043','NEW UPDATE','N','N'),('GRP00000045','NEW UPDATE','N','N'),('GRP00000047','NEW UPDATE1','N','N'),('GRP00000049','NEW UPDATE','N','N'),('GRP00000051','Testing','N','N'),('GRP00000053','Testing','N','N'),('GRP00000055','Testing','N','N'),('GRP00000057','NEW UPDATE','N','N'),('GRP00000059','NEW UPDATE','N','N'),('GRP00000061','Testing','N','N'),('GRP00000063','Testing','N','N'),('GRP00000065','Testing','N','N'),('GRP00000067','Testing from front','N','N'),('GRP00000069','Transaction New','N','N');
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
INSERT INTO `build_sequences` VALUES ('GRP_SEQ',71,'GRP'),('USER_SEQ',9,'USR'),('MENU_SEQ',1,'ROLE');
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
INSERT INTO `build_user` VALUES ('USR00000001','Anup Sharma','anupshrm','anupshrm','N','Y',NULL),('USR00000003','Vikrant Rai','vik','vik','N','Y',NULL),('USR00000005','Soura  Bhattacharya','soura','soura','N','Y',NULL),('USR00000007','Chayan Chatterjee','chayan','chayan','N','Y',NULL);
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
INSERT INTO `build_user_group` VALUES ('GRP00000001','USR00000001'),('GRP00000003','USR00000001'),('GRP00000003','USR00000003'),('GRP00000003','USR00000005'),('GRP00000003','USR00000007');
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
  DECLARE v_VAL INTEGER;
  SELECT VALUE INTO v_VALUE FROM build_sequences WHERE CODE = v_CODE;
  SET v_VAL = v_VALUE;
  UPDATE build_sequences SET value=v_VALUE+2 WHERE CODE = v_CODE;
	RETURN CONCAT(v_CODE,LPAD(v_VAL,8,'0'));
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
 delim VARCHAR(12),
 pos INT
 ) RETURNS varchar(255) CHARSET utf8
BEGIN
 SET @v_REP_STR := REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),delim, '');
 SET @v_STR := CASE @v_REP_STR WHEN '' THEN NULL ELSE @v_REP_STR END;
RETURN @v_STR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GROUP_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GROUP_DETAILS`(v_GRP_DETAILS LONGTEXT,OUT v_FLAG VARCHAR(20))
BEGIN
DECLARE v_ID VARCHAR(20);
DECLARE v_TITLE VARCHAR(200) DEFAULT  SPLIT_STR(v_GRP_DETAILS,'#',2);
DECLARE v_DELETED VARCHAR(10) DEFAULT SPLIT_STR(v_GRP_DETAILS,'#',3);
DECLARE v_ACTIVE VARCHAR(10) DEFAULT SPLIT_STR(v_GRP_DETAILS,'#',4);
     BEGIN
			DECLARE EXIT HANDLER FOR SQLEXCEPTION
    			BEGIN
              ROLLBACK;
    				  SET @v_ERROR_CODE := '0000';
    				  SET @v_ERROR_MESSAGE := 'Group Error' ;
    				  INSERT INTO ERROR_LOG
    						 (SQL_CODE,SQL_ERRM,USER_DATE,TRANS_HEADING)
    						 VALUES(@v_ERROR_CODE,@v_ERROR_MESSAGE,SYSDATE(),'Group ERROR');
    				  SET v_FLAG = 'Error' ;
    			END;
      START TRANSACTION;
      IF SPLIT_STR(v_GRP_DETAILS,'#',1) IS NULL THEN
       SET v_ID = GET_ID(SPLIT_STR(v_GRP_DETAILS,'#',5));
        INSERT INTO build_group VALUES(v_ID,v_TITLE,v_DELETED,v_ACTIVE);
        COMMIT;
        SET v_FLAG = v_ID;
      ELSE
        UPDATE build_group SET title = SPLIT_STR(v_GRP_DETAILS,'#',2),is_deleted = SPLIT_STR(v_GRP_DETAILS,'#',3),is_active = SPLIT_STR(v_GRP_DETAILS,'#',4) WHERE id = SPLIT_STR(v_GRP_DETAILS,'#',1);
        COMMIT;
        SET v_FLAG = 'Success';
      END IF;
      END;
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

-- Dump completed on 2014-12-10 18:38:57
