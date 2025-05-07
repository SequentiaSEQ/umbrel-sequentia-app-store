export APP_SEQUENTIA_IP="10.21.22.133"
export APP_SEQUENTIA_NODE_IP="10.21.21.134"
export APP_SEQUENTIA_ELECTRS_IP="10.21.21.135"
export APP_SEQUENTIA_TOR_PROXY_IP="10.21.21.136"

export APP_SEQUENTIA_NODE_RPC_PORT=18776
export APP_SEQUENTIA_NODE_P2P_PORT=18777
export APP_SEQUENTIA_NODE_TOR_PORT=18778
export APP_SEQUENTIA_ELECTRS_RPC_PORT=51101
export APP_SEQUENTIA_ELECTRS_WEB_PORT=3001

app_sequentia_rpc_hidden_service_file="${EXPORTS_TOR_DATA_DIR}/app-${EXPORTS_APP_ID}-rpc/hostname"
app_sequentia_p2p_hidden_service_file="${EXPORTS_TOR_DATA_DIR}/app-${EXPORTS_APP_ID}-p2p/hostname"
app_sequentia_electrs_hidden_service_file="${EXPORTS_TOR_DATA_DIR}/app-${EXPORTS_APP_ID}-electrs/hostname"

export APP_SEQUENTIA_RPC_HIDDEN_SERVICE="$(cat "${app_sequentia_rpc_hidden_service_file}" 2>/dev/null || echo "notyetset.onion")"
export APP_SEQUENTIA_P2P_HIDDEN_SERVICE="$(cat "${app_sequentia_p2p_hidden_service_file}" 2>/dev/null || echo "notyetset.onion")"
export APP_SEQUENTIA_ELECTRS_HIDDEN_SERVICE="$(cat "${app_sequentia_electrs_hidden_service_file}" 2>/dev/null || echo "notyetset.onion")"

export APP_SEQUENTIA_RPC_USER="umbrel"

SEQUENTIA_ENV_FILE="${EXPORTS_APP_DIR}/.env"
if [[ ! -f "${SEQUENTIA_ENV_FILE}" ]]; then

    SEQUENTIA_RPC_DETAILS=$("${EXPORTS_APP_DIR}/scripts/rpcauth.py" "${APP_SEQUENTIA_RPC_USER}")
    SEQUENTIA_RPC_PASS=$(echo "$SEQUENTIA_RPC_DETAILS" | tail -1)
    SEQUENTIA_RPC_AUTH=$(echo "$SEQUENTIA_RPC_DETAILS" | head -2 | tail -1 | sed -e "s/^rpcauth=//")

	echo "export APP_SEQUENTIA_RPC_USER='${APP_SEQUENTIA_RPC_USER}'"	>> "${SEQUENTIA_ENV_FILE}"
	echo "export APP_SEQUENTIA_RPC_PASS='${SEQUENTIA_RPC_PASS}'"	>> "${SEQUENTIA_ENV_FILE}"
	echo "export APP_SEQUENTIA_RPC_AUTH='${SEQUENTIA_RPC_AUTH}'"	>> "${SEQUENTIA_ENV_FILE}"
fi

. "${SEQUENTIA_ENV_FILE}"
