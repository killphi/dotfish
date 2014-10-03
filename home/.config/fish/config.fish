# source global config
source /etc/fish/config.fish

# source aliases
source ~/.config/fish/aliases.fish

# set path
if test -z (echo $PATH | grep $HOME/bin)
  set -x PATH ~/bin $PATH
end

if test -z (echo $PATH | grep $HOME/.local/bin)
  set -x PATH ~/.local/bin $PATH
end

if test -z (echo $PATH | grep $HOME/node_moduls/.bin)
  set -x PATH $PATH ~/node_modules/.bin
end

# VIm <3
set -x VISUAL vim
set -x EDITOR $VISUAL

# fix user & host color
set -g fish_color_user green
set -g fish_color_host cyan

# dircolors
set -x LS_COLORS (dircolors .dir_colors | cut -d\n -f1 | sed -e 's/.*\'\(.*\)\'.*/\1/')

# call rvm once, to set up env
rvm ^&1 >/dev/null
