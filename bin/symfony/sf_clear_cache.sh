#!/bin/bash

echo -e "\033[33;1mClearing app cache...\033[0m"

if [ ! -e bin/console ]
then
  echo "This script must be executed in the root of a Symfony project (console file not detected)."
  exit
fi

if [ -z "$1" ]
then
	environment='dev'
	echo "No environment specified (default: dev)."
else
	environment=$1
	echo "Environment:" $1
fi

rm -rf var/cache/*
php bin/console cache:clear --env=$environment -vv
echo -e "\033[32;1mCache cleared successfully.\033[0m"