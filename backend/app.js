const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const dhcpRoutes = require('./routes/dhcp');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(bodyParser.json());

app.use('/api/dhcp', dhcpRoutes);

app.listen(PORT, () => {
  console.log(`Backend running on http://localhost:${PORT}`);
});
