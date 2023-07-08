DROP TABLE IF EXISTS chapter;
CREATE TABLE chapter (
  id int NOT NULL,
  name varchar(45) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES chapter WRITE;
INSERT INTO chapter VALUES (1,'The Fish'),(2,'Number of a Man'),(3,'Men on the Boat'),(4,'Measure of a Man'),(5,'Skilled Men'),(6,'Time, Times, and a Half of Time'),(7,'Generations'),(8,'Crosswise');
UNLOCK TABLES;

DROP TABLE IF EXISTS chapter_reference;
CREATE TABLE chapter_reference (
  id int NOT NULL,
  chapterId int NOT NULL,
  description varchar(2000) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES chapter_reference WRITE;
INSERT INTO `chapter_reference` VALUES (1,1,'Matthew 4'),(2,1,'Mark 1'),(3,1,'Luke 4'),(4,1,'John 21'),(5,1,'Ezekiel 47'),(6,1,'Jeremiah 16'),(7,2,'Revelation 13'),(8,3,'Acts 27'),(9,4,'Revelation 21'),(10,4,'Ezekiel 40-48'),(11,4,'Genesis 6-9'),(12,5,'Genesis 14'),(13,6,'Daniel 7'),(14,6,'Daniel 12'),(15,6,'Revelation 11'),(16,6,'Revelation 12'),(17,6,'1 Kings 17-19'),(18,6,'Luke 4'),(19,6,'James 5'),(20,7,'Matthew 1');
UNLOCK TABLES;

DROP PROCEDURE IF EXISTS get_book;

DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE get_book()
BEGIN
SELECT c.id Chapter, c.name Title, GROUP_CONCAT(cr.description ORDER BY name ASC SEPARATOR ', ') Reference
   from chapter c
        LEFT JOIN chapter_reference cr ON c.id = cr.chapterId
GROUP BY c.name, c.id
   order by c.id;
END$$
DELIMITER ;