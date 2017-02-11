# dotfiles
My dotfiles for frequently used software.

Dotfiles are symlinked into place used GNU stow.

To perform symlinking, make sure that dotfiles git repo is located in $HOME. Alternatively, the "-t" flag can be used to specify the target directory into which the symlinks should be placed.

"cd $HOME/dotfiles" then stow $PROGRAM_NAME where $PROGRAM_NAME is a directory within $HOME/dotfiles.

Not all config files present are relevant for all platforms.
