---
extends: _layouts.post
title: Find all folders with same name in a directory tree and execute commands on
author: Cristian Radulescu
description: Find folders having the same name in a directory tree and execute commands on them.
date: 2009-10-11
section: content
categories: []
---
In a Linux CLI environment you can use the "find" command to search for files or folder. In this tutorial I will explain how to find folders having the same name in a directory tree and execute commands on them.

Since the best way to learn is by example, let's consider the following scenario: a collection of images along with their corresponding thumbnails in directories named "thumbs"; so what you are trying to do is remove all "thumbs" directories from your images collection.

The first step is to determine the path of the directory tree. Assuming that "/home/cristian/wallpapers" is the path you can execute the command by providing the entire path as parameter for the "find" command. If you are already in this directory you can use the dot "." instead of the path (the dot is the equivalent of the current directory).

Now that you have the path, you need two more parameters for the find command - the name of the directories and the type. For the type you must use the letter "d" since this is how the "find" command will know that you want to search for a directory. For the name just provide "thumbs" since this is what we want to remove (see above scenario).

So far the command is:

```shell
find "/home/cristian/wallpapers" -name thumbs -type d
```

You found the directories, now pass this list to the deleting command with "xargs":

```shell
find "/home/cristian/wallpapers" -name thumbs -type d | xargs rm -rf
```

If you need root permissions to delete the files just add the "sudo":

```shell
find "/home/cristian/wallpapers" -name thumbs -type d | xargs sudo rm -rf
```

then enter your password.