#!/bin/bash

repo=$(echo $1 | sed 's/https:\/\/github.com\///')
filename=$(echo $repo | sed 's/.*\///').json
curl -s https://raw.githubusercontent.com/$repo/HEAD/README.md |
  grep -o 'github.com/[-a-zA-Z0-9]\+/[-\.a-zA-Z0-9_]\+' |
  sed 's/.*github.com\///g' |
  jq --raw-input '[inputs]' >$filename
