#!/bin/bash

nodemon -w . -w etc/ -w lollipop -e json,py,js,yaml -x ./test.sh
