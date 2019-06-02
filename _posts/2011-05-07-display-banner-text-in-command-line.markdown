---
layout: post
status: publish
published: true
title: Display banner text in command line
author: Cristian Radulescu
excerpt: Display banner-like texts with large characters created from regular
  characters using the FIGlet utility.
date: '2011-05-07 11:39:23 +0300'
date_gmt: '2011-05-07 09:39:23 +0300'
---
You can display banner-like texts with large characters created from regular characters using the FIGlet utility.

The default output look like this (quotes are optional):

```text
% figlet "Hello world! :)"
 _   _      _ _                            _     _ _   __  
| | | | ___| | | ___   __      _____  _ __| | __| | |  \ \ 
| |_| |/ _ \ | |/ _ \  \ \ /\ / / _ \| '__| |/ _` | | (_) |
|  _  |  __/ | | (_) |  \ V  V / (_) | |  | | (_| |_|  _| |
|_| |_|\___|_|_|\___/    \_/\_/ \___/|_|  |_|\__,_(_) (_) |
                                                       /_/ 
```

Basic usage requires only the text you want to output on the CLI, but you can also specify the font used in text rendering, dimensions and other layout options.