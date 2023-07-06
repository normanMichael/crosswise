DROP TABLE IF EXISTS `chapter`;

CREATE TABLE `chapter` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `chapter` WRITE;

INSERT INTO `chapter` VALUES (1,'Fishers'),(2,'The Fish'),(3,'Number of a Man'),(4,'Men on the Boat'),(5,'Measure of a Man'),(6,'Skilled Men'),(7,'Time, Times, and a Half of Time'),(8,'Generations'),(9,'Crosswise');

UNLOCK TABLES;
