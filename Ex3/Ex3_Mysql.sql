use quan_ly_kho;

-- Lọc các sản phẩm có chứa từ 'Điện Thoại' và thuộc loại danh mục có mã là 'Apple'
SELECT ten_san_pham FROM san_pham
INNER JOIN danh_muc ON san_pham.id_danh_muc = danh_muc.id
WHERE danh_muc.ten_danh_muc LIKE '%Điện thoại%' AND danh_muc.ma_danh_muc = "Apple";

-- Đếm số sản phẩm trong mỗi loại danh mục, sắp xếp theo thứ tự giảm dần
SELECT ten_danh_muc, COUNT(ten_danh_muc) as SLSPTungDanhMuc
FROM san_pham
INNER JOIN danh_muc ON san_pham.id_danh_muc = danh_muc.id
GROUP BY ten_danh_muc
ORDER BY SLSPTungDanhMuc DESC;

-- Xóa danh mục đồng thời xóa luôn các sản phẩm thuộc danh mục đó (Có sử dụng transaction)
START TRANSACTION;
DELETE FROM san_pham 
WHERE san_pham.id_danh_muc = 
	( SELECT danh_muc.id FROM danh_muc 
    WHERE danh_muc.ma_danh_muc LIKE '%Vivo%' );
DELETE FROM danh_muc WHERE danh_muc.ma_danh_muc LIKE '%Vivo%';
COMMIT;

-- Lấy 10 sản phẩm có số lượng bán nhiều nhất
SELECT ten_san_pham, quantity_sold FROM sanpham 
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
  DECLARE `_ma_san_pham` VARCHAR(255);
  DECLARE `_ten_san_pham` VARCHAR(255);
  DECLARE `_ten_danh_muc` VARCHAR(255);
  DECLARE `_ma_kho` VARCHAR(255);
  DECLARE `_create_at` DATETIME;
  DECLARE done INT DEFAULT 0;
  DECLARE `result` CURSOR FOR 
    SELECT `SPDM`.`ma_san_pham`, `SPDM`.`ten_san_pham`, `SPDM`.`ten_danh_muc`, `ma_kho`, `SPDM`.`create_at` FROM kho INNER JOIN (
      SELECT `san_pham`.`ma_san_pham`, `san_pham`.`ten_san_pham`, `danh_muc`.`ten_danh_muc`, `san_pham`.`id_kho`, `san_pham`.`create_at` FROM `san_pham` INNER JOIN `danh_muc` ON `san_pham`.`id_danh_muc` = `danh_muc`.`id`
    ) as SPDM ON `kho`.`id` = `SPDM`.`id_kho`;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  DROP TEMPORARY TABLE IF EXISTS results;
  CREATE TEMPORARY TABLE results (
    `ma_san_pham` VARCHAR(255),
    `ten_san_pham` VARCHAR(255),
    `ten_danh_muc` VARCHAR(255),
    `ma_kho` VARCHAR(255),
    `create_at` DATETIME
  );

  OPEN `result`;
  label: LOOP
    FETCH `result` INTO `_ma_san_pham`, `_ten_san_pham`, `_ten_danh_muc`, `_ma_kho`, `_create_at`;
    
    IF done = 1 THEN
      SET _page = (_page - 1) * 10;
      SELECT * FROM results WHERE
        (`ma_san_pham` LIKE CONCAT('%', _ma_hoac_ten, '%') OR `tenSP` LIKE CONCAT('%', _ma_hoac_ten, '%') OR _ma_hoac_ten IS NULL) AND
        (`ma_kho` LIKE CONCAT('%', _ma_kho, '%') OR _ma_kho IS NULL) AND
        (`ten_danh_muc` LIKE CONCAT('%', _ten_danh_muc, '%') OR _ten_danh_muc IS NULL) AND
        (`create_at` = _created_at OR _created_at IS NULL) LIMIT _page, 10;

      DROP TEMPORARY TABLE IF EXISTS results;
      LEAVE label;
    END IF;
    
    INSERT INTO results VALUES (`_ma_san_pham`, `_ten_san_pham`, `_ten_danh_muc`, `_ma_kho`, `_create_at`);
  END LOOP label;
  CLOSE `result`;

END $$
DELIMITER ;

select * from danh_muc;
select * from san_pham;
select * from kho;

-- Tạo, lấy danh sách, xóa index bảng sản phẩm 
-- Tạo index
CREATE INDEX index_san_pham on san_pham (ten_san_pham);
-- Lấy danh sách index
SHOW INDEX FROM san_pham;
-- Xóa index
DROP INDEX index_san_pham ON san_pham;

