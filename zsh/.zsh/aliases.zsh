#-------------------------------------------------------------------
# use nocorrect alias to prevent auto correct from "fixing" these
# -------------------------------------------------------------------
alias sudo='nocorrect sudo'

# -------------------------------------------------------------------
# directory movement
# -------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias 'bk=cd $OLDPWD'

# -------------------------------------------------------------------
# directory information
# -------------------------------------------------------------------
if [[ $IS_MAC -eq 1 ]]; then
    alias lh='ls -d .*' # show hidden files/directories only
    alias lsd='ls -aFhlG'
    alias l='ls -al'
    alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
    alias ll='ls -GFhl' # Same as above, but in long listing format
fi
if [[ $IS_LINUX -eq 1 ]]; then
    alias lh='ls -d .* --color' # show hidden files/directories only
    alias lsd='ls -aFhlG --color'
    alias l='ls -al --color'
    alias ls='ls -GFh --color' # Colorize output, add file type indicator, and put sizes in human readable format
    alias ll='ls -GFhl --color' # Same as above, but in long listing format
fi

alias lsd="ls -ld *" # show directories
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias 'dirdus=du -sckx * | sort -nr' #directories sorted by size
alias 'dus=du -kx | sort -nr | less' #files sorted by size

alias 'wordy=wc -w * | sort | tail -n10' # sort files in current directory by the number of words they contain
alias 'filecount=find . -type f | wc -l' # number of files (not directories)

# these require zsh
alias ltd='ls *(m0)' # files & directories modified in last day
alias lt='ls *(.m0)' # files (no directories) modified in last day
alias lnew='ls *(.om[1,3])' # list three newest


# -------------------------------------------------------------------
# Mac only
# -------------------------------------------------------------------
if [[ $IS_MAC -eq 1 ]]; then
    alias ql='qlmanage -p 2>/dev/null' # OS X Quick Look
    alias oo='open .' # open current directory in OS X Finder
    alias 'today=calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
    alias 'smart=diskutil info disk0 | grep SMART' # display SMART status of hard drive
    # alias to show all Mac App store apps
    alias apps='mdfind "kMDItemAppStoreHasReceipt=1"'
    # refresh brew by upgrading all outdated casks
    alias refreshbrew='brew outdated | while read cask; do brew upgrade $cask; done'
    # rebuild Launch Services to remove duplicate entries on Open With menu
    alias rebuildopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
    alias defhist='history 1 | grep "defaults"'
fi

# -------------------------------------------------------------------
# random shortcuts
# -------------------------------------------------------------------
alias p='cd ~/Projects'
alias v='nvim'
alias makepass="openssl rand -base64 12"

# ------------------------------------------------------------------
# tmux stuff
# ------------------------------------------------------------------
alias takeover="tmux detach -a"
alias attach="tmux attach -t base || tmux new -s base"
alias ta='tmux attach -t' 
alias tn='tmux new -s' 
alias tls='tmux ls'
alias tk='tmux kill-session -t'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gpl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gcm='git commit'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gv='git log --pretty=format:'%s' | cut -d " " -f 1 | sort | uniq -c | sort -nr'
alias gdb='git diff master..`git rev-parse --abbrev-ref HEAD`'
alias gr='git diff master..'

# curiosities
# gsh shows the number of commits for the current repos for all developers
alias gsh="git shortlog | grep -E '^[ ]+\w+' | wc -l"

# gu shows a list of all developers and the number of commits they've made
alias guser="git shortlog | grep -E '^[^ ]'"

# ect (Edit Changed in Tabs) opens all files maked as changed by Git in Vim
# tabs
alias ect="git status --short | awk '{print $2}' | xagrs -o vim"

# -------------------------------------------------------------------
# Python virtualenv
# -------------------------------------------------------------------
alias mkenv='mkvirtualenv'
alias on="workon"
alias off="deactivate"
