#!/usr/bin/env bash

#!/bin/bash

# Define the desired bucket size
BUCKET_SIZE="128"

# Path to the Nginx configuration file
NGINX_CONF="/etc/nginx/nginx.conf"

# Check if the Nginx configuration file exists
if [ ! -f "$NGINX_CONF" ]; then
    echo "Nginx configuration file does not exist at $NGINX_CONF"
    exit 1
fi

# Check if server_names_hash_bucket_size is already set
if grep -q "server_names_hash_bucket_size" "$NGINX_CONF"; then
    # Update the existing value
    sudo sed -i "/server_names_hash_bucket_size/c\    server_names_hash_bucket_size $BUCKET_SIZE;" "$NGINX_CONF"
else
    # Add the directive to the http block
    sudo sed -i "/http {/a \    server_names_hash_bucket_size $BUCKET_SIZE;" "$NGINX_CONF"
fi

# Test Nginx configuration
if ! sudo nginx -t; then
    echo "Nginx configuration test failed"
    exit 1
fi

echo "nginx server_names_hash_bucket_size is set to ${BUCKET_SIZE}"
