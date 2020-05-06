[How To](https://blog.crashspace.org/category/how-to/) 

What Day is It? Command-line Utility
====================================

[** April 30, 2020April 30,
2020](https://blog.crashspace.org/2020/04/what-day-is-it-command-line-utility/ "9:37 am")
** [carlyn](https://blog.crashspace.org/author/carlyn/ "carlyn") [** 0
Comments](https://blog.crashspace.org/2020/04/what-day-is-it-command-line-utility/#respond)

So you don’t know what day it is? Here is a quick tutorial on how to set
up a small program to print the current day on the command line on Linux
and MacOS computers. It assumes some [basic command-line interface
understanding](http://linuxcommand.org/lc3_learning_the_shell.php)
already.

Write and test the script
-------------------------

I’ve chosen to use python for this because I’m already [familiar with
its calendar
functions](https://github.com/carlynorama/2018JournalProject). Four main
sections make the script work.

-   **Declare the environment**(`!/usr/bin/env python3`) – this will
    work for most folks, but your python install might be in a different
    place. Don’t worry about changing it yet, errors won’t happen until
    later.
-   **Import what you need** (`import datetime`) – we don’t need much
    for this.
-   **Custom functions** (`def printDay():`) – Only one for this script.
    I’m using .strftime to format the date output, but there are [lots
    more
    options](http://-%20https://docs.python.org/3/library/datetime.html).
-   **Make it run** (`if __name__ == __"main"__:`) – This [special
    function](https://stackoverflow.com/questions/419163/what-does-if-name-main-do)
    will run when this file is called explicitly rather than used as a
    module to another program.

``` {.wp-block-code}
#!/usr/bin/env python3

#imports go here
import datetime

#functions go here

def printDay():
 d = datetime.datetime.now()
 #print(d.strftime("%A %d %B %Y"))
 print(d.strftime("%A"))

#make it run
if __name__ == "__main__":
   printDay()
```

Copy and paste this code into a file and save it as `whatday.py`. Once
the file is saved, navigate to the directory that contains it [using
your terminal](https://www.computerhope.com/issues/ch000795.htm). At the
prompt write `python3 whatday.py` and the full name of the day of the
week should print out. `python whatday.py` may also work as this code
can still be run by older versions of python as well.

Let it run on its own
---------------------

Let’s make it so you don’t have to type `python3` every time. The file
will still have to be called from within its directory or with the full
path, but you won’t need to prepend the environment call. First of all,
create a directory for utility files if you don’t have a spot already.
It’s better to keep them all together in a directory that just your user
can access for now. For example, `~/Developer/myutils/bin`. As a
reminder, “\~/” refers to the user’s home directory.

-   `mv whatday.py ~/Developer/myutils/bin/whatday` – create a moved,
    renamed file without an extension in your utilities directory that
    has the contents of the script.
-   `cd ~/Developer/myutils/bin/` – go to that directory if not there
    already
-   `chmod 755 whatday` – make it executable. `chmod +x whatday` will
    also work.

Typing `whatday` alone at the command prompt should now print out the
name of the day of the week. If there is a problem with the initial
compiler declaration (the “hash-bang” line at the top), this is when it
will show up with an error like “`usr/bin/env python3 does not exist`.”
Try entering `which python` and/or `which python3` and use that path
although it is [not preferred](https://askubuntu.com/a/716281).

Run it from anywhere
--------------------

I don’t want to have to write out `~/Developer/myutils/bin/whatday.py`
every time I want to know what day it is. I want to be able to write
just `whatday` no matter what directory I’m working in or when I’ve
popped open a new terminal window. If you’ve been dinking around with
shell scripting already at any point since your last fesh install, there
may already be a file named \~/.bash\_profile, \~/.bash\_rc or
\~/.profile already floating around. Go looking for it.

``` {.wp-block-code}
ls -al ~/
```

If it isn’t there, make a new file called .profile. Of the files
mentioned above, it is the [lowest
priority](https://www.tecmint.com/understanding-shell-initialization-files-and-user-profiles-linux/).
This specialty bash file should run when you open a new terminal window,
so you can use it to automatically add your utilities directory to the
path your computer uses to look for command names. The example assumes
using the text editor nano, which is fairly beginner friendly.

``` {.wp-block-code}
cd ~/
nano .profile
```

Add the following line to the file then save it.

``` {.wp-block-code}
PATH=$PATH:~/Developer/myutils/bin
```

This will append the specified directory to the **end** of the path
list. Some people prefer to prepend, but by adding the new directory to
the end existing commands won’t be preempted. To overriding existing
commands, use `PATH=~/Developer/myutils/bin:$PATH` instead.

Open a new terminal window and type `whatday`. The name of the day of
the week should print. If not try adding the PATH line to
\~/.bash\_profile or \~/.bash\_rc instead. Adding an `echo` to any of
these files will confirm if it’s running and when, e.g.:

``` {.wp-block-code}
now=$(date +"%T")
echo "profile was called at $now"
```

More Reading
------------

### Date and Time in Python

-   [https://www.cyberciti.biz/faq/howto-get-current-date-time-in-python/](https://www.cyberciti.biz/faq/howto-get-current-date-time-in-python/)
-   [https://medium.com/capital-one-tech/bashing-the-bash-replacing-shell-scripts-with-python-d8d201bc0989](https://medium.com/capital-one-tech/bashing-the-bash-replacing-shell-scripts-with-python-d8d201bc0989)
-   [https://docs.python.org/3/library/datetime.html](https://docs.python.org/3/library/datetime.html)

### Combining Python and Bash Scripts

-   [https://automatetheboringstuff.com/2e/appendixb/](https://automatetheboringstuff.com/2e/appendixb/)
-   [https://apple.stackexchange.com/questions/99788/os-x-create-a-personal-bin-directory-bin-and-run-scripts-without-specifyin](https://apple.stackexchange.com/questions/99788/os-x-create-a-personal-bin-directory-bin-and-run-scripts-without-specifyin)
-   [https://unix.stackexchange.com/questions/184726/how-to-include-python-script-inside-a-bash-script](https://unix.stackexchange.com/questions/184726/how-to-include-python-script-inside-a-bash-script) 
-   [https://askubuntu.com/a/716281](https://askubuntu.com/a/716281)

### Updating Path Information

-   [https://www.computerhope.com/issues/ch001647.htm](https://www.computerhope.com/issues/ch001647.htm)
-   [https://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path/26059\#26059](https://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path/26059#26059)
-   [https://www.tecmint.com/understanding-shell-initialization-files-and-user-profiles-linux/](https://www.tecmint.com/understanding-shell-initialization-files-and-user-profiles-linux/) 
-   [https://www.cyberciti.biz/faq/change-bash-profile/](https://www.cyberciti.biz/faq/change-bash-profile/) 

### More Misc Bash Script Examples

-   [https://www.taniarascia.com/how-to-create-and-use-bash-scripts/](https://www.taniarascia.com/how-to-create-and-use-bash-scripts/)
-   [https://www.linux.com/training-tutorials/writing-simple-bash-script/](https://www.linux.com/training-tutorials/writing-simple-bash-script/)
-   [https://linuxhint.com/30\_bash\_script\_examples/\#t26](https://linuxhint.com/30_bash_script_examples/#t26)
-   [https://linuxconfig.org/bash-scripting-tutorial](https://linuxconfig.org/bash-scripting-tutorial)
