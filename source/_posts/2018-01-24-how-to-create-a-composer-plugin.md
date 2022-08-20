---
extends: _layouts.post
title: How to create a Composer plugin
author: Cristian Radulescu
description: After tinkering around with Symfony4 and Flex I was curious about how Composer plugins work...
date: 2018-01-24
section: content
categories: []
---
After tinkering around with *Symfony4* and *Flex* I was curious about how *Composer* plugins work. So I started to check the Composer's plugin API and [the official documentation](https://getcomposer.org/doc/articles/plugins.md). The documentation is great and you even have a full example of a plugin but when I wanted to test it... nothing. The plugin wasn't loaded and nothing happened. Why? Because I was testing it wrong. :) So this is more of a tip on how to start with a Composer plugin than a real step by step tutorial on how to create it.

You can find the [**demo code** here](https://github.com/cristianradulescu/composer-plugin-demo) if you want to follow it while reading (ignore the instructions from README for now).

**First steps:**

1. Create the *composer.json* file in a new folder;
2. Make sure to set the "type" to "composer-plugin", add "autoload" and "extra" sections;
3. Create the PHP class defined in the "extra" section.

**The wrong way to test the plugin (don't do it like this):**

What I did next was to actually run *composer* in the same project where the plugin was created as described above. But it doesn't work like that because this is a plugin and should be added to a project to extend that project's capabilities.

**The right way to test the plugin:**

So instead of trying to execute the plugin as a full featured project, add it to one of your projects. Create a repository for the plugin on Github or another VCS system, then update the *composer.json* file from your project and include it there:

```json
"require": {
  "cristianradulescu/composer-plugin-demo": "dev-master"
},
"repositories": [
  {
    "type": "git",
    "url": "https://github.com/cristianradulescu/composer-plugin-demo.git"
  }
]
```

Run *composer update* and make sure the plugin is installed.

In the demo the event is set to "init" which means that the plugin is executed each time *composer* runs. If you run *composer* now you should see the plugin's output in terminal:

```shell
$ ./composer.phar

========= Demo plugin =========
Congrats, your plugin works! :)
===============================

   ______
  / ____/___  ____ ___  ____  ____  ________  _____
 / /   / __ \/ __ `__ \/ __ \/ __ \/ ___/ _ \/ ___/
/ /___/ /_/ / / / / / / /_/ / /_/ (__  )  __/ /
\____/\____/_/ /_/ /_/ .___/\____/____/\___/_/
                    /_/
Composer version 1.6.2 2018-01-05 15:28:41
```
