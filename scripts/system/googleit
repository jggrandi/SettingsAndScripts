#!/bin/bash

if [[ $(echo $*) ]]; then

    searchterm="$*"

else

    read -p "Enter your search term: " searchterm

fi

searchterm=$(echo $searchterm | sed -e 's/\ /+/g')

lynx -dump http://www.google.com/search?q=$searchterm | less
