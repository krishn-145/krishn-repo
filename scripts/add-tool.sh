#!/data/data/com.termux/files/usr/bin/bash
set -e
[ -f "$1" ] || { echo "Usage: $0 /path/to/tool.deb"; exit 1; }
mkdir -p debs
cp "$1" debs/
echo "[✓] Added $(basename "$1")"
