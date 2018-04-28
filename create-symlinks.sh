#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/i3/config ~/.config/i3/config
