PHP development binaries
========================

[![Latest Stable Version](https://poser.pugx.org/ang3/php-dev-binaries/v/stable)](https://packagist.org/packages/ang3/php-dev-binaries) [![Latest Unstable Version](https://poser.pugx.org/ang3/php-dev-binaries/v/unstable)](https://packagist.org/packages/ang3/php-dev-binaries) [![Total Downloads](https://poser.pugx.org/ang3/php-dev-binaries/downloads)](https://packagist.org/packages/ang3/php-dev-binaries)

This package provides useful binaries so as to check the code of your project. It uses [phpstan/phpstan](https://github.com/phpstan/phpstan) for code analysis and [friendsofphp/php-cs-fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer) to fix code.

Summary
=======

- [Installation](#installation)
- [Usage](#usage)
    - [PHP](#php-development)
        - [Check code](#check-code)
        - [Fix code](#fix-code)
    - [Symfony](#symfony-development)
        - [Clear logs](#clear-logs)
        - [Clear cache](#clear-cache)
        - [Clear Doctrine cache](#clear-doctrine-cache-only)
        - [Reset application](#reset-application)

Installation
============

This package should be installed globally.

Open a command console, enter your project directory and execute the
following command to download the latest stable version of this package:

```console
$ composer global require ang3/php-dev-binaries
```

Finally, do not forget to add the composer bin folder to your environment variable ```PATH```.

Usage
=====

PHP development
---------------

### Check code

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

### Fix code

In your project directory:

```shell
$ dev_fix_code.sh <sources_dir>
```

- ```sources_dir``` is the relative path of the sources folder to analyze [default: ```src```]


Symfony development
-------------------

### Clear logs

In your project directory:

```shell
$ sf_clear_logs.sh
```

### Clear cache

In your project directory:

```shell
$ sf_clear_cache.sh <environment>
```

- ```environment``` is the environment to clear [default: ```dev```]

### Clear doctrine cache (only)

In your project directory:

```shell
$ sf_clear_doctrine_cache.sh <environment>
```

- ```environment``` is the environment to clear [default: ```dev```]

### Reset application

This command will delete the database, then recreate it, load Doctrine migrations and clear the cache. 
You can force migrations resetting by passing the second argument ```full```.

In your project directory:

```shell
$ sf_reset.sh <environment> [full]
```

- ```environment``` is the environment to clear [default: ```dev```]
- ```full``` enable doctrine migrations resetting if set