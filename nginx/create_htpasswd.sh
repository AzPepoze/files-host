#!/bin/sh
set -e

if [ -n "$USERNAME" ] && [ -n "$PASSWORD" ]; then
    echo "Installing apache2-utils..."
    apk add --no-cache apache2-utils > /dev/null

    echo "Generating .htpasswd for user: $USERNAME"
    htpasswd -bc /etc/nginx/.htpasswd "$USERNAME" "$PASSWORD"
else
    echo "USERNAME or PASSWORD not set. Skipping .htpasswd generation."
fi