const express = require('express');
const fs = require('fs');
const { exec } = require('child_process');
const path = require('path');

const router = express.Router();

// Paths to scripts and logs
const SCRIPTS_PATH = path.join(__dirname, '..', '..', 'scripts');
const LOG_FILE = path.join(__dirname, '..', '..', 'logs', 'dhcp.log');
const IP_POOL_FILE = path.join(SCRIPTS_PATH, 'ip_pool.json');

// Get current leases
router.get('/leases', (req, res) => {
  fs.readFile(IP_POOL_FILE, 'utf8', (err, data) => {
    if (err) return res.status(500).json({ error: err.message });
    const leases = JSON.parse(data).leases;
    res.json(leases);
  });
});

// Get DHCP logs
router.get('/logs', (req, res) => {
  fs.readFile(LOG_FILE, 'utf8', (err, data) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ logs: data.split('\n').filter(line => line !== '') });
  });
});


module.exports = router;
