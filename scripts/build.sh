#!/bin/bash

# find the project dir
echo 'detecting project dir..'
PROJ_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

pushd $PROJ_DIR > /dev/null

echo 'building css..'

# compile the css
lessc site/css/main.less site/css/main.css

echo 'building html..'

# make the main page
cat parts/pagestart.html parts/searchform.html parts/pageend.html > site/index.html

# make two results partial pages
cat parts/results1.html > site/results1.html
#cat parts/results2.html > site/results2.html

popd > /dev/null

date "+finished %S seconds after %I:%M%p."