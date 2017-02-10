# If pure has not be installed before, make sure to symlink into function path
if [ ! -f /usr/local/share/zsh/site-functions/prompt_pure_setup ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    ln -s "$DIR/pure/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
    ln -s "$DIR/pure/async.zsh" /usr/local/share/zsh/site-functions/async
fi

autoload -U promptinit; promptinit
prompt pure