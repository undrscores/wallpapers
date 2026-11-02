#!/bin/sh
# Download the Wallhaven images listed in sources.txt into ./wallhaven (not tracked by git).
# Uses the public Wallhaven API (SFW needs no key). Existing files are skipped.
set -eu
cd "$(dirname "$0")"
mkdir -p wallhaven
grep -v '^\s*#' sources.txt | grep -v '^\s*$' | while IFS='|' read -r id name _credit; do
    id=$(echo "$id" | xargs); name=$(echo "$name" | xargs)
    if ls wallhaven/"$name".* >/dev/null 2>&1; then echo "have  $name"; continue; fi
    url=$(curl -fsS "https://wallhaven.cc/api/v1/w/$id" | python3 -c 'import sys,json; print(json.load(sys.stdin)["data"]["path"])') || { echo "FAIL  $name ($id)"; continue; }
    ext="${url##*.}"
    curl -fsS -o "wallhaven/$name.$ext" "$url" && echo "got   $name.$ext"
done
