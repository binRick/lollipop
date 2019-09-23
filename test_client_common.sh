source common.sh
set -e
source findSocket.sh >/dev/null
export SSH_AUTH_SOCK=$(lolliSocket)
