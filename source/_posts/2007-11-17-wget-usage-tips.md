---
extends: _layouts.post
title: WGET - usage tips
author: Cristian Radulescu
description: _If you need only to download something from an url
date: 2007-11-17
section: content
categories: []
---
### Examples

If you need only to download something from an url:

```shell
wget https://example.com/image.jpg
```

With *user* (cristian) and *password* (abc123):

```shell
wget https://example.com/document.pdf --user=cristian --password=abc123
```

Download from an url list (list.txt):

```shell
# list.txt
https://example.com/image1.jpg
https://example.com/image2.jpg
https://example.com/image3.jpg
```

```shell
wget -i list.txt
```

When the connection fails you can continue:

```shell
wget -c https://example.com/compressed.zip
```

The default number of retries is set to 20. Set the number of retries to infinity:

```shell
wget -t 0 -c https://example.com/compressed.zip
```

Download all files from a directory:

```shell
wget -p https://example.com/assets/img/
```

Download files with specific extensions (.jpg, .gif, .png):

```shell
wget -nd -r -l1 -A.jpg -A.gif -A.png https://example.com/images/
```

(*-nd* no directory, *-r* recursive download, *-l1* level 1, no subdirectories).

### Shell script example

If the files are named useng a pattern (like *wallpaper_1.jpg, *wallpaper*_2.jpg, ..., *wallpaper*_284.jpg, *wallpaper*_285.jpg*) you can use a simple shell script:

```shell
#!/bin/bash
for ((i = 1; i <= 285; i ++))
  do
    wget -c "https://example.com/wallpapers/wallpaper_"$i".jpg"
done
```

or type in a console:

```shell
for ((i = 1; i <= 285; i ++)); do wget -c "https://example.com/wallpapers/wallpaper_"$i".jpg"; done
```