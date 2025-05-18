/*
  Warnings:

  - You are about to alter the column `KichCo` on the `DimMatHang` table. The data in that column could be lost. The data in that column will be cast from `VarChar(50)` to `Enum(EnumId(1))`.

*/
-- AlterTable
ALTER TABLE `DimMatHang` MODIFY `KichCo` ENUM('S', 'M', 'L', 'XL', 'XXl', 'XXXL') NOT NULL;
