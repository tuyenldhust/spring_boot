-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: quan_ly_kho
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `danhmuc`
--

DROP TABLE IF EXISTS `danhmuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhmuc` (
  `id` int NOT NULL,
  `maDM` varchar(45) NOT NULL,
  `tenDM` varchar(45) NOT NULL,
  `decription` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idDM_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhmuc`
--

LOCK TABLES `danhmuc` WRITE;
/*!40000 ALTER TABLE `danhmuc` DISABLE KEYS */;
INSERT INTO `danhmuc` 
VALUES 
(1,'Apple','Điện thoại','Top 20 các hãng điện thoại tại VN','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(2,'Samsung','Điện thoại','Top 20 các hãng điện thoại tại VN','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(3,'Xiaomi','Điện thoại','Top 20 các hãng điện thoại tại VN','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(4,'Vivo','Điện thoại','Top 20 các hãng điện thoại tại VN','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(5,'Samsung','Tivi','Top thương hiệu tivi cao cấp hiện nay','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(6,'Dell','Máy Tính','Top 15 các hãng Laptop nổi tiếng, bền, đẹp nhất thế giới','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(7,'Acer','Máy Tính','Top 15 các hãng Laptop nổi tiếng, bền, đẹp nhất thế giới','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(8,'Lenovo','Máy Tính','Top 15 các hãng Laptop nổi tiếng, bền, đẹp nhất thế giới','2023-01-01 00:00:00','2023-03-24 00:00:00');
/*!40000 ALTER TABLE `danhmuc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-04 21:52:12
