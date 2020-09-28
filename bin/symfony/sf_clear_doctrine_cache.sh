#!/bin/bash

echo -e "\033[33;1mClearing Doctrine cache...\033[0m"

if [ ! -e bin/console ]
then
  echo "This script must be executed in the root of a Symfony project (console file not detected)."
  exit
fi

if [ -z "$1" ]
then
	ENV='dev'
	echo "No environment specified (default: dev)."
	echo
else
	ENV=$1
	echo "Environment:" $1
	echo
fi

php bin/console doctrine:cache:clear-metadata --env=$ENV
php bin/console doctrine:cache:clear-query --env=$ENV
php bin/console doctrine:cache:clear-result --env=$ENV
php bin/console doctrine:cache:flush doctrine_cache.providers.doctrine.orm.default_second_level_cache.region_cache_driver --env=$ENV
echo -e "\033[32;1mCache cleared successfully.\033[0m"