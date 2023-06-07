# My Linux Environment Dotfiles

## My terminal config. It incudes ZSH and Neovim.
Note: This config assumes you are using `zypper` package manager.
To use other package manager (such as apt), make changes in `install.sh` accordingly.
No other changes it required.

--------------------------------

### Steps to install:

* clone the repo in your `$HOME` directory.
* then do `cd .dotfiles`
* `./install.sh` OR `bash install.sh`
* Now it will install some dependencies automatically.
* Restart terminal.
* Done!

# Minimal configs
```
.dotfiles
├── forTermux
│   └── motd
├── install.sh
├── nvim
│   ├── init.lua
│   ├── lazy-lock.json
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
│   │       ├── githubTheme.lua
│   │       ├── leap.lua
│   │       ├── neo-tree.lua
│   │       ├── nvimComment.lua
│   │       ├── tailwind-sorter.lua
│   │       ├── telescope.lua
│   │       ├── transparent.lua
│   │       ├── treesitter.lua
│   │       └── zerolsp.lua
│   └── README.md
├── ohmyzsh
│   └── install.sh
└── README.md


9 directories, 24 files

```
