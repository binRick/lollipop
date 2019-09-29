#!/bin/bash

nodemon -i venv -w .  -e sh,json,py,js,yaml -x ./test_client.sh
