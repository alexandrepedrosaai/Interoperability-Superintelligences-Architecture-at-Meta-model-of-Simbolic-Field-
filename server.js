const express = require('express');
const rateLimit = require('express-rate-limit');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Enable trust proxy only when running behind a known reverse proxy (e.g., Azure Web Apps)
if (process.env.TRUST_PROXY === '1' || process.env.NODE_ENV === 'production') {
  app.set('trust proxy', 1);
}

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  limit: 100,               // express-rate-limit v8 prefers 'limit' over deprecated 'max'
  standardHeaders: 'draft-7',
  legacyHeaders: false,
});

// Rate-limited root route: serve README.md as plain text
app.get('/', limiter, (req, res) => {
  res.sendFile(path.join(__dirname, 'README.md'), {
    headers: { 'Content-Type': 'text/plain; charset=UTF-8' },
  });
});

// Serve static files from the public directory (index disabled so `/` hits the route above)
app.use(express.static(path.join(__dirname, 'public'), { index: false }));

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
