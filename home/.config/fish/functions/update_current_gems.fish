function update_current_gems
  rvm reload
  rvm rvmrc load

  rvm @global do gem update --system
  and rvm @global do gem update
  and rvm @global do gem cleanup

  if test -f Gemfile
    bundle update
    bundle clean --force
    gem cleanup
  else
    gem update
    gem cleanup
  end
end
