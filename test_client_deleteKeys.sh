#!/bin/bash
set -e
sleep .1
source findSocket.sh >/dev/null
export SSH_AUTH_SOCK=$(lolliSocket)
ssh-add -D
