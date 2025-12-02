#!/bin/sh
set -e

if [ -n "$USERNAME" ] && [ -n "$PASSWORD" ]; then
    echo "Generating .htpasswd for user: $USERNAME"
    # ใช้ openssl สร้าง hash (MD5 based - รองรับกว้างขวาง)
    PASSWORD_HASH=$(openssl passwd -1 "$PASSWORD")
    echo "$USERNAME:$PASSWORD_HASH" > /etc/nginx/.htpasswd
else
    echo "USERNAME or PASSWORD not set. Skipping .htpasswd generation."
