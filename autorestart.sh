#!/usr/bin/env bash

function execute() {
    echo "Restart"
    # eval "$@"
}

execute "$@"

inotifywait --quiet --recursive --monitor --event modify --format "%w%f" ./wireguard/ \
| while read change; do
    execute "$@"
done
