#!/bin/bash
	temp=`sensors | grep "Physical id 0:" | awk -n '{print $4}'| tr -d '+' | tr -d  'C-º'| tr -d [:punct:]`
	echo $temp

