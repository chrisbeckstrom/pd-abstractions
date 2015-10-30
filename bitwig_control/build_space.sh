#!/bin/bash
# CB's Bitwig window ID script
# this script does a few things:
# 0. Gets the window ID of bitwig (using xdotool)
# 1. writes a script to hit the space bar in that window
# 2. makes the script executable
# once it's executable, the script can be run from within pd-extended
# using the "shell" thing
# the idea is to control *that* with MIDI, so we can control
# bitwig's transport with MIDI

# go find the bitwigid using xdotool
bitwigid=$(xdotool search --class bitwig)

# save this id to a file in case we need it later
echo $bitwigid > bitwigid

# tell us the id
echo 'the bitwigid is: '$bitwigid

# BUILT THE SPACEBAR SCRIPT
# the file we're going to build
file=space.sh

# build up the script
echo '#!/bin/bash' > $file

echo 'bitwigid='$bitwigid >> $file

echo 'xdotool windowactivate --sync $bitwigid' >> $file

echo '# bring the window to the front
xdotool windowactivate --sync $bitwigid' >> $file

echo '# hit a key
xdotool key --window $bitwigid space' >> $file

# make executable
chmod +x $file

# BUILT THE RECORD ENABLE TOGGLE SCRIPT
# the file we're going to build
file=record.sh

# tell us the id
echo 'the bitwigid is: '$bitwigid

# build up the script
echo '#!/bin/bash' > $file

echo 'bitwigid='$bitwigid >> $file

echo 'xdotool windowactivate --sync $bitwigid' >> $file

echo '# bring the window to the front
xdotool windowactivate --sync $bitwigid' >> $file

echo '# hit a key
xdotool key --window $bitwigid F9' >> $file

# make executable
chmod +x $file

# BUILT THE METRONOME/CLICK TOGGLE SCRIPT
# the file we're going to build
file=click.sh

# build up the script
echo '#!/bin/bash' > $file

echo 'bitwigid='$bitwigid >> $file

echo 'xdotool windowactivate --sync $bitwigid' >> $file

echo '# bring the window to the front
xdotool windowactivate --sync $bitwigid' >> $file

echo '# hit a key
xdotool key --window $bitwigid c' >> $file

# make executable
chmod +x $file
