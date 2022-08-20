---
extends: _layouts.post
title: Beautiful strings and the PHP solution
author: Cristian Radulescu
description: _Beautiful strings_ is one of the proposed problems on Facebook Hacker Cup 2013 Qualification Round
date: 2013-02-01
section: content
categories: []
---
*Beautiful strings* is one of the proposed problems on&nbsp;Facebook Hacker Cup 2013 Qualification Round. The presented PHP solution was already validated.

### The problem:
*When John was a little kid he didn't have much to do. There was no internet, no Facebook, and no programs to hack on. So he did the only thing he could... he evaluated the beauty of strings in a quest to discover the most beautiful string in the world.
Given a string s, little Johnny defined the beauty of the string as the sum of the beauty of the letters in it.
The beauty of each letter is an integer between 1 and 26, inclusive, and no two letters have the same beauty. Johnny doesn't care about whether letters are uppercase or lowercase, so that doesn't affect the beauty of a letter. (Uppercase 'F' is exactly as beautiful as lowercase 'f', for example.)
You're a student writing a report on the youth of this famous hacker. You found the string that Johnny considered most beautiful. What is the maximum possible beauty of this string?*

**Input**

The input file consists of a single integer m followed by m lines.

**Output**

Your output should consist of, for each test case, a line containing the string "Case #x: y" where x is the case number (with 1 being the first case in the input file, 2 being the second, etc.) and y is the maximum beauty for that test case.

**Constraints**
```
5 <= m <= 50
2 <= length of s <= 500
```

### Example input:
```
5
ABbCcc
Good luck in the Facebook Hacker Cup this year!
Ignore punctuation, please :)
Sometimes test cases are hard to make up.
So I just go consult Professor Dalves
```

### Example output:
```
Case #1: 152
Case #2: 754
Case #3: 491
Case #4: 729
Case #5: 646
```

### The PHP solution:

```php
$filename = 'input.txt';
$file = fopen($filename, 'r');
$contents = fread($file, filesize($filename));
$strings = explode(PHP_EOL, trim($contents));

// remove strings count
unset($strings[0]);

foreach ($strings as $case => $string) {
  calculate_beauty($string, $case);
}

function calculate_beauty($string, $case)
{
  $string = strtolower($string);
  $arr = array();
  for ($i = 0; $i < strlen($string); $i++) {
    if (ctype_alpha($string[$i])) {
      $arr[$string[$i]] = isset($arr[$string[$i]]) ? $arr[$string[$i]] + 1 : 1;
    }
  }

  rsort($arr);
  $beauty = 0;
  $letter_range = range(26, 1);

  for ($i = 0; $i < count($arr); $i++) {
    $beauty += $arr[$i] * $letter_range[$i];
  }

  echo 'Case #'.$case.': '.$beauty.'<br />';
}
```
