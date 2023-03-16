#!/bin/sh
#   writefile = full path to a file (including filename) on the filesystem
#  writestr = he second argument is a text string which will be written within this file 

# check number of arguments
if [ $# -eq 2 ]
then
  writefile=$1
  writestr=$2
  writedir=$(dirname $1) 
else
  echo command must take only 2 arguments!!
  return 1 # Exits with return value 1 error
fi

# check if first argument is path to file 
if [ -e $1 ]
then
  echo $2 > $1 # overwrite the file if it already exists
  return 0
fi 

# directory in path not exist, so make it
mkdir -p $writedir
if [ $? -eq 1 ] # errot directory write permisiion
then
  echo directory could not be created, permission denied!!
  return 1
fi

# file or in path not exist, so make it
touch $1
if [ $? -eq 1 ] # errot file write permisiion
then
  echo file could not be created, permission denied!!
  return 1
else
  echo $2 > $1 # write string in the file
fi

