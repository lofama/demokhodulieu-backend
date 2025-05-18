USE dashboard;
;

-- View theo Ngày
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_MaKH_MaMatHang  AS
SELECT
    Ngay, Thang, Nam,
    MaKH, TenKH, LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam,
    MaKH, TenKH, LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Tháng
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_MaKH_MaMatHang  AS
SELECT
    Nam, Thang,
    MaKH, TenKH, LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang,
    MaKH, TenKH, LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Quý
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_MaKH_MaMatHang  AS
SELECT
    Nam, Quy, LoaiKH,
    MaKH, TenKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy,
    LoaiKH,
    MaKH, TenKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Năm
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_MaKH_MaMatHang  AS
SELECT
    Nam,
    MaKH, TenKH, LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,
    MaKH, TenKH, LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View tổng hợp All (ko phân cấp thời gian)
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_MaKH_MaMatHang  AS
SELECT
    MaKH, TenKH, LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MaKH, TenKH, LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-----------KhachHang len 1 cấp

-- View theo Ngày - LoaiKH
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_LoaiKH_MaMatHang  AS
SELECT
    Ngay, Thang, Nam, LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam, LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Tháng LoaiKH
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_LoaiKH_MaMatHang  AS
SELECT
    Nam, Thang,
     LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang,
     LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Quý
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_LoaiKH_MaMatHang  AS
SELECT
    Nam, Quy, LoaiKH,
    
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy,
    LoaiKH,
    
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Năm
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_LoaiKH_MaMatHang  AS
SELECT
    Nam,
     LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,
     LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View tổng hợp All (ko phân cấp thời gian) LoaiKH 
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_LoaiKH_MaMatHang  AS
SELECT
     LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    LoaiKH,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;
-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho
-- View theo Ngày - ThanhPho
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_ThanhPho_MaMatHang  AS
SELECT
    Ngay, Thang, Nam,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Tháng ThanhPho
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_ThanhPho_MaMatHang  AS
SELECT
    Nam, Thang,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,MaThanhPho,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang,MaThanhPho,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Quý ThanhPho
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_ThanhPho_MaMatHang  AS
SELECT
    Nam, Quy,MaThanhPho,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy,
    MaThanhPho,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Năm ThanhPho
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_ThanhPho_MaMatHang  AS
SELECT
    Nam,
    MaThanhPho,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,
    MaThanhPho,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View tổng hợp All (ko phân cấp thời gian) ThanhPho 
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_ThanhPho_MaMatHang  AS
SELECT
    MaThanhPho,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MaThanhPho,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho -> Bang
-- View theo Ngày - Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_Bang_MaMatHang  AS
SELECT
    Ngay, Thang, Nam,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    Bang
;

-- View theo Tháng Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_Bang_MaMatHang  AS
SELECT
    Nam, Thang,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    Bang
;

-- View theo Quý Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_Bang_MaMatHang  AS
SELECT
    Nam, Quy,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    Bang
;

-- View theo Năm Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_Bang_MaMatHang  AS
SELECT
    Nam,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    Bang
;

-- View tổng hợp All (ko phân cấp thời gian) Bang 
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_Bang_MaMatHang  AS
SELECT
    MaMatHang, MoTa, KichCo, TrongLuong, Gia, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MaMatHang, MoTa, KichCo, TrongLuong, Gia, Bang
;

-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho -> Bang ->All
-- View theo Ngày - AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_AllKhachHang_MaMatHang  AS
SELECT
    Ngay, Thang, Nam,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia
;

-- View theo Tháng AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_AllKhachHang_MaMatHang  AS
SELECT
    Nam, Thang,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia
;

-- View theo Quý AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_ThanhPho_MaMatHang  AS
SELECT
    Nam, Quy,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia
;

-- View theo Năm AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_AllKhachHang_MaMatHang  AS
SELECT
    Nam,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,
    MaMatHang, MoTa, KichCo, TrongLuong, Gia
;

-- View tổng hợp All (ko phân cấp thời gian) AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_AllKhachHang_MaMatHang  AS
SELECT
    MaMatHang, MoTa, KichCo, TrongLuong, Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MaMatHang, MoTa, KichCo, TrongLuong, Gia
;
--------- Khách Hàng MaMH-> KichCo

-- View theo Ngày KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_MaKH_KichCo  AS
SELECT
    Ngay, Thang, Nam,
    MaKH, TenKH, LoaiKH,
    MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam,
    MaKH, TenKH, LoaiKH,
    MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Tháng KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_MaKH_KichCo  AS
SELECT
    Nam, Thang,
    MaKH, TenKH, LoaiKH,
    MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang,
    MaKH, TenKH, LoaiKH,
    MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Quý KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_MaKH_KichCo  AS
SELECT
    Nam, Quy, LoaiKH,
    MaKH, TenKH,
    MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy,
    LoaiKH,
    MaKH, TenKH,
    MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Năm KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_MaKH_KichCo  AS
SELECT
    Nam,
    MaKH, TenKH, LoaiKH,
    MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,
    MaKH, TenKH, LoaiKH,
    MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View tổng hợp All (ko phân cấp thời gian) KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_MaKH_KichCo  AS
SELECT
    MaKH, TenKH, LoaiKH,
     MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MaKH, TenKH, LoaiKH,
    MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-----------KhachHang len 1 cấp
 
-- View theo Ngày - LoaiKH KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_LoaiKH_KichCo  AS
SELECT
    Ngay, Thang, Nam, LoaiKH,
     MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam, LoaiKH,
    MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Tháng LoaiKH KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_LoaiKH_KichCo  AS
SELECT
    Nam, Thang,
     LoaiKH,
     MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang,
     LoaiKH,
     MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Quý KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_LoaiKH_KichCo  AS
SELECT
    Nam, Quy, LoaiKH,
    MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy,
    LoaiKH, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Năm KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_LoaiKH_KichCo  AS
SELECT
    Nam, LoaiKH,  MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,
     LoaiKH, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;
 
-- View tổng hợp All (ko phân cấp thời gian) LoaiKH KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_LoaiKH_KichCo  AS
SELECT
     LoaiKH, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    LoaiKH, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;
-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho
-- View theo Ngày - ThanhPho KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_ThanhPho_KichCo  AS
SELECT
    Ngay, Thang, Nam, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Tháng ThanhPho KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_ThanhPho_KichCo  AS
SELECT
    Nam, Thang, MoTa, KichCo, TrongLuong, Gia,MaThanhPho,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang,MaThanhPho, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Quý ThanhPho KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_ThanhPho_KichCo  AS
SELECT
    Nam, Quy,MaThanhPho, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy,
    MaThanhPho, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View theo Năm ThanhPho KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_ThanhPho_KichCo  AS
SELECT
    Nam,
    MaThanhPho, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,
    MaThanhPho,  MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- View tổng hợp All (ko phân cấp thời gian) ThanhPho KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_ThanhPho_KichCo  AS
SELECT
    MaThanhPho, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MaThanhPho, MoTa, KichCo, TrongLuong, Gia,
    TenThanhPho, Bang
;

-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho -> Bang
-- View theo Ngày - Bang KichCo
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_Bang_KichCo  AS
SELECT
    Ngay, Thang, Nam, MoTa, KichCo, TrongLuong, Gia,
    Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam, MoTa, KichCo, TrongLuong, Gia,
    Bang
;

-- View theo Tháng Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_Bang_KichCo  AS
SELECT
    Nam, Thang, MoTa, KichCo, TrongLuong, Gia, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang, MoTa, KichCo, TrongLuong, Gia,
    Bang
;

-- View theo Quý Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_Bang_KichCo  AS
SELECT
    Nam, Quy, MoTa, KichCo, TrongLuong, Gia,
    Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy, MoTa, KichCo, TrongLuong, Gia,
    Bang
;

-- View theo Năm Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_Bang_KichCo  AS
SELECT
    Nam, MoTa, KichCo, TrongLuong, Gia,Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,  MoTa, KichCo, TrongLuong, Gia,
    Bang
;

-- View tổng hợp All (ko phân cấp thời gian) Bang 
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_Bang_KichCo  AS
SELECT
    MoTa, KichCo, TrongLuong, Gia, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MoTa, KichCo, TrongLuong, Gia, Bang
;

-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho -> Bang ->All
-- View theo Ngày - AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_AllKhachHang_KichCo  AS
SELECT
    Ngay, Thang, Nam,
     MoTa, KichCo, TrongLuong, Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam,
      MoTa, KichCo, TrongLuong, Gia
;

-- View theo Tháng AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_AllKhachHang_KichCo  AS
SELECT
    Nam, Thang, MoTa, KichCo, TrongLuong, Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang, MoTa, KichCo, TrongLuong, Gia
;

-- View theo Quý AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_ThanhPho_KichCo  AS
SELECT
    Nam, Quy,  MoTa, KichCo, TrongLuong, Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy, MoTa, KichCo, TrongLuong, Gia
;

-- View theo Năm AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_AllKhachHang_KichCo  AS
SELECT
    Nam,  MoTa, KichCo, TrongLuong, Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,  MoTa, KichCo, TrongLuong, Gia
;

-- View tổng hợp All (ko phân cấp thời gian) AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_AllKhachHang_KichCo  AS
SELECT 
	MoTa, KichCo, TrongLuong, Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MoTa, KichCo, TrongLuong, Gia
;

--------- Khách Hàng MaMH-> MoTa

-- View theo Ngày MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_MaKH_MoTa  AS
SELECT
    Ngay, Thang, Nam,
    MaKH, TenKH, LoaiKH,
    MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam,
    MaKH, TenKH, LoaiKH,
    MoTa,   Gia,
    TenThanhPho, Bang
;

-- View theo Tháng MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_MaKH_MoTa  AS
SELECT
    Nam, Thang,
    MaKH, TenKH, LoaiKH,
    MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang,
    MaKH, TenKH, LoaiKH,
    MoTa,   Gia,
    TenThanhPho, Bang
;

-- View theo Quý MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_MaKH_MoTa  AS
SELECT
    Nam, Quy, LoaiKH,
    MaKH, TenKH,
    MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy,
    LoaiKH,
    MaKH, TenKH,
    MoTa,   Gia,
    TenThanhPho, Bang
;

-- View theo Năm MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_MaKH_MoTa  AS
SELECT
    Nam,
    MaKH, TenKH, LoaiKH,
    MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,
    MaKH, TenKH, LoaiKH,
    MoTa,   Gia,
    TenThanhPho, Bang
;

-- View tổng hợp All (ko phân cấp thời gian) MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_MaKH_MoTa  AS
SELECT
    MaKH, TenKH, LoaiKH,
     MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MaKH, TenKH, LoaiKH,
    MoTa,   Gia,
    TenThanhPho, Bang
;

-----------KhachHang len 1 cấp
 
-- View theo Ngày - LoaiKH MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_LoaiKH_MoTa  AS
SELECT
    Ngay, Thang, Nam, LoaiKH,
     MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam, LoaiKH,
    MoTa,   Gia,
    TenThanhPho, Bang
;

-- View theo Tháng LoaiKH MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_LoaiKH_MoTa  AS
SELECT
    Nam, Thang,
     LoaiKH,
     MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang,
     LoaiKH,
     MoTa,   Gia,
    TenThanhPho, Bang
;

-- View theo Quý MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_LoaiKH_MoTa  AS
SELECT
    Nam, Quy, LoaiKH,
    MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy,
    LoaiKH, MoTa,   Gia,
    TenThanhPho, Bang
;

-- View theo Năm MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_LoaiKH_MoTa  AS
SELECT
    Nam, LoaiKH,  MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,
     LoaiKH, MoTa,   Gia,
    TenThanhPho, Bang
;
 
-- View tổng hợp All (ko phân cấp thời gian) LoaiKH MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_LoaiKH_MoTa  AS
SELECT
     LoaiKH, MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    LoaiKH, MoTa,   Gia,
    TenThanhPho, Bang
;
-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho
-- View theo Ngày - ThanhPho MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_ThanhPho_MoTa  AS
SELECT
    Ngay, Thang, Nam, MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam, MoTa,   Gia,
    TenThanhPho, Bang
;

-- View theo Tháng ThanhPho MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_ThanhPho_MoTa  AS
SELECT
    Nam, Thang, MoTa,   Gia,MaThanhPho,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang,MaThanhPho, MoTa,   Gia,
    TenThanhPho, Bang
;

-- View theo Quý ThanhPho MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_ThanhPho_MoTa  AS
SELECT
    Nam, Quy,MaThanhPho, MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy,
    MaThanhPho, MoTa,   Gia,
    TenThanhPho, Bang
;

-- View theo Năm ThanhPho MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_ThanhPho_MoTa  AS
SELECT
    Nam,
    MaThanhPho, MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,
    MaThanhPho,  MoTa,   Gia,
    TenThanhPho, Bang
;

-- View tổng hợp All (ko phân cấp thời gian) ThanhPho MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_ThanhPho_MoTa  AS
SELECT
    MaThanhPho, MoTa,   Gia,
    TenThanhPho, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MaThanhPho, MoTa,   Gia,
    TenThanhPho, Bang
;

-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho -> Bang
-- View theo Ngày - Bang MoTa
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_Bang_MoTa  AS
SELECT
    Ngay, Thang, Nam, MoTa,   Gia,
    Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam, MoTa,   Gia,
    Bang
;

-- View theo Tháng Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_Bang_MoTa  AS
SELECT
    Nam, Thang, MoTa,   Gia, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang, MoTa,   Gia,
    Bang
;

-- View theo Quý Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_Bang_MoTa  AS
SELECT
    Nam, Quy, MoTa,   Gia,
    Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy, MoTa,   Gia,
    Bang
;

-- View theo Năm Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_Bang_MoTa  AS
SELECT
    Nam, MoTa,   Gia,Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,  MoTa,   Gia,
    Bang
;

-- View tổng hợp All (ko phân cấp thời gian) Bang 
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_Bang_MoTa  AS
SELECT
    MoTa,   Gia, Bang,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MoTa,   Gia, Bang
;

-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho -> Bang ->All
-- View theo Ngày - AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_AllKhachHang_MoTa  AS
SELECT
    Ngay, Thang, Nam,
     MoTa,   Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Ngay, Thang, Nam,
      MoTa,   Gia
;

-- View theo Tháng AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_AllKhachHang_MoTa  AS
SELECT
    Nam, Thang, MoTa,   Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Thang, MoTa,   Gia
;

-- View theo Quý AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_ThanhPho_MoTa  AS
SELECT
    Nam, Quy,  MoTa,   Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam, Quy, MoTa,   Gia
;

-- View theo Năm AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_AllKhachHang_MoTa  AS
SELECT
    Nam,  MoTa,   Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    Nam,  MoTa,   Gia
;

-- View tổng hợp All (ko phân cấp thời gian) AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoiGian_AllKhachHang_MoTa  AS
SELECT 
	MoTa,   Gia,
    SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
    SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
    MoTa,   Gia
;
--------- Khách Hàng MaMH-> AllMatHang
-- View theo Ngày AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_MaKH_AllMatHang  AS
SELECT
 Ngay, Thang, Nam,
 MaKH, TenKH, LoaiKH,
 
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Ngay, Thang, Nam,
 MaKH, TenKH, LoaiKH,
 
 TenThanhPho, Bang
;
-- View theo Tháng AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_MaKH_AllMatHang  AS
SELECT
 Nam, Thang,
 MaKH, TenKH, LoaiKH,
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam, Thang,
 MaKH, TenKH, LoaiKH,
 
 TenThanhPho, Bang
;
-- View theo Quý AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_MaKH_AllMatHang  AS
SELECT
 Nam, Quy, LoaiKH,
 MaKH, TenKH,
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam, Quy,
 LoaiKH,
 MaKH, TenKH,
 
 TenThanhPho, Bang
;
-- View theo Năm AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_MaKH_AllMatHang  AS
SELECT
 Nam,
 MaKH, TenKH, LoaiKH,
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam,
 MaKH, TenKH, LoaiKH,
 
 TenThanhPho, Bang
;
-- View tổng hợp All (ko phân cấp thời n) AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoin_MaKH_AllMatHang  AS
SELECT
 MaKH, TenKH, LoaiKH,
 
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 MaKH, TenKH, LoaiKH,
 
 TenThanhPho, Bang
;
-----------KhachHang len 1 cấp
 
-- View theo Ngày - LoaiKH AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_LoaiKH_AllMatHang  AS
SELECT
 Ngay, Thang, Nam, LoaiKH,
 
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Ngay, Thang, Nam, LoaiKH,
 TenThanhPho, Bang
;
-- View theo Tháng LoaiKH AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_LoaiKH_AllMatHang  AS
SELECT
 Nam, Thang,
 LoaiKH, TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam, Thang,
 LoaiKH,
 TenThanhPho, Bang
;
-- View theo Quý AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_LoaiKH_AllMatHang  AS
SELECT
 Nam, Quy, LoaiKH,
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam, Quy,
 LoaiKH, 
 TenThanhPho, Bang
;
-- View theo Năm AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_LoaiKH_AllMatHang  AS
SELECT
 Nam, LoaiKH, 
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam,
 LoaiKH, 
 TenThanhPho, Bang
;
 
-- View tổng hợp All (ko phân cấp thời n) LoaiKH AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoin_LoaiKH_AllMatHang  AS
SELECT
 LoaiKH, 
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 LoaiKH, 
 TenThanhPho, Bang
;
-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho
-- View theo Ngày - ThanhPho AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_ThanhPho_AllMatHang  AS
SELECT
 Ngay, Thang, Nam, 
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Ngay, Thang, Nam, 
 TenThanhPho, Bang
;
-- View theo Tháng ThanhPho AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_ThanhPho_AllMatHang  AS
SELECT
 Nam, Thang, MaThanhPho,
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam, Thang,MaThanhPho, 
 TenThanhPho, Bang
;
-- View theo Quý ThanhPho AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_ThanhPho_AllMatHang  AS
SELECT
 Nam, Quy,MaThanhPho, 
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam, Quy,
 MaThanhPho, 
 TenThanhPho, Bang
;
-- View theo Năm ThanhPho AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_ThanhPho_AllMatHang  AS
SELECT
 Nam,
 MaThanhPho, 
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam,
 MaThanhPho, 
 TenThanhPho, Bang
;
-- View tổng hợp All (ko phân cấp thời n) ThanhPho AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoin_ThanhPho_AllMatHang  AS
SELECT
 MaThanhPho, 
 TenThanhPho, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 MaThanhPho, 
 TenThanhPho, Bang
;
-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho -> Bang
-- View theo Ngày - Bang AllMatHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_Bang_AllMatHang  AS
SELECT
 Ngay, Thang, Nam, 
 Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Ngay, Thang, Nam, 
 Bang
;
-- View theo Tháng Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_Bang_AllMatHang  AS
SELECT
 Nam, Thang, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam, Thang, 
 Bang
;
-- View theo Quý Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_Bang_AllMatHang  AS
SELECT
 Nam, Quy, 
 Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam, Quy, 
 Bang
;
-- View theo Năm Bang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_Bang_AllMatHang  AS
SELECT
 Nam, Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam, 
 Bang
;
-- View tổng hợp All (ko phân cấp thời n) Bang 
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoin_Bang_AllMatHang  AS
SELECT
 Bang,
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Bang
;
-- Khach Hang lên thêm 1 cấp LoaiKh -> ThanhPho -> Bang ->All
-- View theo Ngày - AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNgay_AllKhachHang_AllMatHang  AS
SELECT
 Ngay, Thang, Nam,
 
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Ngay, Thang, Nam
;
-- View theo Tháng AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoThang_AllKhachHang_AllMatHang  AS
SELECT
 Nam, Thang, 
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam, Thang
;
-- View theo Quý AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoQuy_ThanhPho_AllMatHang  AS
SELECT
 Nam, Quy, 
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam, Quy
;
-- View theo Năm AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_TheoNam_AllKhachHang_AllMatHang  AS
SELECT
 Nam, 
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary
GROUP BY
 Nam
;
-- View tổng hợp All (ko phân cấp thời n) AllKhachHang
CREATE OR REPLACE VIEW vw_DoanhThu_AllThoin_AllKhachHang_AllMatHang  AS
SELECT 
 SUM(IFNULL(SoLuongDat, 0)) AS TongSoLuongDat,
 SUM(IFNULL(ThanhTien, 0)) AS TongDoanhThu
FROM salesummary