#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/zshrc ~/.zshrc
ln -s $DIR/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s $DIR/alacritty.yaml ~/.config/alacritty/alacritty.yml
ln -s $DIR/i3blocks.conf ~/.i3blocks.conf
ln -s $DIR/fonts.conf ~/.config/fontconfig/
ln -s $DIR/dunstrc ~/.config/dunst/dunstrc
ln -s $DIR/.gtkrc-2.0 ~/.gtkrc-2.0
ln -s $DIR/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
ln -s $DIR/sway/config ~/.config/sway/config


