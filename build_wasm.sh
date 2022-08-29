#!/usr/bin/env bash

# [target.'cfg(not(target_arch = "wasm32"))'.dev-dependencies] doesn't work for avoiding compilation dev-dependecies for wasm32
cd ./token-lending/program 

# deisable dependecies
sed -i '' "s/proptest/#proptest/" Cargo.toml
sed -i '' "s/solana-program-test/#solana-program-test/" Cargo.toml

cargo build --lib --release --target wasm32-unknown-unknown

# enable dependecies
sed -i '' "s/#proptest/proptest/" ./Cargo.toml
sed -i '' "s/#solana-program-test/solana-program-test/" Cargo.toml