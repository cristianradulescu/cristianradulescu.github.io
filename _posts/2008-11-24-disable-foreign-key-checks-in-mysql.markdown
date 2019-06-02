---
layout: post
status: publish
published: true
title: Disable foreign key checks in MySQL
author: Cristian Radulescu
excerpt: Disabling foreign key checks in MySQL is usefull when you are dealing with
  tables that use foreign keys (InnoDB engine).
date: '2008-11-24 22:47:44 +0200'
date_gmt: '2008-11-24 20:47:44 +0200'
---
Disabling foreign key checks in MySQL is usefull when you are dealing with tables that use foreign keys (InnoDB engine). You can not delete (drop) multiple tables, a parent table or a child table until you disable foreign key checks four your current database.

The sql command is:

```sql
SET FOREIGN_KEY_CHECKS = 0;
```

To re-enable the foreign key checks use:

```sql
SET FOREIGN_KEY_CHECKS = 1;
```