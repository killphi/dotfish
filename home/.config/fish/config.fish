# source global config
source /etc/fish/config.fish

# we know we get unicode
unicode_start

# source aliases
source ~/.config/fish/aliases.fish

# set tool and ext path
set -g __killphi_tool_path ~/.config/fish/tools
set -g __killphi_ext_path ~/.config/fish/ext

# clean language foo
set -e LANGUAGE


# modify PATH
set -xg PATH /usr/local/bin /usr/bin /bin

if not contains $HOME/node_modules/.bin $PATH
  set -x PATH ~/node_modules/.bin $PATH
end

if not contains $HOME/bin $PATH
  set -x PATH ~/bin $PATH
end

if not contains $HOME/.local/bin $PATH
  set -x PATH ~/.local/bin $PATH
end

# modify LD_LIBRARY_PATH
if not contains /usr/lib $LD_LIBRARY_PATH
  set -x LD_LIBRARY_PATH /usr/lib $LD_LIBRARY_PATH
end

if not contains /usr/lib64 $LD_LIBRARY_PATH
  set -x LD_LIBRARY_PATH /usr/lib64 $LD_LIBRARY_PATH
end

if not contains /usr/local/lib $LD_LIBRARY_PATH
  set -x LD_LIBRARY_PATH /usr/local/lib $LD_LIBRARY_PATH
end

# VIm <3
set -x VISUAL vim
set -x EDITOR $VISUAL
fish_vi_mode
fish_vi_key_bindings

# dircolors
set -x LS_COLORS (dircolors ~/.dir_colors | head -1 | sed -e 's/.*\'\(.*\)\'.*/\1/')

# Rust env
set -x RUST_SRC_PATH "/home/killphi/Versioning/Rust/rust/src"

# call rvm (silently), to set up env
rvm reload ^&1 >/dev/null
rvm rvmrc load ^&1 >/dev/null
