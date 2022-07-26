#!/usr/bin/env sh

DATA_DIR=${DATA_DIR:-"/data"}
NETWORK_ID=${NETWORK_ID:-"1337"}
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
  --http.api 'eth,net,web3,personal,debug' \
  --password /root/password.txt \
  --unlock "$UNLOCK_LIST"