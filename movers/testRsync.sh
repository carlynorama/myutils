#!/bin/sh

SOURCE="$1"
DESTINATION="$2"

#this recursively moves items from one location to another.
#if the user DOES NOT include a / at the end of the source folder
#it will move the folder, not the contents. 
#v is for verbose
rsync -rv $SOURCE $DESTINATION

#Some alternates
#rsync -zaP $SOURCE $DESTINATION



# -v : verbose output
# -r : recursive, but also see -a below, preserves more. 
# -z : compress file data during transfer
# -P : report progress
# -a : archive files and directories while copying, i.e. include permissions and symlinks
# -n : dry run. Also --dry-run use with -v or kinda useless. 
# --delete : DANGER will remove files from dest that don't exist in source

# A discussion of rsync vs cp
# https://stackoverflow.com/questions/6339287/copy-or-rsync-command
# https://askubuntu.com/questions/806371/whats-the-difference-between-cp-and-rsync 
# https://en.wikipedia.org/wiki/Rsync
