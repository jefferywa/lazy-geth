#!/usr/bin/env sh

DATA_DIR=${DATA_DIR:-"/data"}
GAS_LIMIT=${GAS_LIMIT:-"8000000"}
GAS_PRICE=${GAS_PRICE:-"1000000000"}
NETWORK_ID=${NETWORK_ID:-"2020"}
UNLOCK_LIST=${UNLOCK_LIST:-""}

if [ ! "$(ls -A $DATA_DIR)" ]; then
  echo "Init from custom genesis"
  geth --nousb init --datadir $DATA_DIR /root/config.json
  cp -R /root/keystore $DATA_DIR
fi
echo "Starting GETH..."
geth --nousb \
  --maxpeers 0 \
  --datadir /data \
  --networkid "$NETWORK_ID" \
  --http \
  --http.addr 0.0.0.0 \
  --http.corsdomain '*' \
  --http.vhosts '*' \
  --http.api 'eth,net,web3,personal,debug' \
  --ws \
  --ws.addr 0.0.0.0 \
  --ws.port 8546 \
  --ws.origins '*' \
  --ws.api 'eth,net,web3' \
  --password /root/password.txt \
  --unlock "$UNLOCK_LIST"