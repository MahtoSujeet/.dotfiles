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


# For termux only
if [ -n "$TERMUX_VERSION" ]; then
  echo "Setting default termux screen..."
  motd_path="/data/data/com.termux/files/usr/etc/" 

  if [ -e $motd_path/motd ]; then
    echo "motd (default screen) file already exists, removing it first..."
    rm $motd_path/motd
  fi

  ln -s "$HOME/.dotfiles/forTermux/motd" "$motd_path" 
  echo "Added new motd file"

fi

# Installing nvim config
echo "Installing Neovim configurations..."

config_dir="$HOME/.config"

if [ ! -d "$config_dir" ]; then
	echo "$config_dir dir doesn't exist. Creating..."
	mkdir -p "$config_dir"
fi

if [ -d "$config_dir/nvim" ]; then
  echo "nvim config already exists!"

  while true; do
    read -p "Do you want to take backup and [o]verwrite or [s]kip instalation? (o/s)" os

    case "$os" in
      [oO]* ) echo "moving nvim/ to nvim.bak/"
        mv $config_dir/nvim $config_dir/nvim.bak

        echo "Creating symbolic link"
        ln -s "$HOME/.dotfiles/nvim" "$config_dir"
        echo "Done!"
      break;;

      [sS]* ) echo "Skiping..."
      break;;
      *) echo "Invalid input!"
      ;;
    esac

  done
fi



echo "\n\nAll set.\n"
