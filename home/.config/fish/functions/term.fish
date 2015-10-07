#!/usr/bin/env fish
function term
  # if URXVT is already running, do nothing
  if ps -C urxvt256c-ml > /dev/null
    return
  end

  # start 256 color URXVT and attach tmux session
  urxvt256c-ml -cd ~ -C -e tmux -2 attach -t standard &

  # wait for window to be up
  while test -z (wmctrl -l | grep tmux)
    sleep 0.1
  end

  # make window fullscreen
  wmctrl -r tmux -b add,fullscreen
end
