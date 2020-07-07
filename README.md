PHP development binaries
========================

[![Latest Stable Version](https://poser.pugx.org/ang3/php-dev-binaries/v/stable)](https://packagist.org/packages/ang3/php-dev-binaries) [![Latest Unstable Version](https://poser.pugx.org/ang3/php-dev-binaries/v/unstable)](https://packagist.org/packages/ang3/php-dev-binaries) [![Total Downloads](https://poser.pugx.org/ang3/php-dev-binaries/downloads)](https://packagist.org/packages/ang3/php-dev-binaries)

This package provides useful binaries so as to check the code of your project. It uses [phpstan/phpstan](https://github.com/phpstan/phpstan) for code analysis and [friendsofphp/php-cs-fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer) to fix code.

Installation
============

Open a command console, enter your project directory and execute the
following command to download the latest stable version of this bundle:

```console
$ composer global require ang3/php-dev-binaries
```

/!\ Do not forget to add the composer bin folder to you environment variable ```PATH```.

Usage
=====

## Check code

In your project directory:

```shell
$ dev_check_code.sh <env> <phpstan_level>
```

- ```env``` is the relative path of the sources folder to analyze [default: ```src```]
- ```phpstan_level``` the level (lower: 1 - Higher: 7) [default: ```7```]

Create the file ```phpstan.neon``` at the root of your project:

```neon
parameters:
  inferPrivatePropertyTypeFromConstructor: true
  checkGenericClassInNonGenericObjectType: false
  checkMissingIterableValueType: false
  paths:
    - %currentWorkingDirectory%/src
```

If the ```env``` is neither empty nor equal to ```src```, 
then the config file must be named following the naming convention: ```phpstan.<env>.neon```.

## Fix code

In your project directory:

```shell
$ dev_fix_code.sh <sources_dir>
```

- ```sources_dir``` is the relative path of the sources folder to analyze [default: ```src```]