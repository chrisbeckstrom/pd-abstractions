#!/bin/bash
bitwigid=56623309
xdotool windowactivate --sync $bitwigid
# bring the window to the front
xdotool windowactivate --sync $bitwigid
# hit a key
xdotool key --window $bitwigid F9
