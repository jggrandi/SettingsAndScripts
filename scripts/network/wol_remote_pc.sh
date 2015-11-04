#!/bin/bash

if [[ $(echo $1) ]]; then

        host="$1"

else

       read -p "Host Addr (xxx.xxx.xxx.xxx) or (www.test.com): " host

fi

if [[ $(echo $2) ]]; then

        mac="$2"
else

        read -p "Mac Addr (XX:XX:XX:XX:XX:XX):  " mac 

fi

wol -h $host $mac -p 7
