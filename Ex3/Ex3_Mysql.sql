use quan_ly_kho;

-- Lọc các sản phẩm có chứa từ 'Điện Thoại' và thuộc loại danh mục có mã là 'Apple'
SELECT tenSP FROM sanpham
INNER JOIN danhmuc ON sanpham.idDM = danhmuc.id
WHERE danhmuc.tenDM LIKE '%Điện thoại%' AND danhmuc.maDM = "Apple";

-- Đếm số sản phẩm trong mỗi loại danh mục, sắp xếp theo thứ tự giảm dần
SELECT tenDM, COUNT(tenDM) as SLSPTungDanhMuc
FROM sanpham
INNER JOIN danhmuc ON sanpham.idDM = danhmuc.id
GROUP BY tenDM
ORDER BY SLSPTungDanhMuc DESC;

-- Xóa danh mục đồng thời xóa luôn các sản phẩm thuộc danh mục đó (Có sử dụng transaction)
START TRANSACTION;
DELETE FROM sanpham 
WHERE sanpham.idDM = 
	( SELECT danhmuc.id FROM danhmuc 
    WHERE danhmuc.maDM LIKE '%Vivo%' );
DELETE FROM danhmuc WHERE danhmuc.maDM LIKE '%Vivo%';
COMMIT;

-- Lấy 10 sản phẩm có số lượng bán nhiều nhất
SELECT tenSP, quantity_sold FROM sanpham 
ORDER BY quantity_sold DESC
LIMIT 10;

/* Viết procedure đáp ứng các yêu cầu sau: 
tìm sản phẩm theo mã hoặc tên và theo mã kho và theo danh mục và theo thời gian tạo, có phân trang 
(theo 2 kiểu: phân trang theo kiểu chọn số trạng và phân trang theo kiểu xem thêm, xem nữa, mỗi trang 10 bản ghi), 
nếu điều kiện nào không nhập thì bỏ qua. */

DELIMITER $$
CREATE PROCEDURE `search_product`(
    IN _ma_hoac_ten VARCHAR(255),
    IN _ma_kho VARCHAR(255),
    IN _ten_danh_muc VARCHAR(255),
    IN _created_at DATETIME,
    IN _page INT
)
BEGIN
  DECLARE `_maSP` VARCHAR(255);
  DECLARE `_tenSP` VARCHAR(255);
  DECLARE `_tenDM` VARCHAR(255);
  DECLARE `_maKho` VARCHAR(255);
  DECLARE `_create_at` DATETIME;
  DECLARE done INT DEFAULT 0;
  DECLARE `result` CURSOR FOR 
    SELECT `SPDM`.`maSP`, `SPDM`.`tenSP`, `SPDM`.`tenDM`, `maKho`, `SPDM`.`create_at` FROM kho INNER JOIN (
      SELECT `sanpham`.`maSP`, `sanpham`.`tenSP`, `danhmuc`.`tenDM`, `sanpham`.`idKho`, `sanpham`.`create_at` FROM `sanpham` INNER JOIN `danhmuc` ON `sanpham`.`idDM` = `danhmuc`.`id`
    ) as SPDM ON `kho`.`id` = `SPDM`.`idKho`;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  DROP TEMPORARY TABLE IF EXISTS results;
  CREATE TEMPORARY TABLE results (
    `maSP` VARCHAR(255),
    `tenSP` VARCHAR(255),
    `tenDM` VARCHAR(255),
    `maKho` VARCHAR(255),
    `create_at` DATETIME
  );

  OPEN `result`;
  label: LOOP
    FETCH `result` INTO `_maSP`, `_tenSP`, `_tenDM`, `_maKho`, `_create_at`;
    
    IF done = 1 THEN
      SET _page = (_page - 1) * 10;
      SELECT * FROM results WHERE
        (`maSP` LIKE CONCAT('%', _ma_hoac_ten, '%') OR `tenSP` LIKE CONCAT('%', _ma_hoac_ten, '%') OR _ma_hoac_ten IS NULL) AND
        (`maKho` LIKE CONCAT('%', _ma_kho, '%') OR _ma_kho IS NULL) AND
        (`tenDM` LIKE CONCAT('%', _ten_danh_muc, '%') OR _ten_danh_muc IS NULL) AND
        (`create_at` = _created_at OR _created_at IS NULL) LIMIT _page, 10;

      DROP TEMPORARY TABLE IF EXISTS results;
      LEAVE label;
    END IF;
    
    INSERT INTO results VALUES (`_maSP`, `_tenSP`, `_tenDM`, `_maKho`, `_create_at`);
  END LOOP label;
  CLOSE `result`;

END $$
DELIMITER ;

select * from danhmuc;
select * from sanpham;
select * from kho;

-- Tạo, lấy danh sách, xóa index bảng sản phẩm 
-- Tạo index
CREATE INDEX indexSP on sanpham (tenSP);
-- Lấy danh sách index
SHOW INDEX FROM sanpham;
-- Xóa index
DROP INDEX indexSP ON sanpham;

