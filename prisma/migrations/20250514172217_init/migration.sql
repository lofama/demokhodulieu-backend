-- CreateTable
CREATE TABLE `DimThoiGian` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Ngay` DATETIME(3) NOT NULL,
    `NgayTrongThang` INTEGER NOT NULL,
    `Thang` INTEGER NOT NULL,
    `Quy` INTEGER NOT NULL,
    `Nam` INTEGER NOT NULL,

    UNIQUE INDEX `DimThoiGian_id_key`(`id`),
    PRIMARY KEY (`Ngay`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DimThanhPho` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `MaThanhPho` VARCHAR(10) NOT NULL,
    `TenThanhPho` VARCHAR(100) NOT NULL,
    `DiaChiVP` VARCHAR(200) NOT NULL,
    `Bang` VARCHAR(50) NOT NULL,

    UNIQUE INDEX `DimThanhPho_id_key`(`id`),
    PRIMARY KEY (`MaThanhPho`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DimCuaHang` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `MaCuaHang` VARCHAR(10) NOT NULL,
    `MaThanhPho` VARCHAR(10) NOT NULL,
    `SoDienThoai` VARCHAR(20) NOT NULL,

    UNIQUE INDEX `DimCuaHang_id_key`(`id`),
    PRIMARY KEY (`MaCuaHang`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DimKhachHang` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `MaKH` VARCHAR(10) NOT NULL,
    `TenKH` VARCHAR(100) NOT NULL,
    `MaThanhPho` VARCHAR(10) NOT NULL,
    `LoaiKH` VARCHAR(20) NOT NULL,

    UNIQUE INDEX `DimKhachHang_id_key`(`id`),
    PRIMARY KEY (`MaKH`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DimMatHang` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `MaMatHang` VARCHAR(10) NOT NULL,
    `MoTa` VARCHAR(200) NOT NULL,
    `KichCo` VARCHAR(50) NOT NULL,
    `TrongLuong` DOUBLE NOT NULL,
    `Gia` DECIMAL(10, 2) NOT NULL,

    UNIQUE INDEX `DimMatHang_id_key`(`id`),
    PRIMARY KEY (`MaMatHang`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FactDatHang` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `MaDon` VARCHAR(10) NOT NULL,
    `MaKH` VARCHAR(10) NOT NULL,
    `MaMatHang` VARCHAR(10) NOT NULL,
    `NgayDatHang` DATETIME(3) NOT NULL,
    `SoLuongDat` INTEGER NOT NULL,
    `GiaDat` DECIMAL(10, 2) NOT NULL,

    UNIQUE INDEX `FactDatHang_id_key`(`id`),
    PRIMARY KEY (`MaDon`, `MaMatHang`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FactTonKho` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `MaMatHang` VARCHAR(10) NOT NULL,
    `MaCuaHang` VARCHAR(10) NOT NULL,
    `Ngay` DATETIME(3) NOT NULL,
    `SoLuongTonKho` INTEGER NOT NULL,

    UNIQUE INDEX `FactTonKho_id_key`(`id`),
    PRIMARY KEY (`MaMatHang`, `MaCuaHang`, `Ngay`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `DimCuaHang` ADD CONSTRAINT `DimCuaHang_MaThanhPho_fkey` FOREIGN KEY (`MaThanhPho`) REFERENCES `DimThanhPho`(`MaThanhPho`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DimKhachHang` ADD CONSTRAINT `DimKhachHang_MaThanhPho_fkey` FOREIGN KEY (`MaThanhPho`) REFERENCES `DimThanhPho`(`MaThanhPho`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FactDatHang` ADD CONSTRAINT `FactDatHang_MaMatHang_fkey` FOREIGN KEY (`MaMatHang`) REFERENCES `DimMatHang`(`MaMatHang`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FactDatHang` ADD CONSTRAINT `FactDatHang_MaKH_fkey` FOREIGN KEY (`MaKH`) REFERENCES `DimKhachHang`(`MaKH`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FactDatHang` ADD CONSTRAINT `FactDatHang_NgayDatHang_fkey` FOREIGN KEY (`NgayDatHang`) REFERENCES `DimThoiGian`(`Ngay`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FactTonKho` ADD CONSTRAINT `FactTonKho_MaMatHang_fkey` FOREIGN KEY (`MaMatHang`) REFERENCES `DimMatHang`(`MaMatHang`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FactTonKho` ADD CONSTRAINT `FactTonKho_MaCuaHang_fkey` FOREIGN KEY (`MaCuaHang`) REFERENCES `DimCuaHang`(`MaCuaHang`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FactTonKho` ADD CONSTRAINT `FactTonKho_Ngay_fkey` FOREIGN KEY (`Ngay`) REFERENCES `DimThoiGian`(`Ngay`) ON DELETE RESTRICT ON UPDATE CASCADE;
