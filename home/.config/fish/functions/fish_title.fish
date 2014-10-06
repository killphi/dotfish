function fish_title
  printf '\033]2;%s\033\\' (pwd | ~/.config/fish/ext/dir_shortener.rb):$_
end
