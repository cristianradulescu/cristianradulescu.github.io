---
extends: _layouts.post
title: Display random posts in WordPress
author: Cristian Radulescu
description: WordPress posts may be randomly displayed
date: 2011-08-25
section: content
categories: []
---
WordPress posts may be randomly displayed using the [Get random results from a MySql table]({{ site.base_url }}{% post_url 2011-08-20-get-random-results-from-a-mysql-table ) tip placed in a simple plugin.

What this plugin does is to simply add the "RAND()" value to "ORDER BY" clause in the sql query which retrieves the WordPress posts.

```php
/**
 * Plugin Name: Randomize posts
 * Description: Display random posts in WordPress.
 */

function rand_posts_orderby_request($orderby) {
  return 'RAND()';
}

// add custom action to WordPres filters
add_action('posts_orderby_request', 'rand_posts_orderby_request');
```

In order to use the plugin, just place the above code in a file, upload it to your WordPress plugins directory and activate it. If you use cache related plugins it may be necessary to disable them to view the randomized posts.
