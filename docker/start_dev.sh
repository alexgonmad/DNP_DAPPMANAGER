#!/bin/bash

# link important directories
ln -s /app/packages/admin-ui/build/ /app/packages/dappmanager/dist
ln -s /usr/src/app/dnp_repo/ /app/packages/dappmanager
ln -s /usr/src/app/DNCORE/ /app/packages/dappmanager

# Install lerna first
yarn --frozen-lockfile --non-interactive --ignore-scripts --ignore-optional
yarn

# Build admin-ui
cd /app/packages/admin-ui/ && yarn build

# Build dappmanager
cd /app/packages/dappmanager/ && yarn build

# execute the scripts in background and wait
cd /app/packages/dappmanager && yarn dev &
cd /app/packages/admin-ui && yarn dev &
wait