import express from 'express';
import cors from 'cors';
import storeRoutes from './routes/storeRoute';

const app = express();
const PORT = 3000;
app.use(cors());
app.use(express.json());

app.use('/store', storeRoutes);

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
