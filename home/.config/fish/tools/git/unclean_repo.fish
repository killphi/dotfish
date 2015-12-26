#!/usr/bin/env fish
set -l file_status (git status --porcelain)
set -l branch_status (git status --porcelain --branch | head -1)

if test -n "$file_status"
  pwd
end
