-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: bam_banimals_adventure_db
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `high_score`
--

DROP TABLE IF EXISTS `high_score`;
/*!50001 DROP VIEW IF EXISTS `high_score`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `high_score` AS SELECT 
 1 AS `id_USER_SCORE`,
 1 AS `Nickname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `LEVELS`
--

DROP TABLE IF EXISTS `LEVELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LEVELS` (
  `id_LEVELS` int unsigned NOT NULL AUTO_INCREMENT,
  `TimesPlayed` int NOT NULL,
  PRIMARY KEY (`id_LEVELS`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEVELS`
--

LOCK TABLES `LEVELS` WRITE;
/*!40000 ALTER TABLE `LEVELS` DISABLE KEYS */;
INSERT INTO `LEVELS` VALUES (1,1),(2,21),(3,30),(4,6),(5,10),(6,2),(7,55),(8,90),(9,2),(10,29),(11,89),(12,11),(13,67),(14,86),(15,43),(16,29),(17,36),(18,58),(19,9),(20,47),(21,40),(22,61),(23,78),(24,95),(25,54),(26,52);
/*!40000 ALTER TABLE `LEVELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `max_high_score`
--

DROP TABLE IF EXISTS `max_high_score`;
/*!50001 DROP VIEW IF EXISTS `max_high_score`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `max_high_score` AS SELECT 
 1 AS `Nickname`,
 1 AS `Bambastic`,
 1 AS `Noice`,
 1 AS `Keep_trying`,
 1 AS `Oops`,
 1 AS `total_bambastic`,
 1 AS `total_noice`,
 1 AS `total_KT`,
 1 AS `total_Oops`,
 1 AS `Final_Score`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `id_USER` int unsigned NOT NULL AUTO_INCREMENT,
  `Nickname` varchar(255) NOT NULL,
  PRIMARY KEY (`id_USER`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'ariigato'),(2,'yelatina'),(3,'AndyPandy'),(4,'Jaboobs'),(5,'G0lden W0lf'),(6,'Octa'),(7,'Josh'),(8,'Capimuse'),(9,'MarcoPolo'),(10,'Jajavi'),(11,'Vance'),(12,'Aditya'),(13,'Amari'),(14,'Zack'),(15,'Nyla'),(16,'Misael'),(17,'Nathan'),(18,'Catalina'),(19,'Kaia'),(20,'Salvatore'),(21,'Dashawn'),(22,'Shelby'),(23,'Hanna'),(24,'Oscar'),(25,'Madalynn'),(26,'Hunter'),(27,'Alfredo'),(28,'Elaina'),(29,'Vance'),(30,'Krish'),(31,'yELIUUUUX');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SCORE`
--

DROP TABLE IF EXISTS `USER_SCORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SCORE` (
  `id_USER_SCORE` int unsigned NOT NULL AUTO_INCREMENT,
  `id_USER` int unsigned NOT NULL,
  `id_LEVELS` int unsigned NOT NULL,
  `Bambastic` int NOT NULL,
  `Noice` int NOT NULL,
  `Keep_trying` int NOT NULL,
  `Oops` int NOT NULL,
  `total_score` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_USER_SCORE`),
  KEY `fk_id_USER` (`id_USER`),
  KEY `fk_id_LEVELS` (`id_LEVELS`),
  CONSTRAINT `fk_id_LEVELS` FOREIGN KEY (`id_LEVELS`) REFERENCES `LEVELS` (`id_LEVELS`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_id_USER` FOREIGN KEY (`id_USER`) REFERENCES `USER` (`id_USER`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SCORE`
--

LOCK TABLES `USER_SCORE` WRITE;
/*!40000 ALTER TABLE `USER_SCORE` DISABLE KEYS */;
INSERT INTO `USER_SCORE` VALUES (1,1,1,3,2,1,0,0),(2,2,1,3,2,1,0,0),(3,3,1,3,2,1,0,0),(4,4,1,3,2,1,0,0),(5,5,1,3,2,1,0,0),(6,22,12,12,16,15,1,0),(7,30,5,9,15,5,1,0),(8,21,2,4,17,18,8,0),(9,7,22,16,17,10,10,0),(10,8,25,14,17,8,7,0),(11,16,18,14,9,20,16,0),(12,30,6,17,3,16,16,0),(13,2,24,18,1,9,10,0),(14,25,10,5,5,2,3,0),(15,7,10,2,15,3,4,0),(16,2,14,11,7,15,11,0),(17,27,17,18,14,12,18,0),(18,1,9,13,5,16,7,0),(19,21,18,18,11,7,8,0),(20,16,17,4,11,17,8,0),(21,6,23,19,2,15,10,0),(22,12,2,1,9,2,2,0),(23,21,7,15,15,14,1,0),(24,24,11,15,13,16,8,0),(25,29,15,4,15,18,6,0);
/*!40000 ALTER TABLE `USER_SCORE` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `USER_SCORE_BEFORE_UPDATE` BEFORE UPDATE ON `user_score` FOR EACH ROW BEGIN
	IF coalesce(Bambastic) * 3 + coalesce(Noice) * 2 + coalesce(Keep_trying) * 1 + coalesce(Oops) * 0 > old.total_score THEN
		SET new.total_score = coalesce(Bambastic) * 3 + coalesce(Noice) * 2 + coalesce(Keep_trying) * 1 + coalesce(Oops) * 0;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'bam_banimals_adventure_db'
--

--
-- Dumping routines for database 'bam_banimals_adventure_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_attempt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attempt`(in LEVELS int)
BEGIN
	select TimesPlayed
    from LEVELS
    where LEVELS = id_LEVELS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_score` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_score`(in player varchar(255))
BEGIN
	select total_score
    from USER_SCORE usc
    inner join user u on usc.id_USER_SCORE = u.id_USER
    where nickname = player;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `high_score`
--

/*!50001 DROP VIEW IF EXISTS `high_score`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `high_score` AS select `user_score`.`id_USER_SCORE` AS `id_USER_SCORE`,`user`.`Nickname` AS `Nickname` from (`user_score` join `user`) order by `user_score`.`Bambastic`,`user_score`.`Noice`,`user_score`.`Keep_trying`,`user_score`.`Oops` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `max_high_score`
--

/*!50001 DROP VIEW IF EXISTS `max_high_score`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `max_high_score` AS select `U`.`Nickname` AS `Nickname`,`US`.`Bambastic` AS `Bambastic`,`US`.`Noice` AS `Noice`,`US`.`Keep_trying` AS `Keep_trying`,`US`.`Oops` AS `Oops`,(coalesce(`US`.`Bambastic`) * 3) AS `total_bambastic`,(coalesce(`US`.`Noice`) * 2) AS `total_noice`,(coalesce(`US`.`Keep_trying`) * 1) AS `total_KT`,(coalesce(`US`.`Oops`) * 0) AS `total_Oops`,((((coalesce(`US`.`Bambastic`) * 3) + (coalesce(`US`.`Noice`) * 2)) + (coalesce(`US`.`Keep_trying`) * 1)) + (coalesce(`US`.`Oops`) * 0)) AS `Final_Score` from (`user_score` `US` join `user` `U` on((`U`.`id_USER` = `US`.`id_USER_SCORE`))) order by `U`.`Nickname` */;
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

-- Dump completed on 2022-05-04  0:05:30
