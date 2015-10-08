#!/usr/bin/env fish
function term
  # wait if started in parallel
  sleep 0.1

  # if URXVT is already running, do nothing
  if ps -C urxvt256c-ml
    return
  end

  # re-read user .Xresources
  test -r ~/.Xresources; and xrdb -merge -I$HOME ~/.Xresources
  sleep 0.1

  # start 256 color URXVT and attach tmux session
  urxvt256c-ml -cd ~ -C -e tmux -2 attach -t standard &

  # wait for window to be up
  while test -z (wmctrl -l | grep tmux)
    sleep 0.1
  end

  # make window fullscreen
  wmctrl -r tmux -t 1 -e 0,0,0,-1,-1 -b add,fullscreen
end
