---
layout: post
status: publish
published: true
title: Get random results from a MySql table
author: Cristian Radulescu
excerpt: It is possible to retrieve random results from a MySql table using the RAND()
  mathematical function. In order to get the random results the RAND() function needs
  to be used in the ORDER BY clause.
date: '2011-08-20 13:52:50 +0300'
date_gmt: '2011-08-20 11:52:50 +0300'
---
It is possible to retrieve random results from a MySql table using the [RAND()](http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html#function_rand) mathematical function.

In order to get the random results, the RAND() function should be used in the *ORDER BY* clause, like in the example below:

```sql
-- Get random results
SELECT * FROM `my_table` ORDER BY RAND();
```

Retrieving random results directly from MySql is useful since you don't need another step in your application in order to manually randomize the sql results. For example if the sql results are retrieved without being randomized you need to use a ["shuffle"](http://php.net/manual/en/function.shuffle.php) like function to get random results in PHP.
