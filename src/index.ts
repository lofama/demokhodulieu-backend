import express from 'express';
import cors from 'cors';
import storeRoutes from './routes/storeRoute';
import customerRoutes from './routes/customerRoute';
import saleRoutes from './routes/saleRoute';
import orderRoutes from './routes/orderRoute';
import inventoryRoutes from './routes/inventoryRoute';

const app = express();
const PORT = 3000;
app.use(cors());
app.use(express.json());

app.use('/stores', storeRoutes);
app.use('/customers', customerRoutes);
app.use('/sales', saleRoutes);
app.use('/inventories', inventoryRoutes);
app.use('/orders', orderRoutes);

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
