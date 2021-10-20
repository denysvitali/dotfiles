#!/bin/bash

# This is ugly. PRs are welcome.

echo -n "🌬 "
fancy get speeds | 
  sed -E 's/^(.).*?: /\1: /' | 
  head -n2 | 
  tr '\n' '|' | 
  sed -E 's/\|([^$])/, \1/g' | 
  tr -d '|'
