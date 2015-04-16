#!/bin/bash
    vol=`amixer get Master | grep "Front Left:" | awk '{print $5}' | tr -d '[]'`
    if [ $vol == "0%" ]
    then 
        echo "Mute"
    else
        echo $vol
    fi