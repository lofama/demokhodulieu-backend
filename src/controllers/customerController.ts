import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
const prisma = new PrismaClient();

export const getCustomers = async (req: Request, res: Response) => {
  const customers = await prisma.dimkhachhang.findMany();
  res.json(customers);
};

export const getStoreInfo = async (req: Request, res: Response) => {
  const table = 'vw_doanhthu_theongay_makh_mamathang';
  const result: any[] = await prisma.$queryRaw`
  SELECT * FROM ${table}
`;
  res.json({
    data: result,
    meta: {
      total: result.length,
      page: 1,
      pageSize: 10,
    },
  });
};
