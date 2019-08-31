#!/bin/sh
set -e

set -- zedwallet-beta --remote-daemon ${REMOTE_DAEMON_HOST}:${REMOTE_DAEMON_PORT} "$@"

if [ "$1" = 'zedwallet-beta' -a "$(id -u)" = '0' ]; then
    find . \! -user turtlecoin -exec chown turtlecoin '{}' +
    exec su-exec turtlecoin "$0" "$@"
fi

exec "$@"
