#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/zshrc ~/.zshrc
ln -s $DIR/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s $DIR/alacritty.yaml ~/.config/alacritty/alacritty.yml
ln -s $DIR/i3/config ~/.config/i3/config
ln -s $DIR/i3blocks.conf ~/.i3blocks.conf
