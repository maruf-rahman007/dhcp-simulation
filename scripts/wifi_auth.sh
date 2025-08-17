# checks for the wifi authentication this file gets executed after the clint file sends the clint name to the server and before the handshake


AUTH_FILE="$(dirname "$0")/../logs/auth.log"

SSID="mywifi"
PASSWORD="12345678"

wifi_login() {
    read -p "Enter WiFi SSID: " input_ssid
    read -sp "Enter WiFi Password: " input_pass
    echo

    if [[ "$input_ssid" == "$SSID" && "$input_pass" == "$PASSWORD" ]]; then
        echo "$(date) - SUCCESS: $input_ssid login" >> "$AUTH_FILE"
        return 0
    else
        echo "$(date) - FAILED: $input_ssid login" >> "$AUTH_FILE"
        return 1
    fi
}
