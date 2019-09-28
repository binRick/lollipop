#!/bin/bash
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) && source test_client_common.sh
command passh -h >/dev/null || {
    echo passh not found
    exit 1;
}
set -e

./test_client_listKeys.sh
./test_client_addKey.sh ~/.ssh/id_rsa
./test_client_addKey.sh random
./test_client_addKey.sh random
./test_client_listKeys.sh
#./test_client_deleteKey.sh ~/.ssh/id_rsa
#./test_client_deleteKey.sh last
#./test_client_listKeys.sh
passh -p 132123 -P ':' \
    ./test_client_lock.sh
passh -p 132123 -P ':' \
    ./test_client_unlock.sh
