---
layout: post
status: publish
published: true
title: Insert value 0 for primary keys with auto increment in MySQL
author: Cristian Radulescu
excerpt: 'In order to insert value 0 in a field that is set as primary key for a MySQL
  table you need to execute the following query...'
date: '2009-07-12 22:11:37 +0300'
date_gmt: '2009-07-12 20:11:37 +0300'
---
In order to insert value *0* in a field that is set as primary key for a MySQL table you need to execute the following query prior to any insert query:

```sql
SET SESSION SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
```

Mentioning the "SESSION" variable will make sure that you do not change the sql mode globally, but if you really want to change it globally you need to execute:

```sql
SET GLOBAL SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
```