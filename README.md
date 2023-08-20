# My Linux Environment Dotfiles

## My terminal config. It incudes OhMyZSH, Neovim and Kitty.

### Prerequisites
1. `git` must be installed
1. Your brain must be present in skull.

--------------------------------

### Steps to install:

Run the following piece of code in `$HOME` directory.
```bash
git clone --bare https://github.com/MahtoSujeet/.dotfiles.git $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
It takes the backup of current config files in `.config-backup` folder and installs remote config.


# Required Packages
```
neovim npm kitty zsh zsh-completions ntfs-3g intel-ucode
```

## Auto Screen rotate
```iio-sensor-proxy```

## Bluetooth
1. Install ```bluez bluez-utils pulseaudio-bluetooth```
1. `sudo systemctl enable bluetooth.service`
1. `sudo systemctl start bluetooth.service`

## OhMyZSH
### Plugins
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

## Dolphin thumbnail fix
* Install `ffmpegthumbs` package.

## Other Apps
* `Okular` - PDF Reader
* `smplayer` - Video Player (VLC sucks in Linux)

