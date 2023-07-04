# My Linux Environment Dotfiles

## My terminal config. It incudes ZSH and Neovim.

### Prerequisites
1. Make sure to clone this repo in `$HOME` directory.
1. This config assumes you are using `pacman` package manager.
To use other package manager (such as apt), make changes in `install.sh` accordingly.
No other changes it required.

--------------------------------

### Steps to install:

* Clone the repo in your `$HOME` directory.
* Do `cd .dotfiles`
* `./install.sh` OR `bash install.sh`
* Now it will install some dependencies automatically.
* After the script is done doing its work, open `nvim` for once so that it install all the plugins.
* Exit `Neovim` (`:q!`) and restart terminal.
* Done!

# Minimal configs
```
.dotfiles
├── forTermux
│   └── motd
├── install.sh
├── nvim
│   ├── init.lua
│   ├── lua
│   │   ├── after
│   │   │   └── plugins
│   │   │       ├── autocmds.lua
│   │   │       ├── colors.lua
│   │   │       └── init.lua
│   │   ├── myconfig
│   │   │   ├── init.lua
│   │   │   ├── remap.lua
│   │   │   └── set.lua
│   │   └── plugins
│   │       ├── autopairs.lua
│   │       ├── colorizer.lua
│   │       ├── github-nvim-theme.lua
│   │       ├── gruvbox.lua
│   │       ├── leap.lua
│   │       ├── lualine.lua
│   │       ├── neo-tree.lua
│   │       ├── nvim-comment.lua
│   │       ├── tailwind-sorter.lua
│   │       ├── telescope.lua
│   │       ├── transparent.lua
│   │       ├── treesitter.lua
│   │       └── zerolsp.lua
│   └── README.md
├── ohmyzsh
│   └── install.sh
└── README.md

9 directories, 25 files

```
