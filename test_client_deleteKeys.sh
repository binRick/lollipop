#!/bin/bash
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) && source test_client_common.sh
ssh-add -D
