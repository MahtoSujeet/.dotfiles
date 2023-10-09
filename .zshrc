# vim:foldmethod=marker

#: ex = EXtractor for all kinds of archives {{{
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
#: }}}

#: Completions {{{
autoload -Uz compinit promptinit
compinit

# Plguins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# case insensitive path-completion
# NOTE doesnt work with autosuggest tab key binding
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

zstyle ':completion:*' menu select # menu for autocompletes
# completions in sudo
zstyle ':completion::complete:*' gain-privileges 1
#}}}

#: Keybindings {{{
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# By doing this, only the past commands matching the current line up
# to the current cursor position will be shown when Up or Down keys are pressed.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

##### My bindings #############
bindkey "\t" autosuggest-accept
#: }}}

#: Aliases {{{
# Look and feel
alias ls="ls --color"
alias la="ls -a"
alias ll="ls -l"
alias l="ls -la"
alias grep="grep --color"
alias ..="cd .."
alias ...="cd ../.."

# pacman
alias sps="sudo pacman -S --needed"
alias spss="sudo pacman -Ss"
alias spsi="sudo pacman -Si"
alias sprns="sudo pacman -Rns"
alias pqs="pacman -Qs"
alias pqi="pacman -Qi"
alias outdated="paru -Sy && paru -Qu"
alias resedue="paru -Qdt"

# ytdl
alias ytv='yt-dlp --merge-output-format mp4 -f "bestvideo+bestaudio/best"'
alias yta="yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail"

# git
alias gd="git diff"
alias gs="git status"
alias gcm="git commit -m"
alias gco="git checkout"

# dotfiles config
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias df=dotfiles

# Dotfiles info, use `dot` function
dot(){
  if [[ "$#" -eq 0 ]]; then
    (cd /
    for i in $(dotfiles ls-files); do
      echo -n "$(dotfiles -c color.status=always status $i -s | sed "s#$i##")"
      echo -e "¬/$i¬\e[0;33m$(dotfiles -c color.ui=always log -1 --format="%s" -- $i)\e[0m"
    done
    ) | column -t --separator=¬ -T2
  else
    dotfiles $*
  fi
}

# Warp+
alias wlc="warp-cli connect"
alias wld="warp-cli disconnect"
alias wls="warp-cli -l status"

# other
# alias neofetch="clear && neofetch"
alias vi=nvim
alias se=sudoedit
alias tree="tree -I 'node_modules|__pycache__'"
alias yd="yarn dev"
alias neofetch=fastfetch
alias history="fc -li 1"
#}}}

#: Look and Feel {{{
# to set truecolor
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor

# promptinit
# This will set the default prompt to the walters theme
# prompt walters
eval "$(starship init zsh)"
#}}}

#: Configs {{{
export EDITOR='nvim'

# zsh history
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
export HISTFILESIZE=10000
export HISTSIZE=10000

# immediate appent to history
setopt INC_APPEND_HISTORY
setopt appendhistory

setopt HIST_FIND_NO_DUPS    # No dublicate when step history with arrow keys

# Hyprshot
export HYPRSHOT_DIR=~/Pictures/Screenshots
#}}}

#: Fixes {{{
# for firefox wayland support & touch screen
export MOZ_USE_XINPUT2=1
export MOZ_ENABLE_WAYLAND=1
#}}}

# Startup
# fastfetch
pfetch

