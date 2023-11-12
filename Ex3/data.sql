USE quan_ly_kho;

DROP TABLE IF EXISTS `danh_muc`;
CREATE TABLE `danh_muc` (
  `id` int NOT NULL,
  `ma_danh_muc` varchar(45) NOT NULL,
  `ten_danh_muc` varchar(45) NOT NULL,
  `decription` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `danh_muc` 
VALUES 
(1,'Apple','Điện thoại','Top 20 các hãng điện thoại tại VN','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(2,'Samsung','Điện thoại','Top 20 các hãng điện thoại tại VN','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(3,'Xiaomi','Điện thoại','Top 20 các hãng điện thoại tại VN','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(4,'Vivo','Điện thoại','Top 20 các hãng điện thoại tại VN','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(5,'Samsung','Tivi','Top thương hiệu tivi cao cấp hiện nay','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(6,'Dell','Máy Tính','Top 15 các hãng Laptop nổi tiếng, bền, đẹp nhất thế giới','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(7,'Acer','Máy Tính','Top 15 các hãng Laptop nổi tiếng, bền, đẹp nhất thế giới','2023-01-01 00:00:00','2023-03-24 00:00:00'),
(8,'Lenovo','Máy Tính','Top 15 các hãng Laptop nổi tiếng, bền, đẹp nhất thế giới','2023-01-01 00:00:00','2023-03-24 00:00:00');

----------------------------------------------

DROP TABLE IF EXISTS `kho`;
CREATE TABLE `kho` (
  `id` int NOT NULL,
  `ma_kho` varchar(45) NOT NULL,
  `ten_san_pham` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `kho` 
VALUES 
(1,'A01','Kho A1','Hà Nội','2023-01-01 00:00:00','2023-03-11 00:00:00'),
(2,'A02','Kho A2','Đà Nẵng','2023-01-01 00:00:00','2023-03-11 00:00:00'),
(3,'A03','Kho A3','TP HCM','2023-01-01 00:00:00','2023-03-11 00:00:00'),
(4,'A04','Kho A4','Thanh Hóa','2023-01-01 00:00:00','2023-03-11 00:00:00'),
(5,'A05','Kho A5','Pleiku','2023-01-01 00:00:00','2023-03-11 00:00:00'),
(6,'A06','Kho A6','Nha Trang','2023-01-01 00:00:00','2023-03-11 00:00:00');

----------------------------------------------

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE `san_pham` (
  `id` int NOT NULL,
  `ma_san_pham` varchar(45) NOT NULL,
  `id_danh_muc` int NOT NULL,
  `id_kho` int NOT NULL,
  `ten_san_pham` varchar(45) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `decription` varchar(150) NOT NULL,
  `link_image` varchar(100) NOT NULL,
  `quantity_stock` int NOT NULL,
  `quantity_sold` int NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_id_danh_muc` FOREIGN KEY (`id_danh_muc`) REFERENCES `danh_muc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_kho` FOREIGN KEY (`id_kho`) REFERENCES `kho` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `san_pham` 
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
