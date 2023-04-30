#!/bin/bash

cd $HOME 

echo "Upgrading Packages..."
apt update && apt upgrade -y

echo "Installing required packages."
apt install git -y
apt install neovim -y
apt install tree -y


while true; do
	read -p "Do you want to install Python? (y/n)" yn
	case $yn in
		[yY]* ) 
			apt install python -y
			pip install --upgrade pip
			pip install wheel
			break;;

		[nN]* ) echo "Skipped Python instalation."; break;;
		* ) echo "Invalid input!";;
	
	esac
done


while true; do
	read -p "Do you want to install Nodejs? (y/n)" yn
	case $yn in
		[yY]* ) 
			apt install nodejs -y
			break;;

		[nN]* ) echo "Skipped Python instalation."; break;;
		* ) echo "Invalid input!";;
	
	esac
done


# Installing nvim config
echo "Installing Neovim configurations..."

config_dir="$HOME/.config"

if [ ! -d "$config_dir" ]; then
	echo "$config_dir dir doesn't exist. Creating..."
	mkdir -p "$config_dir"
fi

ln -s "$HOME/.dotfiles/nvim" "$config_dir"
