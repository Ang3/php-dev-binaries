#!/bin/bash

echo -e "\033[33;1mResetting application...\033[0m"

if [ ! -e bin/console ]
then
  echo "This script must be executed in the root of a Symfony project (console file not detected)."
  exit
fi

if [ -z "$1" ]
then
	ENV='dev'
	echo "No environment specified (default: dev)."
else
	ENV=$1
	echo "Environment:" $ENV
fi

if [ -z "$2" ]
then
	TYPE='normal'
	echo "Resetting type: normal (default)."
	echo
else
	TYPE=$2
	echo "Resetting type:" $TYPE
	echo
fi

php bin/console d:d:d --force --env=$ENV
if [ $TYPE = "full" ]
then
  rm -rf bin/../migrations/Version*.php
fi

php bin/console d:d:c --env=$ENV
if [ $TYPE = "full" ]
then
  php bin/console d:m:diff
fi

php bin/console d:m:m --no-interaction --env=$ENV
sh sf_clear_logs.sh
sh sf_clear_cache.sh $ENV