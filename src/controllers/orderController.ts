import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
const prisma = new PrismaClient();

export const getOrders = async (req: Request, res: Response) => {
  const maDon = req.query.maDon as string;
  const result = await prisma.factdathang.findFirst({
    where: {
      MaDon: maDon,
    },
    include: {
      dimkhachhang: {
        include: {
          dimthanhpho: {
            include: {
              dimcuahang: true,
            },
          },
        },
      },
      dimmathang: true,
    },
  });
  res.json(result);
};
