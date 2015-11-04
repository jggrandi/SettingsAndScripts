#!/bin/bash

if [[ $(echo $1) ]]; then

	username="$1"
 
else

	read -p "Enter the user name: " username

fi

if [[ $(echo $2) ]]; then

	host="$2"
else
	read -p "Enter the remote machine: " host

fi

if [[ $(echo $3) ]]; then
 
        doit="$3"
else
        read -p "Enter the command: " doit

fi



ssh $username@$host -t $doit
