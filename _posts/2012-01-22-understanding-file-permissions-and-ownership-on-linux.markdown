---
layout: post
status: publish
published: true
title: Understanding file permissions and ownership on Linux
author: Cristian Radulescu
excerpt: The files on a Linux system can have reading permissions, writing permissions,
  executing (running) permissions or no permissions for the user that owns that files,
  groups of users or the rest - users who does not own that files and they are not
  members of any group.
date: '2012-01-22 23:44:00 +0200'
date_gmt: '2012-01-22 21:44:00 +0200'
---
### The files on a Linux system can have reading permissions, writing permissions, executing (running) permissions or no permissions for the user that owns that files, groups of users or the rest - users who does not own that files and they are not members of any group.

### The usual file types are

* Directory - associated symbol **d**
* Normal file - associated symbol **-**
* Symbolic link (symlink) - associated symbol **l**

### Permission types

* *Reading* - associated symbol **r**, or number **4**
* Writing - associated symbol **w**, or number **2**
* *Executing (running)* - associated symbol **x**, or number **1**
* *No permission* - associated symbol **-**, or number **0**


If a file has the **reading permission** you can open the file and read it, but you can not change the content. If a directory has the **reading permission** you can read the files in that directory, but you are not allowed to change their content.

If a file has the **writing permission** you can open the file for reading and for writing (you can change the file's content and save it with the new content). You can not **delete** or **rename** a file unless the directory has the **writing permission.**

The **execution permission** allows the user to execute (run) the file.

### User types

* **User** - the user name of the owner of the file or directory; if a user creates a file or directory it becomes the owner of that file of directory.
* **Group** - a group of users (ftp, mysql), all group members have the same rights for the file or directory.
* **Other** - all users that do not own the file or directory and they do not belong to any group that has right for the file or directory.


### Setting permissions:
You can set the permissions using the *chmod* command. There two methods for changing file permissions:

* **Symbolic mode**
* **Numeric mode**

### Symbolic mode

Setting the permissions is made using the associated symbols - **rwx**.

Actions are defined using mathematical symbols: the **+ (plus)** symbol is used to **add a permission**, the **- (minus)** symbol is used to **remove a permission**, and the **= (equal)** symbol is used to **remove the old permission and set a new one**.

For the owners, associated symbols are **u** for **user**, **g** for **group**, **o** for **others (the rest)** and **a** for **all**.

To make a file executable type in a console:

```shell
chmod +x myfile
```

To remove the write permissions of the group:

```shell
chmod g-w myfile
```

### Numeric mode

Instead of symbols, the **associated number** are used for setting permissions. The number for each owner will be the sum of the permissions for that owner.

To set the reading, writing and execution rights for the user you use the number 7 (4+2+1); to set the reading and writing rights for group will you use the number 6 (4+2); the reading permission for the rest (others) will be set using number 4.

The command for setting the permissions in numeric mode:

```shell
chmod 764 myfile
```

### Here is the association between numbers and letters

```shell
0  |  ---
1  |  --x
2  |  -w-
3  |  -wx
4  |  r--
5  |  r-x
6  |  rw-
7  |  rwx
```

### Changing the owner

It is done using the command **chown**. To change **the owner**:

```shell
chown myusername myfile
```

To change **the group and the owner**:

```shell
chown mygroup:myowner myfile
```

To **change only the group** you use the command *chgrp*:

```shell
chgrp group myfile
```

#### References

[TLDP.org](http://tldp.org/LDP/GNU-Linux-Tools-Summary/html/file-permissions.html)

[TUXfiles.org](http://www.tuxfiles.org/linuxhelp/filepermissions.html)
