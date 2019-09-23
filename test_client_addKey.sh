#!/bin/bash
set -e
_GEN_KEY_NAME=$(mktemp -p /dev/shm)
NEW_KEY=$1
if [ "$1" == "" ]; then
    NEW_KEY=~/.ssh/id_rsa
fi
if [ "$1" == "generate" ] || [ "$1" == "new" ] || [ "$1" == "gen" ] || [ "$1" == "random" ] || [ "$1" == "rand" ]; then
    if [ -f "$_GEN_KEY_NAME" ]; then 
        unlink $_GEN_KEY_NAME;
    fi
    ssh-keygen -t rsa -N "" -f $_GEN_KEY_NAME >/dev/null
    NEW_KEY=$_GEN_KEY_NAME
fi

if [ ! -f "$NEW_KEY" ]; then
    echo "File \"$_NEW_KEY\" not found"
    exit 1
fi
sleep .1
source findSocket.sh >/dev/null
export SSH_AUTH_SOCK=$(lolliSocket)
ssh-add $NEW_KEY
