#!/usr/bin/env fish
set -l git_status (git status --short)

if test -n "$git_status"
  pwd
end
