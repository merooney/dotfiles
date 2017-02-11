# WARNING These customizations are currently mac-centric
# If pure has not be installed before, make sure to symlink into function path
if [ ! -f /usr/local/share/zsh/site-functions/prompt_pure_setup ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    ln -s "$DIR/pure/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
    ln -s "$DIR/pure/async.zsh" /usr/local/share/zsh/site-functions/async
fi

# Perform basic platform checks
source ~/.checks.zsh
# Set colors
source ~/.colors.zsh
# Set options
source ~/.setopt.zsh
# Exported environment variables
source .exports.zsh
# NOTE Research how completitions work and how to add custom completions
# Load up completions
source .completion.zsh
# Set aliases
source .aliases.zsh
# Change key bindings to vi style
source .bindkeys.zsh
# Inject utility shell scripts
source .functions.zsh
# History settings
source .history.zsh
# These two lines initiate the modified version of the "Pure" prompt in use
autoload -U promptinit; promptinit
prompt pure
# This script modifies pure to have a modal prompt based on vimode
source ~/.vimode.zsh
# Load up frecency based dir nag
source ~/.z.sh 
# Supposed to keep the following line at the end
source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
