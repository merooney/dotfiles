# zshenv has already started PATH with virtual environments
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin
# PyCharm path extensions
export PATH=$PATH:/Applications/PyCharm.app/Contents/helpers/pycharm/pycharm_commands:/Applications/PyCharm.app/Contents/MacOS/pycharm:/Volumes/PyCharm/PyCharm.app/Contents/bin/:/Applications/PyCharm.app/Contents/MacOS/

# remove duplicate entries
typeset -U PATH

# Setup terminal, and turn on colors
#export TERM=xterm-256color
export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
if [[ $IS_MAC -eq 1 ]]; then
    export EDITOR='vim'
fi
if [[ $IS_LINUX -eq 1 ]]; then
    export EDITOR='vim'
fi

# Set LC_ALL="UTF8"
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# Virtual Environment Stuff
if [[ $HAS_VIRTUALENV -eq 1 ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
