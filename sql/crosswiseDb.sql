CREATE DATABASE  IF NOT EXISTS `crosswise` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crosswise`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: crosswise
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapter` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;
INSERT INTO `chapter` VALUES (1,'The Fish'),(2,'Number of a Man'),(3,'Men on the Boat'),(4,'Measure of a Man'),(5,'Skilled Men'),(6,'Time, Times, and a Half of Time'),(7,'Generations'),(8,'Crosswise');
/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter_reference`
--

DROP TABLE IF EXISTS `chapter_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapter_reference` (
  `id` int NOT NULL,
  `chapterId` int NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_chapterId_idx` (`chapterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter_reference`
--

LOCK TABLES `chapter_reference` WRITE;
/*!40000 ALTER TABLE `chapter_reference` DISABLE KEYS */;
INSERT INTO `chapter_reference` VALUES (1,1,'Matthew 4'),(2,1,'Mark 1'),(3,1,'Luke 4'),(4,1,'John 21'),(5,1,'Ezekiel 47'),(6,1,'Jeremiah 16'),(7,2,'Revelation 13'),(8,3,'Acts 27'),(9,4,'Revelation 21'),(10,4,'Ezekiel 40-48'),(11,4,'Genesis 6-9'),(12,5,'Genesis 14'),(13,6,'Daniel 7'),(14,6,'Daniel 12'),(15,6,'Revelation 11'),(16,6,'Revelation 12'),(17,6,'1 Kings 17-19'),(18,6,'Luke 4'),(19,6,'James 5'),(20,7,'Matthew 1'),(21,8,'12 x 3.5 = 14 x 3');
/*!40000 ALTER TABLE `chapter_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter_reference_todo`
--

DROP TABLE IF EXISTS `chapter_reference_todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapter_reference_todo` (
  `id` int NOT NULL,
  `chapter_referenceId` int DEFAULT NULL,
  `Summary` tinytext,
  `Detail` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_chapter_referenceId_idx` (`chapter_referenceId`),
  CONSTRAINT `fk_chapter_referenceId` FOREIGN KEY (`chapter_referenceId`) REFERENCES `chapter_reference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter_reference_todo`
--

LOCK TABLES `chapter_reference_todo` WRITE;
/*!40000 ALTER TABLE `chapter_reference_todo` DISABLE KEYS */;
INSERT INTO `chapter_reference_todo` VALUES (1,1,'Jesus to disciples - I will make you fishers of people',' '),(2,2,'Jesus to disciples - I will make you fishers of people',' '),(3,3,'Jesus replied to Simon - Don’t be afraid! From now on you’ll be fishing for people!',' '),(4,4,'Jesus to disciples - Fellows, have you caught any fish?','153 fish eventually'),(5,5,'From En-gedi to En-eglaim','Gematria to 17 and 153 see:: 153 fish John 21'),(6,6,'Fished or hunted?',' '),(7,7,'tbd',' '),(8,8,'14 days fasting','Relate to Genesis 14 and Matthew 1'),(9,9,'144','Ratio earth : heaven relate to Ezekiel 40-48 Genesis 6-9'),(10,10,'Ezekiel\'s City','Subject to Revelation 21'),(11,11,'Days of man, Noah\'s Ark','Subject to Revelation 21'),(12,12,'14 years war','Relate to Matthew 1 and Acts 27'),(13,13,'3.5 years',' '),(14,14,'3.5 years',' '),(15,15,'3.5 years',' '),(16,16,'3.5 years',' '),(17,17,'3.5 years',' '),(18,18,'3.5 years',' '),(19,19,'3.5 years',' '),(20,20,'14 generations 3 times','Relate to Genesis 14 and Acts 27'),(21,21,'Put it all together',' ');
/*!40000 ALTER TABLE `chapter_reference_todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'crosswise'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_book`()
BEGIN
SELECT c.id Chapter, c.name Title, GROUP_CONCAT(cr.description ORDER BY name ASC SEPARATOR ', ') Reference
   from chapter c
        LEFT JOIN chapter_reference cr ON c.id = cr.chapterId
GROUP BY c.name, c.id
   order by c.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_todo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_todo`()
BEGIN
SELECT c.id Chapter, cr.description Reference, crt.Summary, crt.Detail
   from chapter c
        LEFT JOIN chapter_reference cr ON c.id = cr.chapterId
        LEFT JOIN chapter_reference_todo crt ON cr.id = crt.chapter_referenceId
   order by c.id;
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

-- Dump completed on 2023-07-10 15:47:00
