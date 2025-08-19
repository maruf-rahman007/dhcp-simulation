# 📡 DHCP Simulator (Bash + Ubuntu)

This project is a **simulation of a DHCP server** built using **Bash scripts**.  
It mimics the DHCP handshake (Discover → Offer → Request → Ack) and requires **WiFi authentication** before assigning IPs.  


---

## 📂 Project Structure (till now)
```bash 
dhcp-simulation/
│
├── scripts/                  # All Bash scripts (core simulation)
│   ├── dhcp_server.sh        # DHCP server simulation logic
│   ├── dhcp_client.sh        # DHCP client simulation script
│   ├── wifi_auth.sh          # WiFi SSID/password simulation
│   ├── ip_pool.json          # IP pool & lease file (JSON/CSV)
│   └── utils.sh              # Common functions (logging, validation etc.)
│
├── backend/                  # Web server backend
│   ├── app.js                # Flask backend (Python)
│   ├── routes/               # API endpoints
│   │   ├── dhcp.js           # APIs to fetch DHCP logs, leases
├── frontend/                 # Web UI
│   ├── index.html            # UI homepage
│   ├── js/                   # Frontend logic
│   │   └── main.js           # Fetch API + show logs/leases dynamically
│   ├── css/                  # Styles (Tailwind or Bootstrap)
│   │   └── styles.css
│
├── logs/                     # Store simulation logs
│   ├── dhcp.log              # Server logs of requests
│   └── auth.log              # WiFi authentication logs
│



---
```
## ⚙️ Requirements

- Ubuntu / Linux system  
- Bash (pre-installed)  
- [`jq`](https://stedolan.github.io/jq/) for JSON parsing  

Install `jq`:

## Start DHCP serverand add client

```bash
sudo apt update
sudo apt install jq -y
chmod +x scripts/*.sh
./scripts/dhcp_client.sh client1
```

#### Enter WiFi credentials
```bash 
SSID → mywifi

Password → 12345678
```
👉 If correct → DHCP server assigns an IP.
👉 If wrong → Authentication fails, no IP assigned.

```bash
📜 Example Output
Client Side
Enter WiFi SSID: mywifi
Enter WiFi Password:
[client1] → DHCP DISCOVER
[Server] → DHCP OFFER 192.168.1.100
[client1] → DHCP REQUEST 192.168.1.100
[Server] → DHCP ACK 192.168.1.100
```
Logs
```bash
cat logs/dhcp.log
cat logs/auth.log
```
Current Leases
```bash
cat scripts/ip_pool.json
```
## Start backend
```bash

cd backend
npm install
node app.js

```

## Open Frontend
Write following commands
``` bash
npm install -g live-server
cd frontend
live-server

```
### Wifi Login 
``` bash
SSID: mywifi

Password: 12345678

```