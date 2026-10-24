---
title: 'CLI search and replace in multiple files'
date: 2010-03-11
excerpt: 'Quick tip about how to find and replace a text in multiple files from CLI.'
---
In this example you have some text files (.txt) with urls like "http://example.com, http://another-example.com...". What you are trying to do is to replace all "http" references with "https".

You can find all text files using the following command in the directory where the files are located:

```shell
find -type f -name *.txt
```

You can execute a command on the search result using the *-exec* parameter for the *find* command:

```shell
find -type f -name *.txt -exec my_command
```

The actual search and replace will be performed using *sed*:

```shell
find -type f -name *.txt -exec sed -i 's/http/https/' {} \;
```