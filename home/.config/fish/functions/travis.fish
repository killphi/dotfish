function travis
  if not contains travis $PATH
    rvm default do travis $argv
  else
    travis $argv
  end
end
