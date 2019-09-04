#!/bin/bash
set -e
sleep .5
source findSocket.sh >/dev/null
export SSH_AUTH_SOCK=$(lolliSocket)
ssh-add -l
