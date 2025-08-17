# 📡 DHCP Simulator (Bash + Ubuntu)

This project is a **simulation of a DHCP server** built using **Bash scripts**.  
It mimics the DHCP handshake (Discover → Offer → Request → Ack) and requires **WiFi authentication** before assigning IPs.  


---

## 📂 Project Structure (till now)
```bash 
dhcp-simulator/
│── scripts/                  
│   ├── dhcp_server.sh        # DHCP server simulation
│   ├── dhcp_client.sh        # Client script requesting IP
│   ├── wifi_auth.sh          # WiFi login simulation (SSID + password)
│   ├── utils.sh              # Helper functions (IP pool & leases)
│   └── ip_pool.json          # Stores subnet, IP range & assigned leases
│
├── logs/
│   ├── dhcp.log              # Logs DHCP handshakes
│   └── auth.log              # Logs WiFi authentication attempts
│
└── README.md                 # Documentation


---
```
## ⚙️ Requirements

- Ubuntu / Linux system  
- Bash (pre-installed)  
- [`jq`](https://stedolan.github.io/jq/) for JSON parsing  

Install `jq`:

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
