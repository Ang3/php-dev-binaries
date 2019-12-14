PHP development binaries
========================

This package provides useful binaries so as to check the code of your project. It uses [phpstan/phpstan](https://github.com/phpstan/phpstan) for code analysis and [friendsofphp/php-cs-fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer) to fix code.

Installation
============

Open a command console, enter your project directory and execute the
following command to download the latest stable version of this bundle:

```console
$ composer require ang3/php-dev-binaries --dev
```

Usage
=====

## Check code

In your project directory:

```shell
$ vendor/bin/check_code.sh <sources_dir> <phpstan_level>
```

- ```source_dir``` (required) is the relative path of the sources folder to analyze [default: ```src```]
- ```phpstan_level``` (optional) the level (lower: 1 - Higher: 7) [default: ```7```]

## Fix code

In your project directory:

```shell
$ vendor/bin/fix_code.sh <sources_dir>
```

- ```source_dir``` (required) is the relative path of the sources folder to analyze [default: ```src```]