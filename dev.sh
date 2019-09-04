#!/bin/bash

nodemon -w etc/ -w lollipop -e json,py,js,yaml -x ./server.py
