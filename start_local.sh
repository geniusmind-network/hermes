#!/bin/bash

alias hermes=./target/release/hermes

# create keys
hermes keys add --chain earth --mnemonic-file ./.local/alice.mnemonic
hermes keys add --chain mars --mnemonic-file ./.local/bob.mnemonic

# create clients
hermes create client --host-chain earth --reference-chain mars
hermes create client --host-chain mars --reference-chain earth

# create connection
hermes create connection --a-chain earth --a-client 07-tendermint-0 --b-client 07-tendermint-0

# create channel
hermes create channel --a-chain earth --a-connection connection-0 --a-port router --b-port router --channel-version router-1

# relay
hermes start