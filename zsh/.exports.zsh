# zshenv has already started PATH with virtual environments
export PATH=$PATH:/Users/merooney/miniconda3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin
# remove duplicate entries
typeset -U PATH

# Setup terminal, and turn on colors
export TERM=xterm-256color
#export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export MYNVIMRC=/Users/merooney/Code/dotfiles/neovim/.config/nvim/init.vim

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
if [[ $IS_MAC -eq 1 ]]; then
    export EDITOR='nvim'
fi
if [[ $IS_LINUX -eq 1 ]]; then
    export EDITOR='nvim'
fi

# Set LC_ALL="UTF8"
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
