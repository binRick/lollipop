#!/bin/bash
set -e
sleep .01
./test_client_listKeys.sh
./test_client_addKey.sh
./test_client_addKey.sh random
./test_client_listKeys.sh
