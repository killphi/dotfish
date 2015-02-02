#!/usr/bin/env fish
function term
  urxvt256c-ml -cd ~ -C -e tmux -2 attach -t standard &

  while test -z (wmctrl -l | grep tmux)
    sleep 0.1
  end

  wmctrl -r tmux -b add,fullscreen
end
