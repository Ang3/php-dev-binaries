#!/bin/bash

echo -e "\033[33;1mClearing logs...\033[0m"

if [ ! -e bin/console ]
then
  echo "This script must be executed in the root of a Symfony project (console file not detected)."
  exit
fi

rm -rf var/log
echo -e "\033[32;1mLog cleared successfully.\033[0m"