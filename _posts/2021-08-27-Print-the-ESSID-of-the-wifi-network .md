---
layout: post
status: publish
published: true
title: Print the ESSID of the wireless network
author: Cristian Radulescu
excerpt: CLI oneliner to print the ESSID of the wireless network
date: '2021-08-27 22:05:00'
date_gmt: '2021-08-27 12:05:00 +0300'
---
CLI oneliner to print the ESSID of the wireless network

{% highlight bash %}
$ iwconfig > /tmp/essid 2>/dev/null && grep ESSID /tmp/essid | awk '{ print $4 }' | cut -c 8- | rev | cut -c 2- | rev
{% endhighlight %}

Step by step:
1. Use _iwconfig_ to fetch wireless info and place it into a file on disk: _iwconfig > /tmp/essid 2>/dev/null_;
2. In the resulted file find the row with ESSID info using _grep_ ;
3. Extract only the ESSID info using _awk_;
4. Cut irrelevant strings from the start and end of the actual ESSID (reverse the string to cut the last double quote).
