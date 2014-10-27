function find_excluding -a paths excludes find_expression
  # expand excludes
  set -l excludes (echo $excludes | sed 's/ /\n/g')

  set -l exclude_expression
  for e in $excludes
    set exclude_expression $exclude_expression "-type d -name $e -prune -false -or"
  end

  eval "find $paths $exclude_expression $find_expression"
end

