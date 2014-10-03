function find_unclean_repos
  set -l unclean $__killphi_tool_path/unclean_repo.fish
  find . -type d -name .git -execdir $unclean \; ^/dev/null
end
