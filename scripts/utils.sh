# this file is basically responsible for looking into the ip pool and then send the ips to the server to assign for the client


POOL_FILE="$(dirname "$0")/ip_pool.json"

# Get next free IP
get_free_ip() {
    jq -r '
      . as $pool |
      [range(
        (.range_start | split(".") | map(tonumber) | .[3]) ;
        (.range_end | split(".") | map(tonumber) | .[3]+1)
      ) | 
      ("192.168.1." + (.|tostring)) ] 
      - (.leases | to_entries | map(.value))
      | .[0]' "$POOL_FILE"
}

# Assign IP to client
assign_ip() {
    local client=$1
    local ip=$(get_free_ip)
    if [[ "$ip" == "null" ]]; then
        echo "No IP available"
        exit 1
    fi
    tmp=$(mktemp)
    jq --arg client "$client" --arg ip "$ip" '.leases[$client] = $ip' "$POOL_FILE" > "$tmp" && mv "$tmp" "$POOL_FILE"
    echo "$ip"
}

# Release IP from client
release_ip() {
    local client=$1
    tmp=$(mktemp)
    jq "del(.leases[\"$client\"])" "$POOL_FILE" > "$tmp" && mv "$tmp" "$POOL_FILE"
    echo "Released IP for $client"
}
