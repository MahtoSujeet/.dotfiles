#!/bin/bash


cd $HOME 

echo "Installing neccessay packages..."

sudo pacman -Sy tree npm


while true; do
	read -p "Do you want to install Python? (y/n)" yn
	case $yn in
		[yY]* ) 
			sudo pacman -S python3 
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

rm $HOME/.zshrc
ln -s $HOME/.dotfiles/ohmyzsh/.zshrc $HOME/.zshrc
sudo pacman -S zsh

# plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git $ZSH_CUSTOM/plugins/auto-notify
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
 git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search


source $HOME/.dotfiles/ohmyzsh/install.sh


echo "\n\nAll set.\n"
