---
extends: _layouts.post
title: PHP CLI increase memory limit
author: Cristian Radulescu
description: When running a PHP script from command line interface, a higher memory limit may be required...
date: 2009-10-03
section: content
categories: []
---
When running a PHP script from command line interface, a higher memory limit may be required in order for the script to be successfully executed. This can be achieved using the *-d* or *--define* option in the command. 

An example of running a PHP script in CLI with custom memory limit:

```shell
php -d memory_limit=128M script.php
```

The option is not limited to the memory limit directive and it can be use to alter other php.ini directives as well.