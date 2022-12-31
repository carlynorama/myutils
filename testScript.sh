#!/bin/sh
# This program is a very simple test script that prints out a string.
# To run it type % zsh testScript.sh world or % zsh testScript.sh "world"
# either will work in this case. (pwd is the same as location of file)
# To eliminate the zsh prefix, % chmod 755 testScript.sh 
#(or % chmod u+x testScript.sh)
# u stands for user.
# g stands for group.
# o stands for others.
# a stands for all.

#Note the lack of spaces on either side of the = sign. 
#Adding spaces causes an error. 
myString="Hello"
FIRST_ARGUMENT="$1"

echo "$myString, $FIRST_ARGUMENT"