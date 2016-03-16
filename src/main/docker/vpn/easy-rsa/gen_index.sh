#!/bin/bash
touch "$( cd "$( dirname "$0" )" && pwd )"/keys/index.txt
echo "00" > "$( cd "$( dirname "$0" )" && pwd )"/keys/serial
