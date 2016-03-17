function ssh-keys
  ssh-add (grep -L '^ssh' .ssh/ids/*)
end
