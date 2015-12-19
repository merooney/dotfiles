# START ANTIGEN
# Load Antigen
source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Antigen OS-independent bundles
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting

# Antigen python bundles
antigen bundle python
antigen bundle virtualenv

# Antigen mac bundles
antigen bundle brew

# Load ZSH theme
antigen theme sunrise
antigen apply

# END ANTIGEN

export PATH="/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin:/Applications/PyCharm.app/Contents/helpers/pycharm/pycharm_commands:/Applications/PyCharm.app/Contents/MacOS/pycharm:/Volumes/PyCharm/PyCharm.app/Contents/bin/:/Applications/PyCharm.app/Contents/MacOS/"
source /usr/local/bin/virtualenvwrapper.sh
export MANPATH="/usr/local/man:$MANPATH"
export PYTHONPATH="PYTHONPATH:/Applications/PyCharm.app/Contents/debug-eggs/pycharm-debug.egg"

export LANG=en_US.UTF-8
export MYNVIMRC=~/.config/nvim/init.vim

alias v="nvim"
alias zshconfig="nvim ~/.zshrc"
