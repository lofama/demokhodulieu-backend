import { Router } from 'express';
import { getSumarySales } from '../controllers/saleController';

const router = Router();

router.get('/', getSumarySales);

export default router;
