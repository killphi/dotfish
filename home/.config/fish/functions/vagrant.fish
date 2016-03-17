function vagrant
  set -l current_ruby (rvm current)
  rvm use system ^&1 > /dev/null
  set GEM_HOME ~/.vagrant.d/gems
  set GEM_PATH "/usr/share/gems:/usr/share/vagrant/gems"
  command vagrant $argv
  rvm use $current_ruby ^&1 > /dev/null
end
