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
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `id` int NOT NULL,
  `maSP` varchar(45) NOT NULL,
  `idDM` int NOT NULL,
  `idKho` int NOT NULL,
  `tenSP` varchar(45) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `decription` varchar(150) NOT NULL,
  `link_Image` varchar(100) NOT NULL,
  `quantity_stock` int NOT NULL,
  `quantity_sold` int NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idKho_idx` (`idKho`),
  KEY `idDM_idx` (`idDM`),
  CONSTRAINT `idDM` FOREIGN KEY (`idDM`) REFERENCES `danhmuc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idKho` FOREIGN KEY (`idKho`) REFERENCES `kho` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` 
VALUES 
(1,'SP1',1,1,'iPhone 6 128GB',7990000,'t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.','Lorem Ipsum ',6,12,'2023-02-01 00:00:00','2023-04-24 00:00:00'),
(2,'SP2',8,1,'Lenovo Yoga Slim 7 Pro',27990000,'Lorem Ipsum is simply dummy text of the printing and typesetting industry.','Lorem Ipsum ',12,23,'2023-04-23 00:00:00','2023-05-24 00:00:00'),(3,'SP3',4,1,'Vivo Y22S',4090000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ','Lorem Ipsum ',5,53,'2023-10-12 00:00:00','2023-11-20 00:00:00'),
(4,'SP4',5,1,'Smart Tivi Samsung Neo QLED 4K 85 inch',39890000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ','Lorem Ipsum ',0,2,'2023-08-11 00:00:00','2023-10-31 00:00:00'),
(5,'SP5',7,2,'Laptop Acer Aspire 7 A715 43G R8GA',17490000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ','Lorem Ipsum ',10,54,'2023-01-01 00:00:00','2023-10-01 00:00:00'),
(6,'SP6',3,2,'Xiaomi 13',17500000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using','Lorem Ipsum ',7,65,'2023-10-02 00:00:00','2023-11-30 00:00:00'),
(7,'SP7',4,3,'Vivo V27e',6999000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using','Lorem Ipsum ',3,2,'2023-05-23 00:00:00','2023-09-16 00:00:00'),
(8,'SP8',6,3,'Laptop Dell Inspiron 14 7420',18990000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ','Lorem Ipsum ',17,43,'2023-01-17 00:00:00','2023-02-11 00:00:00'),
(9,'SP9',1,3,'iPhone 12 256GB',1999000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using','Lorem Ipsum ',5,2,'2023-11-11 00:00:00','2023-12-11 00:00:00'),
(10,'SP10',3,3,'Xiaomi 12T Pro',14690000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using','Lorem Ipsum ',23,32,'2023-11-20 00:00:00','2023-11-24 00:00:00'),
(11,'SP11',8,4,'Lenovo IdeaPad Duet 3 10IGL5',8990000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using','Lorem Ipsum ',65,4,'2023-01-23 00:00:00','2023-01-24 00:00:00'),
(12,'SP12',2,4,'Samsung Galaxy A24 8GB',6990000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using','Lorem Ipsum ',8,2,'2023-10-31 00:00:00','2023-11-08 00:00:00'),
(13,'SP13',6,5,'Laptop Dell Vostro 3400',16990000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using','Lorem Ipsum ',3,34,'2023-09-16 00:00:00','2023-12-12 00:00:00'),
(14,'SP14',3,5,'Xiaomi 13 Pro',23490000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using','Lorem Ipsum ',23,4,'2023-02-11 00:00:00','2023-04-23 00:00:00'),
(15,'SP15',4,6,'Vivo T1X',3590000,'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using','Lorem Ipsum ',54,76,'2023-04-24 00:00:00','2023-05-01 00:00:00');
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
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
