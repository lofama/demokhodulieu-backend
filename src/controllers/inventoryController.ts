import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
const prisma = new PrismaClient();

export interface InventorySumary {
  MaMatHang: string;
  MaCuaHang: string;
  SoLuongTonKho: string;
  TenThanhPho: string;
  Bang: string;
  MoTa: string;
  KichCo: string;
  TrongLuong: string;
  Gia: string;
  NgayDatHang: string;
}

export const getSumaryInventories = async (req: Request, res: Response) => {
  const page = Number(req.query.page) || 1;
  const pageSize = Number(req.query.pageSize) || 10;
  const [result, count] = await Promise.all([
    prisma.facttonkho.findMany({
      skip: Number(page - 1) * Number(pageSize),
      take: Number(pageSize),
      include: {
        dimmathang: true,
        dimcuahang: {
          include: {
            dimthanhpho: true,
          },
        },
      },
    }),
    prisma.facttonkho.count(),
  ]);

  const data: InventorySumary[] = result.map(item => ({
    MaMatHang: item.MaMatHang,
    MaCuaHang: item.MaCuaHang,
    SoLuongTonKho: item.SoLuongTonKho.toString(),
    TenThanhPho: item.dimcuahang.dimthanhpho.TenThanhPho,
    Bang: item.dimcuahang.dimthanhpho.Bang,
    MoTa: item.dimmathang.MoTa,
    KichCo: item.dimmathang.KichCo,
    TrongLuong: item.dimmathang.TrongLuong.toString(),
    Gia: item.dimmathang.Gia.toString(),
    NgayDatHang: item.Ngay.toString(),
  }));

  res.json({
    data,
    meta: {
      total: count,
      page: page,
      pageSize: pageSize,
    },
  });
};
