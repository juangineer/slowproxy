#!/usr/bin/env bash
# Copyright (c) 2023 juangineer

echo
if [ -z ${ETH_NAME} ]; then
    export ETH_NAME=enp0s3
fi
echo "Configuring $ETH_NAME ..."

# get the variables: DELAY, JITTER, DATARATE, LOSS_PERCENT
echo
if [ -z ${DELAY} ]; then
    export DELAY=100ms 
    echo "DELAY is defaulting to $DELAY"
else
    echo "DELAY is set to $DELAY"
fi

if [ -z ${JITTER} ]; then
    export JITTER=5ms 
    echo "JITTER is defaulting to $JITTER"
else
    echo "JITTER is set to $JITTER"
fi

if [ -z ${DATARATE} ]; then
    export DATARATE=100mbit
    echo "DATARATE is defaulting to $DATARATE"
else
    echo "DATARATE is set to $DATARATE"
fi

if [ -z ${LOSS_PERCENT} ]; then
    export LOSS_PERCENT=0 
    echo "LOSS_PERCENT is defaulting to $LOSS_PERCENT %"
else
    echo "LOSS_PERCENT is set to $LOSS_PERCENT %"
fi

# run tc using DELAY, JITTER, LOSS_PERCENT
tc qdisc del dev ${ETH_NAME} root netem 2>/dev/null
tc qdisc add dev ${ETH_NAME} root netem delay ${DELAY} ${JITTER} rate ${DATARATE} loss random ${LOSS_PERCENT}
echo
