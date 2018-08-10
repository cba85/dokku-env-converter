#!/bin/bash

# File content
file='.env'
tmp='.env.tmp'
sed '/^#/ d' < $file > $tmp

# Check if app_name argument exists
if [ -z "$1" ]
then
	echo -e '\033[31mUsage: dokku-env-converter [app_name]\033[0m'
else
	# Check if .env file exists
	if [ -f "$file" ]
	then
		echo 'dokku config:set ' | tr -d '\n'; echo "$1 " | tr -d '\n'; cat $tmp | tr '\r\n' ' '
		rm -f $tmp
	else
		echo -e '\033[31mError: .env file not found\033[0m'
	fi
fi