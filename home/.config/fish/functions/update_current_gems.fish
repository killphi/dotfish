function update_current_gems
  rvm reload
  rvm rvmrc load
  rvm @global do gem update --system
  and rvm @global do gem update
  and gem update
end
