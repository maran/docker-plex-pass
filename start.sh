#! /bin/sh

mkdir -p /config/logs/supervisor

rm -rf /var/run/*
rm -f "/config/Library/Application Support/Plex Media Server/plexmediaserver.pid"

mkdir -p /var/run/dbus
chown messagebus:messagebus /var/run/dbus
dbus-uuidgen --ensure
dbus-daemon --system --fork
sleep 1

avahi-daemon -D
sleep 1

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
