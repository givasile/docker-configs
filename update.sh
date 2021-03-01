# Updates the configuration with the present set up of emacs, tmux

# copy Emacs configuration from current working configuration
PREFIX=~/.emacs.d
rm -rf emacs/*
cp -R $PREFIX/* emacs
rm -rf emacs/auto-save-list/

# copy tmux configuration from current working configuration
cp ~/.tmux.conf tmux/

# copy git configuration from current working configuration
cp ~/.gitconfig git/
