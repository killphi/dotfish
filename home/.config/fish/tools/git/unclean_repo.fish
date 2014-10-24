#!/usr/bin/env fish
set -l git_status (git status --porcelain)

if test -n "$git_status"
  pwd
end
