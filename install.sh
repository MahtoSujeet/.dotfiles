#!/bin/bash

cd $HOME 
echo "Upgrading Packages..."
sudo apt update && sudo apt upgrade -y


echo "Installing neccessay packages..."
sudo add-apt-repository ppa:git-core/ppa
sudo apt update

sudo apt install git -y
sudo apt install tree -y

while true; do
	read -p "Do you want to install Python? (y/n)" yn
	case $yn in
		[yY]* ) 
			sudo apt install python3 -y
			pip3 install --upgrade pip
			pip3 install wheel
			break;;

		[nN]* ) echo "Skipped Python instalation."; break;;

		* ) echo "Invalid input!";;
	
	esac
done


################ Installing nvim config ##################
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
  
else
  echo "Creating symbolic link"
  ln -s "$HOME/.dotfiles/nvim" "$config_dir"
  echo "Done!"
	
fi




################ For termux only #####################
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
#######################################################

############ Oh my zsh #####################
sudo apt install zsh -y
source $HOME/.dotfiles/ohmyzsh/install.sh
ln -s $HOME/.dotfiles/ohmyzsh/.zshrc $HOME/.zshrc

echo "\n\nAll set.\n"
