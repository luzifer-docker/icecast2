#!/bin/bash

# Copy default config to /config if not existent
if ! [ -e /config/icecast.xml ]; then
  cp /etc/icecast2/icecast.xml /config/icecast.xml
  chown icecast2 /config/icecast.xml
fi

# Hand over to icecast
sudo -u icecast2 /usr/bin/icecast2 -c /config/icecast.xml
