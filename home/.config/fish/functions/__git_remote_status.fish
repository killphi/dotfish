function __git_remote_status
  set -l remote_status (git status --porcelain --branch | head -1)

  if test (echo $remote_status | ag -Q ahead  | wc -l) -gt 0
    echo 1
    return
  end

  if test (echo $remote_status | ag -Q behind | wc -l) -gt 0
    echo -1
    return
  end

  echo 0
end
