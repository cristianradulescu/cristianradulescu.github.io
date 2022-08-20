---
extends: _layouts.post
title: Easy file sharing with Python SimpleHTTPServer
author: Cristian Radulescu
description: An easy way to share files from your computer is to use Python SimpleHTTPServer.
date: 2012-02-08
section: content
categories: []
---
An easy way to share files from your computer is to use [Python SimpleHTTPServer](http://docs.python.org/library/simplehttpserver.html). You don't need to know Python programming to use the SimpleHTTPServer, the only requirement is to have Python installed on the machine where the files that needs to be shared are located.

Most Linux distributions are shipped with Python installed by default, but for Windows you might need to check [how to use Python on Windows](http://docs.python.org/using/windows.html).

To start the SimpleHTTPServer "cd" into the directory which you want to be shared and run the following command:

#### Python 2

```shell 
python -m SimpleHTTPServer 9000
``` 

#### Python 3

```shell
python3 -m http.server 9000
```

To access the shared files o to http://your_ip_address:9000.
