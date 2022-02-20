#!/bin/sh

# shellcheck disable=SC2039
echo -e "\033[33;1m"
echo -e "Checking code"
echo -e "=============\033[0m"
echo

if [ -z "$1" ]
then
	level=9
	echo "No level specified (default: 9 [max])."
	echo 
else
	level=$1
	echo "Level:" $1
	echo 
fi

echo "Config file:" $config_file
echo 

phpstan analyse $directory -c phpstan.neon -l $level