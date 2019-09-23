#!/bin/bash
set -e
DELETE_KEY="$1"
if [ "$DELETE_KEY" == "" ]; then
    echo First argument must be key path
    exit 1
fi

if [ "$DELETE_KEY" == "last" ]; then
    DELETE_KEY="$(./test_client_listKeys.sh 2>/dev/null | grep 'SHA256:'|tail -n 1|sed 's/[[:space:]]/ /g'|cut -d' ' -f3)"
fi

source findSocket.sh >/dev/null
export SSH_AUTH_SOCK=$(lolliSocket)

./test_client_listKeys.sh 2>/dev/null | grep " ${DELETE_KEY} " >/dev/null || {
    echo "Key \"$DELETE_KEY\" not found!"
    echo "Loaded Keys"
    ./test_client_listKeys.sh 2>/dev/null
    echo ""
    exit 1;
}

ssh-add -d $DELETE_KEY
code=$?

echo "ssh-add exit code: $code"
