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
  --ipcdisable \
  --nodiscover \
  --maxpeers 0 \
  --nat none \
  --datadir /data \
  --mine \
  --miner.gaslimit "$GAS_LIMIT" \
  --miner.gasprice "$GAS_PRICE" \
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
  --exitwhensynced \
  --syncmode full \
  --gcmode archive \
  --vmdebug \
  --password /root/password.txt \
  --unlock "$UNLOCK_LIST"