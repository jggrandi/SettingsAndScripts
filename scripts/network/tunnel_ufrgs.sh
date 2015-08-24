#!/bin/bash

if [[ $(echo $1) ]]; then

	username="$1"
 
else

	read -p "Enter the user name: " username

fi

if [[ $(echo $2) ]]; then

	remotemachine="$2"
else
	read -p "Enter the remote machine: " remotemachine

fi

ssh $username@portal.inf.ufrgs.br -L 2222:$remotemachine:22
