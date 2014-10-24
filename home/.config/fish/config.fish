# source global config
source /etc/fish/config.fish

# source aliases
source ~/.config/fish/aliases.fish

# set tool and ext path
set -g __killphi_tool_path ~/.config/fish/tools
set -g __killphi_ext_path ~/.config/fish/ext

# modify path
if not contains $HOME/node_modules/.bin $PATH
  set -x PATH ~/node_modules/.bin $PATH
end

if not contains $HOME/bin $PATH
  set -x PATH ~/bin $PATH
end

if not contains $HOME/.local/bin $PATH
  set -x PATH ~/.local/bin $PATH
end

# VIm <3
set -x VISUAL vim
set -x EDITOR $VISUAL

# dircolors
set -x LS_COLORS (dircolors ~/.dir_colors | cut -d\n -f1 | sed -e 's/.*\'\(.*\)\'.*/\1/')

# call rvm once (silently), to set up env
rvm ^&1 >/dev/null
