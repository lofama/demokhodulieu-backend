import { Router } from 'express';
import { getCustomers, getStoreInfo } from '../controllers/customerController';

const router = Router();

router.get('/', getCustomers);
router.get('/view', getStoreInfo);

export default router;
