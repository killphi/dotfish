function find_unclean_repos
  set -l unclean $__killphi_tool_path/git/unclean_repo.fish
  set -l excludes node_modules bower_components vendor
  set -l expression "-type d -name .git -prune -execdir $unclean"

  find_excluding . $excludes $expression \\\; ^/dev/null
end
