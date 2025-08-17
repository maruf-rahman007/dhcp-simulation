# here this file gets executed after the client file gets the clint name it gets the clint name as local variable 
# as it was passed to this file. after this it goes to the wifi config for authentication if it happens successfully
# the next it goes for handshake where it simulates the entire ip assign steps of DHCP ans simultaniously it also saves all in the log file
# this file also access the utils file which basically assigns the ips from the pool 
source "$(dirname "$0")/utils.sh"
source "$(dirname "$0")/wifi_auth.sh"

LOG_FILE="$(dirname "$0")/../logs/dhcp.log"

dhcp_handshake() {
    local client=$1

    echo "[$client] → DHCP DISCOVER"
    echo "$(date) [$client] → DHCP DISCOVER" >> "$LOG_FILE"

    ip=$(assign_ip "$client")

    echo "[Server] → DHCP OFFER $ip"
    echo "$(date) [Server] → DHCP OFFER $ip to $client" >> "$LOG_FILE"

    echo "[$client] → DHCP REQUEST $ip"
    echo "$(date) [$client] → DHCP REQUEST $ip" >> "$LOG_FILE"

    echo "[Server] → DHCP ACK $ip"
    echo "$(date) [Server] → DHCP ACK $ip to $client" >> "$LOG_FILE"
}

run_server() {
    local client=$1
    wifi_login
    if [[ $? -eq 0 ]]; then
        dhcp_handshake "$client"
    else
        echo "WiFi authentication failed. No IP assigned."
    fi
}

if [[ $# -eq 1 ]]; then
    run_server "$1"
else
    echo "Usage: $0 <client_id>"
fi
