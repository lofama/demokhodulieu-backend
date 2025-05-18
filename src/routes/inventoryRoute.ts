import { Router } from 'express';
import { getSumaryInventories } from '../controllers/inventoryController';

const router = Router();

router.get('/sumary', getSumaryInventories);

export default router;
