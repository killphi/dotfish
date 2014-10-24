function rvmdo  --description "do something with `rvm default do`"
  # no params is bad
  if test -z "$argv"
    echo 'usage:
       rvmdo $cmd $args' >&2
    return 1
  end

  # is it already in path?
  set -l exists (which $argv[1] ^/dev/null)

  # yes -> eval, no -> rvm default do
  if test -n "$exists"
    eval "$argv"
  else
    rvm default do $argv
  end
end
