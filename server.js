const express = require('express');
const rateLimit = require('express-rate-limit');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100,
});

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Fallback: serve README.md for the root route
app.get('/', limiter, (req, res) => {
  res.sendFile(path.join(__dirname, 'README.md'));
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
