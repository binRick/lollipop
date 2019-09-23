#!/bin/bash
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) && source test_client_common.sh
set -e

./test_client_listKeys.sh
./test_client_addKey.sh ~/.ssh/id_rsa
./test_client_addKey.sh random
./test_client_addKey.sh random
./test_client_listKeys.sh
./test_client_deleteKey.sh ~/.ssh/id_rsa
./test_client_deleteKey.sh last
./test_client_listKeys.sh
