export APP_SEQUENTIA_NODE_RPC_PORT="18776"
export APP_SEQUENTIA_NODE_P2P_PORT="18777"

app_sequentia_rpc_hidden_service_file="${EXPORTS_TOR_DATA_DIR}/app-${EXPORTS_APP_ID}-rpc/hostname"
app_sequentia_p2p_hidden_service_file="${EXPORTS_TOR_DATA_DIR}/app-${EXPORTS_APP_ID}-p2p/hostname"

export APP_SEQUENTIA_RPC_HIDDEN_SERVICE="$(cat "${app_sequentia_rpc_hidden_service_file}" 2>/dev/null || echo "notyetset.onion")"
export APP_SEQUENTIA_P2P_HIDDEN_SERVICE="$(cat "${app_sequentia_p2p_hidden_service_file}" 2>/dev/null || echo "notyetset.onion")"

export APP_SEQUENTIA_RPC_USER="umbrel"
export APP_SEQUENTIA_RPC_PASS="sequentia"
