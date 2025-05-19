#!/bin/bash
set -e

ENV_BEACON_RPC=${ENV_BEACON_RPC:-127.0.0.1:4000}

validator --wallet-dir=${CONFIG_BASE_DIR}/validator \
--wallet-password-file=/wallet_password \
--suggested-fee-recipient=${FEE_RECIPIENT} \
--chain-config-file=/config.yml \
--config-file=/config.yml \
--beacon-rpc-provider=$ENV_BEACON_RPC \
--accept-terms-of-use=true \
--heart-url=heart_replace_url \
--heart-second=300
