# this folder will be the first one to be executed and while executing you have to put a clint name 
# and after taking the clint name i sends it to the server file for server side logic 

SERVER_SCRIPT="$(dirname "$0")/dhcp_server.sh"

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <client_id>"
    exit 1
fi

client=$1
bash "$SERVER_SCRIPT" "$client"
