import { Router } from 'express';
import { getStore, getStoreInfo } from '../controllers/storeController';

const router = Router();

router.get('/', getStore);
router.get('/info', getStoreInfo);

export default router;
