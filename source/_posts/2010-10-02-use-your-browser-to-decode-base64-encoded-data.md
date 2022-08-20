---
extends: _layouts.post
title: Use your browser to decode base64 encoded data
author: Cristian Radulescu
description: Any modern browser can easily decode base64 encoded data using the Data URI scheme.
date: 2010-10-02
section: content
categories: []
---
If you are dealing with base64 encoded data you may find useful to know that any modern browser can easily decode it using the *Data URI scheme*. All you need is pass the encoded data to the browser in the same way as you would enter a regular URL, but of course using the correct structure of the data URI scheme:

```text
data:<MIME-type>;charset=<encoding>;base64,<data>
```

The MIME-type and charset parameters are optional, with default values *text/plain* and *US-ASCII* but is a good practice to always specify at least the MIME-type.

An example of base64 encoded data is:

```text
data:text/plain;base64,bWVzc2FnZSBlbmNvZGVkIGluIGJhc2U2NA==
```

which should be decoded to:

```text
message encoded in base64
```