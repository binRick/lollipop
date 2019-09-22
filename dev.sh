#!/bin/bash

nodemon -w . -w etc/ -w lollipop -e json,py,js,yaml,sh,yml,j2,js -x ./server.sh
