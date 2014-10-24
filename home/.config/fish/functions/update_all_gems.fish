function update_all_gems
  rvm reload
  rvm use @global
  gem update --system; and gem update
  rvm rvmrc load
  gem update
end
