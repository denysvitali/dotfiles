#!/bin/bash

echo -n "C: "
fancy get temps | grep '^CPU: ' | awk '{print $2}'
