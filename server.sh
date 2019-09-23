#!/bin/bash
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) && source common.sh
if [ ! -d venv ]; then
    python3 -m venv venv
fi
source venv/bin/activate
exec ./server.py
