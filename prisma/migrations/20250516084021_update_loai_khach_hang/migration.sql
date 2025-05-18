/*
  Warnings:

  - You are about to alter the column `LoaiKH` on the `DimKhachHang` table. The data in that column could be lost. The data in that column will be cast from `VarChar(20)` to `Enum(EnumId(0))`.

*/
-- AlterTable
ALTER TABLE `DimKhachHang` MODIFY `LoaiKH` ENUM('DuLich', 'BuuDien', 'CaHai', 'Khac') NOT NULL;
