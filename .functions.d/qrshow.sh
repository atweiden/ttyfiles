#!/bin/bash

# -----------------------------------------------------------------------------
# qrshow: create and display QR code with qrencode
# https://news.ycombinator.com/item?id=5332843
# -----------------------------------------------------------------------------

qrshow() { echo "$(qrencode -t ASCII -s 10 "$1" -o -)"; }
