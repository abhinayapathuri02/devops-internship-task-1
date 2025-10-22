const express = require('express');
const app = express();
const port = 8080;

app.get('/', (req, res) => {
  res.send('<h1>Node.js CI/CD App v1.0</h1><p>Deployment Successful!</p>');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
