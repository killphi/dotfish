function fish_title
  printf '\033]2;%s\033\\' (pwd | eval $__killphi_ext_path/dir_shortener.rb):$_
end
