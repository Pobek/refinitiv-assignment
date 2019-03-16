#!/bin/sh

echo "---- Start Testing Sequence ----"

sleep 2
python3 tests/app.test.py -v

echo "---- End Testing Sequence ----"