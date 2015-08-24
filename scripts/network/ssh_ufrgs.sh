#!/bin/bash

if [[ $(echo $*) ]]; then
    
	username="$*"

else

	read -p "Enter the user name: " username

fi

ssh $username@portal.inf.ufrgs.br
