#!/usr/bin/env bash

apt-get install -y ca-certificates gnupg
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=18
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Ensure we use nodesource packages, even if Debian ships newer major versions.
cat << EOD > /etc/apt/preferences.d/nodesource-nodejs
Package: *
Pin: origin deb.nodesource.com
Pin-Priority: 1001
EOD

apt-get update
apt-get -qq install nodejs
# This only works for node > 16, but that version is unsupported now anyway.
corepack enable

# Validate we have the right nodejs version.
nodejs -v | grep -q v$NODE_MAJOR
