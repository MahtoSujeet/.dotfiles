# Dotfiles

There is no place like ~/

This config includes Hyprland, neovim and zsh.

### Prerequisites

1. `git` must be installed
1. Your brain must be present in skull.

--------------------------------

# HYPRLAND SETUP

To get started you'll need few utilities and some basic things, We'll go in steps as;

1. Adding Wayland & Xwayland
1. Installing an AUR helper
1. Installing hyprland and related dependencies
1. Setting up audio, video, Brightness, wofi & Screenshot
1. Installing and configuring app clients like Discord, Telegram

## Setup
### Setting Up Wayland and Xwayland

If you are running something like Gnome, Kde, Sway, Qtile e.t.c you can skip this step and move to next one

```bash
sudo pacman -Sy wayland libdrm pixman libxkbcommon python2 libxml2 \
llvm libpng gegl mtdev xorg-xwayland  qt5-wayland qt6-wayland 
```
These dependencies will setup the base required for proper functioning of hyprland or any other window manager based on wayland

Xwayland is requied to run some xorg specific dependencies without it you might feel lags or stutters while doing some task or some task might break

## Installing AUR Helper (Paru)
```bash
git clone https://aur.archlinux.org/paru-bin && cd paru-bin && makepkg -si
```

After Installing paru, check for any updates using Paru.

## Installing hyprland and Stuff to make Hyprland functional
```bash
paru -S hyprland-bin hyprpaper waybar-hyprland-git xdg-desktop-portal-hyprland \
wlroots xdg-desktop-portal polkit-kde-agent wofi kitty neovim zsh zsh-completions \
zsh-syntax-highlighting zsh-autosuggestions starship ntfs-3g intel-ucode npm thunar
```

## Setting up Volume, Brightness & other useful stuff
```bash
paru -S light pavucontrol alsa-utils mako mpv brave-bin nm-applet
```

-------------------------------------------------

# Config installation

Run the following piece of code in `$HOME` directory.
```bash
git clone --bare https://github.com/MahtoSujeet/.dotfiles.git $HOME/.dotfiles
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .dotfiles-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no
```
It takes the backup of current config files in `.dotfiles-backup` folder and installs remote config.

---------------------------------------

# Other Useful stuff and fixes

## Bluetooth
1. Install ```bluez blueman bluez-utils pulseaudio-bluetooth```
1. `sudo systemctl enable bluetooth.service`
1. `sudo systemctl start bluetooth.service`

## Thumbnail fix
* Dolphin - Install `ffmpegthumbs` package.
* Thunar/Nautilus - Install `ffmpeg ffmpegthumbnailer gst-libav`

In case insalling these alone doesn't work, remove `~/.thumbnails`,
then `ln -s $HOME/.cache/thumbnails $HOME/.thumbnails`

## Chaotic AUR
First, install the primary key - it can then be used to install our keyring and mirrorlist.

```bash
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
```

Append (adding to the end of the file) to `/etc/pacman.conf`:

```
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
```

## To mount NTFS
1. Get UUID of disk with `lsblk -f`
1. Add following to `/etc/fstab`
```
UUID=<UUID>     <mount-point>   ntfs    rw,uid=1000,gid=1000,umask=0022,fmast=0022  0 0
```

## Other Apps
* `Okular` - PDF Reader
* `haruna` - Video Player (VLC sucks in Linux)
* `imv` - Image Viewer

