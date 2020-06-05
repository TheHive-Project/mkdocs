#!/bin/bash

set -e

help() {
  cat <<-_EOF_
  mkdocs deploy to a remote repository
  Udate: $0 [OPTION...]
  Arguments:
    -t, --token         Token to upload
    -h, --help          This message
_EOF_
  exit 1
}

die() {
  echo $* >&2
  exit 2
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -t|--token)        PLUGIN_TOKEN=$2;     shift 2;;
    *)                 help;                shift 1;;
  esac
done

[[ -z "$PLUGIN_TOKEN" ]] && die "No Github Token configured (setting \"--token\")"


echo "[+] building and deploying documentation website"
git config credential.helper "store --file=.git/credentials"
echo "https://${PLUGIN_TOKEN}:@github.com" > .git/credentials
mkdocs gh-deploy