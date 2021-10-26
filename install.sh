#!/bin/bash

read -s -p "This script WILL NOT backup your existing configuration, please do it manually before running the script. Press any key to continue or ctrl-c to abort."

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "COPYING CONFIG FILES:"

echo "[-] vim"
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/ ~/.vim

echo "[-] zsh"
ln -s ${BASEDIR}/zshrc ~/.zshrc

echo "[-] Dunst (notifications)"
ln -s ${BASEDIR}/config/dunst ~/.config/dunst
echo "[-] Kitty"
ln -s ${BASEDIR}/config/kitty ~/.config/kitty
echo "[-] Polybar"
ln -s ${BASEDIR}/config/polybar ~/.config/polybar
echo "[-] Rofi"
ln -s ${BASEDIR}/config/rofi ~/.config/rofi
ln -s ${BASEDIR}/base16-material-palenight.rasi ~/.local/share/rofi/themes/base16-material-palenight.rasi
echo "[-] i3"
ln -s ${BASEDIR}/config/i3 ~/.config/i3
echo "[-] Picom"
ln -s ${BASEDIR}/config/picom ~/.config/picom
echo "[-] Script to toggle the touchpad (for laptops)"
ln -s ${BASEDIR}/config/toggletouchpad.sh ~/.config/toggletouchpad.sh

echo "SETTING WALLPAPER"
nitrogen --set-scaled ${BASEDIR}/wallpaper.jpeg

echo "INSTALLING FONTS"
cp ${BASEDIR}/fonts/* ~/.local/share/fonts/
fc-cache

echo "MAKING ZSH THE DEFAULT SHELL"
chsh -s $(which zsh)

echo "DONE"
echo "If the config seems broken please read this repo's README (https://github.com/Gusalimi/dotfiles) to make sure you have all the needed software. If it still not work, try copying the config files manually."
