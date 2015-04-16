#!/bin/bash
	conx=`cat /sys/class/net/wlp7s0/operstate`
	conx2=`cat /sys/class/net/enp9s0/operstate`
	if [ $conx == "down"  ] && [ $conx2 == "down" ]
	then
		echo OFF
	else
		echo ON
	fi
