#!/bin/sh
#  filesdir = path to a directory on the filesystem
#  searchstr = text string which will be searched within these files, referred to below as 

# check number of arguments
if [ $# -eq 2 ]
then
  filesdir=$1
  searchstr=$2
else
  echo command must take only 2 arguments!!
  return 1 # Exits with return value 1 error
fi

# check if first argument is path to directory 
if [ -d $1 ]
then
  filesdir=$1
else
  echo argument 1: not a directory!!
  return 1 # Exits with return value 1 error
fi

# find NO.files in the directory and all subdirectories
x=$(find $1 -type f | wc -l)

# number of matching lines found in respective files, where a matching line refers to a line which contains searchstr
y=$(grep $2 $(find $1 -type f) | wc -l)

# print result i terminal
echo The number of files are $x and the number of matching lines are $y
