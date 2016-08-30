prompt_script_path=`dirname -- "$0"`
fpath=( $prompt_script_path $fpath )

autoload -U promptinit && promptinit
prompt pure
