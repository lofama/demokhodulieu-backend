SELECT
  `dashboard`.`salesummary`.`Ngay` AS `Ngay`,
  `dashboard`.`salesummary`.`Thang` AS `Thang`,
  `dashboard`.`salesummary`.`Nam` AS `Nam`,
  `dashboard`.`salesummary`.`MaKH` AS `MaKH`,
  `dashboard`.`salesummary`.`TenKH` AS `TenKH`,
  `dashboard`.`salesummary`.`LoaiKH` AS `LoaiKH`,
  `dashboard`.`salesummary`.`MaMatHang` AS `MaMatHang`,
  `dashboard`.`salesummary`.`MoTa` AS `MoTa`,
  `dashboard`.`salesummary`.`KichCo` AS `KichCo`,
  `dashboard`.`salesummary`.`TrongLuong` AS `TrongLuong`,
  `dashboard`.`salesummary`.`Gia` AS `Gia`,
  `dashboard`.`salesummary`.`TenThanhPho` AS `TenThanhPho`,
  `dashboard`.`salesummary`.`Bang` AS `Bang`,
  sum(IFNULL(`dashboard`.`salesummary`.`SoLuongDat`, 0)) AS `TongSoLuongDat`,
  sum(IFNULL(`dashboard`.`salesummary`.`ThanhTien`, 0)) AS `TongDoanhThu`
FROM
  `dashboard`.`salesummary`
GROUP BY
  `dashboard`.`salesummary`.`Ngay`,
  `dashboard`.`salesummary`.`Thang`,
  `dashboard`.`salesummary`.`Nam`,
  `dashboard`.`salesummary`.`MaKH`,
  `dashboard`.`salesummary`.`TenKH`,
  `dashboard`.`salesummary`.`LoaiKH`,
  `dashboard`.`salesummary`.`MaMatHang`,
  `dashboard`.`salesummary`.`MoTa`,
  `dashboard`.`salesummary`.`KichCo`,
  `dashboard`.`salesummary`.`TrongLuong`,
  `dashboard`.`salesummary`.`Gia`,
  `dashboard`.`salesummary`.`TenThanhPho`,
  `dashboard`.`salesummary`.`Bang`