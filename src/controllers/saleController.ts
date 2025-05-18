import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
import { buildWhereClauseFromFilters, tables } from '../libs/utils';
const prisma = new PrismaClient();

const tableDefault = 'salesummary';

export const getSumarySales = async (req: Request, res: Response) => {
  const page = Math.max(Number(req.query.page) || 1, 1);
  const pageSize = Math.max(Number(req.query.pageSize) || 10, 1);
  let tableName =
    typeof req.query.tableName === 'string' && tables.includes(req.query.tableName)
      ? req.query.tableName
      : tableDefault;

  const searchs = JSON.parse(typeof req.query.search === 'string' ? req.query.search : '{}');
  const offset = (page - 1) * pageSize;
  const limit = pageSize;

  const whereClause = buildWhereClauseFromFilters(searchs);

  const [result, countData] = await Promise.all([
    prisma.$queryRawUnsafe(
      `SELECT * FROM ${tableName} WHERE ${whereClause}  LIMIT ${limit} OFFSET ${offset}`
    ),
    prisma.$queryRawUnsafe(`SELECT COUNT(*) as count FROM ${tableName} WHERE ${whereClause}`),
  ]);

  const count = Number((countData as Array<{ count: number | string }>)[0].count);
  res.json({
    data: result,
    meta: {
      total: count,
      page: Number(page),
      pageSize: Number(pageSize),
    },
  });
};
