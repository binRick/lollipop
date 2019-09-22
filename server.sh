#!/bin/bash
set -e
if [ ! -d venv ]; then
    python3 -m venv venv
fi
source venv/bin/activate
exec ./server.py
