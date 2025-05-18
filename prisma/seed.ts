import { dimmathang_KichCo, PrismaClient } from '@prisma/client';
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient();
function getQuarter(month: number): number {
  return Math.floor((month - 1) / 3) + 1;
}
async function main() {
  for (let i = 0; i < 100; i++) {
    await prisma.salesummary.create({
      data: {
        MaDon: `MD${faker.number.int({ min: 10000, max: 99999 })}`,
        MaMatHang: `MH${faker.number.int({ min: 1000, max: 9999 })}`,
        NgayDatHang: faker.date.past().toISOString().split('T')[0],
        MaKH: `KH${faker.number.int({ min: 1000, max: 9999 })}`,
        TenKH: faker.person.fullName(),
        LoaiKH: faker.helpers.arrayElement(['VIP', 'Thường', 'Mới']),
        TenThanhPho: faker.location.city(),
        MaThanhPho: faker.string.numeric(3),
        Bang: faker.helpers.arrayElement(['A', 'B', 'C']),
        DiaChiVP: faker.location.streetAddress(),
        MoTa: faker.commerce.productDescription(),
        KichCo: `${faker.number.int({ min: 10, max: 100 })}cm`,
        TrongLuong: `${faker.number.int({ min: 1, max: 10 })}kg`,
        Gia: faker.commerce.price({ min: 10000, max: 90000 }),
        SoLuongDat: faker.number.int({ min: 1, max: 20 }).toString(),
        GiaDat: faker.commerce.price({ min: 10000, max: 90000 }),
        ThanhTien: faker.commerce.price({ min: 100000, max: 1000000 }),
        Ngay: faker.date.recent().toISOString().split('T')[0],
        NgayTrongThang: faker.number.int({ min: 1, max: 28 }).toString(),
        Thang: faker.number.int({ min: 1, max: 12 }).toString(),
        Quy: faker.number.int({ min: 1, max: 4 }).toString(),
        Nam: faker.number.int({ min: 2020, max: 2025 }).toString(),
      },
    });
  }
  for (let i = 0; i < 100; i++) {
    await prisma.dimthanhpho.create({
      data: {
        MaThanhPho: `TP${faker.string.alphanumeric({ length: 6, casing: 'upper' })}`,
        TenThanhPho: faker.location.city(),
        DiaChiVP: faker.location.streetAddress(),
        Bang: faker.helpers.arrayElement(['A', 'B', 'C', 'D', 'E']),
      },
    });
  }

  console.log('✅ Seeded 100 DimThanhPho records.');

  const thanhPhos = await prisma.dimthanhpho.findMany({
    select: { MaThanhPho: true },
  });

  if (thanhPhos.length === 0) {
    throw new Error('⚠️ Không có dữ liệu trong bảng DimThanhPho. Hãy seed DimThanhPho trước.');
  }

  for (let i = 0; i < 100; i++) {
    const thanhPho = faker.helpers.arrayElement(thanhPhos);

    await prisma.dimcuahang.create({
      data: {
        MaCuaHang: `CH${faker.string.alphanumeric({ length: 6, casing: 'upper' })}`,
        MaThanhPho: thanhPho.MaThanhPho,
        SoDienThoai: faker.phone.number().slice(0, 10),
      },
    });
  }

  console.log('✅ Seeded 100 DimCuaHang records.');

  for (let i = 0; i < 100; i++) {
    await prisma.dimmathang.create({
      data: {
        MaMatHang: `MH${faker.string.alphanumeric({ length: 6, casing: 'upper' })}`,
        MoTa: faker.commerce.productDescription(),
        KichCo: faker.helpers.arrayElement(Object.values(dimmathang_KichCo)),
        TrongLuong: parseFloat(faker.number.float({ min: 0.5, max: 10 }).toFixed(2)),
        Gia: parseFloat(faker.commerce.price({ min: 10000, max: 100000, dec: 2 })),
      },
    });
  }

  console.log('✅ Seeded 100 DimMatHang records.');

  const startDate = new Date('2023-01-01');
  const endDate = new Date('2024-12-31');

  const days: Date[] = [];
  let current = new Date(startDate);

  while (current <= endDate) {
    days.push(new Date(current));
    current.setDate(current.getDate() + 1);
  }

  const records = days.map(date => ({
    Ngay: date,
    NgayTrongThang: date.getDate(),
    Thang: date.getMonth() + 1,
    Quy: getQuarter(date.getMonth() + 1),
    Nam: date.getFullYear(),
  }));

  for (const record of records) {
    await prisma.dimthoigian.create({ data: record });
  }

  console.log(`✅ Đã tạo ${records.length} ngày trong DimThoiGian.`);

  const matHangs = await prisma.dimmathang.findMany({ select: { MaMatHang: true } });
  const cuaHangs = await prisma.dimcuahang.findMany({ select: { MaCuaHang: true } });
  const thoiGians = await prisma.dimthoigian.findMany({ select: { Ngay: true } });

  if (matHangs.length === 0 || cuaHangs.length === 0 || thoiGians.length === 0) {
    throw new Error('⚠️ Cần seed DimMatHang, DimCuaHang và DimThoiGian trước.');
  }

  const tonKhoSet = new Set<string>();
  const totalRecords = 300;

  let created = 0;

  while (created < totalRecords) {
    const mh = faker.helpers.arrayElement(matHangs);
    const ch = faker.helpers.arrayElement(cuaHangs);
    const ngay = faker.helpers.arrayElement(thoiGians);

    const key = `${mh.MaMatHang}_${ch.MaCuaHang}_${ngay.Ngay.toISOString()}`;

    if (tonKhoSet.has(key)) continue;
    tonKhoSet.add(key);

    await prisma.facttonkho.create({
      data: {
        MaMatHang: mh.MaMatHang,
        MaCuaHang: ch.MaCuaHang,
        Ngay: ngay.Ngay,
        SoLuongTonKho: faker.number.int({ min: 0, max: 500 }),
      },
    });

    created++;
  }

  console.log(`✅ Seeded ${created} FactTonKho records.`);
}

main()
  .catch(e => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
