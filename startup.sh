#!/usr/bin/dumb-init /bin/bash
set -euxo pipefail

# Copy default config to /config if not existent
if ! [ -e /config/icecast.xml ]; then
	cp /etc/icecast.xml /config/icecast.xml
	chown icecast /config/icecast.xml
fi

# Hand over to icecast
exec gosu icecast /usr/bin/icecast -c /config/icecast.xml
