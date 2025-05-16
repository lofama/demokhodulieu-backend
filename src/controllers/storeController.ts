import { Request, Response } from 'express';

export const getStore = (req: Request, res: Response) => {
  console.log('🚀 ~ app.get ~ req.query:', req.query);
  res.sendStatus(200);
};

export const getStoreInfo = (req: Request, res: Response) => {
  res.send('Store Information');
};
