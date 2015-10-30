#!/bin/bash

bitwigid=$(xdotool search --class bitwig)
echo 'the bitwigid is: '$bitwigid

# build up space3.sh

echo '#!/bin/bash' > space3.sh

bitwigid=$(cat bitwigid)

echo 'bitwigid='$bitwigid >> space3.sh
