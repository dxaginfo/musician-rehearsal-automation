// Placeholder for Express API
// Will implement endpoints for users, rehearsals, bookings, notifications, payments, etc.
const express = require('express');
const app = express();
app.use(express.json());
app.get('/', (req, res) => res.send('Musician Rehearsal Automation API base'));
app.listen(3001, ()=>console.log('API running on port 3001'));