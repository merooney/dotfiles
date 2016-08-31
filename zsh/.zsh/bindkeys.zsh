# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

export KEYTIMEOUT=1
bindkey -v   # Default to standard vi bindings, regardless of editor string
# Old habits die hard
bindkey -M viins "^r" history-incremental-search-backward
bindkey -M vicmd "^r" history-incremental-search-backward
# Make it so shift+tab cycles in reverse
bindkey "^[[Z" reverse-menu-complete
