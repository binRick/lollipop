#!/bin/bash
set -e
source findSocket.sh >/dev/null
export SSH_AUTH_SOCK=$(lolliSocket)
ssh-add -l
