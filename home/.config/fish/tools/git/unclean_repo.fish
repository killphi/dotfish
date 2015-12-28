#!/usr/bin/env fish
set -l print 0
set -l pwd $PWD

git remote update >/dev/null

set -l file_status (git status --porcelain)
set -l remote_status (__git_remote_status)

if test $remote_status -ne 0
  set print 1

  if test $remote_status -gt 0
    set pwd "$pwd [AHEAD]"
  else
    set pwd "$pwd [BEHIND]"
  end
end

if test -n "$file_status" -o $print -gt 0
  echo $pwd
end
