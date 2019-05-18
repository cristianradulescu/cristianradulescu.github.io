---
layout: post
status: publish
published: true
title: Easy file sharing with Python SimpleHTTPServer
author: Cristian Radulescu
excerpt: An easy way to share files from your computer is to use Python SimpleHTTPServer.
date: '2012-02-08 23:46:59 +0200'
date_gmt: '2012-02-08 21:46:59 +0200'
---
An easy way to share files from your computer is to use [Python SimpleHTTPServer](http://docs.python.org/library/simplehttpserver.html). You don't need to know Python programming to use the SimpleHTTPServer, the only requirement is to have Python installed on the machine where the files that needs to be shared are located.

Most Linux distributions are shipped with Python installed by default, but for Windows you might need to check [how to use Python on Windows](http://docs.python.org/using/windows.html).

To start the SimpleHTTPServer "cd" into the directory which you want to be shared and run the command:

{% highlight shell %}
python -m SimpleHTTPServer 8000
{% endhighlight %}

You need to specify a port, usually 8000, like in the example should be just fine.

To access the shared files o to http://your_ip_address:8000.
